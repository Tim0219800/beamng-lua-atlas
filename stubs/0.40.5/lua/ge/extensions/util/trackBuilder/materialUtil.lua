---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/trackBuilder/materialUtil.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Manages the eight material sets (letters A to H) of the Track Builder. Each letter corresponds to two scene materials, 'track_editor_<letter>_center' and 'track_editor_<letter>_border'. The module reads and writes their colors, textures (base, specular, normal, center/border decals), glow (glow/emissive) and ground type (groundtype); it can also revert to the original values and return only the values that differ from the defaults.
--- Access: extension `util_trackBuilder_materialUtil`: `extensions.load("util_trackBuilder_materialUtil")`, then the global `util_trackBuilder_materialUtil`
---@class util_trackBuilder_materialUtil
---@field currentMaterials table<string, table> Current state of the materials, keyed by letter (A to H).
---@field loadMaterials nil Always nil: reference to an undefined function _anon(bug).
util_trackBuilder_materialUtil = {}

--- Rereads the 8 materials from the scene and returns, per letter, only the values that differ from the original values (removeDefaults).
---Source: lua/ge/extensions/util/trackBuilder/materialUtil.lua:437
---@return table<string, table>  Slimmed-down materials, keyed by letter.
function util_trackBuilder_materialUtil.getMaterials() end

--- Resets the materials to the original values: all if letter is nil, otherwise only that letter.
---Source: lua/ge/extensions/util/trackBuilder/materialUtil.lua:426
---@param letter string|nil Letter 'A' to 'H', or nil for all.
function util_trackBuilder_materialUtil.resetMaterialsToDefault(letter) end

--- Applies several materials: completes each entry with the missing original values (fillDefaults) then calls setSingleMaterial. With no argument, does nothing.
---Source: lua/ge/extensions/util/trackBuilder/materialUtil.lua:395
---@param materials table<string, table>|nil Materials keyed by letter.
---@param skipSet boolean|nil If true, does not reread the current state of the scene objects before applying.
function util_trackBuilder_materialUtil.setMaterials(materials, skipSet) end

--- Applies a material to the given letter: textures, colors, glow, groundtype, then flush and reload of the center and border materials; updates currentMaterials.
---Source: lua/ge/extensions/util/trackBuilder/materialUtil.lua:402
---@param letter string Letter 'A' to 'H'.
---@param material table Full material table (see module).
---@param skipSet boolean|nil See setMaterials.
function util_trackBuilder_materialUtil.setSingleMaterial(letter, material, skipSet) end

