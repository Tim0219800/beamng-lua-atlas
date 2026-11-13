---@meta
-- tim19Atlas stub generated from lua/ge/extensions/scenario/raceMarkers/sideHologramMarker.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Marqueur portique avec piliers, cônes, colonnes et flèche.
---@class scenario_raceMarkers_sideHologramMarker
local scenario_raceMarkers_sideHologramMarker = {}

--- Supprime un objet à partir de son identifiant.
---Source : lua/ge/extensions/scenario/raceMarkers/sideHologramMarker.lua:509
---@param id integer|nil Identifiant d'objet.
function scenario_raceMarkers_sideHologramMarker:clearMarker(id) end

--- Supprime tous les objets créés.
---Source : lua/ge/extensions/scenario/raceMarkers/sideHologramMarker.lua:517
function scenario_raceMarkers_sideHologramMarker:clearMarkers() end

--- Supprime les anciens objets puis crée les 9 objets.
---Source : lua/ge/extensions/scenario/raceMarkers/sideHologramMarker.lua:495
function scenario_raceMarkers_sideHologramMarker:createMarkers() end

--- Crée un TSStatic caché enregistré sous objectName et ajouté à ScenarioObjectsGroup.
---Source : lua/ge/extensions/scenario/raceMarkers/sideHologramMarker.lua:473
---@param shapeName string Chemin du modèle.
---@param objectName string Nom d'enregistrement.
---@return table  L'objet créé.
function scenario_raceMarkers_sideHologramMarker:createObject(shapeName, objectName) end

--- Appelle setVisibility(false).
---Source : lua/ge/extensions/scenario/raceMarkers/sideHologramMarker.lua:469
function scenario_raceMarkers_sideHologramMarker:hide() end

--- Constructeur : initialise l'état et les couleurs.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/scenario/raceMarkers/sideHologramMarker.lua:105
---@param id integer Identifiant unique.
function scenario_raceMarkers_sideHologramMarker:init(id) end

--- Change de mode : affiche (sauf 'hidden') et lance le fondu.
---Source : lua/ge/extensions/scenario/raceMarkers/sideHologramMarker.lua:413
---@param mode string default, next, start, lap, recovery, final, branch ou hidden.
function scenario_raceMarkers_sideHologramMarker:setMode(mode) end

--- Calcule les positions au sol des deux piliers par lancers de rayon et place tous les objets.
---Source : lua/ge/extensions/scenario/raceMarkers/sideHologramMarker.lua:300
---@param wp table {pos, radius, normal?, nextPos?, fadeNear?, fadeFar?, minAlpha?}.
function scenario_raceMarkers_sideHologramMarker:setToCheckpoint(wp) end

--- Affiche ou cache les 9 objets.
---Source : lua/ge/extensions/scenario/raceMarkers/sideHologramMarker.lua:425
---@param v boolean Visibilité.
function scenario_raceMarkers_sideHologramMarker:setVisibility(v) end

--- Appelle setVisibility(true).
---Source : lua/ge/extensions/scenario/raceMarkers/sideHologramMarker.lua:470
function scenario_raceMarkers_sideHologramMarker:show() end

--- Appel par image : balancement vertical, fondu de couleur, taille des colonnes selon la distance, orientation de la flèche vers nextPos.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/scenario/raceMarkers/sideHologramMarker.lua:145
---@param dt number Durée réelle (s).
---@param dtSim number Durée simulée (s).
function scenario_raceMarkers_sideHologramMarker:update(dt, dtSim) end

