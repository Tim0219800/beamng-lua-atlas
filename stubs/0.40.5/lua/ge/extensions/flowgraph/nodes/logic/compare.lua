---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/logic/compare.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du noeud flowgraph (creee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.
---@class flowgraph_nodes_logic_compare_C
local flowgraph_nodes_logic_compare_C = {}

--- Retrouve la comparaison via opSymbol (ou l'ancien champ data.comparisonFunc) puis appelle refreshFunction.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/logic/compare.lua:79
---@param res any
function flowgraph_nodes_logic_compare_C:_onDeserialized(res) end

--- Appele quand une propriete change ; relance refreshFunction.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/logic/compare.lua:70
---@param key string nom de la propriete
---@param val any nouvelle valeur
function flowgraph_nodes_logic_compare_C:_onPropertyChanged(key, val) end

--- Sauvegarde opSymbol de la comparaison courante.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/logic/compare.lua:75
---@param res any
function flowgraph_nodes_logic_compare_C:_onSerialize(res) end

--- Panneau de proprietes : liste deroulante des fonctions de comparaison.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/logic/compare.lua:38
function flowgraph_nodes_logic_compare_C:drawCustomProperties() end

--- Affiche le symbole de l'operateur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/logic/compare.lua:114
---@param builder any
---@param style any
function flowgraph_nodes_logic_compare_C:drawMiddle(builder, style) end

--- Trie les operateurs de comparaison par nom et selectionne le premier par defaut.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/logic/compare.lua:29
function flowgraph_nodes_logic_compare_C:init() end

--- Met a jour compFunc depuis la comparaison choisie ; si absente, installe une fonction vide et signale l'erreur 'Invalid comparison'.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/logic/compare.lua:59
function flowgraph_nodes_logic_compare_C:refreshFunction() end

--- Calcule value = compFunc(A, B) ; flow suit l'entree flow, true = value, false = not value. Cas nil decrit ci-dessus.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/logic/compare.lua:97
function flowgraph_nodes_logic_compare_C:work() end

