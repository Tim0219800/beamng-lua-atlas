---@meta
-- tim19Atlas stub generated from lua/common/utils/heatmap.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Proof of concept: generates an SVG image (2048x2048) of the map's road network (map.getMap()) with a red dot per vehicle on each call of update(). Loaded with require('utils/heatmap'). Used to visualize trajectories; the image is written with the libs/EzSVG library.
--- Access: `require("utils/heatmap")`
---@class utils_heatmap
local utils_heatmap = {}

--- Saves then frees the document and the terrain position.
---Source: lua/common/utils/heatmap.lua:74
function utils_heatmap.destroy() end

--- Creates the SVG document, remembers the terrain position and draws the map's roads and nodes.
---Source: lua/common/utils/heatmap.lua:80
---@param _filename string Output SVG file
function utils_heatmap.init(_filename) end

--- Writes the current SVG to the file chosen at init(). Does nothing if there is no document.
---Source: lua/common/utils/heatmap.lua:69
function utils_heatmap.save() end

--- To be called every frame (including in menus, without 3D rendering): draws a red circle at the position of each object in map.objects.
---Source: lua/common/utils/heatmap.lua:96
function utils_heatmap.update() end

return utils_heatmap
