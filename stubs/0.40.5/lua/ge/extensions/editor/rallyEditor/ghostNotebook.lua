---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/rallyEditor/ghostNotebook.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Object returned by the module constructor (new(rallyEditor)). Fields: rallyEditor, selectedFname, path (loaded notebook), labels (table id -> label), error (message or nil).
---@class editor_rallyEditor_ghostNotebook
local editor_rallyEditor_ghostNotebook = {}

--- Returns the notebook currently being edited (path field of the pacenotes window), or nil.
---Source: lua/ge/extensions/editor/rallyEditor/ghostNotebook.lua:282
---@return table|nil  Active notebook.
function editor_rallyEditor_ghostNotebook:activeNotebook() end

--- Forgets the selected ghost notebook, its path, labels and error.
---Source: lua/ge/extensions/editor/rallyEditor/ghostNotebook.lua:249
function editor_rallyEditor_ghostNotebook:clear() end

--- Alias of clear(), called by the editor on a state reset.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/rallyEditor/ghostNotebook.lua:256
function editor_rallyEditor_ghostNotebook:clearState() end

--- Returns the last load error message.
---Source: lua/ge/extensions/editor/rallyEditor/ghostNotebook.lua:333
---@return string|nil  Error message, or nil.
function editor_rallyEditor_ghostNotebook:getError() end

--- Returns the text to display for a ghost pacenote. In '<metadata>' mode, builds the label from the calibration metadata (empty string if absent); otherwise uses the cache then recomputes.
---Source: lua/ge/extensions/editor/rallyEditor/ghostNotebook.lua:337
---@param pacenote table|nil Ghost notebook pacenote.
---@return string|nil  Label, or nil if pacenote is nil.
function editor_rallyEditor_ghostNotebook:getLabelForPacenote(pacenote) end

--- Returns the loaded ghost notebook.
---Source: lua/ge/extensions/editor/rallyEditor/ghostNotebook.lua:320
---@return table|nil  Notebook object, or nil.
function editor_rallyEditor_ghostNotebook:getPath() end

--- Returns the selected file name (or '<metadata>').
---Source: lua/ge/extensions/editor/rallyEditor/ghostNotebook.lua:324
---@return string|nil  Selected path.
function editor_rallyEditor_ghostNotebook:getSelectedFname() end

--- Returns the display label of the selected ghost, or '(none)' if nothing is selected.
---Source: lua/ge/extensions/editor/rallyEditor/ghostNotebook.lua:328
---@return string  Label.
function editor_rallyEditor_ghostNotebook:getSelectedLabel() end

--- Internal constructor: stores the editor and resets the state.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/rallyEditor/ghostNotebook.lua:244
---@param rallyEditor table Rally editor instance (uses getCurrentMissionDir and getPacenotesWindow).
function editor_rallyEditor_ghostNotebook:init(rallyEditor) end

--- Lists the selectable ghosts: first the '<metadata>' entry, then each notebook in the mission folder. Returns an empty table if there is no current mission.
---Source: lua/ge/extensions/editor/rallyEditor/ghostNotebook.lua:260
---@return table<integer, {fname: string, basename: string, label: string}>  Each entry gives the full path, the base name and the display label (without .notebook.json).
function editor_rallyEditor_ghostNotebook:listChoices() end

--- Loads the indicated ghost notebook ('<metadata>' = active notebook), refreshes its structured notes and precomputes the labels. An empty or nil name clears the selection. On failure, fills self.error and logs an error.
---Source: lua/ge/extensions/editor/rallyEditor/ghostNotebook.lua:287
---@param fname string|nil Full path of the notebook, or '<metadata>'.
---@return boolean  true if the selection succeeded (or was cleared), false if the notebook could not be loaded.
function editor_rallyEditor_ghostNotebook:select(fname) end

