---@meta
-- tim19Atlas stub generated from lua/ge/extensions/scenario/raceMarkers/ringMarker.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Marqueur anneau de checkpoint.
---@class scenario_raceMarkers_ringMarker
local scenario_raceMarkers_ringMarker = {}

--- Supprime l'objet créé.
---Source : lua/ge/extensions/scenario/raceMarkers/ringMarker.lua:205
function scenario_raceMarkers_ringMarker:clearMarkers() end

--- Supprime les anciens objets puis crée l'anneau.
---Source : lua/ge/extensions/scenario/raceMarkers/ringMarker.lua:195
function scenario_raceMarkers_ringMarker:createMarkers() end

--- Crée un TSStatic caché enregistré sous objectName et ajouté à ScenarioObjectsGroup.
---Source : lua/ge/extensions/scenario/raceMarkers/ringMarker.lua:173
---@param shapeName string Chemin du modèle.
---@param objectName string Nom d'enregistrement.
---@return table  L'objet créé.
function scenario_raceMarkers_ringMarker:createObject(shapeName, objectName) end

--- Appelle setVisibility(false).
---Source : lua/ge/extensions/scenario/raceMarkers/ringMarker.lua:169
function scenario_raceMarkers_ringMarker:hide() end

--- Constructeur : initialise l'état et copie la table des modes.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/scenario/raceMarkers/ringMarker.lua:56
---@param id integer Identifiant unique.
function scenario_raceMarkers_ringMarker:init(id) end

--- Passe à un mode : affiche (sauf 'hidden'), démarre le fondu de couleur depuis l'ancien mode et change le modèle.
---Source : lua/ge/extensions/scenario/raceMarkers/ringMarker.lua:146
---@param mode string default, next, start, lap, final, branch ou hidden.
function scenario_raceMarkers_ringMarker:setMode(mode) end

--- Place l'anneau (position, modèle selon wp.mode, rotation) sur un checkpoint.
---Source : lua/ge/extensions/scenario/raceMarkers/ringMarker.lua:127
---@param wp table {pos, radius, normal?, up?, mode?}.
function scenario_raceMarkers_ringMarker:setToCheckpoint(wp) end

--- Affiche ou cache l'anneau.
---Source : lua/ge/extensions/scenario/raceMarkers/ringMarker.lua:162
---@param v boolean Visibilité.
function scenario_raceMarkers_ringMarker:setVisibility(v) end

--- Appelle setVisibility(true).
---Source : lua/ge/extensions/scenario/raceMarkers/ringMarker.lua:170
function scenario_raceMarkers_ringMarker:show() end

--- Appel par image : avance le fondu de couleur, masque l'anneau une fois en mode 'hidden', met à jour échelle et couleur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/scenario/raceMarkers/ringMarker.lua:81
---@param dt number Durée réelle (s).
---@param dtSim number Durée simulée (s).
function scenario_raceMarkers_ringMarker:update(dt, dtSim) end

