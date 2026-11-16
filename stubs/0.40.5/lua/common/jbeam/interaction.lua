---@meta
-- tim19Atlas stub generated from lua/common/jbeam/interaction.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Jbeam post-processing step that loads the *.interaction.json files (folder /vehicles/common/ then the vehicle folder) and merges their interaction groups, action categories and actions. Produces vehicle.interactionGroups, vehicle.actionCategories and vehicle.inputActions, used afterwards by the input actions system (lua/ge/extensions/core/input/actions.lua according to the code comment).
--- Access: `require("jbeam/interaction")`
---@class jbeam_interaction
local jbeam_interaction = {}

--- Reads the interaction files, applies the icon overrides and stores the results in vehicle.interactionGroups, vehicle.actionCategories and vehicle.inputActions.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/jbeam/interaction.lua:26
---@param vehicle table Vehicle data (vehicleDirectory required; modified in place).
function jbeam_interaction.process(vehicle) end

return jbeam_interaction
