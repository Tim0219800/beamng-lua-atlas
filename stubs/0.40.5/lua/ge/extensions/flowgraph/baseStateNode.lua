---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/baseStateNode.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe de base des nœuds d'un graphe d'états (state graph) du flowgraph. Elle étend flowgraph/basenode en ajoutant huit pins de type « transition » aux bords du nœud (entrées et sorties N, E, S, W) et leur dessin dans l'éditeur. Un moddeur ne l'appelle pas directement : elle sert aux nœuds d'état.
--- Accès : extension `flowgraph_baseStateNode` : `extensions.load("flowgraph_baseStateNode")`, puis la globale `flowgraph_baseStateNode`
---@class flowgraph_baseStateNode
flowgraph_baseStateNode = {}

--- Crée un nœud basenode, y copie les méthodes de la classe d'états (init, customDrawEnd, drawTransitionPin) puis appelle init(...).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/baseStateNode.lua:67
---@param ... any arguments de basenode.createBase : mgr, graph, forceId
---@return table  nœud d'état
function flowgraph_baseStateNode.createBase(...) end

--- Crée un nœud d'état, applique derivedClass par-dessus, puis exécute _preInit, init (si redéfini) et _postInit comme basenode.use.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/baseStateNode.lua:80
---@param mgr table manager flowgraph
---@param graph table graphe qui contient le nœud
---@param forceId integer|nil identifiant imposé, sinon le manager en attribue un
---@param derivedClass table méthodes/champs du type de nœud concret
---@return table  nœud initialisé
function flowgraph_baseStateNode.use(mgr, graph, forceId, derivedClass) end

--- Méthodes ajoutées aux nœuds d'état.
---@class flowgraph_baseStateNode_C
local flowgraph_baseStateNode_C = {}

--- Appelé par le builder à la fin du dessin du nœud (builder:End). Dessine les 8 pins de transition le long des bords du rectangle du nœud (entrées sur les côtés antihoraires, sorties côtés horaires).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/baseStateNode.lua:35
---@param builder table builder flowgraph (flowgraph/builder), qui fournit NodeRect
function flowgraph_baseStateNode_C:customDrawEnd(builder) end

--- Dessine un pin de transition rectangulaire à la position donnée avec ui_flowgraph_editor (BeginPin, PinRect, PinPivotRect, EndPin) et mémorise pin.imPos.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/baseStateNode.lua:10
---@param pin table pin de transition
---@param kind integer ui_flowgraph_editor.PinKind_Input ou PinKind_Output
---@param pos ImVec2 position du curseur ImGui
---@param size ImVec2 taille du rectangle du pin (pixels)
function flowgraph_baseStateNode_C:drawTransitionPin(pin, kind, pos, size) end

--- Crée les 8 pins de transition (4 entrées, 4 sorties : N, E, S, W) via flowgraph/pin et les range dans self.transitionPins._in et ._out.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/baseStateNode.lua:23
---@param mgr table manager flowgraph (non utilisé directement)
function flowgraph_baseStateNode_C:init(mgr) end

