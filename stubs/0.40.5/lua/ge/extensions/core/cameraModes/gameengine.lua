---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/cameraModes/gameengine.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Filtre de sortie vers le moteur.
---@class core_cameraModes_gameengine
local core_cameraModes_gameengine = {}

--- isGlobal = true, runningOrder = 1, isFilter = true, hidden = true.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/cameraModes/gameengine.lua:12
function core_cameraModes_gameengine:init() end

--- Pousse data.res vers la vue principale ou vers data.renderView.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/cameraModes/gameengine.lua:68
---@param data table camData (data.renderView = nom de vue, 'main' pour le joueur)
function core_cameraModes_gameengine:update(data) end

