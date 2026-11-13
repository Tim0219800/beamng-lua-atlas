# `flowgraph_manager`

*Fichier : `lua/ge/extensions/flowgraph/manager.lua` · VM : Game Engine (GE) · 2333 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/manager")` (fichier sous extensions/ mais pas une extension classique)

Classe 'manager' du flowgraph : un manager représente UN projet flowgraph (graphes, macros, variables, modules, historique, état d'exécution). Il est créé par core_flowgraphManager (self.fgMgr) et exposé à l'éditeur (fgEditor). Il crée les graphes (dont le graphe d'états), gère les macros et leurs instances, la sélection, copier-coller, annuler-refaire, la sérialisation du projet, et pilote l'exécution : setRunning planifie les graphes, démarre les états, diffuse les hooks (broadcastCall) et notifie les 16 modules (missionReplay, drift, vehicle, level, prefab, timer, button, action, camera, file, traffic, mission, foreach, thread, ui, aiRecording) triés par moduleOrder. Le module renvoie un constructeur : require('/lua/ge/extensions/flowgraph/manager')(parent).

## Remarques

- États d'exécution (runningState) : 'stopped', 'running', 'paused'. L'arrêt normal est différé en fin de frame (queueReset traité par resolveHooksAndReset) ; setRunning(false, true) arrête et détruit immédiatement.
- Les ids de graphe et de nœud sont petits (getNextFreeGraphNodeId) ; les ids de pins et de liens descendent depuis 2^29 (getNextFreePinLinkId).
- Les hooks des modules sont enregistrés via extProxy:submitEventSinks(getHooklist(), getDependencies()) ; getHooklist et getDependencies renvoient {} si le projet n'est pas en 'running'.
- getRelativeAbsolutePath cherche d'abord à la racine, puis dans les dossiers layers de l'activité, ou sinon savedDir puis missionFolder.
- Bug : checkDuplicateId utilise les variables non définies 'i', 'occupied' et 'node' (restes de getNextFreeGraphNodeId) : self.graphs[i] vaut toujours nil et la boucle suivante peut échouer ; la vérification est donc inopérante (elle n'est exécutée que si __safeIds, vrai par défaut).
- Bug mineur : setPaused appelle extProxy:submitEventSinks(self:getHooklist()) sans la liste de dépendances.
- Bug probable : findMacrosUsedInChildren lit graph.children, champ commenté dans graph.lua (jamais rempli).
- createStateFromLibrary utilise 'oldIdMap' non défini (nil) lors de l'appel à graph:_onDeserialized.

## Classe `C`

Objet manager (un projet flowgraph).

Le module renvoie un constructeur : `local obj = require("flowgraph_manager")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:DrawTypeIcon(dataType, connected, alpha, typeIconSize, innercolor)` | Dessine l'icône d'un type de donnée (couleur du type, plein si connecté) dans l'éditeur. | 1030 |
| `C:_executionStarted()` | Notifie graphes et modules du démarrage (ordre des modules par moduleOrder). | 2106 |
| `C:_executionStopped()` | Appelé à l'arrêt : notifie graphes, variables et modules (executionStopped), retire le proxy d'extensions, décharge les extensions de extToUnload, remet steps et frameCount à 0. | 2132 |
| `C:_onClear()` | Appelé à l'arrêt : notifie graphes, variables, modules (onClear) et états. | 2120 |
| `C:_onDeserialized(data)` | Reconstruit le projet depuis des données sérialisées. | 1599 |
| `C:_onSerialize()` | Sérialise tout le projet (graphes, macros, variables, métadonnées). | 1533 |
| `C:allNodes()` | Itérateur sur tous les nœuds de tous les graphes : for node in mgr:allNodes() do ... end. | 2265 |
| `C:attach(fgEditor)` | Attache l'éditeur (fgEditor) et met à jour la position des nœuds. | 16 |
| `C:autoGraphNodeOffset()` | Définit ce décalage au plus grand id de graphe ou de nœud existant (graphes et macros). | 84 |
| `C:blocksOnResetGameplay()` | Vrai si le projet tourne et qu'un de ses nœuds déclare blocksOnResetGameplay (résultat mis en cache jusqu'au prochain setRunning). | 2249 |
| `C:broadcastCall(functionName, ...)` | Si le projet tourne, appelle la fonction de hook donnée sur le proxy d'extensions puis sur les états (donc sur les nœuds qui l'écoutent). | 2193 |
| `C:broadcastCallReturn(functionName, ...)` | Comme broadcastCall, mais collecte les résultats des nœuds dans une table (passée comme premier argument aux hooks). | 2202 |
| `C:checkCompileWarnings()` | Journalise une erreur si une section du graphe a plusieurs nœuds racines (couleurs de flux multiples). | 1989 |
| `C:checkDuplicateId(id)` | Devait signaler un id déjà utilisé (voir notes : code défectueux). | 28 |
| `C:clearGraph(graph)` | Vide un graphe (par défaut le courant) : supprime nœuds et liens de l'éditeur puis appelle graph:clear(). | 1504 |
| `C:convertToMacro(graph)` | Transforme un graphe en macro : sa copie sérialisée devient un macro (self.macros) et le graphe d'origine devient une instance de ce macro. | 356 |
| `C:copyGraph(oldGraph, newName, hidden)` | Copie un graphe par sérialisation puis désérialisation, en conservant macroID. | 342 |
| `C:copyNodes()` | Copie les nœuds sélectionnés dans le presse-papier interne (copiedNodes). | 1193 |
| `C:createGraph(name, hidden, forceId)` | Crée un graphe lié au manager ; s'il n'est pas hidden, il est ajouté à self.graphs. | 333 |
| `C:createGraphAsState(name, isStateGraph)` | Crée un graphe et un nœud d'état (states/stateNode) dans le graphe courant qui le cible. | 257 |
| `C:createGroupState(name)` | Crée un état de groupe (graphe d'états enfant du graphe courant) avec entrée et sortie 'success'. | 269 |
| `C:createInstanceFromMacro(macro, node, forceId)` | Crée un graphe de type 'instance' depuis un macro et le lie éventuellement à un nœud integrated. | 691 |
| `C:createMacroInstanceFromPath(path, node)` | Crée une instance de macro depuis un fichier (réutilise le macro déjà chargé s'il a le même macroPath). | 725 |
| `C:createNewMacroNode(path)` | Crée un nœud macro/integrated dans le graphe courant, instancié depuis un fichier macro. | 684 |
| `C:createStateFromLibrary(data)` | Crée un état depuis une donnée de bibliothèque (graph, node, minId, name). | 286 |
| `C:createSubgraphFromMacroInstance()` | Crée un sous-graphe depuis l'instance de macro sélectionnée (via groupHelper). | 1849 |
| `C:createSubgraphFromSelection()` | Groupe la sélection en sous-graphe (groupHelper:createGroupingFromSelection). | 1853 |
| `C:creationWorkflow()` | Traite chaque frame la création de liens et de nœuds par glisser dans l'éditeur. | 891 |
| `C:deleteGraph(graph)` | Supprime un graphe (graphes ou macros du manager) ; journalise une erreur s'il n'appartient pas au manager. | 784 |
| `C:deleteGraphs()` | Supprime tous les graphes puis tous les macros. | 1517 |
| `C:deleteSelection()` | Supprime les nœuds et liens sélectionnés du graphe courant (si l'édition est autorisée). | 1404 |
| `C:deleteSelectionButton()` | Supprime la sélection puis ajoute une entrée d'historique 'Deleted Selection'. | 1396 |
| `C:deletionWorkflow()` | Traite la suppression par l'éditeur (touche Suppr et sélection). | 1062 |
| `C:destroy()` | Arrête le projet s'il tourne, détruit les états et le proxy d'extensions et marque le manager comme détruit. | 2162 |
| `C:detached()` | Détache l'éditeur : vide la sélection. | 21 |
| `C:dragDropSource(payloadType, data)` | Appelé par l'éditeur pour préparer la source d'un glisser-déposer. | 1169 |
| `C:dragDropTarget(payloadType)` | Appelé par l'éditeur quand un objet est déposé : gère la cible du glisser-déposer. | 1158 |
| `C:draw(dtReal, dtSim, dtRaw)` | Dessine le projet dans l'éditeur à chaque frame (ui). | 1423 |
| `C:findDependencyMap(serializedMacros)` | Construit l'ordre de dépendance entre macros sérialisés. | 1797 |
| `C:findIntegratedNode(graph)` | Trouve le nœud macro/integrated du graphe parent qui représente ce graphe. | 520 |
| `C:findLinkIdFromHiddenLinkId(hiddenId)` | Renvoie l'id du lien dont hiddenId est donné, dans le graphe courant. | 1134 |
| `C:findMacrosUsedInChildren(graph, list)` | Liste récursivement les macroID utilisés par les enfants (voir notes). | 1787 |
| `C:getAvailableMacros()` | Liste les fichiers macros JSON du dossier /flowgraphEditor/macros/ (par nom, avec le champ path). | 1429 |
| `C:getAvailableNodeTemplates()` | Renvoie les modèles de nœuds (liste et table de recherche par type) du jeu, plus les nœuds personnalisés du dossier customNodes/ du projet s'il est enregistré. | 1446 |
| `C:getAvailableStateTemplates()` | Renvoie les modèles d'états de core_flowgraphManager. | 1442 |
| `C:getCustomNodeTemplates()` | Charge les nœuds personnalisés (*Node.lua) depuis savedDir/customNodes/. | 1465 |
| `C:getDependencies()` | Renvoie, triées, les extensions requises par les nœuds (hors macros) et les modules. Vide si le projet n'est pas en cours. | 1961 |
| `C:getGraphByName(name)` | Renvoie le premier graphe portant ce nom. | 2177 |
| `C:getGraphNodeOffset()` | Décalage d'ids utilisé lors de la désérialisation (défaut 0). | 80 |
| `C:getHooklist()` | Renvoie la liste des cibles de hooks (le manager et une table de fonctions regroupant les hooks des modules, exécutés sous xpcall avec log d'erreur). Vide si le projet n'est pas en cours. | 1920 |
| `C:getNextFreeGraphNodeId()` | Renvoie le prochain id libre pour un graphe ou un nœud (incrémental, vérifie graphes, macros et leurs nœuds). | 50 |
| `C:getNextFreePinLinkId()` | Renvoie le prochain id libre pour pins et liens, en descendant depuis 2^29. | 101 |
| `C:getNextUniqueIdentifier()` | Renvoie un id unique entre toutes les instances de l'éditeur (délègue à core_flowgraphManager). | 1529 |
| `C:getRelativeAbsolutePath(p, disableLogEntryOnFail)` | Résout un ou plusieurs chemins relatifs à la racine, aux dossiers de couches de l'activité, à savedDir ou au dossier de mission et renvoie le premier fichier existant (FS:fileExists). Sinon renvoie le premier chemin candidat et false (avec un avertissement sauf si désactivé). | 2284 |
| `C:goToHistory(index)` | Restaure un état de l'historique par index. | 1344 |
| `C:hasNodeForHook(functionName)` | Vrai si le projet tourne et qu'un nœud ou un état écoute ce hook. | 2213 |
| `C:historySnapshot(title)` | Enregistre un instantané sérialisé du projet dans l'historique (ignoré si l'édition est interdite, c'est-à-dire pendant l'exécution). | 1374 |
| `C:init(parent)` | Crée un projet vide : graphe 'New State' avec un nœud events/onUpdate, graphe d'états, variableStorage, instances des 16 modules, historique (99 entrées max), proxy d'extensions (newExtensionProxy) enregistré dans core_flowgraphManager.runningProxies, groupHelper, et un premier instantané d'historique. | 126 |
| `C:logEvent(name, type, description, meta)` | Ajoute un évènement au journal du projet (nom, type 'I'/'W'/'E', description, frame, heure) et compte les doublons par nom. Utile aux nœuds et modules pour tracer l'exécution. | 1898 |
| `C:onClientEndMission()` | Hook de fin de mission : arrête immédiatement le projet si stopRunningOnClientEndMission est vrai. | 2277 |
| `C:onDrag()` | Pendant un glisser-déposer. | 1147 |
| `C:onDragEnded()` | Fin d'un glisser-déposer. | 1153 |
| `C:onDragStarted()` | Début d'un glisser-déposer (dragging = true). | 1143 |
| `C:onUpdate(dtReal, dtSim, dtRaw)` | Appelé à chaque frame : compte les frames, mémorise dtReal/dtSim/dtRaw, gère le mode pas-à-pas (steps) puis appelle onUpdate de chaque module. | 1882 |
| `C:pasteNodes()` | Colle les nœuds copiés dans le graphe courant. | 1238 |
| `C:queueForRestart()` | Demande un redémarrage du projet en fin de frame. | 2102 |
| `C:redo()` | Passe à l'entrée suivante de l'historique. | 1364 |
| `C:refreshIntegratedPins(node)` | Reconstruit les pins d'un nœud macro/integrated d'après son graphe cible en conservant liens et valeurs codées en dur. | 395 |
| `C:resolveHooksAndReset()` | Appelé en fin de frame par core_flowgraphManager : exécute les arrêts (queueReset) et redémarrages (queueRestart) différés. | 1858 |
| `C:resolveVariableChanges()` | Applique les changements de variables en attente du manager et de tous les graphes. | 2186 |
| `C:saveMacro(macro, savedata)` | Écrit un macro (racine) dans un fichier JSON avec ses tags et met à jour macroPath des instances. | 608 |
| `C:selectGraph(graph)` | Rend un graphe courant (affiche son onglet, mémorise l'instance récente, ouvre le macro si arrêté) et vide la sélection. | 303 |
| `C:setPaused(paused)` | Met le projet en pause ou le reprend (sans effet si arrêté). | 2094 |
| `C:setRunning(running, stopInstant)` | Démarre ou arrête le projet. Au démarrage : planifie les graphes racines, construit et démarre les états, notifie nœuds et modules (_executionStarted) et diffuse 'onExecutionStarted'. À l'arrêt : diffuse 'onRemoveNextFrame' et programme l'arrêt en fin de frame, ou l'immédiat si stopInstant. | 2027 |
| `C:setupCreationWorkflow()` | Prépare la création de nœud ou de lien depuis l'éditeur (ui_flowgraph_editor). | 837 |
| `C:setupStateGraph(empty)` | Crée le graphe d'états 'States' avec nœuds stateEntry et stateExit, et (sauf si empty) un stateNode vers le graphe principal. | 233 |
| `C:undo()` | Revient à l'entrée précédente de l'historique. | 1354 |
| `C:unselectAll()` | Vide la sélection de nœuds et de liens. | 1088 |
| `C:updateEditorPosition(force)` | Met à jour la position éditeur de tous les nœuds des graphes et macros. | 1759 |
| `C:updateEditorSelections()` | Met à jour les tables de nœuds et de liens sélectionnés à partir de la sélection côté C++. | 1100 |
| `C:updateInstances(macro)` | Met à jour toutes les instances d'un macro modifié à partir de sa version sérialisée. | 551 |
| `C:updateNodePositions()` | Relit la position éditeur de tous les nœuds des graphes. | 1776 |
| `C:updateSubgraphs(graph)` | Remplace récursivement les graphes cibles des nœuds integrated par des copies de type 'instance'. | 537 |

## Appels vers le moteur (C++)

- `FS:` `fileExists`, `findFiles`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/manager.lua`.*
