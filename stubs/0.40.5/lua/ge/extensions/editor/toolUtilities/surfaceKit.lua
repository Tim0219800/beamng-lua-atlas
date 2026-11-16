---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/surfaceKit.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Shared kit for painting groundmodels (physics) on mesh roads (groundmodel mode of the Hero Road Editor). The groundmodel is inferred from the name of a triangle's material: grip variants look the same as the base and differ only by groundType. The variants are the road's pavement material plus a suffix (_wet, _snow or _snowy, _ice); Dry is the base material and serves as an eraser. A state can only be painted if its material exists in the level. The paint is stored in world stamps { x, y, r, m } (m = palette index starting at 1).
--- Access: extension `editor_toolUtilities_surfaceKit`: `extensions.load("editor_toolUtilities_surfaceKit")`, then the global `editor_toolUtilities_surfaceKit`
---@class editor_toolUtilities_surfaceKit
editor_toolUtilities_surfaceKit = {}

--- Builds a uniform spatial hash over the stamps so the per-quad lookup is roughly O(1). Returns nil if nothing is painted.
---Source: lua/ge/extensions/editor/toolUtilities/surfaceKit.lua:84
---@param stamps table|nil List of stamps { x, y, r, m }.
---@return table|nil  { cell, map } or nil.
function editor_toolUtilities_surfaceKit.buildGrid(stamps) end

--- Overlay color { r, g, b } (0-255); that of Dry if the index is unknown.
---Source: lua/ge/extensions/editor/toolUtilities/surfaceKit.lua:41
---@param i integer Index.
---@return table  { r, g, b }.
function editor_toolUtilities_surfaceKit.colOf(i) end

--- Number of palette entries.
---Source: lua/ge/extensions/editor/toolUtilities/surfaceKit.lua:37
---@return integer  4
function editor_toolUtilities_surfaceKit.count() end

--- Palette entry (id, label, groundmodel, col, suffixes).
---Source: lua/ge/extensions/editor/toolUtilities/surfaceKit.lua:38
---@param i integer Index starting at 1.
---@return table|nil  Entry.
function editor_toolUtilities_surfaceKit.get(i) end

--- True if surface `i` is paintable: Dry always, the others only if a variant exists.
---Source: lua/ge/extensions/editor/toolUtilities/surfaceKit.lua:62
---@param i integer Palette index.
---@param baseMat string Base material.
---@return boolean  Available.
function editor_toolUtilities_surfaceKit.isAvailable(i, baseMat) end

--- True if the index is that of the base surface (Dry); nil is treated as the base.
---Source: lua/ge/extensions/editor/toolUtilities/surfaceKit.lua:39
---@param i integer|nil Palette index.
---@return boolean  Is the base.
function editor_toolUtilities_surfaceKit.isBase(i) end

--- Label of the entry, '?' if unknown.
---Source: lua/ge/extensions/editor/toolUtilities/surfaceKit.lua:40
---@param i integer Index.
---@return string  Label.
function editor_toolUtilities_surfaceKit.labelOf(i) end

--- Palette index of the painted surface at world point (px, py): the highest-index stamp covering the point wins. Returns the base index if nothing covers it.
---Source: lua/ge/extensions/editor/toolUtilities/surfaceKit.lua:101
---@param grid table|nil Result of buildGrid.
---@param stamps table The same stamps.
---@param px number World X (m).
---@param py number World Y (m).
---@return integer  Palette index.
function editor_toolUtilities_surfaceKit.materialAt(grid, stamps, px, py) end

--- True if a material of this name is present in the level (scenetree.findObject).
---Source: lua/ge/extensions/editor/toolUtilities/surfaceKit.lua:44
---@param name string|nil Material name.
---@return boolean  Exists.
function editor_toolUtilities_surfaceKit.materialExists(name) end

--- Material actually applied to a painted quad of surface `i`: the variant if it exists, otherwise the base.
---Source: lua/ge/extensions/editor/toolUtilities/surfaceKit.lua:69
---@param i integer Index.
---@param baseMat string Base material.
---@return string  Material name.
function editor_toolUtilities_surfaceKit.materialOf(i, baseMat) end

--- Resolves the material of each surface for a given base, in one pass (called once per mesh build).
---Source: lua/ge/extensions/editor/toolUtilities/surfaceKit.lua:75
---@param baseMat string Base material.
---@return table<integer, string>  Palette index -> material name.
function editor_toolUtilities_surfaceKit.resolveMaterials(baseMat) end

--- Name of the variant material of surface `i` for the pavement `baseMat`, or nil if no variant exists (not paintable). Dry returns the base material.
---Source: lua/ge/extensions/editor/toolUtilities/surfaceKit.lua:50
---@param i integer Palette index.
---@param baseMat string Base material of the pavement.
---@return string|nil  Material name.
function editor_toolUtilities_surfaceKit.variantMaterial(i, baseMat) end

