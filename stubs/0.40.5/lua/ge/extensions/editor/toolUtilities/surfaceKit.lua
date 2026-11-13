---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/surfaceKit.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_toolUtilities_surfaceKit` : `extensions.load("editor_toolUtilities_surfaceKit")`, puis la globale `editor_toolUtilities_surfaceKit`
---@class editor_toolUtilities_surfaceKit
editor_toolUtilities_surfaceKit = {}

--- Build a uniform spatial hash over the stamps so a per-quad lookup is ~O(1) instead of O(#stamps). Cell size = the largest
---  brush radius, so any stamp covering a query point has its centre within one cell of the point's cell (3x3 neighbourhood).
---  Returns nil when there's nothing painted (callers then treat every quad as base). Cheap: rebuilt per full mesh build only.
---Source : lua/ge/extensions/editor/toolUtilities/surfaceKit.lua:84
---@param stamps any
function editor_toolUtilities_surfaceKit.buildGrid(stamps) end

---Source : lua/ge/extensions/editor/toolUtilities/surfaceKit.lua:41
---@param i any
function editor_toolUtilities_surfaceKit.colOf(i) end

--- Palette accessors.
---Source : lua/ge/extensions/editor/toolUtilities/surfaceKit.lua:37
function editor_toolUtilities_surfaceKit.count() end

---Source : lua/ge/extensions/editor/toolUtilities/surfaceKit.lua:38
---@param i any
function editor_toolUtilities_surfaceKit.get(i) end

--- Whether surface `i` can be painted on a road with this base material (Dry always; others only when a variant material exists).
---Source : lua/ge/extensions/editor/toolUtilities/surfaceKit.lua:62
---@param i any
---@param baseMat any
function editor_toolUtilities_surfaceKit.isAvailable(i, baseMat) end

---Source : lua/ge/extensions/editor/toolUtilities/surfaceKit.lua:39
---@param i any
function editor_toolUtilities_surfaceKit.isBase(i) end

---Source : lua/ge/extensions/editor/toolUtilities/surfaceKit.lua:40
---@param i any
function editor_toolUtilities_surfaceKit.labelOf(i) end

--- Palette index of the surface painted at world (px, py): the HIGHEST-index (last-painted) stamp covering the point wins, so a
---  later stroke -- including a Dry erase stroke -- overrides earlier ones. Returns baseIndex when nothing covers it. Orphan
---  stamps far from the road live in cells no quad ever queries, so they cost nothing here.
---Source : lua/ge/extensions/editor/toolUtilities/surfaceKit.lua:101
---@param grid any
---@param stamps any
---@param px any
---@param py any
function editor_toolUtilities_surfaceKit.materialAt(grid, stamps, px, py) end

--- True when a material of this name is present in the level.
---Source : lua/ge/extensions/editor/toolUtilities/surfaceKit.lua:44
---@param name any
function editor_toolUtilities_surfaceKit.materialExists(name) end

--- Material actually applied to a painted quad of surface `i`: the variant when it exists, else the base material (so a missing
---  variant degrades to base rather than referencing a material that isn't there).
---Source : lua/ge/extensions/editor/toolUtilities/surfaceKit.lua:69
---@param i any
---@param baseMat any
function editor_toolUtilities_surfaceKit.materialOf(i, baseMat) end

--- Resolve every surface's material against one base material in a single pass (called once per mesh build, so the per-quad
---  routing is a plain array lookup rather than a scene-tree query).
---Source : lua/ge/extensions/editor/toolUtilities/surfaceKit.lua:75
---@param baseMat any
function editor_toolUtilities_surfaceKit.resolveMaterials(baseMat) end

--- Resolved variant material name for surface `i` given the road's base (carriageway) material, or nil when this state has no
---  existing variant (so it isn't paintable on this road). Dry (base) always resolves to the base material itself.
---Source : lua/ge/extensions/editor/toolUtilities/surfaceKit.lua:50
---@param i any
---@param baseMat any
function editor_toolUtilities_surfaceKit.variantMaterial(i, baseMat) end

