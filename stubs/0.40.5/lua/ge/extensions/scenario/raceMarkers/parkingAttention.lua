---@meta
-- tim19Atlas stub generated from lua/ge/extensions/scenario/raceMarkers/parkingAttention.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Parois de debug autour d'une place de parking.
---@class scenario_raceMarkers_parkingAttention
local scenario_raceMarkers_parkingAttention = {}

--- Efface la table d'identifiants.
---Source : lua/ge/extensions/scenario/raceMarkers/parkingAttention.lua:126
function scenario_raceMarkers_parkingAttention:clearMarkers() end

--- Conservé pour la compatibilité d'API avec les autres marqueurs : ne crée aucun objet.
---Source : lua/ge/extensions/scenario/raceMarkers/parkingAttention.lua:122
function scenario_raceMarkers_parkingAttention:createMarkers() end

--- Appelle setVisibility(false).
---Source : lua/ge/extensions/scenario/raceMarkers/parkingAttention.lua:118
function scenario_raceMarkers_parkingAttention:hide() end

--- Constructeur : initialise l'état.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/scenario/raceMarkers/parkingAttention.lua:34
---@param id integer Identifiant unique.
function scenario_raceMarkers_parkingAttention:init(id) end

--- 'hidden' masque, autre mode affiche.
---Source : lua/ge/extensions/scenario/raceMarkers/parkingAttention.lua:101
---@param mode string Nom du mode.
function scenario_raceMarkers_parkingAttention:setMode(mode) end

--- Mémorise la place de parking à entourer.
---Source : lua/ge/extensions/scenario/raceMarkers/parkingAttention.lua:79
---@param wp table {pos, rot, scl} ou {parkingSpot = {pos, rot, scl}}.
function scenario_raceMarkers_parkingAttention:setToCheckpoint(wp) end

--- Active ou désactive le dessin.
---Source : lua/ge/extensions/scenario/raceMarkers/parkingAttention.lua:114
---@param v boolean Visibilité.
function scenario_raceMarkers_parkingAttention:setVisibility(v) end

--- Appelle setVisibility(true).
---Source : lua/ge/extensions/scenario/raceMarkers/parkingAttention.lua:119
function scenario_raceMarkers_parkingAttention:show() end

--- Appel par image : avance le minuteur de mode, masque après le fondu en 'hidden' et dessine les quatre parois si une place est définie.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/scenario/raceMarkers/parkingAttention.lua:49
---@param dt number Durée réelle (s).
---@param dtSim number Durée simulée (s).
function scenario_raceMarkers_parkingAttention:update(dt, dtSim) end

