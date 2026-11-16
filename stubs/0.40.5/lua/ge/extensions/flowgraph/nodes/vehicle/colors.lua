---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/vehicle/colors.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (returned by `_flowgraph_createNode(C)`). Definition fields: name, description, category, pinSchema, tags.
---@class flowgraph_nodes_vehicle_colors_C
local flowgraph_nodes_vehicle_colors_C = {}

--- Marks the three color pins with `colorSetup = {vehicleColor = true}` (vehicle paint picker in the editor).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/colors.lua:29
function flowgraph_nodes_vehicle_colors_C:postInit() end

--- Creates a paint per non-nil color pin, applies it to the vehicle object and sends the list of paints with `setMetallicPaintData`.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/colors.lua:43
function flowgraph_nodes_vehicle_colors_C:work() end

