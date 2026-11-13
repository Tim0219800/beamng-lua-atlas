---@meta
-- tim19Atlas stub generated from lua/ge/extensions/scenario/raceMarkers/sideMarker.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Marqueur à courbes latérales.
---@class scenario_raceMarkers_sideMarker
local scenario_raceMarkers_sideMarker = {}

--- Supprime les objets créés.
---Source : lua/ge/extensions/scenario/raceMarkers/sideMarker.lua:301
function scenario_raceMarkers_sideMarker:clearMarkers() end

--- Supprime les anciens objets puis crée base, côtés et version distante.
---Source : lua/ge/extensions/scenario/raceMarkers/sideMarker.lua:283
function scenario_raceMarkers_sideMarker:createMarkers() end

--- Crée un TSStatic caché enregistré sous objectName et ajouté à ScenarioObjectsGroup.
---Source : lua/ge/extensions/scenario/raceMarkers/sideMarker.lua:261
---@param shapeName string Chemin du modèle.
---@param objectName string Nom d'enregistrement.
---@return table  L'objet créé.
function scenario_raceMarkers_sideMarker:createObject(shapeName, objectName) end

--- Masque et mémorise la couleur 'hidden'.
---Source : lua/ge/extensions/scenario/raceMarkers/sideMarker.lua:248
function scenario_raceMarkers_sideMarker:hide() end

--- Constructeur : initialise l'état et copie la table des modes.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/scenario/raceMarkers/sideMarker.lua:69
---@param id integer Identifiant unique.
function scenario_raceMarkers_sideMarker:init(id) end

--- Change de mode : affiche (sauf 'hidden'), lance le fondu de couleur et change le modèle des côtés.
---Source : lua/ge/extensions/scenario/raceMarkers/sideMarker.lua:212
---@param mode string default, next, start, lap, final, branch ou hidden.
function scenario_raceMarkers_sideMarker:setMode(mode) end

--- Place base, côtés et marqueur distant sur un checkpoint.
---Source : lua/ge/extensions/scenario/raceMarkers/sideMarker.lua:187
---@param wp table {pos, radius, normal?, fadeNear?, fadeFar?, mode?}.
function scenario_raceMarkers_sideMarker:setToCheckpoint(wp) end

--- Affiche ou cache les trois objets.
---Source : lua/ge/extensions/scenario/raceMarkers/sideMarker.lua:235
---@param v boolean Visibilité.
function scenario_raceMarkers_sideMarker:setVisibility(v) end

--- Affiche en restaurant la couleur mémorisée.
---Source : lua/ge/extensions/scenario/raceMarkers/sideMarker.lua:254
function scenario_raceMarkers_sideMarker:show() end

--- Appel par image : gère le fondu proche/lointain, la rotation vers la normale ou la caméra, les couleurs et l'alpha de la base, des côtés et de la version distante.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/scenario/raceMarkers/sideMarker.lua:104
---@param dt number Durée réelle (s).
---@param dtSim number Durée simulée (s).
function scenario_raceMarkers_sideMarker:update(dt, dtSim) end

