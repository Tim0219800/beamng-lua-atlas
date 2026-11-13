---@meta
-- tim19Atlas stub generated from lua/ge/extensions/scenario/raceMarkers/overhead.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Marqueur flèche au-dessus du checkpoint.
---@class scenario_raceMarkers_overhead
local scenario_raceMarkers_overhead = {}

--- Supprime l'objet créé.
---Source : lua/ge/extensions/scenario/raceMarkers/overhead.lua:189
function scenario_raceMarkers_overhead:clearMarkers() end

--- Supprime les anciens objets puis crée la flèche.
---Source : lua/ge/extensions/scenario/raceMarkers/overhead.lua:179
function scenario_raceMarkers_overhead:createMarkers() end

--- Crée un TSStatic caché enregistré sous objectName et ajouté à ScenarioObjectsGroup.
---Source : lua/ge/extensions/scenario/raceMarkers/overhead.lua:157
---@param shapeName string Chemin du modèle.
---@param objectName string Nom d'enregistrement.
---@return table  L'objet créé.
function scenario_raceMarkers_overhead:createObject(shapeName, objectName) end

--- Appelle setVisibility(false).
---Source : lua/ge/extensions/scenario/raceMarkers/overhead.lua:153
function scenario_raceMarkers_overhead:hide() end

--- Constructeur : initialise l'état.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/scenario/raceMarkers/overhead.lua:49
---@param id integer Identifiant unique.
function scenario_raceMarkers_overhead:init(id) end

--- 'hidden' masque, autre mode affiche ; mémorise l'ancien et le nouveau mode.
---Source : lua/ge/extensions/scenario/raceMarkers/overhead.lua:129
---@param mode string default, next, start, lap, final, branch ou hidden.
function scenario_raceMarkers_overhead:setMode(mode) end

--- Place le marqueur sur un checkpoint.
---Source : lua/ge/extensions/scenario/raceMarkers/overhead.lua:116
---@param wp table {pos, radius, fadeNear?, fadeFar?}.
function scenario_raceMarkers_overhead:setToCheckpoint(wp) end

--- Affiche ou cache la flèche.
---Source : lua/ge/extensions/scenario/raceMarkers/overhead.lua:144
---@param v boolean Visibilité.
function scenario_raceMarkers_overhead:setVisibility(v) end

--- Appelle setVisibility(true).
---Source : lua/ge/extensions/scenario/raceMarkers/overhead.lua:154
function scenario_raceMarkers_overhead:show() end

--- Appel par image : oriente la flèche vers la caméra, l'anime (0.4 + 0.4*sin) et ajuste couleur et alpha selon la distance.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/scenario/raceMarkers/overhead.lua:74
---@param dt number Durée réelle (s).
---@param dtSim number Durée simulée (s).
function scenario_raceMarkers_overhead:update(dt, dtSim) end

