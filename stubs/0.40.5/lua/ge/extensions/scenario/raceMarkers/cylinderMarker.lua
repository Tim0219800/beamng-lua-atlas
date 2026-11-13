---@meta
-- tim19Atlas stub generated from lua/ge/extensions/scenario/raceMarkers/cylinderMarker.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Marqueur cylindre de checkpoint.
---@class scenario_raceMarkers_cylinderMarker
local scenario_raceMarkers_cylinderMarker = {}

--- Supprime les objets créés.
---Source : lua/ge/extensions/scenario/raceMarkers/cylinderMarker.lua:152
function scenario_raceMarkers_cylinderMarker:clearMarkers() end

--- Supprime les anciens objets puis crée la base et le cylindre.
---Source : lua/ge/extensions/scenario/raceMarkers/cylinderMarker.lua:138
function scenario_raceMarkers_cylinderMarker:createMarkers() end

--- Crée un TSStatic caché enregistré sous objectName et ajouté à ScenarioObjectsGroup.
---Source : lua/ge/extensions/scenario/raceMarkers/cylinderMarker.lua:116
---@param shapeName string Chemin du modèle.
---@param objectName string Nom d'enregistrement.
---@return table  L'objet créé.
function scenario_raceMarkers_cylinderMarker:createObject(shapeName, objectName) end

--- Appelle setVisibility(false).
---Source : lua/ge/extensions/scenario/raceMarkers/cylinderMarker.lua:112
function scenario_raceMarkers_cylinderMarker:hide() end

--- Constructeur : initialise l'état (invisible, tables de couleurs par mode copiées).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/scenario/raceMarkers/cylinderMarker.lua:25
---@param id integer Identifiant unique.
function scenario_raceMarkers_cylinderMarker:init(id) end

--- Choisit la couleur selon le mode ('hidden' masque, sinon affiche).
---Source : lua/ge/extensions/scenario/raceMarkers/cylinderMarker.lua:89
---@param mode string default, next, start, lap, recovery, final, branch ou hidden.
function scenario_raceMarkers_cylinderMarker:setMode(mode) end

--- Place base et cylindre sur un checkpoint.
---Source : lua/ge/extensions/scenario/raceMarkers/cylinderMarker.lua:71
---@param wp table {pos, radius, fadeNear?, fadeFar?}.
function scenario_raceMarkers_cylinderMarker:setToCheckpoint(wp) end

--- Affiche ou cache la base et le cylindre.
---Source : lua/ge/extensions/scenario/raceMarkers/cylinderMarker.lua:102
---@param v boolean Visibilité.
function scenario_raceMarkers_cylinderMarker:setVisibility(v) end

--- Appelle setVisibility(true).
---Source : lua/ge/extensions/scenario/raceMarkers/cylinderMarker.lua:113
function scenario_raceMarkers_cylinderMarker:show() end

--- Appel par image : recalcule la transparence d'après la distance à la caméra (core_camera.getPosition) et met à jour les couleurs d'instance.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/scenario/raceMarkers/cylinderMarker.lua:46
function scenario_raceMarkers_cylinderMarker:update() end

