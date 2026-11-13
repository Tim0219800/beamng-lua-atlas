---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/manager.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Objet manager (un projet flowgraph).
---@class flowgraph_manager
local flowgraph_manager = {}

--- Dessine l'icône d'un type de donnée (couleur du type, plein si connecté) dans l'éditeur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/manager.lua:1030
---@param dataType string|table type de pin
---@param connected boolean pin connectée
---@param alpha number opacité
---@param typeIconSize number|nil taille
---@param innercolor ImVec4|nil couleur intérieure
function flowgraph_manager:DrawTypeIcon(dataType, connected, alpha, typeIconSize, innercolor) end

--- Notifie graphes et modules du démarrage (ordre des modules par moduleOrder).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/manager.lua:2106
function flowgraph_manager:_executionStarted() end

--- Appelé à l'arrêt : notifie graphes, variables et modules (executionStopped), retire le proxy d'extensions, décharge les extensions de extToUnload, remet steps et frameCount à 0.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/manager.lua:2132
function flowgraph_manager:_executionStopped() end

--- Appelé à l'arrêt : notifie graphes, variables, modules (onClear) et états.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/manager.lua:2120
function flowgraph_manager:_onClear() end

--- Reconstruit le projet depuis des données sérialisées.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/manager.lua:1599
---@param data table données
function flowgraph_manager:_onDeserialized(data) end

--- Sérialise tout le projet (graphes, macros, variables, métadonnées).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/manager.lua:1533
---@return table  données du projet
function flowgraph_manager:_onSerialize() end

--- Itérateur sur tous les nœuds de tous les graphes : for node in mgr:allNodes() do ... end.
---Source : lua/ge/extensions/flowgraph/manager.lua:2265
---@return function  itérateur
---@return table  contexte
function flowgraph_manager:allNodes() end

--- Attache l'éditeur (fgEditor) et met à jour la position des nœuds.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/manager.lua:16
---@param fgEditor table éditeur flowgraph
function flowgraph_manager:attach(fgEditor) end

--- Définit ce décalage au plus grand id de graphe ou de nœud existant (graphes et macros).
---Source : lua/ge/extensions/flowgraph/manager.lua:84
function flowgraph_manager:autoGraphNodeOffset() end

--- Vrai si le projet tourne et qu'un de ses nœuds déclare blocksOnResetGameplay (résultat mis en cache jusqu'au prochain setRunning).
---Source : lua/ge/extensions/flowgraph/manager.lua:2249
---@return boolean  bloque le reset du gameplay
function flowgraph_manager:blocksOnResetGameplay() end

--- Si le projet tourne, appelle la fonction de hook donnée sur le proxy d'extensions puis sur les états (donc sur les nœuds qui l'écoutent).
---Source : lua/ge/extensions/flowgraph/manager.lua:2193
---@param functionName string nom du hook (ex. 'onVehicleResetted')
---@param ... any arguments du hook
function flowgraph_manager:broadcastCall(functionName, ...) end

--- Comme broadcastCall, mais collecte les résultats des nœuds dans une table (passée comme premier argument aux hooks).
---Source : lua/ge/extensions/flowgraph/manager.lua:2202
---@param functionName string nom du hook
---@param ... any arguments
---@return table  résultats
function flowgraph_manager:broadcastCallReturn(functionName, ...) end

--- Journalise une erreur si une section du graphe a plusieurs nœuds racines (couleurs de flux multiples).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/manager.lua:1989
function flowgraph_manager:checkCompileWarnings() end

--- Devait signaler un id déjà utilisé (voir notes : code défectueux).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/manager.lua:28
---@param id integer id à vérifier
---@return boolean|nil  true si doublon
function flowgraph_manager:checkDuplicateId(id) end

--- Vide un graphe (par défaut le courant) : supprime nœuds et liens de l'éditeur puis appelle graph:clear().
---Source : lua/ge/extensions/flowgraph/manager.lua:1504
---@param graph table|nil graphe
function flowgraph_manager:clearGraph(graph) end

--- Transforme un graphe en macro : sa copie sérialisée devient un macro (self.macros) et le graphe d'origine devient une instance de ce macro.
---Source : lua/ge/extensions/flowgraph/manager.lua:356
---@param graph table graphe à convertir
---@return table|nil  macro
function flowgraph_manager:convertToMacro(graph) end

--- Copie un graphe par sérialisation puis désérialisation, en conservant macroID.
---Source : lua/ge/extensions/flowgraph/manager.lua:342
---@param oldGraph table graphe source
---@param newName string|nil nom
---@param hidden boolean|nil ne pas enregistrer
---@return table  copie
function flowgraph_manager:copyGraph(oldGraph, newName, hidden) end

--- Copie les nœuds sélectionnés dans le presse-papier interne (copiedNodes).
---Source : lua/ge/extensions/flowgraph/manager.lua:1193
function flowgraph_manager:copyNodes() end

--- Crée un graphe lié au manager ; s'il n'est pas hidden, il est ajouté à self.graphs.
---Source : lua/ge/extensions/flowgraph/manager.lua:333
---@param name string|nil nom
---@param hidden boolean|nil ne pas enregistrer dans graphs
---@param forceId integer|nil id imposé
---@return table  graphe
function flowgraph_manager:createGraph(name, hidden, forceId) end

--- Crée un graphe et un nœud d'état (states/stateNode) dans le graphe courant qui le cible.
---Source : lua/ge/extensions/flowgraph/manager.lua:257
---@param name string nom
---@param isStateGraph boolean graphe d'états
---@return table  graphe
---@return table  nœud d'état
function flowgraph_manager:createGraphAsState(name, isStateGraph) end

--- Crée un état de groupe (graphe d'états enfant du graphe courant) avec entrée et sortie 'success'.
---Source : lua/ge/extensions/flowgraph/manager.lua:269
---@param name string nom
---@return table  graphe
---@return table  nœud d'état
function flowgraph_manager:createGroupState(name) end

--- Crée un graphe de type 'instance' depuis un macro et le lie éventuellement à un nœud integrated.
---Source : lua/ge/extensions/flowgraph/manager.lua:691
---@param macro table graphe macro
---@param node table|nil nœud integrated
---@param forceId integer|nil id imposé
---@return table  instance
function flowgraph_manager:createInstanceFromMacro(macro, node, forceId) end

--- Crée une instance de macro depuis un fichier (réutilise le macro déjà chargé s'il a le même macroPath).
---Source : lua/ge/extensions/flowgraph/manager.lua:725
---@param path string chemin du macro
---@param node table nœud integrated
---@return table  instance
function flowgraph_manager:createMacroInstanceFromPath(path, node) end

--- Crée un nœud macro/integrated dans le graphe courant, instancié depuis un fichier macro.
---Source : lua/ge/extensions/flowgraph/manager.lua:684
---@param path string chemin du fichier macro
function flowgraph_manager:createNewMacroNode(path) end

--- Crée un état depuis une donnée de bibliothèque (graph, node, minId, name).
---Source : lua/ge/extensions/flowgraph/manager.lua:286
---@param data table données d'état
---@return table  graphe
---@return table  nœud
function flowgraph_manager:createStateFromLibrary(data) end

--- Crée un sous-graphe depuis l'instance de macro sélectionnée (via groupHelper).
---Source : lua/ge/extensions/flowgraph/manager.lua:1849
function flowgraph_manager:createSubgraphFromMacroInstance() end

--- Groupe la sélection en sous-graphe (groupHelper:createGroupingFromSelection).
---Source : lua/ge/extensions/flowgraph/manager.lua:1853
function flowgraph_manager:createSubgraphFromSelection() end

--- Traite chaque frame la création de liens et de nœuds par glisser dans l'éditeur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/manager.lua:891
function flowgraph_manager:creationWorkflow() end

--- Supprime un graphe (graphes ou macros du manager) ; journalise une erreur s'il n'appartient pas au manager.
---Source : lua/ge/extensions/flowgraph/manager.lua:784
---@param graph table graphe
function flowgraph_manager:deleteGraph(graph) end

--- Supprime tous les graphes puis tous les macros.
---Source : lua/ge/extensions/flowgraph/manager.lua:1517
function flowgraph_manager:deleteGraphs() end

--- Supprime les nœuds et liens sélectionnés du graphe courant (si l'édition est autorisée).
---Source : lua/ge/extensions/flowgraph/manager.lua:1404
function flowgraph_manager:deleteSelection() end

--- Supprime la sélection puis ajoute une entrée d'historique 'Deleted Selection'.
---Source : lua/ge/extensions/flowgraph/manager.lua:1396
function flowgraph_manager:deleteSelectionButton() end

--- Traite la suppression par l'éditeur (touche Suppr et sélection).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/manager.lua:1062
function flowgraph_manager:deletionWorkflow() end

--- Arrête le projet s'il tourne, détruit les états et le proxy d'extensions et marque le manager comme détruit.
---Source : lua/ge/extensions/flowgraph/manager.lua:2162
function flowgraph_manager:destroy() end

--- Détache l'éditeur : vide la sélection.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/manager.lua:21
function flowgraph_manager:detached() end

--- Appelé par l'éditeur pour préparer la source d'un glisser-déposer.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/manager.lua:1169
---@param payloadType string type de contenu
---@param data any données
function flowgraph_manager:dragDropSource(payloadType, data) end

--- Appelé par l'éditeur quand un objet est déposé : gère la cible du glisser-déposer.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/manager.lua:1158
---@param payloadType string type de contenu
function flowgraph_manager:dragDropTarget(payloadType) end

--- Dessine le projet dans l'éditeur à chaque frame (ui).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/manager.lua:1423
---@param dtReal number dt réel
---@param dtSim number dt simulation
---@param dtRaw number dt brut
function flowgraph_manager:draw(dtReal, dtSim, dtRaw) end

--- Construit l'ordre de dépendance entre macros sérialisés.
---Source : lua/ge/extensions/flowgraph/manager.lua:1797
---@param serializedMacros table macros sérialisés
function flowgraph_manager:findDependencyMap(serializedMacros) end

--- Trouve le nœud macro/integrated du graphe parent qui représente ce graphe.
---Source : lua/ge/extensions/flowgraph/manager.lua:520
---@param graph table graphe
---@return table|nil  nœud
function flowgraph_manager:findIntegratedNode(graph) end

--- Renvoie l'id du lien dont hiddenId est donné, dans le graphe courant.
---Source : lua/ge/extensions/flowgraph/manager.lua:1134
---@param hiddenId integer hiddenId du lien
---@return integer|nil  id du lien
function flowgraph_manager:findLinkIdFromHiddenLinkId(hiddenId) end

--- Liste récursivement les macroID utilisés par les enfants (voir notes).
---Source : lua/ge/extensions/flowgraph/manager.lua:1787
---@param graph table graphe
---@param list string[] liste à remplir
function flowgraph_manager:findMacrosUsedInChildren(graph, list) end

--- Liste les fichiers macros JSON du dossier /flowgraphEditor/macros/ (par nom, avec le champ path).
---Source : lua/ge/extensions/flowgraph/manager.lua:1429
---@return table<string, table>  macros par nom
function flowgraph_manager:getAvailableMacros() end

--- Renvoie les modèles de nœuds (liste et table de recherche par type) du jeu, plus les nœuds personnalisés du dossier customNodes/ du projet s'il est enregistré.
---Source : lua/ge/extensions/flowgraph/manager.lua:1446
---@return table  liste
---@return table  lookup par nodeType
function flowgraph_manager:getAvailableNodeTemplates() end

--- Renvoie les modèles d'états de core_flowgraphManager.
---Source : lua/ge/extensions/flowgraph/manager.lua:1442
---@return table  modèles
function flowgraph_manager:getAvailableStateTemplates() end

--- Charge les nœuds personnalisés (*Node.lua) depuis savedDir/customNodes/.
---Source : lua/ge/extensions/flowgraph/manager.lua:1465
---@return table  {lookup, res}
function flowgraph_manager:getCustomNodeTemplates() end

--- Renvoie, triées, les extensions requises par les nœuds (hors macros) et les modules. Vide si le projet n'est pas en cours.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/manager.lua:1961
---@return string[]  noms d'extensions
function flowgraph_manager:getDependencies() end

--- Renvoie le premier graphe portant ce nom.
---Source : lua/ge/extensions/flowgraph/manager.lua:2177
---@param name string nom
---@return table|nil  graphe
function flowgraph_manager:getGraphByName(name) end

--- Décalage d'ids utilisé lors de la désérialisation (défaut 0).
---Source : lua/ge/extensions/flowgraph/manager.lua:80
---@return integer  offset
function flowgraph_manager:getGraphNodeOffset() end

--- Renvoie la liste des cibles de hooks (le manager et une table de fonctions regroupant les hooks des modules, exécutés sous xpcall avec log d'erreur). Vide si le projet n'est pas en cours.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/manager.lua:1920
---@return table[]  cibles de hooks
function flowgraph_manager:getHooklist() end

--- Renvoie le prochain id libre pour un graphe ou un nœud (incrémental, vérifie graphes, macros et leurs nœuds).
---Source : lua/ge/extensions/flowgraph/manager.lua:50
---@return integer  id
function flowgraph_manager:getNextFreeGraphNodeId() end

--- Renvoie le prochain id libre pour pins et liens, en descendant depuis 2^29.
---Source : lua/ge/extensions/flowgraph/manager.lua:101
---@return integer  id
function flowgraph_manager:getNextFreePinLinkId() end

--- Renvoie un id unique entre toutes les instances de l'éditeur (délègue à core_flowgraphManager).
---Source : lua/ge/extensions/flowgraph/manager.lua:1529
---@return integer  id
function flowgraph_manager:getNextUniqueIdentifier() end

--- Résout un ou plusieurs chemins relatifs à la racine, aux dossiers de couches de l'activité, à savedDir ou au dossier de mission et renvoie le premier fichier existant (FS:fileExists). Sinon renvoie le premier chemin candidat et false (avec un avertissement sauf si désactivé).
---Source : lua/ge/extensions/flowgraph/manager.lua:2284
---@param p string|string[] chemin(s) relatif(s)
---@param disableLogEntryOnFail boolean|nil pas d'avertissement si introuvable
---@return string|nil  chemin
---@return boolean  trouvé
function flowgraph_manager:getRelativeAbsolutePath(p, disableLogEntryOnFail) end

--- Restaure un état de l'historique par index.
---Source : lua/ge/extensions/flowgraph/manager.lua:1344
---@param index integer index dans history
function flowgraph_manager:goToHistory(index) end

--- Vrai si le projet tourne et qu'un nœud ou un état écoute ce hook.
---Source : lua/ge/extensions/flowgraph/manager.lua:2213
---@param functionName string nom du hook
---@return boolean  écouté
function flowgraph_manager:hasNodeForHook(functionName) end

--- Enregistre un instantané sérialisé du projet dans l'historique (ignoré si l'édition est interdite, c'est-à-dire pendant l'exécution).
---Source : lua/ge/extensions/flowgraph/manager.lua:1374
---@param title string titre de l'entrée
function flowgraph_manager:historySnapshot(title) end

--- Crée un projet vide : graphe 'New State' avec un nœud events/onUpdate, graphe d'états, variableStorage, instances des 16 modules, historique (99 entrées max), proxy d'extensions (newExtensionProxy) enregistré dans core_flowgraphManager.runningProxies, groupHelper, et un premier instantané d'historique.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/manager.lua:126
---@param parent table extension core_flowgraphManager
function flowgraph_manager:init(parent) end

--- Ajoute un évènement au journal du projet (nom, type 'I'/'W'/'E', description, frame, heure) et compte les doublons par nom. Utile aux nœuds et modules pour tracer l'exécution.
---Source : lua/ge/extensions/flowgraph/manager.lua:1898
---@param name string nom de l'évènement
---@param type string|nil 'I', 'W' ou 'E'
---@param description string|nil détails
---@param meta table|nil ex. {type = 'node', node = node}
function flowgraph_manager:logEvent(name, type, description, meta) end

--- Hook de fin de mission : arrête immédiatement le projet si stopRunningOnClientEndMission est vrai.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/manager.lua:2277
function flowgraph_manager:onClientEndMission() end

--- Pendant un glisser-déposer.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/manager.lua:1147
function flowgraph_manager:onDrag() end

--- Fin d'un glisser-déposer.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/manager.lua:1153
function flowgraph_manager:onDragEnded() end

--- Début d'un glisser-déposer (dragging = true).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/manager.lua:1143
function flowgraph_manager:onDragStarted() end

--- Appelé à chaque frame : compte les frames, mémorise dtReal/dtSim/dtRaw, gère le mode pas-à-pas (steps) puis appelle onUpdate de chaque module.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/manager.lua:1882
---@param dtReal number dt réel (s)
---@param dtSim number dt simulation (s)
---@param dtRaw number dt brut (s)
function flowgraph_manager:onUpdate(dtReal, dtSim, dtRaw) end

--- Colle les nœuds copiés dans le graphe courant.
---Source : lua/ge/extensions/flowgraph/manager.lua:1238
function flowgraph_manager:pasteNodes() end

--- Demande un redémarrage du projet en fin de frame.
---Source : lua/ge/extensions/flowgraph/manager.lua:2102
function flowgraph_manager:queueForRestart() end

--- Passe à l'entrée suivante de l'historique.
---Source : lua/ge/extensions/flowgraph/manager.lua:1364
function flowgraph_manager:redo() end

--- Reconstruit les pins d'un nœud macro/integrated d'après son graphe cible en conservant liens et valeurs codées en dur.
---Source : lua/ge/extensions/flowgraph/manager.lua:395
---@param node table nœud integrated
function flowgraph_manager:refreshIntegratedPins(node) end

--- Appelé en fin de frame par core_flowgraphManager : exécute les arrêts (queueReset) et redémarrages (queueRestart) différés.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/manager.lua:1858
function flowgraph_manager:resolveHooksAndReset() end

--- Applique les changements de variables en attente du manager et de tous les graphes.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/manager.lua:2186
function flowgraph_manager:resolveVariableChanges() end

--- Écrit un macro (racine) dans un fichier JSON avec ses tags et met à jour macroPath des instances.
---Source : lua/ge/extensions/flowgraph/manager.lua:608
---@param macro table graphe macro
---@param savedata table champ filepath
function flowgraph_manager:saveMacro(macro, savedata) end

--- Rend un graphe courant (affiche son onglet, mémorise l'instance récente, ouvre le macro si arrêté) et vide la sélection.
---Source : lua/ge/extensions/flowgraph/manager.lua:303
---@param graph table graphe
function flowgraph_manager:selectGraph(graph) end

--- Met le projet en pause ou le reprend (sans effet si arrêté).
---Source : lua/ge/extensions/flowgraph/manager.lua:2094
---@param paused boolean pause
function flowgraph_manager:setPaused(paused) end

--- Démarre ou arrête le projet. Au démarrage : planifie les graphes racines, construit et démarre les états, notifie nœuds et modules (_executionStarted) et diffuse 'onExecutionStarted'. À l'arrêt : diffuse 'onRemoveNextFrame' et programme l'arrêt en fin de frame, ou l'immédiat si stopInstant.
---Source : lua/ge/extensions/flowgraph/manager.lua:2027
---@param running boolean démarrer (true) ou arrêter (false)
---@param stopInstant boolean|nil arrêter et détruire tout de suite
function flowgraph_manager:setRunning(running, stopInstant) end

--- Prépare la création de nœud ou de lien depuis l'éditeur (ui_flowgraph_editor).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/manager.lua:837
function flowgraph_manager:setupCreationWorkflow() end

--- Crée le graphe d'états 'States' avec nœuds stateEntry et stateExit, et (sauf si empty) un stateNode vers le graphe principal.
---Source : lua/ge/extensions/flowgraph/manager.lua:233
---@param empty boolean|nil ne pas créer de stateNode
---@return table  graphe d'états
---@return table  nœud d'entrée
---@return table  nœud de sortie
function flowgraph_manager:setupStateGraph(empty) end

--- Revient à l'entrée précédente de l'historique.
---Source : lua/ge/extensions/flowgraph/manager.lua:1354
function flowgraph_manager:undo() end

--- Vide la sélection de nœuds et de liens.
---Source : lua/ge/extensions/flowgraph/manager.lua:1088
function flowgraph_manager:unselectAll() end

--- Met à jour la position éditeur de tous les nœuds des graphes et macros.
---Source : lua/ge/extensions/flowgraph/manager.lua:1759
---@param force boolean|nil inutilisé
function flowgraph_manager:updateEditorPosition(force) end

--- Met à jour les tables de nœuds et de liens sélectionnés à partir de la sélection côté C++.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/manager.lua:1100
function flowgraph_manager:updateEditorSelections() end

--- Met à jour toutes les instances d'un macro modifié à partir de sa version sérialisée.
---Source : lua/ge/extensions/flowgraph/manager.lua:551
---@param macro table|nil macro modifié
function flowgraph_manager:updateInstances(macro) end

--- Relit la position éditeur de tous les nœuds des graphes.
---Source : lua/ge/extensions/flowgraph/manager.lua:1776
function flowgraph_manager:updateNodePositions() end

--- Remplace récursivement les graphes cibles des nœuds integrated par des copies de type 'instance'.
---Source : lua/ge/extensions/flowgraph/manager.lua:537
---@param graph table graphe
function flowgraph_manager:updateSubgraphs(graph) end

