---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/notebook/noSelectionPreview.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Preview of the rally note (pacenotes) editor when no note is selected. Far from the road (beyond overviewDistance), draws the whole road in a rainbow gradient with one marker per note; near the road, only draws the window around the point the camera is aimed at, with the labels of the neighboring notes. A model (points, distances, sorted note entries) is cached in pacenoteToolsState.
--- Access: extension `gameplay_rally_notebook_noSelectionPreview`: `extensions.load("gameplay_rally_notebook_noSelectionPreview")`, then the global `gameplay_rally_notebook_noSelectionPreview`
---@class gameplay_rally_notebook_noSelectionPreview
gameplay_rally_notebook_noSelectionPreview = {}

--- Draws the no-selection preview (route and notes via pacenote:drawDebugPacenoteNoSelectionRainbow).
---Source: lua/ge/extensions/gameplay/rally/notebook/noSelectionPreview.lua:460
---@param path table Notebook (path.pacenotes.sorted).
---@param snaproad table Snaproad.
---@param pacenoteToolsState table Tool state (serves as cache).
---@param globalOpacity number|nil Global opacity (default 1).
---@param prismWidth number|nil Prism width in meters (default 1.945).
---@param drawOnTop boolean|nil true to draw without depth test.
---@param opts table|nil {overviewDistance = 650, labelMode = 'all'|other, nearCameraCount = 3}.
---@return boolean  true if something was drawn, false if the data is insufficient.
function gameplay_rally_notebook_noSelectionPreview.draw(path, snaproad, pacenoteToolsState, globalOpacity, prismWidth, drawOnTop, opts) end

--- Deletes the preview's model and ray cache; call when the notebook or the snaproad changes.
---Source: lua/ge/extensions/gameplay/rally/notebook/noSelectionPreview.lua:200
---@param pacenoteToolsState table|nil Tool state.
function gameplay_rally_notebook_noSelectionPreview.invalidate(pacenoteToolsState) end

--- Returns the route window near the camera used by the near view, without drawing.
---Source: lua/ge/extensions/gameplay/rally/notebook/noSelectionPreview.lua:490
---@param path table Notebook.
---@param snaproad table Snaproad.
---@param pacenoteToolsState table Tool state.
---@param opts table|nil {overviewDistance = 650}.
---@return table|nil  {startDistance, endDistance, pivotDistance, pivotPos} or nil (no notes, camera too far or missing data).
function gameplay_rally_notebook_noSelectionPreview.nearWindow(path, snaproad, pacenoteToolsState, opts) end

