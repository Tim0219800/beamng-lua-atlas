---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/roadDecorations.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_roadDecorations` : `extensions.load("editor_roadDecorations")`, puis la globale `editor_roadDecorations`
---@class editor_roadDecorations
editor_roadDecorations = {}

--- Parameters:
---   - roadName: The unique name of the DecalRoad to decorate
---   - shapeName: Path to the shape file to decorate with
---   - distance: Offset to the side of the road
---   - period: Interval with which to place objects -- "Every x metres"
---   - rotation: Direction vector by which to offset rotation. Props are already rotated to be facing parallel to the road
---   - zOff: Vertical offset of the props. Props are placed at the height of the decalroad's closest node with the given offset added
---   - align: boolean flag that dis/-enables objects always being placed along the same length of the road
--- Returns:
---   A lua table of all objects created
---
--- Example call:
---   decorateProps(9459, "levels/driver_training/art/shapes/objects/reflector.dae", 2, 25, nil, 0, true)
---   Places a reflector 2 metres off the side of the road every 25 metres with no rotation and no z offset such
---   that left and right are on the same length of the road.
--- --
---Source : lua/ge/extensions/editor/roadDecorations.lua:112
---@param roadName any
---@param shapeName any
---@param distance any
---@param period any
---@param rotation any
---@param zOff any
---@param align any
function editor_roadDecorations.decorateProps(roadName, shapeName, distance, period, rotation, zOff, align) end

---Source : lua/ge/extensions/editor/roadDecorations.lua:7
---@param spline any
---@param length any
---@param distance any
---@param left any
function editor_roadDecorations.findOffsetPoint(spline, length, distance, left) end

