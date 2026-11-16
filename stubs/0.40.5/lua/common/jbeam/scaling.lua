---@meta
-- tim19Atlas stub generated from lua/common/jbeam/scaling.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Jbeam post-processing step that applies the "scaleXxx" keys: for any numeric key named scale followed by a name (e.g. scaleNodeWeight), multiplies the value of the neighboring key Xxx (e.g. NodeWeight) by this factor, then removes the scale key. Recursively walks all dictionary-type sections, except those ignored by jbeam/utils (ignoreSections).
--- Access: `require("jbeam/scaling")`
---@class jbeam_scaling
local jbeam_scaling = {}

--- Applies the scaleXxx keys across the whole vehicle (in place).
---*(internal: called by the engine or the main loop)*
---Source: lua/common/jbeam/scaling.lua:12
---@param vehicle table Vehicle jbeam data.
function jbeam_scaling.process(vehicle) end

return jbeam_scaling
