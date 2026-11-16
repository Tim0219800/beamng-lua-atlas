# `editor_roadArchitect_render`

*File: `lua/ge/extensions/editor/roadArchitect/render.lua` · VM: Game Engine (GE) · 1248 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_roadArchitect_render`: `extensions.load("editor_roadArchitect_render")`, then the global `editor_roadArchitect_render`

Debug rendering (utils/debugDraw and debugDrawer) of everything Road Architect displays in the 3D view: road surface and outline, reference line, guides, node spheres and numbers, lane numbers and arrows, automatic tunnels, layers of the selected road, overlay roads, link or junction proposal, group creation polygon, multi-selection nodes and terraforming zones. A single public entry point: drawRoadMarkups, called every frame by the editor. Only roads located within a 700 m square centered on the camera (spatial tree query) are drawn; secondary details are limited to 150 m from the camera.

## Notes

- Visual constants: reference line thickness 4, outline 2 (x2 if selected), guides 3 (5 if selected); guide length 200 m; max distance for details (innerCullLimit) 150 m; radius of the culling zone around the camera 350 m.
- The guides of unselected roads are capped: beyond 200 accumulated guides (excluding selected or multi-selected roads), additional roads no longer add any.
- Profile layers are only drawn for the selected road, if it is neither a bridge, nor a junction road, nor invisible.
- Terraforming zones are 5 m high cylinders whose radius is terraParams.domainOfInfluence[0] + terraParams.terraMargin[0].

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_roadArchitect_render.drawRoadMarkups(roads, map, tree, selectedRoadIdx, selectedNodeIdx, selectedLayerIdx, isGroupMode, isProfileMode, isCreateGroup, gPolygon, multi, selectedLink, selectedCandidateJct, isGuidelines, isShowTerraSingle, isShowTerraGroup, selectedPlacedGroup, terraParams)` | Draws all the Road Architect 3D annotations for the current frame. Does nothing if tree is nil. Iterates over the roads near the camera (tree:queryNotNested) and, depending on the checked boxes of each road (isDisplayRoadSurface, isDisplayRoadOutline, isDisplayRefLine, isDisplayLaneInfo, isDisplayNodeSpheres, isDisplayNodeNumbers) and its state (isVis, isHidden, treatAsInvisibleInEdit, isOverlay, isJctRoad), displays the corresponding elements, then the proposed link/junction, the group polygon, the multi-selection nodes, the guides and the terraforming zone. *(internal)* | 1094 |

### Parameter details

#### `editor_roadArchitect_render.drawRoadMarkups(roads, map, tree, selectedRoadIdx, selectedNodeIdx, selectedLayerIdx, isGroupMode, isProfileMode, isCreateGroup, gPolygon, multi, selectedLink, selectedCandidateJct, isGuidelines, isShowTerraSingle, isShowTerraGroup, selectedPlacedGroup, terraParams)`

Draws all the Road Architect 3D annotations for the current frame. Does nothing if tree is nil. Iterates over the roads near the camera (tree:queryNotNested) and, depending on the checked boxes of each road (isDisplayRoadSurface, isDisplayRoadOutline, isDisplayRefLine, isDisplayLaneInfo, isDisplayNodeSpheres, isDisplayNodeNumbers) and its state (isVis, isHidden, treatAsInvisibleInEdit, isOverlay, isJctRoad), displays the corresponding elements, then the proposed link/junction, the group polygon, the multi-selection nodes, the guides and the terraforming zone.

- `roads` (*table[]*) : Array of Road Architect roads.
- `map` (*table<string, integer>*) : Table road name -> index in roads.
- `tree` (*table|nil*) : Spatial tree (quadtree) of the roads; its absence disables all rendering.
- `selectedRoadIdx` (*integer|nil*) : Index of the selected road.
- `selectedNodeIdx` (*integer|nil*) : Index of the selected node (highlighted).
- `selectedLayerIdx` (*integer|nil*) : Index of the selected layer of the selected road.
- `isGroupMode` (*boolean*) : Groups mode active (also shows hidden roads).
- `isProfileMode` (*boolean*) : Profile editing mode active (also shows hidden roads).
- `isCreateGroup` (*boolean*) : The user is drawing a group polygon: displays the gPolygon fence.
- `gPolygon` (*table*) : Points of the group creation polygon.
- `multi` (*table[]*) : Multi-selection of nodes (elements with field r = road name); their nodes are highlighted.
- `selectedLink` (*table|nil*) : Proposed end-to-end link (see link.computePossibleLinks), to draw.
- `selectedCandidateJct` (*table|nil*) : Candidate junction (see link.computePossibleJct), to draw.
- `isGuidelines` (*boolean*) : Displays the guides along the roads.
- `isShowTerraSingle` (*boolean*) : Displays the terraforming zone of the selected road.
- `isShowTerraGroup` (*boolean*) : Displays the terraforming zone of the selected placed group.
- `selectedPlacedGroup` (*table|nil*) : Placed group selected for the group terraforming visualization.
- `terraParams` (*table*) : Terraforming parameters (ImGui pointers domainOfInfluence and terraMargin).

## Calls into the engine (C++)

- `debugDrawer:` `drawCylinder`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/roadArchitect/render.lua`.*
