---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/gameplay/delivery/getDeliveryResults.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud.
---@class flowgraph_nodes_gameplay_delivery_getDeliveryResults_C
local flowgraph_nodes_gameplay_delivery_getDeliveryResults_C = {}

--- Remet results et isActive à nil/faux.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/delivery/getDeliveryResults.lua:34
function flowgraph_nodes_gameplay_delivery_getDeliveryResults_C:_executionStarted() end

--- Remet results et isActive à nil/faux.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/delivery/getDeliveryResults.lua:29
function flowgraph_nodes_gameplay_delivery_getDeliveryResults_C:_executionStopped() end

--- Remet results et isActive à nil/faux.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/delivery/getDeliveryResults.lua:24
function flowgraph_nodes_gameplay_delivery_getDeliveryResults_C:init() end

--- Appelle isActive() puis getResults() du module freeformDelivery si la livraison est active.
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/delivery/getDeliveryResults.lua:39
function flowgraph_nodes_gameplay_delivery_getDeliveryResults_C:work() end

