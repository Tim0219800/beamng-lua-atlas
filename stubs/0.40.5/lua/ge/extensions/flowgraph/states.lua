---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/states.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Gestionnaire d'états d'un projet flowgraph. Champs : mgr, states (id de nœud -> état {id, depth, graph, name, autoStart, extProxy, active, ports, transitionStack, extHooks, extDeps}), queuedTransitions, hookExists, resolveExtProxy, stateGraph.
---@class flowgraph_states
local flowgraph_states = {}

--- Crée un état à partir d'un nœud avec ports : proxy d'extension dédié, collecte des hooks et dépendances du graphe cible (`getRecursiveHooksAndDependencies`), mémorise les hooks `onXxx` existants dans `hookExists`.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/states.lua:64
---@param pnode table Élément {node, depth, ports, startingState}.
function flowgraph_states:addStateFromPortedNode(pnode) end

--- Appelle le hook `functionName` sur le proxy de chaque état qui le possède.
---Source : lua/ge/extensions/flowgraph/states.lua:560
---@param functionName string Nom du hook.
---@param ... any Arguments passés au hook.
function flowgraph_states:broadcastCall(functionName, ...) end

--- Comme `broadcastCall`, mais passe en premier argument la table `results` pour que les états y déposent des résultats.
---Source : lua/ge/extensions/flowgraph/states.lua:568
---@param functionName string Nom du hook.
---@param results table Table de résultats partagée.
---@param ... any Arguments supplémentaires.
function flowgraph_states:broadcastCallReturn(functionName, results, ...) end

--- Remplit pour chaque nœud ses ports (nom de transition -> cibles, profondeur d'arrêt, arrêt du projet) et marque les états de départ (reliés aux nœuds racine).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/states.lua:347
---@param nodes table Nœuds.
---@param links table Liens aplatis.
---@return table  Nœuds valides (hors connecteurs).
function flowgraph_states:buildPortsAndStarts(nodes, links) end

--- Construit tous les états du projet (collecte, aplatissement, ports) et le proxy `_StateResolver` qui résout les transitions à chaque `onUpdate` tant que le projet tourne.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/states.lua:385
function flowgraph_states:buildStates() end

--- Détruit le proxy de résolution et tous les proxys d'extension des états, rafraîchit les dépendances de `core_flowgraphManager` et vide `states` et `hookExists`.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/states.lua:21
function flowgraph_states:clear() end

--- Détruit le gestionnaire (appelle `clear`).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/states.lua:17
function flowgraph_states:destroy() end

--- Cherche dans le graphe d'états racine le nœud `states/stateNode` dont le graphe cible a l'id donné.
---Source : lua/ge/extensions/flowgraph/states.lua:440
---@param targetGraphId integer Id du graphe cible.
---@return table|nil  Nœud trouvé.
function flowgraph_states:findStateNodeInStateGraph(targetGraphId) end

--- Version récursive de la recherche, sur un graphe et ses enfants.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/states.lua:444
---@param graph table Graphe où chercher.
---@param id integer Id du graphe cible.
---@return table|nil  Nœud trouvé.
function flowgraph_states:findStateNodeInStateGraphRecursive(graph, id) end

--- Vide l'état puis parcourt récursivement le graphe d'états racine pour lister nœuds, liens et groupes.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/states.lua:159
---@return table  nodes.
---@return table  links.
---@return table  group (groupes d'états).
function flowgraph_states:gatherNodesAndLinks() end

--- Parcours récursif d'un graphe : ignore les commentaires, marque connecteurs (groupes, entrée/sortie), racines et liens à raccourcir ; ignore un groupe invalide (entrée reliée directement à une sortie).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/states.lua:167
---@param graph table Graphe courant.
---@param nodes table Table de sortie des nœuds.
---@param links table Liste de sortie des liens.
---@param group table Table des groupes.
---@param depth table Liste des ids de graphes parents.
function flowgraph_states:gatherNodesAndLinksRecursion(graph, nodes, links, group, depth) end

--- Renvoie l'id de l'état dont le graphe est le graphe racine du nœud donné, ou -1.
---Source : lua/ge/extensions/flowgraph/states.lua:424
---@param node table Nœud quelconque.
---@return integer  Id d'état ou -1.
function flowgraph_states:getStateIdForNode(node) end

--- Renvoie les ids des états contenus dans le groupe correspondant à la profondeur donnée (dernier id de la liste).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/states.lua:547
---@param depth table Liste d'ids de graphes.
---@return integer[]  Ids d'états.
function flowgraph_states:getStateIdsForDepth(depth) end

--- Censé renvoyer le nœud d'un état ; renvoie `states[id].node`, champ jamais renseigné (toujours nil).
---Source : lua/ge/extensions/flowgraph/states.lua:431
---@param id integer Id de l'état.
---@return table|nil  Toujours nil dans le code actuel.
function flowgraph_states:getStateNode(id) end

--- Dépréciée : log une erreur et ne renvoie rien.
---Source : lua/ge/extensions/flowgraph/states.lua:435
---@param node table Nœud.
function flowgraph_states:getStateNodeByNode(node) end

--- Renvoie la pile de données de transition d'un état (table vide si inconnu).
---Source : lua/ge/extensions/flowgraph/states.lua:420
---@param id integer Id de l'état.
---@return table  transitionStack.
function flowgraph_states:getTransitionStack(id) end

--- Pour un nœud d'état, regroupe par nom de transition (nom du pin source) les liens sortants de son graphe : {nom -> [{targetName, link}]}.
---Source : lua/ge/extensions/flowgraph/states.lua:48
---@param node table Nœud d'état.
---@return table<string, table[]>  Transitions par nom.
function flowgraph_states:getTransitions(node) end

--- Dit si au moins un nœud d'un état possède une méthode correspondant à ce hook (`onXxx`).
---Source : lua/ge/extensions/flowgraph/states.lua:577
---@param functionName string Nom du hook.
---@return boolean|nil  true si existe.
function flowgraph_states:hasNodeForHook(functionName) end

--- Constructeur : mémorise le manager et initialise les tables.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/states.lua:9
---@param mgr table Manager de flowgraph.
function flowgraph_states:init(mgr) end

--- Dit si l'état est actif.
---Source : lua/ge/extensions/flowgraph/states.lua:581
---@param id integer Id de l'état.
---@return boolean  true si actif.
function flowgraph_states:isRunning(id) end

--- Aplatit les liens qui traversent des connecteurs (groupes d'états, entrées/sorties) en liens virtuels directs entre états réels.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/states.lua:247
---@param nodes table Nœuds collectés.
---@param links table Liens collectés.
---@param group table Groupes.
---@return table  Liste de liens aplatis.
function flowgraph_states:resolveInterHops(nodes, links, group) end

--- Résout toutes les transitions en file : détermine les états à arrêter et à démarrer, applique les profondeurs d'arrêt de groupes, met à jour les `transitionStack`, arrête le projet si un état final est atteint sans autre démarrage, puis vide la file. Appelé à chaque `onUpdate` tant que le projet tourne.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/states.lua:466
function flowgraph_states:resolveTransitions() end

--- Démarre tous les états marqués `autoStart` (ceux reliés à l'entrée racine).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/states.lua:109
function flowgraph_states:startAutoStartStates() end

--- Active un état : branche son proxy aux hooks et dépendances, appelle `onStateStarted` et `onStateStartedTrigger` du proxy, puis `activity:onFlowgraphStateStarted(nom, état, transData)` si le projet est lié à une activité.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/states.lua:117
---@param id integer Id du nœud d'état.
---@param transData table|nil Données de transition (voir bug dans les notes).
function flowgraph_states:startState(id, transData) end

--- Désactive un état : appelle `onStateStopped`, `onStateStoppedTrigger`, `activity:onFlowgraphStateStopped`, puis débranche son proxy.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/states.lua:138
---@param id integer Id de l'état.
function flowgraph_states:stopState(id) end

--- Met en file une transition qui sera résolue à la fin de la frame ; la consigne dans les événements du manager.
---Source : lua/ge/extensions/flowgraph/states.lua:458
---@param sourceStateId integer Id de l'état source.
---@param transitionName string Nom du pin/transition à suivre.
---@param transitionData table|nil Données ajoutées à la pile de transition de la cible.
---@param sourceNode table|nil Nœud d'origine, pour le journal.
function flowgraph_states:transition(sourceStateId, transitionName, transitionData, sourceNode) end

