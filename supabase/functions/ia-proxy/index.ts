// Edge Function `ia-proxy` — relais serveur vers l'API Anthropic.
// Remplace les appels directs navigateur → api.anthropic.com (clé exposée
// côté client, header "anthropic-dangerous-direct-browser-access").
//
// Déploiement :
//   supabase functions deploy ia-proxy
//   supabase secrets set ANTHROPIC_API_KEY=sk-ant-...   (clé centrale, optionnelle)
//
// Le client peut fournir sa propre clé via le header x-ia-key (mode
// "chaque société a sa clé") ; à défaut, la clé serveur ANTHROPIC_API_KEY
// est utilisée si configurée.

import { serve } from "https://deno.land/std@0.224.0/http/server.ts";

const CORS_HEADERS = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Headers": "authorization, apikey, content-type, x-ia-key",
  "Access-Control-Allow-Methods": "POST, OPTIONS",
};

serve(async (req) => {
  if (req.method === "OPTIONS") {
    return new Response(null, { headers: CORS_HEADERS });
  }
  if (req.method !== "POST") {
    return new Response(JSON.stringify({ error: "Method not allowed" }), {
      status: 405,
      headers: { ...CORS_HEADERS, "Content-Type": "application/json" },
    });
  }

  // Authentification Supabase obligatoire (clé anonyme ou session personnel).
  const auth = req.headers.get("authorization") || "";
  if (!auth.startsWith("Bearer ")) {
    return new Response(JSON.stringify({ error: "Non authentifié." }), {
      status: 401,
      headers: { ...CORS_HEADERS, "Content-Type": "application/json" },
    });
  }

  const apiKey = req.headers.get("x-ia-key") || Deno.env.get("ANTHROPIC_API_KEY") || "";
  if (!apiKey) {
    return new Response(
      JSON.stringify({ error: "Clé API Anthropic non configurée (ni serveur, ni client)." }),
      { status: 400, headers: { ...CORS_HEADERS, "Content-Type": "application/json" } }
    );
  }

  let payload: unknown;
  try {
    payload = await req.json();
  } catch {
    return new Response(JSON.stringify({ error: "Payload JSON invalide." }), {
      status: 400,
      headers: { ...CORS_HEADERS, "Content-Type": "application/json" },
    });
  }

  const upstream = await fetch("https://api.anthropic.com/v1/messages", {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
      "x-api-key": apiKey,
      "anthropic-version": "2023-06-01",
    },
    body: JSON.stringify(payload),
  });

  const body = await upstream.text();
  return new Response(body, {
    status: upstream.status,
    headers: { ...CORS_HEADERS, "Content-Type": "application/json" },
  });
});
