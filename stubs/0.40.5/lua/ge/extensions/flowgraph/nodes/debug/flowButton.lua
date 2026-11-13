---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/debug/flowButton.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud.
---@class flowgraph_nodes_debug_flowButton_C
local flowgraph_nodes_debug_flowButton_C = {}

--- Éditeur : dessine le bouton ; un clic arme doTrigger si le graphe est en état « running ».
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/debug/flowButton.lua:26
---@param builder table constructeur de nœud
---@param style table style
function flowgraph_nodes_debug_flowButton_C:drawMiddle(builder, style) end

--- Libellé « Push » et doTrigger à faux.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/debug/flowButton.lua:21
---@param mgr table gestionnaire (non utilisé)
---@param ... any
function flowgraph_nodes_debug_flowButton_C:init(mgr, ...) end

--- Hook éditeur : renomme le bouton d'après le pin ou le nœud cible si le nom est encore « Push ».
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/debug/flowButton.lua:44
---@param link table lien créé
function flowgraph_nodes_debug_flowButton_C:onLink(link) end

--- Hook éditeur : remet le libellé « Push ».
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/debug/flowButton.lua:53
---@param link table lien supprimé
function flowgraph_nodes_debug_flowButton_C:onUnlink(link) end

--- Met la sortie flow à doTrigger puis le remet à faux.
---Source : lua/ge/extensions/flowgraph/nodes/debug/flowButton.lua:39
function flowgraph_nodes_debug_flowButton_C:work() end

