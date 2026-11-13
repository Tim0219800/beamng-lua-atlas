---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/gameplay/delivery/abandonDelivery.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud.
---@class flowgraph_nodes_gameplay_delivery_abandonDelivery_C
local flowgraph_nodes_gameplay_delivery_abandonDelivery_C = {}

--- Appelle reset.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/delivery/abandonDelivery.lua:31
function flowgraph_nodes_gameplay_delivery_abandonDelivery_C:_executionStopped() end

--- Met flow et success à faux.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/delivery/abandonDelivery.lua:26
function flowgraph_nodes_gameplay_delivery_abandonDelivery_C:init() end

--- Appelle reset.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/delivery/abandonDelivery.lua:35
function flowgraph_nodes_gameplay_delivery_abandonDelivery_C:onNodeReset() end

--- Remet flow et success à faux.
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/delivery/abandonDelivery.lua:39
function flowgraph_nodes_gameplay_delivery_abandonDelivery_C:reset() end

--- Si flow est actif : appelle teardown(keepVehicles) et signale le succès ; journalise une erreur si le système de livraison est absent.
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/delivery/abandonDelivery.lua:46
function flowgraph_nodes_gameplay_delivery_abandonDelivery_C:work() end

