---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/rallyEditor/recceTab.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Recce tab instance (windowDescription = 'Recce').
---@class editor_rallyEditor_recceTab
local editor_rallyEditor_recceTab = {}

--- Replaces the recce's driveline with a version downsampled according to straightnessThreshold.
---Source: lua/ge/extensions/editor/rallyEditor/recceTab.lua:54
function editor_rallyEditor_recceTab:downsample() end

--- Draws the tab (does nothing without a notebook).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/rallyEditor/recceTab.lua:156
---@param mouseInfo table Editor mouse information (not used here).
function editor_rallyEditor_recceTab:draw(mouseInfo) end

--- 3D debug drawing: calls recce:drawDebugRecce with the labels option.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/rallyEditor/recceTab.lua:161
---@param mouseInfo table Mouse information passed to the recce.
function editor_rallyEditor_recceTab:drawDebugEntrypoint(mouseInfo) end

--- Draws the UI: refresh, labels, driveline/cuts info, Import button, Downsample button and threshold slider.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/rallyEditor/recceTab.lua:59
function editor_rallyEditor_recceTab:drawSectionV3() end

--- Formats a distance as "123.456m", or in km above 950 m.
---Source: lua/ge/extensions/editor/rallyEditor/recceTab.lua:43
---@param dist number Distance in meters.
---@return string  Text with 3 decimals and unit.
function editor_rallyEditor_recceTab:formatDistance(dist) end

--- Creates the pacenote data from the cuts, adds them to the notebook (appendPacenotes) and displays the Pacenotes tab.
---Source: lua/ge/extensions/editor/rallyEditor/recceTab.lua:147
function editor_rallyEditor_recceTab:import() end

--- Constructor: stores rallyEditor; recce = nil, drawLabels = false.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/rallyEditor/recceTab.lua:14
---@param rallyEditor table Parent rally editor.
function editor_rallyEditor_recceTab:init(rallyEditor) end

--- Recreates the Recce object for the mission folder and loads the driveline and cuts; stores the original size. Logs an error on failure.
---Source: lua/ge/extensions/editor/rallyEditor/recceTab.lua:138
function editor_rallyEditor_recceTab:refresh() end

--- Called when the tab is selected: reloads the recce (refresh) and emits onEditorEditModeChanged(nil, nil).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/rallyEditor/recceTab.lua:29
function editor_rallyEditor_recceTab:selected() end

--- Sets the current notebook.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/rallyEditor/recceTab.lua:24
---@param path table|nil Notebook.
function editor_rallyEditor_recceTab:setPath(path) end

--- Called when the tab is left: emits onEditorEditModeChanged(nil, nil).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/rallyEditor/recceTab.lua:37
function editor_rallyEditor_recceTab:unselect() end

