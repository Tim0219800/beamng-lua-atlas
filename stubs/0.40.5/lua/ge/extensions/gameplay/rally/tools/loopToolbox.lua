---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/tools/loopToolbox.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Rally loop tools window. Main fields: missionDropdownItems, selectedMissionIndex, selectedMissionId, selectedMissionDir, drawRoute, drawLabels, drawZOnTop, drawSignboards, drawVehBB, drawLeadingPoint, showDebugInfo (imgui BoolPtr), signboards, syncedManager.
---@class gameplay_rally_tools_loopToolbox
local gameplay_rally_tools_loopToolbox = {}

--- Passes the showDebugInfo option to the loop manager (setDrawFlag) and remembers this manager as synced.
---Source: lua/ge/extensions/gameplay/rally/tools/loopToolbox.lua:102
---@param manager table|nil RallyLoopManager.
function gameplay_rally_tools_loopToolbox:applyManagerDrawFlags(manager) end

--- Draws the whole content of the window (to be called between im.Begin and im.End).
---Source: lua/ge/extensions/gameplay/rally/tools/loopToolbox.lua:384
---@param manager table|nil Active RallyLoopManager; without a manager, only the loading part is displayed.
function gameplay_rally_tools_loopToolbox:draw(manager) end

--- 3D debug drawing: delegates to gameplay_rallyLoop.drawDebug with the zOnTop, route and labels options.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/tools/loopToolbox.lua:1076
function gameplay_rally_tools_loopToolbox:drawDebug() end

--- Draws the short name of each signboard found above its position (debugDrawer:drawTextAdvanced).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/tools/loopToolbox.lua:1081
function gameplay_rally_tools_loopToolbox:drawSignboardsDebug() end

--- Displays the schedule's validation problems (blocking ones in red, others in orange) or "Validation: OK".
---Source: lua/ge/extensions/gameplay/rally/tools/loopToolbox.lua:356
---@param manager table RallyLoopManager.
---@return boolean  true if there is a blocking problem or if the schedule is invalid.
function gameplay_rally_tools_loopToolbox:drawValidation(manager) end

--- Looks in the scene for the rally signboards and stores them in self.signboards, with their position, shapeName and `flag` dynamic field.
---Source: lua/ge/extensions/gameplay/rally/tools/loopToolbox.lua:150
---@return integer  Number of signboards found.
function gameplay_rally_tools_loopToolbox:findSignboards() end

--- Formats a duration as [h:]mm:ss (or with tenths).
---Source: lua/ge/extensions/gameplay/rally/tools/loopToolbox.lua:332
---@param seconds number|nil Duration in seconds.
---@param showSubseconds boolean|nil true to display tenths.
---@return string  Text, 'N/A' if nil.
function gameplay_rally_tools_loopToolbox:formatDuration(seconds, showSubseconds) end

--- Id of the mission chosen in the menu (extracted from "Name (id)").
---Source: lua/ge/extensions/gameplay/rally/tools/loopToolbox.lua:139
---@return string|nil  Id, nil if "<none>".
function gameplay_rally_tools_loopToolbox:getSelectedMissionId() end

--- Constructor: initializes the options, loads the saved settings and the mission list.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/tools/loopToolbox.lua:21
function gameplay_rally_tools_loopToolbox:init() end

--- Rereads this file and applies the options; if the file is absent, creates default settings all set to false. Looks for the signboards if their display was enabled.
---Source: lua/ge/extensions/gameplay/rally/tools/loopToolbox.lua:62
function gameplay_rally_tools_loopToolbox:loadSettings() end

--- Fills the dropdown with the rallyLoop missions of the current level ("Name (id)") and selects the saved mission if it exists.
---Source: lua/ge/extensions/gameplay/rally/tools/loopToolbox.lua:108
function gameplay_rally_tools_loopToolbox:refreshMissionList() end

--- Writes the chosen mission and the drawing options to /settings/rally/loopToolbox.json.
---Source: lua/ge/extensions/gameplay/rally/tools/loopToolbox.lua:48
function gameplay_rally_tools_loopToolbox:saveSettings() end

