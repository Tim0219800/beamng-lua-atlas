---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/gameplay/delivery/loadDelivery.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud.
---@class flowgraph_nodes_gameplay_delivery_loadDelivery_C
local flowgraph_nodes_gameplay_delivery_loadDelivery_C = {}

--- Appelle reset.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/delivery/loadDelivery.lua:34
function flowgraph_nodes_gameplay_delivery_loadDelivery_C:_executionStopped() end

--- Initialise les sorties et l'état de durée à 'inactive'.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/delivery/loadDelivery.lua:27
function flowgraph_nodes_gameplay_delivery_loadDelivery_C:init() end

--- Appelle reset.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/delivery/loadDelivery.lua:38
function flowgraph_nodes_gameplay_delivery_loadDelivery_C:onNodeReset() end

--- Remet les sorties à faux et l'état à 'inactive'.
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/delivery/loadDelivery.lua:42
function flowgraph_nodes_gameplay_delivery_loadDelivery_C:reset() end

--- En état 'started', attend isLoaded() puis active success, isLoaded et flow ('finished') ; ensuite maintient flow.
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/delivery/loadDelivery.lua:87
function flowgraph_nodes_gameplay_delivery_loadDelivery_C:work() end

--- Résout le chemin, appelle freeformDelivery.load et passe en état 'started' ; journalise les erreurs.
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/delivery/loadDelivery.lua:49
function flowgraph_nodes_gameplay_delivery_loadDelivery_C:workOnce() end

