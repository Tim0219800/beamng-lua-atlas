---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/ui/monologue.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud flowgraph (retournée par _flowgraph_createNode(C)).
---@class flowgraph_nodes_ui_monologue_C
local flowgraph_nodes_ui_monologue_C = {}

--- Réinitialise index, temps et message courant.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/monologue.lua:29
function flowgraph_nodes_ui_monologue_C:_executionStarted() end

--- Restaure count et mode.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/monologue.lua:120
---@param res table Table de sauvegarde du nœud à remplir.
function flowgraph_nodes_ui_monologue_C:_onDeserialized(res) end

--- Sauvegarde count et mode.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/monologue.lua:115
---@param res table Table de sauvegarde du nœud à remplir.
function flowgraph_nodes_ui_monologue_C:_onSerialize(res) end

--- Champ « Count ».
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/monologue.lua:36
function flowgraph_nodes_ui_monologue_C:drawCustomProperties() end

--- count = 1.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/monologue.lua:25
function flowgraph_nodes_ui_monologue_C:init() end

--- État de durée 'inactive'.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/monologue.lua:79
function flowgraph_nodes_ui_monologue_C:onNodeReset() end

--- Ajuste le nombre de paires de pins.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/monologue.lua:53
---@param old integer Ancien nombre d'éléments.
---@param new integer Nouveau nombre d'éléments.
function flowgraph_nodes_ui_monologue_C:updatePins(old, new) end

--- Fait avancer le temps de simulation et affiche chaque message à son tour ; termine après la dernière durée.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/monologue.lua:88
function flowgraph_nodes_ui_monologue_C:work() end

--- temps = 0, état 'started'.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/monologue.lua:83
function flowgraph_nodes_ui_monologue_C:workOnce() end

