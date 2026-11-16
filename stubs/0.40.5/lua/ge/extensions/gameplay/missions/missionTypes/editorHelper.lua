---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/missions/missionTypes/editorHelper.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Mission type editor class. Instance fields: elements (ordered list), autoAdditionalAttributes, mission (mission being edited), mouseInfo (mouse state for the gizmos).
---@class gameplay_missions_missionTypes_editorHelper
local gameplay_missions_missionTypes_editorHelper = {}

--- Checkbox; default false. If hideElementList is given, these elements are moved right after it and hidden when the checkbox is unchecked.
---Source: lua/ge/extensions/gameplay/missions/missionTypes/editorHelper.lua:32
---@param label string Label.
---@param fieldName string Key in missionTypeData.
---@param defaultValue boolean|nil Default value.
---@param hideElementList table[]|nil Elements to display only when the checkbox is checked.
---@param displayOptions table|nil Display options.
---@return table  Element.
function gameplay_missions_missionTypes_editorHelper:addBool(label, fieldName, defaultValue, hideElementList, displayOptions) end

--- Adds a custom element managed by your own functions.
---Source: lua/ge/extensions/gameplay/missions/missionTypes/editorHelper.lua:19
---@param label string Label.
---@param getNewFunction function|nil function(element) -> list {fieldName, value} of default values.
---@param setMissionFunction function|nil function(element, missionTypeData) called when a mission is loaded.
---@param drawFunction function|nil function(element, missionTypeData, mission, mouseInfo) -> true if the value changed.
---@return table  Element.
function gameplay_missions_missionTypes_editorHelper:addCustomElement(label, getNewFunction, setMissionFunction, drawFunction) end

--- Decoration: vertical space of given height (1 by default).
---Source: lua/ge/extensions/gameplay/missions/missionTypes/editorHelper.lua:197
---@param height number|nil Height.
---@return table  Element.
function gameplay_missions_missionTypes_editorHelper:addDecoDummy(height) end

--- Decoration: colored title (default, orange, red, green, blue, white, black).
---Source: lua/ge/extensions/gameplay/missions/missionTypes/editorHelper.lua:193
---@param text string|nil Text.
---@param color string|nil Color name.
---@return table  Element.
function gameplay_missions_missionTypes_editorHelper:addDecoHeader(text, color) end

--- Decoration: separator line.
---Source: lua/ge/extensions/gameplay/missions/missionTypes/editorHelper.lua:195
---@return table  Element.
function gameplay_missions_missionTypes_editorHelper:addDecoSeparator() end

--- Decoration: 4-pixel vertical space.
---Source: lua/ge/extensions/gameplay/missions/missionTypes/editorHelper.lua:196
---@return table  Element.
function gameplay_missions_missionTypes_editorHelper:addDecoSpacer() end

--- Decoration: text line with optional tooltip.
---Source: lua/ge/extensions/gameplay/missions/missionTypes/editorHelper.lua:194
---@param text string|nil Text.
---@param tooltip string|nil Tooltip.
---@return table  Element.
function gameplay_missions_missionTypes_editorHelper:addDecoText(text, tooltip) end

--- Dropdown list of values; if the list is empty, it contains "issues Values!". Default: first element.
---Source: lua/ge/extensions/gameplay/missions/missionTypes/editorHelper.lua:166
---@param label string Label.
---@param fieldName string Key in missionTypeData.
---@param values table Possible values.
---@param defaultValue any Default value.
---@param valueTooltips table|nil Tooltips per value.
---@return table  Element.
function gameplay_missions_missionTypes_editorHelper:addDropdown(label, fieldName, values, defaultValue, valueTooltips) end

--- Adds an already built element to the list (assigns _id, normalizes displayOptions). All addXxx methods go through it and return the element.
---Source: lua/ge/extensions/gameplay/missions/missionTypes/editorHelper.lua:198
---@param element table Element {type, ...}.
---@return table  The added element.
function gameplay_missions_missionTypes_editorHelper:addElement(element) end

--- File path with file selector.
---Source: lua/ge/extensions/gameplay/missions/missionTypes/editorHelper.lua:104
---@param label string Label.
---@param fieldName string Key in missionTypeData.
---@param defaultValue string|nil Default path.
---@param allowedExtensions table[]|nil List of {description, pattern} pairs, e.g. {"Sites File","*.sites.json"}.
---@param displayOptions table|nil Options (optional: the file is then not checked).
---@return table  Element.
function gameplay_missions_missionTypes_editorHelper:addFile(label, fieldName, defaultValue, allowedExtensions, displayOptions) end

--- File expected at a fixed name in the mission folder (a string, or a list of which one of the files is required). Stores no value.
---Source: lua/ge/extensions/gameplay/missions/missionTypes/editorHelper.lua:113
---@param label string Label.
---@param filepathsInMissionfolder string|string[] File name(s).
---@param displayOptions table|nil Display options.
---@return table  Element.
function gameplay_missions_missionTypes_editorHelper:addFixedFile(label, filepathsInMissionfolder, displayOptions) end

--- Leaderboard settings: number of entries and reference results best / medium / worst. Defaults: 10, 80, 120, 200.
---Source: lua/ge/extensions/gameplay/missions/missionTypes/editorHelper.lua:141
---@param label string Label.
---@param fieldName string Key prefix.
---@param defaultCount integer|nil Number of entries.
---@param defaultBest number|nil Best result.
---@param defaultMedium number|nil Medium result.
---@param defaultWorst number|nil Worst result.
---@return table  Element.
function gameplay_missions_missionTypes_editorHelper:addLeaderboard(label, fieldName, defaultCount, defaultBest, defaultMedium, defaultWorst) end

--- Field containing the id of another mission; default "(none)".
---Source: lua/ge/extensions/gameplay/missions/missionTypes/editorHelper.lua:176
---@param label string Label.
---@param fieldName string Key in missionTypeData.
---@param defaultValue string|nil Default value.
---@param displayOptions table|nil Display options.
---@return table  Element.
function gameplay_missions_missionTypes_editorHelper:addMissionId(label, fieldName, defaultValue, displayOptions) end

--- Vehicle choice (model + configuration). Default: model "sbr", config "TT_RWD_S_M". Stored in <fieldName>Model / Config / ConfigPath.
---Source: lua/ge/extensions/gameplay/missions/missionTypes/editorHelper.lua:93
---@param label string Label.
---@param fieldName string Key prefix.
---@param defaultModel string|nil Default model.
---@param defaultConfig string|nil Default config.
---@param displayOptions table|nil Display options.
---@return table  Element.
function gameplay_missions_missionTypes_editorHelper:addModelConfig(label, fieldName, defaultModel, defaultConfig, displayOptions) end

--- Numeric (float) field; default 0.
---Source: lua/ge/extensions/gameplay/missions/missionTypes/editorHelper.lua:22
---@param label string Label.
---@param fieldName string Key in missionTypeData.
---@param defaultValue number|nil Default value.
---@param displayOptions table|nil Display options (optional, associatedStars...).
---@return table  Element.
function gameplay_missions_missionTypes_editorHelper:addNumeric(label, fieldName, defaultValue, displayOptions) end

--- Race file (addFile filtered on *.path.json) of type "race".
---Source: lua/ge/extensions/gameplay/missions/missionTypes/editorHelper.lua:125
---@param label string Label.
---@param fieldName string Key in missionTypeData.
---@param defaultValue string|nil Default path.
---@param ... any displayOptions passed to addFile.
---@return table  Element.
function gameplay_missions_missionTypes_editorHelper:addRace(label, fieldName, defaultValue, ...) end

--- Numeric field of type "reward".
---Source: lua/ge/extensions/gameplay/missions/missionTypes/editorHelper.lua:161
---@param label string Label.
---@param fieldName string Key in missionTypeData.
---@param defaultValue number|nil Default value.
---@return table  Element.
function gameplay_missions_missionTypes_editorHelper:addReward(label, fieldName, defaultValue) end

--- Simple lap configuration (editor/util/lapConfigUtil tool).
---Source: lua/ge/extensions/gameplay/missions/missionTypes/editorHelper.lua:130
---@param label string Label.
---@param fieldName string Key in missionTypeData.
---@param displayOptions table|nil Display options.
---@return table  Element.
function gameplay_missions_missionTypes_editorHelper:addSimpleLapConfig(label, fieldName, displayOptions) end

--- Sites file (addFile filtered on *.sites.json) of type "sites".
---Source: lua/ge/extensions/gameplay/missions/missionTypes/editorHelper.lua:136
---@param label string Label.
---@param fieldName string Key in missionTypeData.
---@param defaultValue string|nil Default path.
---@return table  Element.
function gameplay_missions_missionTypes_editorHelper:addSites(label, fieldName, defaultValue) end

--- Text field (1024-character buffer by default); default empty string.
---Source: lua/ge/extensions/gameplay/missions/missionTypes/editorHelper.lua:26
---@param label string Label.
---@param fieldName string Key in missionTypeData.
---@param defaultValue string|nil Default value.
---@param len integer|nil Buffer size.
---@param displayOptions table|nil Display options.
---@return table  Element.
function gameplay_missions_missionTypes_editorHelper:addString(label, fieldName, defaultValue, len, displayOptions) end

--- Position / rotation / scale editable in the 3D world (transformUtil gizmo). Stored in <fieldName>Pos, <fieldName>Rot, <fieldName>Scl.
---Source: lua/ge/extensions/gameplay/missions/missionTypes/editorHelper.lua:55
---@param label string Label.
---@param fieldName string Key prefix.
---@param valueOptions table|nil {defaultPos, defaultRot, defaultScl, hasPos, hasRot, hasScl, oneDimScale}.
---@param displayOptions table|nil {drawMode='sphere'|'vehicle'|'sphereDir'|'halfBox'|'fullBox', drawColor={r,g,b,a}, ...}.
---@return table  Element.
function gameplay_missions_missionTypes_editorHelper:addTransform(label, fieldName, valueOptions, displayOptions) end

--- Checks missionTypeData against the elements: missing fields, different types, extra fields, nonexistent models/configs/files. Returns the list of problems {label, severity, fixable, data}.
---Source: lua/ge/extensions/gameplay/missions/missionTypes/editorHelper.lua:374
---@param m table Mission.
---@param fix boolean|nil Parameter declared but unused in the part read (inferred from code).
---@return table[]  List of problems.
function gameplay_missions_missionTypes_editorHelper:checkMission(m, fix) end

--- Empties the list of elements.
---Source: lua/ge/extensions/gameplay/missions/missionTypes/editorHelper.lua:211
function gameplay_missions_missionTypes_editorHelper:clear() end

--- Draws all elements (imgui widgets and 3D gizmos); marks mission._dirty when a value changes. filterOptions.onlyStar limits the display to the elements associated with a star.
---Source: lua/ge/extensions/gameplay/missions/missionTypes/editorHelper.lua:1024
---@param filterOptions table|nil {onlyStar = star key}.
function gameplay_missions_missionTypes_editorHelper:draw(filterOptions) end

--- Draws a box aligned on three axes from a corner with debugDrawer.
---Source: lua/ge/extensions/gameplay/missions/missionTypes/editorHelper.lua:1179
---@param corner vec3 Corner.
---@param x vec3 X axis (vector).
---@param y vec3 Y axis (vector).
---@param z vec3 Z axis (vector).
---@param clr ColorF Color.
function gameplay_missions_missionTypes_editorHelper:drawAxisBox(corner, x, y, z, clr) end

--- Draws a transform as a sphere with a direction arrow.
---Source: lua/ge/extensions/gameplay/missions/missionTypes/editorHelper.lua:1066
---@param e table Transform element.
function gameplay_missions_missionTypes_editorHelper:drawTransformAsSphereDir(e) end

--- Draws a transform as a vehicle box (other drawing helper functions).
---Source: lua/ge/extensions/gameplay/missions/missionTypes/editorHelper.lua:1105
---@param e table Transform element.
function gameplay_missions_missionTypes_editorHelper:drawTransformAsVehicle(e) end

--- Returns whether a transform (of an element or of the start trigger) is being edited.
---Source: lua/ge/extensions/gameplay/missions/missionTypes/editorHelper.lua:1011
---@return boolean  true if so.
function gameplay_missions_missionTypes_editorHelper:editingAnyTransform() end

--- Lists all missionTypeData fields handled by the editor, with their type.
---Source: lua/ge/extensions/gameplay/missions/missionTypes/editorHelper.lua:1278
---@return table[]  List of fields with type.
function gameplay_missions_missionTypes_editorHelper:getAllFieldNames() end

--- Builds the default missionTypeData table of a new mission by gathering the default values of all elements.
---Source: lua/ge/extensions/gameplay/missions/missionTypes/editorHelper.lua:256
---@return table<string, any>  Field -> default value.
function gameplay_missions_missionTypes_editorHelper:getNewData() end

--- Enables or disables the automatic generation of an additional mission attribute.
---Source: lua/ge/extensions/gameplay/missions/missionTypes/editorHelper.lua:1288
---@param key string Attribute key.
---@param auto boolean|nil true by default.
function gameplay_missions_missionTypes_editorHelper:setAutoAdditionalAttributes(key, auto) end

--- Loads a mission into the editor: stores self.mission and updates each widget from mission.missionTypeData, then calls valueChangedCallback.
---Source: lua/ge/extensions/gameplay/missions/missionTypes/editorHelper.lua:297
---@param m table Mission (with missionTypeData).
function gameplay_missions_missionTypes_editorHelper:setMission(m) end

--- Updates mouseInfo: camera position, ray and ray hit under the mouse (forest collision disabled during the cast), click/hold/release state, hovered element.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/missions/missionTypes/editorHelper.lua:946
---@param mission table Mission being edited.
function gameplay_missions_missionTypes_editorHelper:updateMouseInfo(mission) end

