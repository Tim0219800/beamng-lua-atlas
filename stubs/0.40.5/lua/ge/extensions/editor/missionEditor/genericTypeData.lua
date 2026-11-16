---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/missionEditor/genericTypeData.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Instance of the "Mission Type Data" panel. Main fields: missionEditor, mission, missionTypes (sorted list), missionTypeEditors (editor per type), rawEditPerMission, oldMissionTypeData, mtdIssues.
---@class editor_missionEditor_genericTypeData
local editor_missionEditor_genericTypeData = {}

--- Changes the mission's type: saves the current type's data, creates (or restores) those of the new type, then calls setMission again.
---Source: lua/ge/extensions/editor/missionEditor/genericTypeData.lua:77
---@param newType string New mission type.
---@param force boolean|nil If true, clears the history of the old data of this mission before saving.
function editor_missionEditor_genericTypeData:changeMissionType(newType, force) end

--- Draws the panel: mission type combo, "Raw" checkbox, "Auto fix N issues" button, then the type's editor or the raw JSON editor.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/missionEditor/genericTypeData.lua:244
function editor_missionEditor_genericTypeData:draw() end

--- For each type whose editor defines toolsFunctions, creates a submenu and calls that function.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/missionEditor/genericTypeData.lua:340
function editor_missionEditor_genericTypeData:drawTools() end

--- Calls drawViews(list of missions) on each type editor that defines it.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/missionEditor/genericTypeData.lua:364
function editor_missionEditor_genericTypeData:drawViews() end

--- For each type whose editor defines viewFunctions, creates a submenu and calls that function.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/missionEditor/genericTypeData.lua:352
function editor_missionEditor_genericTypeData:drawViewsMenu() end

--- Replaces mission.missionTypeData with the fresh data provided by the mission's type editor (getNewData), or {} if there is none.
---Source: lua/ge/extensions/editor/missionEditor/genericTypeData.lua:72
---@param mission table Mission to fill.
function editor_missionEditor_genericTypeData:fillGeneric(mission) end

--- Returns the editor of the current mission's type.
---Source: lua/ge/extensions/editor/missionEditor/genericTypeData.lua:372
---@return table|nil  Editor (editorHelper) of the current type.
function editor_missionEditor_genericTypeData:getCurrentEditorHelper() end

--- Returns a mission's list of issues: result of checkContainer of its type's editor, plus those of the type's calculateMissionIssues if it exists (called in pcall).
---Source: lua/ge/extensions/editor/missionEditor/genericTypeData.lua:375
---@param m table Mission to check.
---@return table[]  List of elements {label, severity}.
function editor_missionEditor_genericTypeData:getMissionIssues(m) end

--- Constructor called by the function returned by the module. Gets the sorted list of mission types and the editor of each type.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/missionEditor/genericTypeData.lua:25
---@param missionEditor table Main editor_missionEditor module.
function editor_missionEditor_genericTypeData:init(missionEditor) end

--- Looks for /gameplay/missionTypes/<missionType>/editor.lua and instantiates it with missionEditor. If the file does not exist or does not load, creates a generic editor via gameplay_missions_missions.editorHelper.
---Source: lua/ge/extensions/editor/missionEditor/genericTypeData.lua:41
---@param missionType string Mission type name.
function editor_missionEditor_genericTypeData:loadEditor(missionType) end

--- Opens the imgui popup "missionFGVariables" (Flowgraph variables helper).
---Source: lua/ge/extensions/editor/missionEditor/genericTypeData.lua:99
function editor_missionEditor_genericTypeData:openPopup() end

--- Sets the current mission, passes the container to its type's editor (setContainer) and recomputes the issues (checkContainer) into self.mtdIssues.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/missionEditor/genericTypeData.lua:60
---@param mission table Mission data (id, missionType, missionTypeData...).
function editor_missionEditor_genericTypeData:setMission(mission) end

--- Draws the popup that sorts the mission type's fields into missing variables, variables of a different type, correct ones, and variables present only in the Flowgraph. The buttons add the missing variables (default value of the type) or fix their type in the current Flowgraph project (editor_flowgraphEditor.getManager()). Call every frame.
---Source: lua/ge/extensions/editor/missionEditor/genericTypeData.lua:103
function editor_missionEditor_genericTypeData:variablesHelperPopup() end

