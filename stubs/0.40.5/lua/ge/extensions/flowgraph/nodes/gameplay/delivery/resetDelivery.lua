---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/gameplay/delivery/resetDelivery.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud.
---@class flowgraph_nodes_gameplay_delivery_resetDelivery_C
local flowgraph_nodes_gameplay_delivery_resetDelivery_C = {}

--- Appelle reset.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/delivery/resetDelivery.lua:31
function flowgraph_nodes_gameplay_delivery_resetDelivery_C:_executionStopped() end

--- Initialise les sorties et l'état de durée à 'inactive'.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/delivery/resetDelivery.lua:25
function flowgraph_nodes_gameplay_delivery_resetDelivery_C:init() end

--- Appelle reset.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/delivery/resetDelivery.lua:35
function flowgraph_nodes_gameplay_delivery_resetDelivery_C:onNodeReset() end

--- Remet les sorties à faux et l'état à 'inactive'.
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/delivery/resetDelivery.lua:39
function flowgraph_nodes_gameplay_delivery_resetDelivery_C:reset() end

--- En état 'started', attend la fin du setup puis active success et flow.
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/delivery/resetDelivery.lua:71
function flowgraph_nodes_gameplay_delivery_resetDelivery_C:work() end

--- Vérifie qu'une livraison existe, appelle freeformDelivery.reset() et passe en 'started' ; journalise un avertissement ou une erreur sinon.
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/delivery/resetDelivery.lua:45
function flowgraph_nodes_gameplay_delivery_resetDelivery_C:workOnce() end

