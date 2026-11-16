---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/aiViz.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Visualization of the AI navgraph in the editor. When a draw mode is active, draws the navigation map nodes (map.getMap().nodes) as spheres, the links (prisms colored according to the mode), the lanes and direction arrows (lanes or oneWay), and highlights the node or link hovered by the mouse. Four exclusive modes: drivability, type (public/private), speedLimit and hiddenInNavi. Nearby links (less than 100 m in path distance from the hovered node) are also drawn in green. Nodes are indexed in a quadtree.
--- Access: extension `editor_aiViz`: `extensions.load("editor_aiViz")`, then the global `editor_aiViz`
---@class editor_aiViz
editor_aiViz = {}

--- Enables or disables a draw mode; enabling a mode disables the others.
---Source: lua/ge/extensions/editor/aiViz.lua:389
---@param mode string "drivability", "type", "speedLimit" or "hiddenInNavi".
---@param enabled boolean Enable or disable.
function editor_aiViz.enableDrawMode(mode, enabled) end

--- Returns the active draw mode.
---Source: lua/ge/extensions/editor/aiViz.lua:401
---@return string|nil  Mode name or nil if nothing is drawn.
function editor_aiViz.getDrawMode() end

--- Editor drawing hook: handles hovering (camera/mouse ray against nodes and links) and draws the nodes near the camera according to the mode.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/aiViz.lua:305
function editor_aiViz.onEditorGui() end

--- Hook emitted when the navgraph is reloaded: empties the node cache and rebuilds the quadtree.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/aiViz.lua:300
function editor_aiViz.onNavgraphReloaded() end

