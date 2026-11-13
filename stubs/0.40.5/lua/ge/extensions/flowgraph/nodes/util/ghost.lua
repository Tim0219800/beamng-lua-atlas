---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/util/ghost.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud flowgraph ; chaque instance représente un nœud dans un graphe.
---@class flowgraph_nodes_util_ghost_C
local flowgraph_nodes_util_ghost_C = {}

--- Renvoie les données d'origine (ghostData) telles quelles pour que le nœud soit resauvegardé à l'identique.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/util/ghost.lua:34
function flowgraph_nodes_util_ghost_C:__onSerialize() end

--- Enregistre l'erreur, mémorise le type d'origine, renomme le nœud « [GHOST]<dernier mot du type> » et garde nodeData dans ghostData.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/util/ghost.lua:38
---@param nodeData table Données sauvegardées du nœud d'origine.
function flowgraph_nodes_util_ghost_C:_onDeserialized(nodeData) end

--- Dessine le type de nœud d'origine et un bouton « Dump ghost data » qui affiche ghostData dans la console.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/util/ghost.lua:26
---@param builder table Constructeur de nœud de l'éditeur.
---@param style table Style du nœud.
function flowgraph_nodes_util_ghost_C:drawMiddle(builder, style) end

--- Initialise formerNodeType à « NOT GHOST ».
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/util/ghost.lua:18
function flowgraph_nodes_util_ghost_C:init() end

--- Ne fait rien.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/util/ghost.lua:22
function flowgraph_nodes_util_ghost_C:work() end

