---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/rallyEditor/ghostNotebook/ghostRenderer.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Object returned by the constructor (new(rallyEditor)). Fields: rallyEditor, cache {path, snaproad, entries}.
---@class editor_rallyEditor_ghostNotebook_ghostRenderer
local editor_rallyEditor_ghostNotebook_ghostRenderer = {}

--- Builds the list of ghost notebook entries: for each non-missing pacenote with a corner start and end, computes the road positions, the label position and the distance along the road, then sorts by distance. Stores the result in self.cache.
---Source: lua/ge/extensions/editor/rallyEditor/ghostNotebook/ghostRenderer.lua:137
---@param path table Ghost notebook (uses path.pacenotes.sorted).
---@param snaproad table Road snaproad object (closestSnapResult, driveline).
---@return table  Cache {path, snaproad, entries}.
function editor_rallyEditor_ghostNotebook_ghostRenderer:buildCache(path, snaproad) end

--- Called every frame: locates the camera on the snaproad, selects the entries within the distance window, decides which labels to display (selection and previous/next neighbors according to the preferences) and calls drawEntry.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/rallyEditor/ghostNotebook/ghostRenderer.lua:205
---@param path table Ghost notebook to display.
---@param snaproad table Road snaproad.
---@param globalOpacity number|nil Opacity multiplier, 1.0 by default.
---@param pacenoteToolsState table|nil Pacenote tools state (selected_pn_id, selected_wp_id).
---@param activePath table|nil Notebook currently being edited, to find the selected pacenote.
function editor_rallyEditor_ghostNotebook_ghostRenderer:draw(path, snaproad, globalOpacity, pacenoteToolsState, activePath) end

--- Draws an entry's label at its corner start position. The text comes from rallyEditor.getGhostNotebookLabelForPacenote, otherwise from the pacenote's name. Draws nothing if drawLabel is false or the text is empty.
---Source: lua/ge/extensions/editor/rallyEditor/ghostNotebook/ghostRenderer.lua:179
---@param entry table Cache entry {pacenote, positions, labelPos, distanceAlongRoute}.
---@param lineColor ColorF Line color (unused while the drawing is disabled).
---@param textAlpha number Text opacity, 0 to 1.
---@param textBgAlpha integer Text background opacity, 0 to 255.
---@param drawLabel boolean Whether or not to draw the label.
---@param prismWidth number Prism width (unused while the drawing is disabled).
function editor_rallyEditor_ghostNotebook_ghostRenderer:drawEntry(entry, lineColor, textAlpha, textBgAlpha, drawLabel, prismWidth) end

--- Returns the current cache if it matches the same notebook and snaproad, otherwise rebuilds it.
---Source: lua/ge/extensions/editor/rallyEditor/ghostNotebook/ghostRenderer.lua:172
---@param path table Ghost notebook.
---@param snaproad table Snaproad.
---@return table  Cache.
function editor_rallyEditor_ghostNotebook_ghostRenderer:getCache(path, snaproad) end

--- Internal constructor: stores the editor and empties the cache.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/rallyEditor/ghostNotebook/ghostRenderer.lua:13
---@param rallyEditor table Editor instance (provides the preferences and getGhostNotebookLabelForPacenote).
function editor_rallyEditor_ghostNotebook_ghostRenderer:init(rallyEditor) end

