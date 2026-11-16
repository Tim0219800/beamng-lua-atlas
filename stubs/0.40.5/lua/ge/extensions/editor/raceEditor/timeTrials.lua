---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/raceEditor/timeTrials.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Time Trials window (windowDescription = 'Time Trials'). Instantiated with init(raceEditor); the module is stored in self.pathEditor.
---@class editor_raceEditor_timeTrials
local editor_raceEditor_timeTrials = {}

--- If the new value differs from path[field], commits a history action that modifies this path field.
---Source: lua/ge/extensions/editor/raceEditor/timeTrials.lua:65
---@param field string Path field name (name, description, authors, difficulty, prefabs, forwardPrefabs, reversePrefabs).
---@param new any New value.
---@param add string|nil Detail added to the history action name.
function editor_raceEditor_timeTrials:changeField(field, new, add) end

--- Displays a "name:" line with a check or cross icon depending on classification[field].
---Source: lua/ge/extensions/editor/raceEditor/timeTrials.lua:148
---@param classification table Result of path:classify() (keys reversible, allowRollingStart...).
---@param name string Label.
---@param field string Key tested in classification.
---@param tt string|nil Tooltip.
function editor_raceEditor_timeTrials:displayClassification(classification, name, field, tt) end

--- Called every frame: draws the general information.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/raceEditor/timeTrials.lua:58
function editor_raceEditor_timeTrials:draw() end

--- Draws the whole form: text fields, difficulty, classification, preview indicator (hover = image, click = refresh) and prefab lists.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/raceEditor/timeTrials.lua:74
function editor_raceEditor_timeTrials:drawGeneralInfo() end

--- Draws the prefab list of a field: read-only automatic entry, then for each prefab delete, input, file picker and existence icon, and an Add button.
---Source: lua/ge/extensions/editor/raceEditor/timeTrials.lua:195
---@param fieldName string prefabs, forwardPrefabs or reversePrefabs.
---@param default string Name of the automatically loaded prefab.
function editor_raceEditor_timeTrials:drawPrefabs(fieldName, default) end

--- Displays a check icon (file found) or error icon (not found) for a prefab, testing several paths (with/without .prefab, .prefab.json, .json, level or path folder). The tooltip lists the file found or the paths tried.
---Source: lua/ge/extensions/editor/raceEditor/timeTrials.lua:159
---@param f string|table<integer, string> File name, or explicit list of paths to test.
---@param inPathFolder boolean|nil Supposed to search in the race path folder (no effect, see notes).
function editor_raceEditor_timeTrials:existsIcon(f, inPathFolder) end

--- Looks for <folder><file name>.jpg; if present, loads it as the preview texture, otherwise clears the preview.
---Source: lua/ge/extensions/editor/raceEditor/timeTrials.lua:48
function editor_raceEditor_timeTrials:findPreview() end

--- Stores the raceEditor module in self.pathEditor.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/raceEditor/timeTrials.lua:24
---@param raceEditor table Module editor_raceEditor.
function editor_raceEditor_timeTrials:init(raceEditor) end

--- Reloads name, description, authors and prefab lists from the path, then looks for the preview image.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/raceEditor/timeTrials.lua:32
function editor_raceEditor_timeTrials:selected() end

--- Sets the race path being edited and reloads the window fields (calls selected()).
---Source: lua/ge/extensions/editor/raceEditor/timeTrials.lua:28
---@param path table gameplay/race/path object.
function editor_raceEditor_timeTrials:setPath(path) end

--- Called when the tab is left; does nothing.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/raceEditor/timeTrials.lua:56
function editor_raceEditor_timeTrials:unselect() end

