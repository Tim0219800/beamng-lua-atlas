---@meta
-- tim19Atlas stub generated from lua/ge/extensions/telemetry/trackers/physics.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Suiveur de télémétrie physique : rapporte les instabilités physiques avec assez de contexte pour les reproduire (évènement « physicsInstability » : modèle, config, mod d'origine, niveau, vitesse de simulation, nombre de véhicules, position et somme des dégâts de sections du véhicule) puis demande l'écriture du rapport.
--- Accès : extension `telemetry_trackers_physics` : `extensions.load("telemetry_trackers_physics")`, puis la globale `telemetry_trackers_physics`
---@class telemetry_trackers_physics
---@field dependencies string[] telemetry_core.
telemetry_trackers_physics = {}

--- Hook appelé au chargement : déchargement manuel.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/trackers/physics.lua:46
function telemetry_trackers_physics.onExtensionLoaded() end

--- Hook appelé quand une instabilité physique est détectée sur un véhicule : construit et envoie l'évènement, puis appelle telemetry_core.triggerReportWrite().
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/trackers/physics.lua:18
---@param vid integer Id du véhicule instable.
---@param returnData table Table de retour des gestionnaires d'instabilité (non utilisée ici).
function telemetry_trackers_physics.onInstabilityDetected(vid, returnData) end

