---@meta
-- tim19Atlas stub generated from lua/ge/extensions/scenario/raceMarkers/directionMarker.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Marqueur flèche de direction.
---@class scenario_raceMarkers_directionMarker
local scenario_raceMarkers_directionMarker = {}

--- Supprime l'objet créé.
---Source : lua/ge/extensions/scenario/raceMarkers/directionMarker.lua:146
function scenario_raceMarkers_directionMarker:clearMarkers() end

--- Supprime les anciens objets puis crée la flèche.
---Source : lua/ge/extensions/scenario/raceMarkers/directionMarker.lua:135
function scenario_raceMarkers_directionMarker:createMarkers() end

--- Crée un TSStatic caché (avec instanceColor et instanceColor1) enregistré sous objectName et ajouté à ScenarioObjectsGroup.
---Source : lua/ge/extensions/scenario/raceMarkers/directionMarker.lua:112
---@param shapeName string Chemin du modèle.
---@param objectName string Nom d'enregistrement.
---@return table  L'objet créé.
function scenario_raceMarkers_directionMarker:createObject(shapeName, objectName) end

--- Appelle setVisibility(false).
---Source : lua/ge/extensions/scenario/raceMarkers/directionMarker.lua:109
function scenario_raceMarkers_directionMarker:hide() end

--- Constructeur : initialise l'état.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/scenario/raceMarkers/directionMarker.lua:43
---@param id integer Identifiant unique.
function scenario_raceMarkers_directionMarker:init(id) end

--- 'hidden' masque, autre mode affiche ; mémorise le mode.
---Source : lua/ge/extensions/scenario/raceMarkers/directionMarker.lua:88
---@param mode string Nom du mode.
function scenario_raceMarkers_directionMarker:setMode(mode) end

--- Place la flèche sur un checkpoint et applique la couleur.
---Source : lua/ge/extensions/scenario/raceMarkers/directionMarker.lua:73
---@param wp table {pos, rot?, radius?}.
function scenario_raceMarkers_directionMarker:setToCheckpoint(wp) end

--- Affiche ou cache la flèche.
---Source : lua/ge/extensions/scenario/raceMarkers/directionMarker.lua:100
---@param v boolean Visibilité.
function scenario_raceMarkers_directionMarker:setVisibility(v) end

--- Appelle setVisibility(true).
---Source : lua/ge/extensions/scenario/raceMarkers/directionMarker.lua:110
function scenario_raceMarkers_directionMarker:show() end

--- Appel par image : applique position (avec va-et-vient), rotation et échelle à la flèche.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/scenario/raceMarkers/directionMarker.lua:56
---@param dt number Durée réelle (s).
---@param dtSim number Durée simulée (s).
function scenario_raceMarkers_directionMarker:update(dt, dtSim) end

