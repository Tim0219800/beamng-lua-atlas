---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/kerbSpec.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Single kerb and footway section that all the editor tools build to, and the stone they are cut from. The dimensions live here so that a car feels the same step on a street, a car park, a bridge or a plaza. Also gives the texture rows of a kerb variant.
--- Access: extension `editor_toolUtilities_kerbSpec`: `extensions.load("editor_toolUtilities_kerbSpec")`, then the global `editor_toolUtilities_kerbSpec`
---@class editor_toolUtilities_kerbSpec
---@field spec table Dimensions and materials: slabW, slabThick, kerbW, kerbH, buryM, slabMaterial, kerbMaterial.
editor_toolUtilities_kerbSpec = {}

--- Returns the three V rows of the texture occupied by a kerb variant: the back of the step, the edge and the foot of the face. The variant is truncated to an integer and clamped to 0..4; a non-numeric value gives 0.
---Source: lua/ge/extensions/editor/toolUtilities/kerbSpec.lua:35
---@param variant integer|nil Variant index, 0 to 4.
---@return number  Row of the back of the step (variant * 0.2).
---@return number  Row of the edge (+0.1).
---@return number  Row of the foot of the face (+0.2 minus a small gap of 0.00332).
function editor_toolUtilities_kerbSpec.kerbRows(variant) end

