---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/drift/freeroam/cruising.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Détecte en roaming libre le passage en mode « cruising » de drift : quand le joueur enchaîne assez de drifts (ou fait un très long drift), le contexte drift passe de "inFreeroam" à "inFreeroamCruising" (ce qui fait afficher l'interface de drift) puis revient à "inFreeroam" après quelques secondes sans drifter. Lit gameplay_drift_drift et pilote gameplay_drift_general.setContext.
--- Accès : extension `gameplay_drift_freeroam_cruising` : `extensions.load("gameplay_drift_freeroam_cruising")`, puis la globale `gameplay_drift_freeroam_cruising`
---@class gameplay_drift_freeroam_cruising
---@field dependencies string[] gameplay_drift_general et gameplay_drift_drift, chargés avant.
gameplay_drift_freeroam_cruising = {}

--- Appelé à chaque frame : teste le début du cruising (detectStart) puis sa fin (detectEnd). Si le debug général est actif, mesure le coût avec un LuaProfiler.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drift/freeroam/cruising.lua:46
---@param dtReal number Delta temps réel en secondes (inutilisé).
---@param dtSim number Delta temps simulé en secondes, utilisé pour le décompte de fin.
---@param dtRaw number Delta temps brut en secondes (inutilisé).
function gameplay_drift_freeroam_cruising.onUpdate(dtReal, dtSim, dtRaw) end

