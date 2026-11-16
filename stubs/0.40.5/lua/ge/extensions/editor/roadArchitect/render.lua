---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/roadArchitect/render.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Debug rendering (utils/debugDraw and debugDrawer) of everything Road Architect displays in the 3D view: road surface and outline, reference line, guides, node spheres and numbers, lane numbers and arrows, automatic tunnels, layers of the selected road, overlay roads, link or junction proposal, group creation polygon, multi-selection nodes and terraforming zones. A single public entry point: drawRoadMarkups, called every frame by the editor. Only roads located within a 700 m square centered on the camera (spatial tree query) are drawn; secondary details are limited to 150 m from the camera.
--- Access: extension `editor_roadArchitect_render`: `extensions.load("editor_roadArchitect_render")`, then the global `editor_roadArchitect_render`
---@class editor_roadArchitect_render
editor_roadArchitect_render = {}

--- Draws all the Road Architect 3D annotations for the current frame. Does nothing if tree is nil. Iterates over the roads near the camera (tree:queryNotNested) and, depending on the checked boxes of each road (isDisplayRoadSurface, isDisplayRoadOutline, isDisplayRefLine, isDisplayLaneInfo, isDisplayNodeSpheres, isDisplayNodeNumbers) and its state (isVis, isHidden, treatAsInvisibleInEdit, isOverlay, isJctRoad), displays the corresponding elements, then the proposed link/junction, the group polygon, the multi-selection nodes, the guides and the terraforming zone.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/roadArchitect/render.lua:1094
---@param roads table[] Array of Road Architect roads.
---@param map table<string, integer> Table road name -> index in roads.
---@param tree table|nil Spatial tree (quadtree) of the roads; its absence disables all rendering.
---@param selectedRoadIdx integer|nil Index of the selected road.
---@param selectedNodeIdx integer|nil Index of the selected node (highlighted).
---@param selectedLayerIdx integer|nil Index of the selected layer of the selected road.
---@param isGroupMode boolean Groups mode active (also shows hidden roads).
---@param isProfileMode boolean Profile editing mode active (also shows hidden roads).
---@param isCreateGroup boolean The user is drawing a group polygon: displays the gPolygon fence.
---@param gPolygon table Points of the group creation polygon.
---@param multi table[] Multi-selection of nodes (elements with field r = road name); their nodes are highlighted.
---@param selectedLink table|nil Proposed end-to-end link (see link.computePossibleLinks), to draw.
---@param selectedCandidateJct table|nil Candidate junction (see link.computePossibleJct), to draw.
---@param isGuidelines boolean Displays the guides along the roads.
---@param isShowTerraSingle boolean Displays the terraforming zone of the selected road.
---@param isShowTerraGroup boolean Displays the terraforming zone of the selected placed group.
---@param selectedPlacedGroup table|nil Placed group selected for the group terraforming visualization.
---@param terraParams table Terraforming parameters (ImGui pointers domainOfInfluence and terraMargin).
function editor_roadArchitect_render.drawRoadMarkups(roads, map, tree, selectedRoadIdx, selectedNodeIdx, selectedLayerIdx, isGroupMode, isProfileMode, isCreateGroup, gPolygon, multi, selectedLink, selectedCandidateJct, isGuidelines, isShowTerraSingle, isShowTerraGroup, selectedPlacedGroup, terraParams) end

