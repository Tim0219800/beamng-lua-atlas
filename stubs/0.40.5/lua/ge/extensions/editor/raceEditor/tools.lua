---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/raceEditor/tools.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Tools window (windowDescription = 'Tools'). Instantiated with init(raceEditor).
---@class editor_raceEditor_tools
local editor_raceEditor_tools = {}

--- Modifies the same field of several pathnodes in a single history action (old values stored for undo).
---Source: lua/ge/extensions/editor/raceEditor/tools.lua:113
---@param field string Pathnode field (pos, normal, radius...).
---@param newDataMap table<integer, any> Maps the pathnode ID to the new value.
function editor_raceEditor_tools:changeFieldMulti(field, newDataMap) end

--- Creates a "<path name>_decoration" SimGroup (numeric suffix if the name already exists) in MissionGroup and places one object per transform in it: TSStatic for a .dae, prefab (spawnPrefab) for a .prefab / .prefab.json, depending on the side (l/r). Remembers the group as the last created group.
---Source: lua/ge/extensions/editor/raceEditor/tools.lua:42
---@param transforms table List of transforms {side='l'|'r', pos, rot, scl} from pathnode:getSideTransforms.
function editor_raceEditor_tools:createDecoration(transforms) end

--- Displays a "name" line with a check or cross icon depending on classification[field].
---Source: lua/ge/extensions/editor/raceEditor/tools.lua:298
---@param classification table Result of path:classify().
---@param name string Label.
---@param field string Key tested.
---@param tt string|nil Tooltip.
function editor_raceEditor_tools:displayClassification(classification, name, field, tt) end

--- Called every frame: draws the tools UI.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/raceEditor/tools.lua:38
function editor_raceEditor_tools:draw() end

--- Draws all the content: side decorations, pathnode tools and debug tools.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/raceEditor/tools.lua:129
function editor_raceEditor_tools:drawGeneralInfo() end

--- Displays a check icon if the file exists (FS:fileExists), otherwise an error icon, with a path tooltip.
---Source: lua/ge/extensions/editor/raceEditor/tools.lua:92
---@param f string File path.
function editor_raceEditor_tools:existsIcon(f) end

--- Returns the side decoration parameters entered in the window, to pass to pathnode:getSideTransforms.
---Source: lua/ge/extensions/editor/raceEditor/tools.lua:123
---@return vec3  Position offset.
---@return vec3  Rotation offset in radians (entered degrees × π/180).
---@return vec3  Scale.
---@return string  Alignment mode: terrain, pathnode or absolute.
function editor_raceEditor_tools:getSideTransformParameters() end

--- Stores raceEditor and initializes the decoration position, rotation and scale offsets.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/raceEditor/tools.lua:19
---@param raceEditor table Module editor_raceEditor.
function editor_raceEditor_tools:init(raceEditor) end

--- Called when the tab becomes active; does nothing.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/raceEditor/tools.lua:35
function editor_raceEditor_tools:selected() end

--- Dropdown to select a path object for a field (see notes: non-functional and unused here).
---Source: lua/ge/extensions/editor/raceEditor/tools.lua:311
---@param name string Label.
---@param objects table Collection (objects, sorted) of nodes or positions.
---@param fieldName string Path field.
---@param clrI ColorI|nil Text background color.
---@param tt string|nil Tooltip.
function editor_raceEditor_tools:selector(name, objects, fieldName, clrI, tt) end

--- Sets the race path being edited.
---Source: lua/ge/extensions/editor/raceEditor/tools.lua:32
---@param path table gameplay/race/path object.
function editor_raceEditor_tools:setPath(path) end

--- Called when the tab is left; does nothing.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/raceEditor/tools.lua:36
function editor_raceEditor_tools:unselect() end

