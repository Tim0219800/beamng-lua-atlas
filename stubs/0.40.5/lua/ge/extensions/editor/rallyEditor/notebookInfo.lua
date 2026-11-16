---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/rallyEditor/notebookInfo.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Tab object returned by the constructor (new(rallyEditor)). Fields: rallyEditor, path (edited notebook), valid, windowDescription = 'Notebook'.
---@class editor_rallyEditor_notebookInfo
local editor_rallyEditor_notebookInfo = {}

--- Forgets the notebook and empties the text fields.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/rallyEditor/notebookInfo.lua:34
function editor_rallyEditor_notebookInfo:clearState() end

--- Draws the tab (delegates to drawNotebook).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/rallyEditor/notebookInfo.lua:78
---@param mouseInfo table Mouse information (not used).
function editor_rallyEditor_notebookInfo:draw(mouseInfo) end

--- Displays the calibration fields defined in the notebook, or a button to initialize them if they do not exist.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/rallyEditor/notebookInfo.lua:142
function editor_rallyEditor_notebookInfo:drawCalibrationMetadataFields() end

--- Draws the ghost notebook selector (list of choices, "(none)" option, error message) by calling the rally editor's ghostNotebook functions.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/rallyEditor/notebookInfo.lua:96
function editor_rallyEditor_notebookInfo:drawGhostNotebook() end

--- Validates then draws the notebook information (any errors, id, file), the editable fields with undo/redo, the audio mode, then the calibration and ghost sections.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/rallyEditor/notebookInfo.lua:165
function editor_rallyEditor_notebookInfo:drawNotebook() end

--- Internal constructor: stores the editor, valid = true.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/rallyEditor/notebookInfo.lua:29
---@param rallyEditor table Rally editor instance.
function editor_rallyEditor_notebookInfo:init(rallyEditor) end

--- Returns the result of the last validation.
---Source: lua/ge/extensions/editor/rallyEditor/notebookInfo.lua:42
---@return boolean  true if the notebook is valid.
function editor_rallyEditor_notebookInfo:isValid() end

--- Called by the editor when the tab is selected: copies the notebook's name, authors and description into the fields, then emits onEditorEditModeChanged(nil, nil) to redraw the shortcut legend.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/rallyEditor/notebookInfo.lua:60
function editor_rallyEditor_notebookInfo:selected() end

--- Sets the notebook edited by the tab.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/rallyEditor/notebookInfo.lua:55
---@param path table Notebook object.
function editor_rallyEditor_notebookInfo:setPath(path) end

--- Called when the tab is left: emits onEditorEditModeChanged(nil, nil).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/rallyEditor/notebookInfo.lua:72
function editor_rallyEditor_notebookInfo:unselect() end

--- Runs path:validate() and updates valid according to path:is_valid(). The issues are in path.validation_issues.
---Source: lua/ge/extensions/editor/rallyEditor/notebookInfo.lua:46
function editor_rallyEditor_notebookInfo:validate() end

