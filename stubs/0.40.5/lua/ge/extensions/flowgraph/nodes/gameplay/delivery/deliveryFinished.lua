---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/gameplay/delivery/deliveryFinished.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud.
---@class flowgraph_nodes_gameplay_delivery_deliveryFinished_C
local flowgraph_nodes_gameplay_delivery_deliveryFinished_C = {}

--- Réinitialise les états et sorties.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/delivery/deliveryFinished.lua:44
function flowgraph_nodes_gameplay_delivery_deliveryFinished_C:_executionStarted() end

--- Réinitialise les états et sorties.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/delivery/deliveryFinished.lua:35
function flowgraph_nodes_gameplay_delivery_deliveryFinished_C:_executionStopped() end

--- Initialise les états et sorties.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/delivery/deliveryFinished.lua:26
function flowgraph_nodes_gameplay_delivery_deliveryFinished_C:init() end

--- Si flow est actif, compare l'état fini à l'état précédent pour émettre finished une seule fois et renseigne failed/failReason.
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/delivery/deliveryFinished.lua:53
function flowgraph_nodes_gameplay_delivery_deliveryFinished_C:work() end

