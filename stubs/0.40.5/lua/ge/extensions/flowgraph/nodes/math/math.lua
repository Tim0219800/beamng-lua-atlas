---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/math/math.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du noeud flowgraph (creee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.
---@class flowgraph_nodes_math_math_C
local flowgraph_nodes_math_math_C = {}

--- Construit activePinList (pins d'entree reliees).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/math/math.lua:258
function flowgraph_nodes_math_math_C:_executionStarted() end

--- Appelle parseExpression apres chargement (resultat ignore).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/math/math.lua:269
---@param nodeData any
function flowgraph_nodes_math_math_C:_onDeserialized(nodeData) end

--- Construit l'environnement de l'expression (fonctions math et utilitaires, lecture des pins avec cache vec3/quat).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/math/math.lua:101
---@return table  environnement passe a load()
function flowgraph_nodes_math_math_C:buildBaseEnv() end

--- Liste des modeles d'expression et description de leurs pins.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/math/math.lua:47
function flowgraph_nodes_math_math_C:drawCustomProperties() end

--- Affiche l'expression.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/math/math.lua:246
---@param builder any
---@param style any
function flowgraph_nodes_math_math_C:drawMiddle(builder, style) end

--- safeMode=true, expression vide, creation de l'environnement et des caches vec3/quat.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/math/math.lua:277
function flowgraph_nodes_math_math_C:init() end

--- Cree un pin d'entree supplementaire (lettre suivante, valeur par defaut 0) quand un lien est ajoute et qu'il manque un pin.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/math/math.lua:251
---@param link any
function flowgraph_nodes_math_math_C:onLink(link) end

--- Vide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/math/math.lua:273
---@param link any
function flowgraph_nodes_math_math_C:onUnlink(link) end

--- Refuse les affectations ('=' isole) puis compile 'return <expression>' avec load() dans l'environnement.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/math/math.lua:182
---@return function|nil  fonction compilee
---@return string|nil  message d'erreur
function flowgraph_nodes_math_math_C:parseExpression() end

--- En safeMode, ne fait rien si une entree connectee est nil. Recompile si l'expression a change, execute avec pcall, convertit un resultat vec3/quat (cdata) en table {x,y,z[,w]}, ecrit 'value' et signale les erreurs (noeud + logEvent).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/math/math.lua:199
function flowgraph_nodes_math_math_C:work() end

