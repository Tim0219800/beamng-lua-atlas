---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/macro/integrated.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du noeud flowgraph (creee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.
---@class flowgraph_nodes_macro_integrated_C
local flowgraph_nodes_macro_integrated_C = {}

--- Appelle updatePins apres chaque execution.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/macro/integrated.lua:190
function flowgraph_nodes_macro_integrated_C:_afterTrigger() end

--- Pousse les valeurs des pins d'entree codes en dur vers le noeud I/O 'in'.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/macro/integrated.lua:195
function flowgraph_nodes_macro_integrated_C:_executionStarted() end

--- Remet a nil ces valeurs dans le noeud I/O 'in'.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/macro/integrated.lua:207
function flowgraph_nodes_macro_integrated_C:_executionStopped() end

--- Relit nom, couleur, type de graphe et cible (instance de macro creee depuis macroPath si besoin).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/macro/integrated.lua:110
---@param nodeData any
function flowgraph_nodes_macro_integrated_C:_onDeserialized(nodeData) end

--- Sauvegarde name, graphType, targetID et couleur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/macro/integrated.lua:82
---@param res any
function flowgraph_nodes_macro_integrated_C:_onSerialize(res) end

--- Relie le graphe cible via mgr.graphs[targetID + offset].
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/macro/integrated.lua:57
function flowgraph_nodes_macro_integrated_C:_postDeserialize() end

--- Selectionne le graphe cible dans l'editeur (sauf depuis un graphe macro).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/macro/integrated.lua:160
function flowgraph_nodes_macro_integrated_C:doubleClicked() end

--- Bouton de debogage 'Manually Refresh Pins'.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/macro/integrated.lua:23
function flowgraph_nodes_macro_integrated_C:drawCustomProperties() end

--- Icone de recherche avec apercu au survol et variables surveillees.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/macro/integrated.lua:130
---@param builder any
---@param style any
function flowgraph_nodes_macro_integrated_C:drawMiddle(builder, style) end

--- Recree les pins d'entree/sortie depuis les pin lists des noeuds I/O.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/macro/integrated.lua:61
---@return table  liste des pins d'entree
---@return table  liste des pins de sortie
function flowgraph_nodes_macro_integrated_C:gatherPins() end

--- savePins=true et couleur grise.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/macro/integrated.lua:19
function flowgraph_nodes_macro_integrated_C:init() end

--- Renvoie le graphe represente.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/macro/integrated.lua:13
---@return table|nil  targetGraph
function flowgraph_nodes_macro_integrated_C:representsGraph() end

--- Lie le noeud a un graphe : retrouve ses noeuds macro/io 'in' et 'out', memorise targetGraph/targetID et fixe le nom.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/macro/integrated.lua:36
---@param graph table graphe cible
function flowgraph_nodes_macro_integrated_C:setTargetGraph(graph) end

--- Copie les valeurs des pins d'entree vers le noeud I/O 'in' et celles du noeud I/O 'out' vers les pins de sortie.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/macro/integrated.lua:171
function flowgraph_nodes_macro_integrated_C:updatePins() end

--- Vide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/macro/integrated.lua:218
function flowgraph_nodes_macro_integrated_C:work() end

