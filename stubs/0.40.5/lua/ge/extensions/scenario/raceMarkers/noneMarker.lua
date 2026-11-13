---@meta
-- tim19Atlas stub generated from lua/ge/extensions/scenario/raceMarkers/noneMarker.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Marqueur sans effet visuel, interface identique aux autres marqueurs de course.
---@class scenario_raceMarkers_noneMarker
local scenario_raceMarkers_noneMarker = {}

--- Ne supprime rien.
---Source : lua/ge/extensions/scenario/raceMarkers/noneMarker.lua:35
function scenario_raceMarkers_noneMarker:clearMarkers() end

--- Ne crée aucun objet.
---Source : lua/ge/extensions/scenario/raceMarkers/noneMarker.lua:31
function scenario_raceMarkers_noneMarker:createMarkers() end

--- Appelle setVisibility(false).
---Source : lua/ge/extensions/scenario/raceMarkers/noneMarker.lua:27
function scenario_raceMarkers_noneMarker:hide() end

--- Constructeur appelé par le module : ne fait rien (l'id n'est pas mémorisé).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/scenario/raceMarkers/noneMarker.lua:8
---@param id integer Identifiant de marqueur (ignoré).
function scenario_raceMarkers_noneMarker:init(id) end

--- Ne fait rien.
---Source : lua/ge/extensions/scenario/raceMarkers/noneMarker.lua:20
---@param mode string Ignoré.
function scenario_raceMarkers_noneMarker:setMode(mode) end

--- Ne fait rien.
---Source : lua/ge/extensions/scenario/raceMarkers/noneMarker.lua:17
---@param wp table Données de checkpoint (ignorées).
---@param mode string|nil Ignoré.
function scenario_raceMarkers_noneMarker:setToCheckpoint(wp, mode) end

--- Ne fait rien.
---Source : lua/ge/extensions/scenario/raceMarkers/noneMarker.lua:24
---@param v boolean Ignoré.
function scenario_raceMarkers_noneMarker:setVisibility(v) end

--- Appelle setVisibility(true).
---Source : lua/ge/extensions/scenario/raceMarkers/noneMarker.lua:28
function scenario_raceMarkers_noneMarker:show() end

--- Appel par image : ne fait rien.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/scenario/raceMarkers/noneMarker.lua:12
function scenario_raceMarkers_noneMarker:update() end

