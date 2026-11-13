---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/gameplay/delivery/startDelivery.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud.
---@class flowgraph_nodes_gameplay_delivery_startDelivery_C
local flowgraph_nodes_gameplay_delivery_startDelivery_C = {}

--- Remet flow et success à faux.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/delivery/startDelivery.lua:35
function flowgraph_nodes_gameplay_delivery_startDelivery_C:_executionStarted() end

--- Remet flow et success à faux.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/delivery/startDelivery.lua:30
function flowgraph_nodes_gameplay_delivery_startDelivery_C:_executionStopped() end

--- Remet flow et success à faux.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/delivery/startDelivery.lua:25
function flowgraph_nodes_gameplay_delivery_startDelivery_C:init() end

--- Si flow est actif : vérifie isLoaded() et not isActive(), appelle freeformDelivery.start() et renseigne success/flow ; journalise les erreurs.
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/delivery/startDelivery.lua:40
function flowgraph_nodes_gameplay_delivery_startDelivery_C:work() end

