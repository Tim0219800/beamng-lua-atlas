---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/logic/booleanExpression.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du noeud flowgraph (creee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.
---@class flowgraph_nodes_logic_booleanExpression_C
local flowgraph_nodes_logic_booleanExpression_C = {}

--- Au demarrage, construit la liste activePinList des pins d'entree reellement connectes (utilisee par safeMode).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/logic/booleanExpression.lua:181
function flowgraph_nodes_logic_booleanExpression_C:_executionStarted() end

--- Appelle parseExpression apres chargement (le resultat est ignore).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/logic/booleanExpression.lua:192
---@param nodeData any
function flowgraph_nodes_logic_booleanExpression_C:_onDeserialized(nodeData) end

--- Construit l'environnement de l'expression : une table dont __index lit la valeur du pin d'entree du meme nom.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/logic/booleanExpression.lua:96
---@return table  environnement passe a load()
function flowgraph_nodes_logic_booleanExpression_C:buildBaseEnv() end

--- Panneau de proprietes : liste deroulante des modeles d'expression (AND, OR, XOR, NAND, ou 'Custom Expression') et description des pins du modele choisi.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/logic/booleanExpression.lua:62
function flowgraph_nodes_logic_booleanExpression_C:drawCustomProperties() end

--- Affiche l'expression au milieu du noeud.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/logic/booleanExpression.lua:169
---@param builder any
---@param style any
function flowgraph_nodes_logic_booleanExpression_C:drawMiddle(builder, style) end

--- Initialise data.safeMode=true, expression vide, l'environnement et une liste blanche de mots-cles (not, true, false, nil).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/logic/booleanExpression.lua:200
function flowgraph_nodes_logic_booleanExpression_C:init() end

--- Quand un lien est ajoute et qu'il manque un pin, cree un nouveau pin d'entree bool nomme par la lettre suivante (a, b, c...).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/logic/booleanExpression.lua:174
---@param link any
function flowgraph_nodes_logic_booleanExpression_C:onLink(link) end

--- Vide (ne fait rien).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/logic/booleanExpression.lua:196
---@param link any
function flowgraph_nodes_logic_booleanExpression_C:onUnlink(link) end

--- Verifie l'expression (refuse '=' d'assignation et les caracteres hors lettres minuscules/espaces/parentheses) puis la compile avec load() dans l'environnement restreint.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/logic/booleanExpression.lua:114
---@return function|nil  fonction compilee
---@return string|nil  message d'erreur
function flowgraph_nodes_logic_booleanExpression_C:parseExpression() end

--- En safeMode, ne fait rien si une entree connectee vaut nil. Recompile l'expression si elle a change, l'execute avec pcall et ecrit le resultat sur 'value' ; les erreurs sont affichees via __setNodeError('expression').
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/logic/booleanExpression.lua:134
function flowgraph_nodes_logic_booleanExpression_C:work() end

