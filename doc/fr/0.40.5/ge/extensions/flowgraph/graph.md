# `flowgraph_graph`

*Fichier : `lua/ge/extensions/flowgraph/graph.lua` · VM : Game Engine (GE) · 1527 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/graph")` (fichier sous extensions/ mais pas une extension classique)

Classe 'graph' du flowgraph : un graphe de nœuds et de liens appartenant à un manager (self.mgr). Un graphe a un type ('graph', 'macro' ou 'instance'), des nœuds, des liens, des pins, un variableStorage local et un parent éventuel (parentId). Il sait créer et supprimer nœuds et liens, vérifier la compatibilité des pins, sérialiser et désérialiser ses données et, pour un graphe racine, planifier l'ordre d'exécution des nœuds (plan). Le module renvoie un constructeur : require('/lua/ge/extensions/flowgraph/graph')(mgr, name, forceId).

## Remarques

- Les graphes sont stockés à plat dans mgr.graphs ; la hiérarchie vient de parentId (getChildren parcourt mgr.graphs et trie par id).
- plan() ne fait rien pour un macro ni pour un graphe qui a un parent : seule la racine planifie, en agrégeant les nœuds et liens de ses enfants (gatherNodesAndLinks) et en résolvant les nœuds macro/integrated et macro/io (liens virtuels).
- plan() détermine les nœuds racines (triggerable, ou sans pin d'entrée local avec une sortie flow), propage les 'couleurs de flux' et génère le code d'exécution ordonné (appels _workDynamicRepeat / _workDynamicOnce).
- createNode crée aussi un lien caché depuis la pin enterState du nœud events/onUpdate vers la pin reset des nœuds 'once' si la préférence flowgraph.general.autoConnectResetPins est active.
- deleteLink et deleteNode ne retirent pas tout de suite l'objet de l'éditeur : ils notent l'id dans mgr.linksToRemove / mgr.nodesToRemove, traités par le manager.
- Bug probable : getDeepChild utilise current.children, champ commenté dans init (self.children n'existe pas), donc getMacro avec des indices non vides échoue.
- getSiblings contient un print(parent.name) de débogage.
- pinsCompatible peut renvoyer nil (au lieu de false) quand aucun type ne correspond.

## Classe `C`

Objet graphe renvoyé par le constructeur.

Le module renvoie un constructeur : `local obj = require("flowgraph_graph")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` | Appelé au démarrage du projet : notifie chaque nœud. | 1266 |
| `C:_executionStopped()` | Appelé à l'arrêt du projet : notifie les nœuds et le variableStorage. | 1281 |
| `C:_onClear()` | Notifie les nœuds et le variableStorage d'un clear. | 1274 |
| `C:_onDeserialized(data)` | Reconstruit le graphe (nœuds triés par id, liens, variables) depuis les données sérialisées. | 1031 |
| `C:_onSerialize()` | Sérialise le graphe (nom, nœuds, liens ordonnés, type, variables, vue, parentId…). Renvoie la table et le plus petit id utilisé. | 952 |
| `C:_printStructure(depth)` | Affiche récursivement l'arbre des graphes avec indentation. | 1378 |
| `C:canCreateLink(a, b, newLinkInfo)` | Vrai si un lien peut être créé entre a et b (directions opposées, nœuds différents, types compatibles, lien inexistant, noms égaux si matchName). | 1229 |
| `C:clear()` | Supprime les graphes enfants, détruit les nœuds et vide nodes, links, pins. | 789 |
| `C:clearVariableChangesChildren()` | Vide les changements de variables en attente de ce graphe et de ses descendants. | 77 |
| `C:createLink(startPin, endPin, ...)` | Crée un lien entre une pin de sortie et une pin d'entrée (après avoir retiré la valeur codée en dur de la pin cible). | 913 |
| `C:createNode(nodeType, forceId, ...)` | Crée un nœud d'un type donné (ex. 'events/onUpdate') à partir des modèles du manager. Journalise une erreur et renvoie nil si le type est inconnu. Marque les nœuds obsolètes dans leur nom. | 818 |
| `C:deleteLink(link)` | Supprime un lien : met à jour pinIn / _mInFlow de la cible, notifie pins et nœuds, planifie la suppression côté éditeur. | 919 |
| `C:deleteNode(node, ignoreIntegratedNodes)` | Supprime un nœud et ses liens (sauf nœuds undeleteable hors mode debug ; un nœud qui représente un graphe supprime ce graphe, sauf ignoreIntegratedNodes). | 874 |
| `C:findNodeInChildren(id)` | Alias de findNodeRecursive. | 1347 |
| `C:findNodeRecursive(id)` | Cherche un nœud par id dans ce graphe puis dans ses enfants. | 1350 |
| `C:findPin(pinId)` | Renvoie la pin d'id donné. | 1249 |
| `C:forceRecursiveNodeUpdatePosition()` | Force la mise à jour de la position éditeur de tous les nœuds (récursif). | 1365 |
| `C:gatherNodesAndLinks(rNodes, rLinks, interInfo)` | Ajoute à rNodes et rLinks les nœuds et liens de ce graphe et de ses enfants, et renseigne interInfo pour les nœuds macro/integrated. | 127 |
| `C:getChildPosition()` | Renvoie la suite d'indices de ce graphe parmi les enfants depuis la racine de l'instance. | 1315 |
| `C:getChildren()` | Renvoie les graphes enfants (parentId == id), triés par id. | 65 |
| `C:getChildrenWithStates()` | Enfants du graphe, plus (pour un graphe d'états) les graphes non-états représentés par ses nœuds. | 1427 |
| `C:getDeepChild(indexes)` | Descend dans les enfants selon des indices (voir notes : utilise un champ children inexistant). | 1326 |
| `C:getDirtyChildren(dirtyChildren)` | Collecte les ids de macros 'dirty' utilisés par des instances enfants. | 92 |
| `C:getInstanceRoot()` | Renvoie la racine de l'instance (premier ancêtre avec macroID). | 1304 |
| `C:getLocation(withIds)` | Renvoie le chemin du graphe depuis la racine (noms, ou ids si withIds), états parents compris. | 1472 |
| `C:getMacro()` | Pour un graphe de type 'instance', renvoie le graphe macro d'origine correspondant. | 1290 |
| `C:getParent()` | Renvoie le graphe parent. | 58 |
| `C:getParentWithStates()` | Comme getParent, mais si le graphe n'a pas de parent, renvoie le graphe d'états dont un nœud représente ce graphe. | 1405 |
| `C:getRecursiveHooksAndDependencies(hooks, deps)` | Collecte récursivement les nœuds (pour leurs hooks) et les dépendances d'extensions déclarées par les nœuds. | 1334 |
| `C:getRootGraph()` | Remonte jusqu'au graphe racine. | 84 |
| `C:getSiblings()` | Renvoie les graphes frères (même parent, états compris) ; imprime le nom du parent (voir notes). | 1441 |
| `C:hasLink(pin)` | Vrai si une pin d'entrée de type autre que flow/state est déjà liée. | 1171 |
| `C:init(mgr, name, forceId)` | Initialise le graphe : id, nom, type 'graph', tables vides, variableStorage, position et zoom de vue. | 18 |
| `C:linkExists(startPin, endPin)` | Vrai s'il existe déjà un lien entre ces deux pins. | 1162 |
| `C:moveNodeToGraph(node, newGraph)` | Déplace un nœud vers un autre graphe en supprimant ses liens. | 863 |
| `C:pinsCompatible(sourcePin, targetPin)` | Teste la compatibilité des types de deux pins : 'any' accepte tout, les pins 'state' ne se lient qu'entre elles, les types table doivent avoir le même tableType ou 'generic'. | 1180 |
| `C:plan()` | Planifie l'exécution (graphe racine non-macro) : dépendances, racines de flux, propagation des couleurs, ordre des nœuds, génération du code d'exécution. Appelé par le manager avant de lancer ou après modification. | 266 |
| `C:printStructure()` | Affiche l'arbre des graphes (seulement depuis une racine). | 1390 |
| `C:resolveInterHops(rLinks, interInfo)` | Suit les liens à travers les nœuds macro/integrated et macro/io pour créer des liens virtuels (virtualLink) entre le vrai émetteur et les vraies cibles. | 192 |
| `C:setDirty(dirty, startFromRoot)` | Marque le graphe (et ses enfants de même type) comme modifié ; par défaut en partant de la racine. | 109 |
| `C:toString()` | Texte 'nom (id / type)'. | 1374 |
| `C:updateChildrenTypes(t, ignoreType)` | Applique un type à ce graphe et à ses descendants (s'arrête sur ignoreType). | 1256 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/graph.lua`.*
