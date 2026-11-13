# `flowgraph_states`

*Fichier : `lua/ge/extensions/flowgraph/states.lua` · VM : Game Engine (GE) · 591 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/states")` (fichier sous extensions/ mais pas une extension classique)

Gestion des états (« state machine ») d'un projet flowgraph basé sur des graphes d'états (nœuds `states/stateNode`, `states/stateEntry`, `states/stateExit` et groupes d'états). Le module renvoie un constructeur : `require('flowgraph_states')(mgr)`. Il aplatit la hiérarchie de graphes d'états en liens directs entre états (`buildStates`), crée pour chaque état un proxy d'extension qui ne reçoit les hooks que quand l'état est actif, met en file les transitions demandées par les nœuds et les résout à la fin de la frame (`resolveTransitions`, via un proxy `_StateResolver` sur `onUpdate`).

## Remarques

- Cycle : `buildStates` → `startAutoStartStates` → pendant l'exécution, `transition(...)` met en file → `resolveTransitions` (dans `onUpdate`) arrête les états source, démarre les cibles, fusionne les données de transition dans `transitionStack`.
- Un état atteignant un `stateExit` racine arrête le projet (`mgr:setRunning(false)`), sauf si un autre état démarre dans la même frame.
- Un lien direct entre `stateEntry` et `stateExit` rend le groupe invalide et il est ignoré (log E).
- Bug : `resolveTransitions` appelle `self:startState(id, transData)` alors que `transData` n'est défini nulle part (global nil) ; les données de transition ne sont donc pas transmises au callback `onFlowgraphStateStarted` de l'activité.
- Bug : `getStateNode(id)` renvoie `self.states[id].node`, champ jamais renseigné par `addStateFromPortedNode` : renvoie toujours nil.
- Bug : dans `addStateFromPortedNode`, si `node.targetGraph` est nil, le code appelle ensuite `node.targetGraph:plan()` (erreur).
- `getStateNodeByNode` est dépréciée (log d'erreur, ne renvoie rien).
- `table.sort(transitions)` dans `getTransitions` n'a aucun effet (table à clés texte).

## Classe `C`

Gestionnaire d'états d'un projet flowgraph. Champs : mgr, states (id de nœud -> état {id, depth, graph, name, autoStart, extProxy, active, ports, transitionStack, extHooks, extDeps}), queuedTransitions, hookExists, resolveExtProxy, stateGraph.

Le module renvoie un constructeur : `local obj = require("flowgraph_states")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:addStateFromPortedNode(pnode)` | Crée un état à partir d'un nœud avec ports : proxy d'extension dédié, collecte des hooks et dépendances du graphe cible (`getRecursiveHooksAndDependencies`), mémorise les hooks `onXxx` existants dans `hookExists`. | 64 |
| `C:broadcastCall(functionName, ...)` | Appelle le hook `functionName` sur le proxy de chaque état qui le possède. | 560 |
| `C:broadcastCallReturn(functionName, results, ...)` | Comme `broadcastCall`, mais passe en premier argument la table `results` pour que les états y déposent des résultats. | 568 |
| `C:buildPortsAndStarts(nodes, links)` | Remplit pour chaque nœud ses ports (nom de transition -> cibles, profondeur d'arrêt, arrêt du projet) et marque les états de départ (reliés aux nœuds racine). | 347 |
| `C:buildStates()` | Construit tous les états du projet (collecte, aplatissement, ports) et le proxy `_StateResolver` qui résout les transitions à chaque `onUpdate` tant que le projet tourne. | 385 |
| `C:clear()` | Détruit le proxy de résolution et tous les proxys d'extension des états, rafraîchit les dépendances de `core_flowgraphManager` et vide `states` et `hookExists`. | 21 |
| `C:destroy()` | Détruit le gestionnaire (appelle `clear`). | 17 |
| `C:findStateNodeInStateGraph(targetGraphId)` | Cherche dans le graphe d'états racine le nœud `states/stateNode` dont le graphe cible a l'id donné. | 440 |
| `C:findStateNodeInStateGraphRecursive(graph, id)` | Version récursive de la recherche, sur un graphe et ses enfants. | 444 |
| `C:gatherNodesAndLinks()` | Vide l'état puis parcourt récursivement le graphe d'états racine pour lister nœuds, liens et groupes. | 159 |
| `C:gatherNodesAndLinksRecursion(graph, nodes, links, group, depth)` | Parcours récursif d'un graphe : ignore les commentaires, marque connecteurs (groupes, entrée/sortie), racines et liens à raccourcir ; ignore un groupe invalide (entrée reliée directement à une sortie). | 167 |
| `C:getStateIdForNode(node)` | Renvoie l'id de l'état dont le graphe est le graphe racine du nœud donné, ou -1. | 424 |
| `C:getStateIdsForDepth(depth)` | Renvoie les ids des états contenus dans le groupe correspondant à la profondeur donnée (dernier id de la liste). | 547 |
| `C:getStateNode(id)` | Censé renvoyer le nœud d'un état ; renvoie `states[id].node`, champ jamais renseigné (toujours nil). | 431 |
| `C:getStateNodeByNode(node)` | Dépréciée : log une erreur et ne renvoie rien. | 435 |
| `C:getTransitionStack(id)` | Renvoie la pile de données de transition d'un état (table vide si inconnu). | 420 |
| `C:getTransitions(node)` | Pour un nœud d'état, regroupe par nom de transition (nom du pin source) les liens sortants de son graphe : {nom -> [{targetName, link}]}. | 48 |
| `C:hasNodeForHook(functionName)` | Dit si au moins un nœud d'un état possède une méthode correspondant à ce hook (`onXxx`). | 577 |
| `C:init(mgr)` | Constructeur : mémorise le manager et initialise les tables. | 9 |
| `C:isRunning(id)` | Dit si l'état est actif. | 581 |
| `C:resolveInterHops(nodes, links, group)` | Aplatit les liens qui traversent des connecteurs (groupes d'états, entrées/sorties) en liens virtuels directs entre états réels. | 247 |
| `C:resolveTransitions()` | Résout toutes les transitions en file : détermine les états à arrêter et à démarrer, applique les profondeurs d'arrêt de groupes, met à jour les `transitionStack`, arrête le projet si un état final est atteint sans autre démarrage, puis vide la file. Appelé à chaque `onUpdate` tant que le projet tourne. | 466 |
| `C:startAutoStartStates()` | Démarre tous les états marqués `autoStart` (ceux reliés à l'entrée racine). | 109 |
| `C:startState(id, transData)` | Active un état : branche son proxy aux hooks et dépendances, appelle `onStateStarted` et `onStateStartedTrigger` du proxy, puis `activity:onFlowgraphStateStarted(nom, état, transData)` si le projet est lié à une activité. | 117 |
| `C:stopState(id)` | Désactive un état : appelle `onStateStopped`, `onStateStoppedTrigger`, `activity:onFlowgraphStateStopped`, puis débranche son proxy. | 138 |
| `C:transition(sourceStateId, transitionName, transitionData, sourceNode)` | Met en file une transition qui sera résolue à la fin de la frame ; la consigne dans les événements du manager. | 458 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/states.lua`.*
