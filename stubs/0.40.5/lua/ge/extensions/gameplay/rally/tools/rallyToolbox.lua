---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/tools/rallyToolbox.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe locale `C` de lua/ge/extensions/gameplay/rally/tools/rallyToolbox.lua (instanciée par la fonction renvoyée par le module)
---@class gameplay_rally_tools_rallyToolbox
local gameplay_rally_tools_rallyToolbox = {}

---Source : lua/ge/extensions/gameplay/rally/tools/rallyToolbox.lua:386
function gameplay_rally_tools_rallyToolbox:_cancelVehiclePlacement() end

---Source : lua/ge/extensions/gameplay/rally/tools/rallyToolbox.lua:117
function gameplay_rally_tools_rallyToolbox:_invalidateVoicepackCache() end

---Source : lua/ge/extensions/gameplay/rally/tools/rallyToolbox.lua:391
---@param pos any
function gameplay_rally_tools_rallyToolbox:_placeVehicleAt(pos) end

---Source : lua/ge/extensions/gameplay/rally/tools/rallyToolbox.lua:489
---@param filepath any
---@param ownerMissionId any
function gameplay_rally_tools_rallyToolbox:_spawnPrefab(filepath, ownerMissionId) end

---Source : lua/ge/extensions/gameplay/rally/tools/rallyToolbox.lua:381
function gameplay_rally_tools_rallyToolbox:_startVehiclePlacement() end

---Source : lua/ge/extensions/gameplay/rally/tools/rallyToolbox.lua:414
function gameplay_rally_tools_rallyToolbox:_updateVehiclePlacementMode() end

---Source : lua/ge/extensions/gameplay/rally/tools/rallyToolbox.lua:1076
function gameplay_rally_tools_rallyToolbox:clearReccePoints() end

---Source : lua/ge/extensions/gameplay/rally/tools/rallyToolbox.lua:644
function gameplay_rally_tools_rallyToolbox:draw() end

---Source : lua/ge/extensions/gameplay/rally/tools/rallyToolbox.lua:1195
function gameplay_rally_tools_rallyToolbox:drawDebug() end

---Source : lua/ge/extensions/gameplay/rally/tools/rallyToolbox.lua:255
function gameplay_rally_tools_rallyToolbox:drawLoopTools() end

---Source : lua/ge/extensions/gameplay/rally/tools/rallyToolbox.lua:562
function gameplay_rally_tools_rallyToolbox:drawPrefabTools() end

---Source : lua/ge/extensions/gameplay/rally/tools/rallyToolbox.lua:287
---@param rm any
function gameplay_rally_tools_rallyToolbox:drawRallyRecoveryTools(rm) end

---Source : lua/ge/extensions/gameplay/rally/tools/rallyToolbox.lua:444
function gameplay_rally_tools_rallyToolbox:drawVehicleTools() end

--- Voicepack picker dropdown. Entry shape: { label, pick = { type, scope, dirname } }.
---  Picker entries are built once per mission load and cached on the toolbox instance.
---  The closed-combo label is cached per (missionDir, pick) pair. Both rebuild only on
---  mission change, on user pick change, or on runtime resync / asset rebuild.
---  TODO: persist the pick across sessions (currently in-memory only).
---Source : lua/ge/extensions/gameplay/rally/tools/rallyToolbox.lua:150
---@param rm any
function gameplay_rally_tools_rallyToolbox:drawVoicepackPicker(rm) end

---Source : lua/ge/extensions/gameplay/rally/tools/rallyToolbox.lua:137
function gameplay_rally_tools_rallyToolbox:getDebugLogging() end

--- Returns the current race object, and assigns debug colors to each segment if not already set.
---  Alternates colors between orange and yellow for visual debugging.
---Source : lua/ge/extensions/gameplay/rally/tools/rallyToolbox.lua:216
function gameplay_rally_tools_rallyToolbox:getRace() end

---Source : lua/ge/extensions/gameplay/rally/tools/rallyToolbox.lua:129
function gameplay_rally_tools_rallyToolbox:getRallyManager() end

---Source : lua/ge/extensions/gameplay/rally/tools/rallyToolbox.lua:41
function gameplay_rally_tools_rallyToolbox:init() end

---Source : lua/ge/extensions/gameplay/rally/tools/rallyToolbox.lua:125
---@param debugLogging any
function gameplay_rally_tools_rallyToolbox:setDebugLogging(debugLogging) end

---Source : lua/ge/extensions/gameplay/rally/tools/rallyToolbox.lua:240
---@param enabled any
function gameplay_rally_tools_rallyToolbox:setMouseAsVehicleEnabled(enabled) end

---Source : lua/ge/extensions/gameplay/rally/tools/rallyToolbox.lua:107
---@param rallyManager any
function gameplay_rally_tools_rallyToolbox:setRallyManager(rallyManager) end

---Source : lua/ge/extensions/gameplay/rally/tools/rallyToolbox.lua:251
function gameplay_rally_tools_rallyToolbox:toggleMouseMovementCheckbox() end

