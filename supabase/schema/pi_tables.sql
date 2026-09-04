-- ═══════════════════════════════════════════════════════════════════════════
-- ImmoSuite ERP — Schéma de base (généré) pour un nouveau client SaaS
-- Schéma uniforme : chaque module métier est une table id/data (JSONB).
-- Généré depuis les tables pi_* référencées dans index.html — voir
-- scripts/provision-client.mjs. Idempotent (IF NOT EXISTS) : rejouable
-- sans risque sur un projet déjà provisionné.
-- ═══════════════════════════════════════════════════════════════════════════

create table if not exists public.pi_actions_marketing (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists pi_actions_marketing_data_gin on public.pi_actions_marketing using gin (data);

create table if not exists public.pi_actions_reunion (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists pi_actions_reunion_data_gin on public.pi_actions_reunion using gin (data);

create table if not exists public.pi_af_agents (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists pi_af_agents_data_gin on public.pi_af_agents using gin (data);

create table if not exists public.pi_af_financiers (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists pi_af_financiers_data_gin on public.pi_af_financiers using gin (data);

create table if not exists public.pi_af_manifestations (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists pi_af_manifestations_data_gin on public.pi_af_manifestations using gin (data);

create table if not exists public.pi_af_operations (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists pi_af_operations_data_gin on public.pi_af_operations using gin (data);

create table if not exists public.pi_af_relances (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists pi_af_relances_data_gin on public.pi_af_relances using gin (data);

create table if not exists public.pi_af_versements_financiers (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists pi_af_versements_financiers_data_gin on public.pi_af_versements_financiers using gin (data);

create table if not exists public.pi_ag_copro (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists pi_ag_copro_data_gin on public.pi_ag_copro using gin (data);

create table if not exists public.pi_agrement_programme (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists pi_agrement_programme_data_gin on public.pi_agrement_programme using gin (data);

create table if not exists public.pi_agrement_promoteur (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists pi_agrement_promoteur_data_gin on public.pi_agrement_promoteur using gin (data);

create table if not exists public.pi_amenageurs (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists pi_amenageurs_data_gin on public.pi_amenageurs using gin (data);

create table if not exists public.pi_appels_charges_copro (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists pi_appels_charges_copro_data_gin on public.pi_appels_charges_copro using gin (data);

create table if not exists public.pi_apporteurs (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists pi_apporteurs_data_gin on public.pi_apporteurs using gin (data);

create table if not exists public.pi_artisans (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists pi_artisans_data_gin on public.pi_artisans using gin (data);

create table if not exists public.pi_audit_log (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists pi_audit_log_data_gin on public.pi_audit_log using gin (data);

create table if not exists public.pi_avenants (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists pi_avenants_data_gin on public.pi_avenants using gin (data);

create table if not exists public.pi_avenants_amenagement (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists pi_avenants_amenagement_data_gin on public.pi_avenants_amenagement using gin (data);

create table if not exists public.pi_baux (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists pi_baux_data_gin on public.pi_baux using gin (data);

create table if not exists public.pi_biens_amort (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists pi_biens_amort_data_gin on public.pi_biens_amort using gin (data);

create table if not exists public.pi_biens_locatifs (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists pi_biens_locatifs_data_gin on public.pi_biens_locatifs using gin (data);

create table if not exists public.pi_bons_commande (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists pi_bons_commande_data_gin on public.pi_bons_commande using gin (data);

create table if not exists public.pi_budgets_copro (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists pi_budgets_copro_data_gin on public.pi_budgets_copro using gin (data);

create table if not exists public.pi_bulletins (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists pi_bulletins_data_gin on public.pi_bulletins using gin (data);

create table if not exists public.pi_caisse (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists pi_caisse_data_gin on public.pi_caisse using gin (data);

create table if not exists public.pi_caisse_budgets (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists pi_caisse_budgets_data_gin on public.pi_caisse_budgets using gin (data);

create table if not exists public.pi_caisse_mouvements (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists pi_caisse_mouvements_data_gin on public.pi_caisse_mouvements using gin (data);

create table if not exists public.pi_caisse_sessions (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists pi_caisse_sessions_data_gin on public.pi_caisse_sessions using gin (data);

create table if not exists public.pi_caisses (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists pi_caisses_data_gin on public.pi_caisses using gin (data);

create table if not exists public.pi_campagnes (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists pi_campagnes_data_gin on public.pi_campagnes using gin (data);

create table if not exists public.pi_candidats_rh (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists pi_candidats_rh_data_gin on public.pi_candidats_rh using gin (data);

create table if not exists public.pi_candidatures_loc (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists pi_candidatures_loc_data_gin on public.pi_candidatures_loc using gin (data);

create table if not exists public.pi_cessions_foncieres (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists pi_cessions_foncieres_data_gin on public.pi_cessions_foncieres using gin (data);

create table if not exists public.pi_chantier_couts (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists pi_chantier_couts_data_gin on public.pi_chantier_couts using gin (data);

create table if not exists public.pi_clients (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists pi_clients_data_gin on public.pi_clients using gin (data);

create table if not exists public.pi_commissions (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists pi_commissions_data_gin on public.pi_commissions using gin (data);

create table if not exists public.pi_conceptions (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists pi_conceptions_data_gin on public.pi_conceptions using gin (data);

create table if not exists public.pi_conges_rh (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists pi_conges_rh_data_gin on public.pi_conges_rh using gin (data);

create table if not exists public.pi_constructeurs (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists pi_constructeurs_data_gin on public.pi_constructeurs using gin (data);

create table if not exists public.pi_conv_agrement (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists pi_conv_agrement_data_gin on public.pi_conv_agrement using gin (data);

create table if not exists public.pi_conventions (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists pi_conventions_data_gin on public.pi_conventions using gin (data);

create table if not exists public.pi_conventions_amenagement (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists pi_conventions_amenagement_data_gin on public.pi_conventions_amenagement using gin (data);

create table if not exists public.pi_conversations (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists pi_conversations_data_gin on public.pi_conversations using gin (data);

create table if not exists public.pi_coproprietes (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists pi_coproprietes_data_gin on public.pi_coproprietes using gin (data);

create table if not exists public.pi_cout_gestion_exercices (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists pi_cout_gestion_exercices_data_gin on public.pi_cout_gestion_exercices using gin (data);

create table if not exists public.pi_cr_visites (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists pi_cr_visites_data_gin on public.pi_cr_visites using gin (data);

create table if not exists public.pi_custom_roles (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists pi_custom_roles_data_gin on public.pi_custom_roles using gin (data);

create table if not exists public.pi_declarations (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists pi_declarations_data_gin on public.pi_declarations using gin (data);

create table if not exists public.pi_declarations_versement_financier (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists pi_declarations_versement_financier_data_gin on public.pi_declarations_versement_financier using gin (data);

create table if not exists public.pi_declarations_versement_foncier (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists pi_declarations_versement_foncier_data_gin on public.pi_declarations_versement_foncier using gin (data);

create table if not exists public.pi_demarcheurs (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists pi_demarcheurs_data_gin on public.pi_demarcheurs using gin (data);

create table if not exists public.pi_depots (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists pi_depots_data_gin on public.pi_depots using gin (data);

create table if not exists public.pi_devis_fournisseurs (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists pi_devis_fournisseurs_data_gin on public.pi_devis_fournisseurs using gin (data);

create table if not exists public.pi_diaspo_ancrages (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists pi_diaspo_ancrages_data_gin on public.pi_diaspo_ancrages using gin (data);

create table if not exists public.pi_diaspo_dossiers (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists pi_diaspo_dossiers_data_gin on public.pi_diaspo_dossiers using gin (data);

create table if not exists public.pi_diaspo_jalons (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists pi_diaspo_jalons_data_gin on public.pi_diaspo_jalons using gin (data);

create table if not exists public.pi_diaspo_parts (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists pi_diaspo_parts_data_gin on public.pi_diaspo_parts using gin (data);

create table if not exists public.pi_diaspo_preuves (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists pi_diaspo_preuves_data_gin on public.pi_diaspo_preuves using gin (data);

create table if not exists public.pi_divisions (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists pi_divisions_data_gin on public.pi_divisions using gin (data);

create table if not exists public.pi_docs_juridiques (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists pi_docs_juridiques_data_gin on public.pi_docs_juridiques using gin (data);

create table if not exists public.pi_documents (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists pi_documents_data_gin on public.pi_documents using gin (data);

create table if not exists public.pi_dossiers_juridiques (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists pi_dossiers_juridiques_data_gin on public.pi_dossiers_juridiques using gin (data);

create table if not exists public.pi_dossiers_lot (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists pi_dossiers_lot_data_gin on public.pi_dossiers_lot using gin (data);

create table if not exists public.pi_ecritures (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists pi_ecritures_data_gin on public.pi_ecritures using gin (data);

create table if not exists public.pi_eds_etudes (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists pi_eds_etudes_data_gin on public.pi_eds_etudes using gin (data);

create table if not exists public.pi_eds_ouvrages (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists pi_eds_ouvrages_data_gin on public.pi_eds_ouvrages using gin (data);

create table if not exists public.pi_eds_ressources (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists pi_eds_ressources_data_gin on public.pi_eds_ressources using gin (data);

create table if not exists public.pi_employes (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists pi_employes_data_gin on public.pi_employes using gin (data);

create table if not exists public.pi_etapes_itineraire (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists pi_etapes_itineraire_data_gin on public.pi_etapes_itineraire using gin (data);

create table if not exists public.pi_etats_lieux_bail (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists pi_etats_lieux_bail_data_gin on public.pi_etats_lieux_bail using gin (data);

create table if not exists public.pi_evenements_calendrier (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists pi_evenements_calendrier_data_gin on public.pi_evenements_calendrier using gin (data);

create table if not exists public.pi_factures_client (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists pi_factures_client_data_gin on public.pi_factures_client using gin (data);

create table if not exists public.pi_factures_fournisseur (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists pi_factures_fournisseur_data_gin on public.pi_factures_fournisseur using gin (data);

create table if not exists public.pi_factures_fournisseur_attente (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists pi_factures_fournisseur_attente_data_gin on public.pi_factures_fournisseur_attente using gin (data);

create table if not exists public.pi_fiches_engagement_depense (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists pi_fiches_engagement_depense_data_gin on public.pi_fiches_engagement_depense using gin (data);

create table if not exists public.pi_financements_programme (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists pi_financements_programme_data_gin on public.pi_financements_programme using gin (data);

create table if not exists public.pi_fonds_travaux_copro (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists pi_fonds_travaux_copro_data_gin on public.pi_fonds_travaux_copro using gin (data);

create table if not exists public.pi_formations_rh (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists pi_formations_rh_data_gin on public.pi_formations_rh using gin (data);

create table if not exists public.pi_fournisseurs (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists pi_fournisseurs_data_gin on public.pi_fournisseurs using gin (data);

create table if not exists public.pi_historique_actions (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists pi_historique_actions_data_gin on public.pi_historique_actions using gin (data);

create table if not exists public.pi_immobilisations (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists pi_immobilisations_data_gin on public.pi_immobilisations using gin (data);

create table if not exists public.pi_itineraires (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists pi_itineraires_data_gin on public.pi_itineraires using gin (data);

create table if not exists public.pi_kyc_fiches (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists pi_kyc_fiches_data_gin on public.pi_kyc_fiches using gin (data);

create table if not exists public.pi_lbc_alertes (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists pi_lbc_alertes_data_gin on public.pi_lbc_alertes using gin (data);

create table if not exists public.pi_lbc_declarations (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists pi_lbc_declarations_data_gin on public.pi_lbc_declarations using gin (data);

create table if not exists public.pi_leads (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists pi_leads_data_gin on public.pi_leads using gin (data);

create table if not exists public.pi_livraisons (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists pi_livraisons_data_gin on public.pi_livraisons using gin (data);

create table if not exists public.pi_loc_relances (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists pi_loc_relances_data_gin on public.pi_loc_relances using gin (data);

create table if not exists public.pi_logs_connexion (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists pi_logs_connexion_data_gin on public.pi_logs_connexion using gin (data);

create table if not exists public.pi_lot_unites (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists pi_lot_unites_data_gin on public.pi_lot_unites using gin (data);

create table if not exists public.pi_lots (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists pi_lots_data_gin on public.pi_lots using gin (data);

create table if not exists public.pi_lots_copro (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists pi_lots_copro_data_gin on public.pi_lots_copro using gin (data);

create table if not exists public.pi_masse_dxf_presets (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists pi_masse_dxf_presets_data_gin on public.pi_masse_dxf_presets using gin (data);

create table if not exists public.pi_messages (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists pi_messages_data_gin on public.pi_messages using gin (data);

create table if not exists public.pi_mobilites_rh (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists pi_mobilites_rh_data_gin on public.pi_mobilites_rh using gin (data);

create table if not exists public.pi_modeles_logement (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists pi_modeles_logement_data_gin on public.pi_modeles_logement using gin (data);

create table if not exists public.pi_mutations (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists pi_mutations_data_gin on public.pi_mutations using gin (data);

create table if not exists public.pi_nomenclatures (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists pi_nomenclatures_data_gin on public.pi_nomenclatures using gin (data);

create table if not exists public.pi_ordres_mission (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists pi_ordres_mission_data_gin on public.pi_ordres_mission using gin (data);

create table if not exists public.pi_ordres_travaux (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists pi_ordres_travaux_data_gin on public.pi_ordres_travaux using gin (data);

create table if not exists public.pi_paiements_online (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists pi_paiements_online_data_gin on public.pi_paiements_online using gin (data);

create table if not exists public.pi_params (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists pi_params_data_gin on public.pi_params using gin (data);

create table if not exists public.pi_parcelles (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists pi_parcelles_data_gin on public.pi_parcelles using gin (data);

create table if not exists public.pi_parcelles_morcellement (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists pi_parcelles_morcellement_data_gin on public.pi_parcelles_morcellement using gin (data);

create table if not exists public.pi_partenaires_lot (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists pi_partenaires_lot_data_gin on public.pi_partenaires_lot using gin (data);

create table if not exists public.pi_permis (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists pi_permis_data_gin on public.pi_permis using gin (data);

create table if not exists public.pi_plans_arch (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists pi_plans_arch_data_gin on public.pi_plans_arch using gin (data);

create table if not exists public.pi_plans_morcellement (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists pi_plans_morcellement_data_gin on public.pi_plans_morcellement using gin (data);

create table if not exists public.pi_pointages (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists pi_pointages_data_gin on public.pi_pointages using gin (data);

create table if not exists public.pi_portail_analytics (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists pi_portail_analytics_data_gin on public.pi_portail_analytics using gin (data);

create table if not exists public.pi_portail_medias (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists pi_portail_medias_data_gin on public.pi_portail_medias using gin (data);

create table if not exists public.pi_portail_messages (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists pi_portail_messages_data_gin on public.pi_portail_messages using gin (data);

create table if not exists public.pi_postes_ouverts (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists pi_postes_ouverts_data_gin on public.pi_postes_ouverts using gin (data);

create table if not exists public.pi_previsionnels (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists pi_previsionnels_data_gin on public.pi_previsionnels using gin (data);

create table if not exists public.pi_prix_unitaire (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists pi_prix_unitaire_data_gin on public.pi_prix_unitaire using gin (data);

create table if not exists public.pi_programmes (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists pi_programmes_data_gin on public.pi_programmes using gin (data);

create table if not exists public.pi_proprietaires_bailleurs (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists pi_proprietaires_bailleurs_data_gin on public.pi_proprietaires_bailleurs using gin (data);

create table if not exists public.pi_quinzainiers (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists pi_quinzainiers_data_gin on public.pi_quinzainiers using gin (data);

create table if not exists public.pi_quittances (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists pi_quittances_data_gin on public.pi_quittances using gin (data);

create table if not exists public.pi_rapports_chantier (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists pi_rapports_chantier_data_gin on public.pi_rapports_chantier using gin (data);

create table if not exists public.pi_rapports_lot (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists pi_rapports_lot_data_gin on public.pi_rapports_lot using gin (data);

create table if not exists public.pi_rapprochements (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists pi_rapprochements_data_gin on public.pi_rapprochements using gin (data);

create table if not exists public.pi_receptions (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists pi_receptions_data_gin on public.pi_receptions using gin (data);

create table if not exists public.pi_receptions_dossiers (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists pi_receptions_dossiers_data_gin on public.pi_receptions_dossiers using gin (data);

create table if not exists public.pi_receptions_travaux (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists pi_receptions_travaux_data_gin on public.pi_receptions_travaux using gin (data);

create table if not exists public.pi_relances (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists pi_relances_data_gin on public.pi_relances using gin (data);

create table if not exists public.pi_relances_locatives (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists pi_relances_locatives_data_gin on public.pi_relances_locatives using gin (data);

create table if not exists public.pi_releves_bank (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists pi_releves_bank_data_gin on public.pi_releves_bank using gin (data);

create table if not exists public.pi_restitutions_caution (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists pi_restitutions_caution_data_gin on public.pi_restitutions_caution using gin (data);

create table if not exists public.pi_reunions_direction (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists pi_reunions_direction_data_gin on public.pi_reunions_direction using gin (data);

create table if not exists public.pi_segments_marketing (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists pi_segments_marketing_data_gin on public.pi_segments_marketing using gin (data);

create table if not exists public.pi_sig_couches (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists pi_sig_couches_data_gin on public.pi_sig_couches using gin (data);

create table if not exists public.pi_signalements (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists pi_signalements_data_gin on public.pi_signalements using gin (data);

create table if not exists public.pi_signatures (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists pi_signatures_data_gin on public.pi_signatures using gin (data);

create table if not exists public.pi_situations (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists pi_situations_data_gin on public.pi_situations using gin (data);

create table if not exists public.pi_situations_amenagement (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists pi_situations_amenagement_data_gin on public.pi_situations_amenagement using gin (data);

create table if not exists public.pi_stock_mouvements (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists pi_stock_mouvements_data_gin on public.pi_stock_mouvements using gin (data);

create table if not exists public.pi_suppressions (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists pi_suppressions_data_gin on public.pi_suppressions using gin (data);

create table if not exists public.pi_terrains (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists pi_terrains_data_gin on public.pi_terrains using gin (data);

create table if not exists public.pi_tiers_comptables (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists pi_tiers_comptables_data_gin on public.pi_tiers_comptables using gin (data);

create table if not exists public.pi_transferts_budgetaires (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists pi_transferts_budgetaires_data_gin on public.pi_transferts_budgetaires using gin (data);

create table if not exists public.pi_users (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists pi_users_data_gin on public.pi_users using gin (data);

create table if not exists public.pi_validations (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists pi_validations_data_gin on public.pi_validations using gin (data);

create table if not exists public.pi_vehicule_affectations (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists pi_vehicule_affectations_data_gin on public.pi_vehicule_affectations using gin (data);

create table if not exists public.pi_vehicule_carburant (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists pi_vehicule_carburant_data_gin on public.pi_vehicule_carburant using gin (data);

create table if not exists public.pi_vehicule_courses (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists pi_vehicule_courses_data_gin on public.pi_vehicule_courses using gin (data);

create table if not exists public.pi_vehicule_entretiens (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists pi_vehicule_entretiens_data_gin on public.pi_vehicule_entretiens using gin (data);

create table if not exists public.pi_vehicules (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists pi_vehicules_data_gin on public.pi_vehicules using gin (data);

create table if not exists public.pi_versements (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists pi_versements_data_gin on public.pi_versements using gin (data);

create table if not exists public.pi_visites_blacklist (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists pi_visites_blacklist_data_gin on public.pi_visites_blacklist using gin (data);

create table if not exists public.pi_visites_log (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists pi_visites_log_data_gin on public.pi_visites_log using gin (data);

create table if not exists public.pi_visites_rdv (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists pi_visites_rdv_data_gin on public.pi_visites_rdv using gin (data);

create table if not exists public.pi_workflow_configs (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists pi_workflow_configs_data_gin on public.pi_workflow_configs using gin (data);

-- ─────────────────────────────────────────────────────────────────────────
-- Accès : réplique le mode actuel (clé anon = accès complet, RLS désactivée).
-- C'est le comportement des instances en prod (Zahara, MENCO, ImmoSuite)
-- aujourd'hui. Durcissement RLS = chantier séparé (voir
-- supabase/schema/rls_portail.sql pour la base déjà rédigée par l'équipe,
-- non activée) — ne pas activer sans revue et bascule de l'app staff.
-- ─────────────────────────────────────────────────────────────────────────
