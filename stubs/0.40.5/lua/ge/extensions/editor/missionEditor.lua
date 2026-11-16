---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/missionEditor.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- World editor "Mission Editor" window to create and edit the game's missions (info.json of each mission folder). It lists the missions with filters (current level, procedural, career, freeroam), search and grouping (level, type, date, branch), and offers the File menu (new mission, save, delete). It instantiates the sub-windows of the missionEditor/ folder (general, conditions, careerSetup, additionalAttributes, startTrigger, layers, setupModules, genericTypeData, objectives, progressSingle, progressMulti, playbookUtils, issues, previewChecker) and delegates the editing of each section. Depends on gameplay_missions_missions.
--- Access: extension `editor_missionEditor`: `extensions.load("editor_missionEditor")`, then the global `editor_missionEditor`
---@class editor_missionEditor
---@field dependencies string[] {'gameplay_missions_missions'}: extension loaded before this one.
editor_missionEditor = {}

--- Simulates a click on a mission: it will be selected on the next frame.
---Source: lua/ge/extensions/editor/missionEditor.lua:1730
---@param m table Mission data (element of getMissionList).
function editor_missionEditor.clickMission(m) end

--- Returns the edit helper of the current mission type, only if the window is visible and a mission is loaded; otherwise nil.
---Source: lua/ge/extensions/editor/missionEditor.lua:1752
---@return table|nil  Result of missionTypeWindow:getCurrentEditorHelper().
function editor_missionEditor.getCurrentEditorHelperWhenActive() end

--- Returns the list of mission data loaded by the editor (gameplay_missions_missions.getFilesData), or nil if it has not been loaded yet.
---Source: lua/ge/extensions/editor/missionEditor.lua:1729
---@return table[]|nil  Missions, each with id, name, missionFolder, _dirty, etc.
function editor_missionEditor.getMissionList() end

--- Returns the sub-window for the mission type's own data (genericTypeData).
---Source: lua/ge/extensions/editor/missionEditor.lua:1733
---@return table  Window object, empty table before the first display.
function editor_missionEditor.getMissionTypeWindow() end

--- Returns the mission currently clicked. Despite the name, it is the mission table (clickedMission) and not its id.
---Source: lua/ge/extensions/editor/missionEditor.lua:1786
---@return table|nil  Data of the clicked mission.
function editor_missionEditor.getSelectedMissionId() end

--- Returns the start trigger editor sub-window (startTrigger).
---Source: lua/ge/extensions/editor/missionEditor.lua:1732
---@return table|nil  Window object, nil before the first display.
function editor_missionEditor.getStartTriggerWindow() end

--- Hook called for each line of the game console; only prints print(timer).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/missionEditor.lua:1782
---@param timer number Timestamp of the message.
---@param lvl string Level (unused).
---@param origin string Origin (unused).
---@param line string Text (unused).
function editor_missionEditor.onConsoleLog(timer, lvl, origin, line) end

--- Deserialization hook: reselects the last mission (setMissionById) and forces the opening of the remembered tree and tab.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/missionEditor.lua:1711
---@param data table|nil Data from onSerialize.
function editor_missionEditor.onDeserialized(data) end

--- Hook called every frame by the world editor: draws the Mission Editor window (menu bar, list, mission tabs, issues window) and handles clicks.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/missionEditor.lua:1074
function editor_missionEditor.onEditorGui() end

--- World editor initialization hook: registers the windows mission_editor (1500x700) and mission_issues (700x700), the "Mission Editor" menu entry (Missions group), loads the filter and restores showWindows from the preferences.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/missionEditor.lua:1673
function editor_missionEditor.onEditorInitialized() end

--- Hook: registers the missionEditor.general preferences category (groupFilter, showWindows, shortIds, alwaysShowScreenshots).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/missionEditor.lua:1689
---@param prefsRegistry table Editor preferences registry.
function editor_missionEditor.onEditorRegisterPreferences(prefsRegistry) end

--- Extension serialization hook: remembers the id of the last displayed mission and the last tab.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/missionEditor.lua:1703
---@return table  {lastSelectedMissionId, lastTabItemShown}.
function editor_missionEditor.onSerialize() end

--- Reloads the whole missions system (gameplay_missions_missions.reloadCompleteMissionSystem), rereads the list, finds the previously displayed mission, updates the sub-windows again and reapplies filter, search and grouping.
---Source: lua/ge/extensions/editor/missionEditor.lua:1758
function editor_missionEditor.reloadMissionSystem() end

--- Selects the mission with the given id and opens the tree. Loads the list if needed. With instant, the sub-windows are updated right away (setMission). Does nothing if the id does not exist.
---Source: lua/ge/extensions/editor/missionEditor.lua:1734
---@param id string Mission identifier.
---@param instant boolean|nil true to apply immediately to the sub-windows.
function editor_missionEditor.setMissionById(id, instant) end

--- Opens the "mission_editor" window (editor.showWindow) and reloads the saved grouping filter.
---Source: lua/ge/extensions/editor/missionEditor.lua:1668
function editor_missionEditor.show() end

