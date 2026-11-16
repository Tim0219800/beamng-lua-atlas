---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/masterSpline/autoRoadGen.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Automatic road generation of the Master Spline tool: between each pair of consecutive nodes, a grid pathfinding (8 directions, minheap priority queue) takes into account the terrain, the maximum slope, the minimum radius and the slope avoidance of the road preset. The path is simplified (RDP), widened in tight turns, adjusted in Z, interpolated (Catmull-Rom) then shown as a preview before being converted to a spline.
--- Access: extension `editor_masterSpline_autoRoadGen`: `extensions.load("editor_masterSpline_autoRoadGen")`, then the global `editor_masterSpline_autoRoadGen`
---@class editor_masterSpline_autoRoadGen
editor_masterSpline_autoRoadGen = {}

--- Clears the current preview (nodes and widths).
---Source: lua/ge/extensions/editor/masterSpline/autoRoadGen.lua:67
function editor_masterSpline_autoRoadGen.clearPreview() end

--- Converts the preview into spline geometry (nodes, widths, nmls), marks it isDirty, enables auto-banking if bankingStrength > 0, then clears the preview. If the preview has fewer than 2 nodes, it is cleared without creating anything.
---Source: lua/ge/extensions/editor/masterSpline/autoRoadGen.lua:346
---@param spline table Spline to fill.
---@param bankingStrength number Auto-banking strength; 0 or less disables banking.
---@param autoBankFalloff number Auto-banking falloff (copied into spline.autoBankFalloff).
function editor_masterSpline_autoRoadGen.createAutoRoad(spline, bankingStrength, autoBankFalloff) end

--- Generates the preview of an automatic road passing through the spline's nodes (at least 2, otherwise returns without doing anything). Each segment is computed separately, the duplicates at the junctions are removed, then the path is simplified, widened in hairpins, set to the allowed slope and as close to the terrain as possible, interpolated and re-simplified.
---Source: lua/ge/extensions/editor/masterSpline/autoRoadGen.lua:290
---@param spline table Master Spline whose nodes are used as waypoints.
---@param autoParams table Tool parameters (baseWidth, slopeAvoidance, widthBlend).
---@param presetParams table Road preset constraints (maxSlope, minRadius, maxWidthGradient).
function editor_masterSpline_autoRoadGen.generateAutoPreview(spline, autoParams, presetParams) end

--- Draws the preview ribbon (rSpline.renderPreviewRibbon). Call once per frame; does nothing if the spline is nil or the preview is empty.
---Source: lua/ge/extensions/editor/masterSpline/autoRoadGen.lua:375
---@param spline table|nil Current spline.
function editor_masterSpline_autoRoadGen.handlePreview(spline) end

--- Indicates whether a road preview exists (at least one path node).
---Source: lua/ge/extensions/editor/masterSpline/autoRoadGen.lua:64
---@return boolean  true if a preview exists.
function editor_masterSpline_autoRoadGen.isPreview() end

