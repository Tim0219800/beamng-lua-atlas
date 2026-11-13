---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/speedTraps.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `gameplay_speedTraps` : `extensions.load("gameplay_speedTraps")`, puis la globale `gameplay_speedTraps`
---@class gameplay_speedTraps
gameplay_speedTraps = {}

---Source : lua/ge/extensions/gameplay/speedTraps.lua:105
---@param speedTrapType any
function gameplay_speedTraps.getSpeedTrapsInCurrentLevel(speedTrapType) end

--- example data
---   {
---     event = "enter",
---     speedLimit = "11.176",
---     speedTrapLightName = "speedTrapLight1",
---     speedTrapType = "speed",
---     subjectID = 46855,
---     subjectName = "clone0",
---     triggerEvent = 0,
---     triggerID = 16584,
---     triggerName = "speedTrapTrigger1"
---   }
---Source : lua/ge/extensions/gameplay/speedTraps.lua:45
---@param data any
function gameplay_speedTraps.onBeamNGTrigger(data) end

