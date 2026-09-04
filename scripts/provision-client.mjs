#!/usr/bin/env node
// ═══════════════════════════════════════════════════════════════════════════
// provision-client.mjs — Provisionne un nouveau client SaaS ImmoSuite.
//
// Ce que fait le script :
//   1. Crée un nouveau projet Supabase (1 base par client — isolation totale)
//   2. Applique le schéma pi_* (supabase/schema/pi_tables.sql)
//   3. Récupère la clé anon du nouveau projet
//   4. Génère clients/<slug>/{index.html, portail-souscripteur.html,
//      portail-apporteur.html} à partir des gabarits à la racine, avec
//      TENANT_CONFIG rempli pour ce client
//
// Ce qu'il NE fait PAS :
//   - portail-unique.html : généré depuis l'ERP du client une fois déployé
//     (Paramètres → Cloud/Sync → « Générer le portail public »)
//   - RLS stricte : voir supabase/schema/rls_portail_reference.sql (chantier
//     séparé, à ne pas activer sans revue)
//   - Déploiement Vercel : affiché en fin de script, à lancer manuellement
//
// Prérequis :
//   export SUPABASE_ACCESS_TOKEN=sbp_...   (Compte Supabase → Access Tokens)
//   node scripts/provision-client.mjs --nom "Agence X" --slug agence-x \
//     --org-id <org_id> [--region eu-west-1] [--plan free] --apply
//
// Sans --apply : affiche le plan (dry-run), n'appelle aucune API, ne crée
// aucune ressource facturée. Sécurité par défaut — ce script crée de vraies
// ressources cloud facturées, jamais sans confirmation explicite.
// ═══════════════════════════════════════════════════════════════════════════

import { readFileSync, writeFileSync, mkdirSync, existsSync } from 'node:fs';
import { randomBytes } from 'node:crypto';
import path from 'node:path';
import { fileURLToPath } from 'node:url';

const ROOT = path.dirname(path.dirname(fileURLToPath(import.meta.url)));
const API = 'https://api.supabase.com/v1';

function parseArgs(argv) {
  const out = { apply: false, region: 'eu-west-1', plan: 'free' };
  for (let i = 0; i < argv.length; i++) {
    const a = argv[i];
    if (a === '--apply') { out.apply = true; continue; }
    if (a.startsWith('--')) {
      const key = a.slice(2).replace(/-([a-z])/g, (_, c) => c.toUpperCase());
      out[key] = argv[i + 1];
      i++;
    }
  }
  return out;
}

function fail(msg) {
  console.error('✖ ' + msg);
  process.exit(1);
}

function slugify(s) {
  return s.toLowerCase().normalize('NFD').replace(/[̀-ͯ]/g, '')
    .replace(/[^a-z0-9]+/g, '-').replace(/^-+|-+$/g, '');
}

async function sbApi(token, method, urlPath, body) {
  const resp = await fetch(API + urlPath, {
    method,
    headers: {
      'Authorization': 'Bearer ' + token,
      'Content-Type': 'application/json'
    },
    body: body ? JSON.stringify(body) : undefined
  });
  const text = await resp.text();
  let json;
  try { json = text ? JSON.parse(text) : {}; } catch { json = { raw: text }; }
  if (!resp.ok) {
    throw new Error(`Supabase API ${method} ${urlPath} → ${resp.status}: ${JSON.stringify(json)}`);
  }
  return json;
}

async function attendreProjetActif(token, ref, timeoutMs = 5 * 60 * 1000) {
  const start = Date.now();
  while (Date.now() - start < timeoutMs) {
    const p = await sbApi(token, 'GET', `/projects/${ref}`);
    process.stdout.write(`  … statut projet : ${p.status}\r`);
    if (p.status === 'ACTIVE_HEALTHY') { console.log(`  ✓ projet actif (${ref})`); return p; }
    await new Promise(r => setTimeout(r, 8000));
  }
  fail('Timeout : le projet Supabase n\'est pas passé ACTIVE_HEALTHY à temps. Vérifier le dashboard.');
}

function remplacerConfig(template, { nom, supabaseUrl, supabaseAnonKey }) {
  return template
    .replace(/nom:\s*'ImmoSuite ERP'/g, `nom: ${JSON.stringify(nom)}`)
    .replace(/https:\/\/izgpvhwhbrgeagjfhfli\.supabase\.co/g, supabaseUrl)
    .replace(/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9\.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Iml6Z3B2aHdoYnJnZWFnamZoZmxpIi[a-zA-Z0-9_-]*\.[a-zA-Z0-9_-]*/g, supabaseAnonKey);
}

async function main() {
  const args = parseArgs(process.argv.slice(2));
  if (!args.nom) fail('--nom "Nom du client" requis');
  const slug = args.slug ? slugify(args.slug) : slugify(args.nom);
  if (!slug) fail('slug invalide (déduit de --slug ou --nom)');

  console.log('═══════════════════════════════════════════════');
  console.log(' Provisioning client SaaS ImmoSuite');
  console.log('═══════════════════════════════════════════════');
  console.log(`  Nom       : ${args.nom}`);
  console.log(`  Slug      : ${slug}`);
  console.log(`  Région    : ${args.region}`);
  console.log(`  Plan      : ${args.plan}`);
  console.log(`  Org id    : ${args.orgId || '(manquant)'}`);
  console.log(`  Mode      : ${args.apply ? 'APPLY (crée de vraies ressources facturées)' : 'DRY-RUN (aucun appel réseau)'}`);
  console.log('');

  if (!args.apply) {
    console.log('Dry-run : relancer avec --apply pour exécuter réellement.');
    console.log('Étapes qui seraient effectuées :');
    console.log('  1. Créer le projet Supabase (org ' + (args.orgId || '<manquant>') + ', région ' + args.region + ')');
    console.log('  2. Appliquer supabase/schema/pi_tables.sql (153 tables)');
    console.log('  3. Récupérer la clé anon');
    console.log(`  4. Générer clients/${slug}/{index.html, portail-souscripteur.html, portail-apporteur.html}`);
    return;
  }

  if (!args.orgId) fail('--org-id requis en mode --apply');
  const token = process.env.SUPABASE_ACCESS_TOKEN;
  if (!token) fail('SUPABASE_ACCESS_TOKEN manquant (export SUPABASE_ACCESS_TOKEN=sbp_...)');

  const schemaPath = path.join(ROOT, 'supabase/schema/pi_tables.sql');
  if (!existsSync(schemaPath)) fail('Schéma introuvable : ' + schemaPath);
  const schemaSql = readFileSync(schemaPath, 'utf8');

  console.log('1/4 Création du projet Supabase…');
  const dbPass = randomBytes(24).toString('base64').replace(/[^a-zA-Z0-9]/g, '').slice(0, 32);
  const created = await sbApi(token, 'POST', '/projects', {
    organization_id: args.orgId,
    name: `immosuite-${slug}`,
    region: args.region,
    db_pass: dbPass,
    plan: args.plan
  });
  const ref = created.id || created.ref;
  console.log(`  ✓ projet créé : ${ref}`);
  console.log(`  ⚠️  Mot de passe DB généré (à conserver en lieu sûr) : ${dbPass}`);

  console.log('2/4 Attente ACTIVE_HEALTHY…');
  await attendreProjetActif(token, ref);

  console.log('3/4 Application du schéma (153 tables pi_*)…');
  await sbApi(token, 'POST', `/projects/${ref}/database/query`, { query: schemaSql });
  console.log('  ✓ schéma appliqué');

  console.log('4/4 Récupération de la clé anon…');
  const keys = await sbApi(token, 'GET', `/projects/${ref}/api-keys`);
  const anonKey = (Array.isArray(keys) ? keys : []).find(k => k.name === 'anon')?.api_key
    || (Array.isArray(keys) ? keys : []).find(k => (k.tags || '').includes('anon'))?.api_key;
  if (!anonKey) fail('Clé anon introuvable dans la réponse API-keys : ' + JSON.stringify(keys));
  const supabaseUrl = `https://${ref}.supabase.co`;
  console.log(`  ✓ ${supabaseUrl}`);

  console.log('Génération des fichiers client…');
  const clientDir = path.join(ROOT, 'clients', slug);
  mkdirSync(clientDir, { recursive: true });
  const cfg = { nom: args.nom, supabaseUrl, supabaseAnonKey: anonKey };
  for (const file of ['index.html', 'portail-souscripteur.html', 'portail-apporteur.html']) {
    const src = readFileSync(path.join(ROOT, file), 'utf8');
    writeFileSync(path.join(clientDir, file), remplacerConfig(src, cfg));
    console.log(`  ✓ clients/${slug}/${file}`);
  }

  console.log('');
  console.log('═══════════════════════════════════════════════');
  console.log(' Provisioning terminé');
  console.log('═══════════════════════════════════════════════');
  console.log(`  Projet Supabase : ${ref} (${supabaseUrl})`);
  console.log(`  Fichiers        : clients/${slug}/`);
  console.log('');
  console.log(' Reste à faire manuellement :');
  console.log(`  - Déployer clients/${slug}/ (ex: vercel --cwd clients/${slug} deploy --prod)`);
  console.log('  - Connexion au portail : créer un premier utilisateur pi_users côté Supabase');
  console.log('    (SQL editor ou Paramètres → Utilisateurs une fois connecté)');
  console.log('  - portail-unique.html : à générer depuis l\'ERP du client (Cloud/Sync)');
}

main().catch(e => fail(e.message));
