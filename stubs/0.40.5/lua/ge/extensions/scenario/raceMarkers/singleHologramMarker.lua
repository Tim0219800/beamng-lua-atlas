---@meta
-- tim19Atlas stub generated from lua/ge/extensions/scenario/raceMarkers/singleHologramMarker.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Marqueur colonne unique.
---@class scenario_raceMarkers_singleHologramMarker
local scenario_raceMarkers_singleHologramMarker = {}

--- Supprime un objet à partir de son identifiant.
---Source : lua/ge/extensions/scenario/raceMarkers/singleHologramMarker.lua:210
---@param id integer|nil Identifiant d'objet.
function scenario_raceMarkers_singleHologramMarker:clearMarker(id) end

--- Supprime la colonne.
---Source : lua/ge/extensions/scenario/raceMarkers/singleHologramMarker.lua:217
function scenario_raceMarkers_singleHologramMarker:clearMarkers() end

--- Supprime l'ancien objet puis crée la colonne.
---Source : lua/ge/extensions/scenario/raceMarkers/singleHologramMarker.lua:205
function scenario_raceMarkers_singleHologramMarker:createMarkers() end

--- Crée un TSStatic caché enregistré sous objectName et ajouté à ScenarioObjectsGroup.
---Source : lua/ge/extensions/scenario/raceMarkers/singleHologramMarker.lua:184
---@param shapeName string Chemin du modèle.
---@param objectName string Nom d'enregistrement.
---@return table  L'objet créé.
function scenario_raceMarkers_singleHologramMarker:createObject(shapeName, objectName) end

--- Appelle setVisibility(false).
---Source : lua/ge/extensions/scenario/raceMarkers/singleHologramMarker.lua:181
function scenario_raceMarkers_singleHologramMarker:hide() end

--- Constructeur : initialise l'état.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/scenario/raceMarkers/singleHologramMarker.lua:74
---@param id integer Identifiant unique.
function scenario_raceMarkers_singleHologramMarker:init(id) end

--- Change de mode : affiche (sauf 'hidden') et lance le fondu.
---Source : lua/ge/extensions/scenario/raceMarkers/singleHologramMarker.lua:163
---@param mode string default, next, start, lap, recovery, final, branch ou hidden.
function scenario_raceMarkers_singleHologramMarker:setMode(mode) end

--- Pose la colonne sur le sol sous le checkpoint.
---Source : lua/ge/extensions/scenario/raceMarkers/singleHologramMarker.lua:131
---@param wp table {pos, radius, normal?, fadeNear?, fadeFar?, minAlpha?}.
function scenario_raceMarkers_singleHologramMarker:setToCheckpoint(wp) end

--- Affiche ou cache la colonne.
---Source : lua/ge/extensions/scenario/raceMarkers/singleHologramMarker.lua:173
---@param v boolean Visibilité.
function scenario_raceMarkers_singleHologramMarker:setVisibility(v) end

--- Appelle setVisibility(true).
---Source : lua/ge/extensions/scenario/raceMarkers/singleHologramMarker.lua:182
function scenario_raceMarkers_singleHologramMarker:show() end

--- Appel par image : fondu, couleur, alpha et hauteur de colonne selon la distance, oscillation.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/scenario/raceMarkers/singleHologramMarker.lua:94
---@param dt number Durée réelle (s).
---@param dtSim number Durée simulée (s).
function scenario_raceMarkers_singleHologramMarker:update(dt, dtSim) end

