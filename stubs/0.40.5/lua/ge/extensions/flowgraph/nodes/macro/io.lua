---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/macro/io.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du noeud flowgraph (creee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.
---@class flowgraph_nodes_macro_io_C
local flowgraph_nodes_macro_io_C = {}

--- Relit nom, couleur et ioType et autorise les pins personnalises dans le bon sens.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/macro/io.lua:35
---@param nodeData any
function flowgraph_nodes_macro_io_C:_onDeserialized(nodeData) end

--- Sauvegarde nom, couleur et ioType (erreur journalisee si ioType est resté 'io').
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/macro/io.lua:24
---@param res any
function flowgraph_nodes_macro_io_C:_onSerialize(res) end

--- Selectionne le graphe cible dans l'editeur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/macro/io.lua:71
function flowgraph_nodes_macro_io_C:doubleClicked() end

--- Affiche le nom du graphe cible et un apercu au survol.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/macro/io.lua:47
---@param builder any
---@param style any
function flowgraph_nodes_macro_io_C:drawMiddle(builder, style) end

--- savePins=true, ioType='io' (doit devenir 'in' ou 'out'), ignoreAsRoot=true.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/macro/io.lua:17
function flowgraph_nodes_macro_io_C:init() end

--- Pour un noeud 'out' : appelle integratedNode:updatePins().
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/macro/io.lua:77
function flowgraph_nodes_macro_io_C:work() end

