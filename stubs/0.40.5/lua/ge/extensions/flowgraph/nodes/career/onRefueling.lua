---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/career/onRefueling.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud.
---@class flowgraph_nodes_career_onRefueling_C
local flowgraph_nodes_career_onRefueling_C = {}

--- Crée la table de drapeaux.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/career/onRefueling.lua:26
function flowgraph_nodes_career_onRefueling_C:init() end

--- Hook : lève paidPrice.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/career/onRefueling.lua:66
---@param data any non utilisé
function flowgraph_nodes_career_onRefueling_C:onPaidRefuelling(data) end

--- Hook : lève closedMenu.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/career/onRefueling.lua:70
function flowgraph_nodes_career_onRefueling_C:onRefuelingEndTransaction() end

--- Hook : lève openedMenu.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/career/onRefueling.lua:54
---@param data any non utilisé
function flowgraph_nodes_career_onRefueling_C:onRefuelingStartTransaction(data) end

--- Hook : lève tankFilled.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/career/onRefueling.lua:58
---@param data any non utilisé
function flowgraph_nodes_career_onRefueling_C:onRefuelingStopFueling(data) end

--- Chaque frame : remet à faux les pins flow, applique les drapeaux, met à jour currentlyFueling et tankPercent, efface les drapeaux.
---Source : lua/ge/extensions/flowgraph/nodes/career/onRefueling.lua:30
---@param args any non utilisé
function flowgraph_nodes_career_onRefueling_C:work(args) end

