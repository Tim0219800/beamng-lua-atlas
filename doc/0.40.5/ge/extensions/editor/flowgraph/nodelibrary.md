# `editor_flowgraph_nodelibrary`

*Fichier : `lua/ge/extensions/editor/flowgraph/nodelibrary.lua` · VM : Game Engine (GE) · 1411 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/editor/flowgraph/nodelibrary")` (fichier sous extensions/ mais pas une extension classique)

Bibliothèque de nœuds (« Node library », fg_nodelib) de l'éditeur Flowgraph, également utilisée comme contenu du menu contextuel « CreateNodeContentMenu » (clic droit dans le graphe, glisser un lien dans le vide). Elle liste les nœuds disponibles (core_flowgraphManager.getAvailableNodeTemplates), les macros, les modèles d'états (state templates) et les variables (Get/Set pour le projet et le graphe), avec recherche floue (searchUtil + frecency partagée dans la préférence flowgraph.general.nodeFrecency), filtre par pin quand on tire un lien (newNodeLinkPin), navigation clavier et glisser-déposer. Contient aussi un exporteur CSV de la liste des nœuds.

## Remarques

- Deux modes d'affichage : fenêtre statique (setStatic, drawContentAsTreeNodes/draw) et menu contextuel (drawContent avec usedForContextMenu).
- Le score d'un nœud est le meilleur entre le nom et ses tags (tags pondérés par 0.75) ; le tri met la frecency avant le score.
- Les nœuds 'hidden' sont toujours exclus ; les nœuds 'obsolete' seulement si la préférence flowgraph.general.showObsoleteNodes est fausse.
- Bugs probables : findFlowNodes et findVar passent une variable globale `score` (nil) ; stateNodeScoringFunction utilise `info` et `self` qui n'existent pas dans cette fonction locale (erreur si un état a un splitPath non vide) ; la fonction checkEmpty écrase dir.isEmpty = true avant le test des sous-dossiers ; getFilterType parcourt la table typeOrder qui est vide (aucun préfixe reconnu) ; hasFoldersOnly ne teste que la première entrée.
- printNodesWithTags écrit nodeLib.csv et pinLib.csv (relatifs au dossier utilisateur) : outil de documentation pour les développeurs.

## Classe `C`

Classe de la fenêtre (windowName 'fg_nodelib', windowDescription 'Node library', arrowControllable = true). Une instance statique est créée par flowgraphEditor (M.nodelib) et sert aussi au menu contextuel.

| Méthode | Description | Ligne |
|---|---|---|
| `C._sortFunc(a, b)` | Comparateur de tri par nom, insensible à la casse. | 796 |
| `C:arrowHelper(cursor, itemSize, doHover, hoverFun)` | Compte les éléments de la liste et dessine le cadre de sélection/survol avec défilement automatique. | 1271 |
| `C:checkEmpty(dir, mode)` | Marque récursivement dir.isEmpty selon qu'un dossier contient des éléments. | 837 |
| `C:clear()` | Vide le champ de recherche, refiltre nœuds et macros et remet sélection, focus et défilement à zéro. | 34 |
| `C:createNode()` | Demande la création du nœud sélectionné (Entrée) ou redonne le focus au champ de recherche s'il n'y a aucun bouton. | 127 |
| `C:createNodeFromButon(menuPos, node)` | Crée un nœud depuis un modèle à la position donnée, le relie au pin en cours et ajoute une entrée d'historique. (Le nom de la fonction contient la faute « Buton ».) | 1214 |
| `C:createStateButton(menuPos, state)` | Crée un état depuis un modèle et le relie. | 1177 |
| `C:createVariableButton(var, menuPos, read, fromMgr)` | Crée le nœud getter/setter correspondant à la variable (et le relie au pin en cours). | 981 |
| `C:displayDir(dir, menuPos, elementFieldName, elementFunction)` | Affiche un dossier en TreeNodes (sous-dossiers puis éléments). | 1054 |
| `C:displayMacro(macroName, macro, menuPos)` | Affiche une macro avec aperçu au survol et création d'une instance au clic. | 1008 |
| `C:displayNode(dir, menuPos, nodeName, node)` | Affiche un modèle de nœud (bouton, tooltip, aperçu, glisser-déposer). | 1194 |
| `C:displayResults(menuPos)` | Affiche les résultats triés (frecency puis score) : nœuds, variables, états, macros. | 637 |
| `C:displaySimpleElement(menuPos, text, clickFun, ...)` | Affiche un bouton simple avec un texte et une fonction de clic. | 1086 |
| `C:displayStateExitButton(menuPos, label)` | Affiche le bouton de création d'un nœud « State Exit » (avec nom de transition). | 1114 |
| `C:displayStateTemplate(dir, menuPos, stateName, state)` | Affiche un modèle d'état dans l'arborescence. | 1157 |
| `C:displayVariable(var, menuPos, read, fromMgr)` | Affiche une variable (Get/Set) comme bouton de création de nœud avec support du glisser-déposer. | 934 |
| `C:draw()` | Dessine la fenêtre « Node Library » si visible (pas le menu contextuel). | 704 |
| `C:drawContent(menuPos, usedForContextMenu)` | Dessine le contenu complet (filtre, résultats de recherche ou arborescence) pour la fenêtre ou le menu contextuel. | 563 |
| `C:drawContentAsTreeNodes(menuPos)` | Fenêtre qui montre tous les nœuds disponibles en arborescence, avec glisser-déposer. | 185 |
| `C:drawTextFilter(usedForContextMenu)` | Dessine le champ « Search: », le bouton d'effacement et, dans le menu contextuel, le bouton Coller. | 66 |
| `C:filterMacroTemplates(filterPins)` | Recalcule filteredMacro à partir de mgr:getAvailableMacros(). | 901 |
| `C:filterMacros(dir, filterPins)` | Renvoie les macros (les filtres de nom/tag sont désactivés : tout passe). | 869 |
| `C:filterNodes(dir, filterPins, mode)` | Filtre récursivement un dossier de modèles (exclut les nœuds cachés ; applique le filtre de pins en mode 'nodes'). | 798 |
| `C:filterTemplates(filterPins, mode)` | Recalcule filteredTemplates/filteredFolders pour le mode demandé (si le mode a changé) puis marque les dossiers vides. | 907 |
| `C:findFlowNodes()` | Soumet à la recherche tous les nœuds visibles qui passent le filtre de pins, puis les variables du projet et du graphe. | 435 |
| `C:findStateNodes()` | Soumet à la recherche les modèles d'états, « New State », « New Group State », « State Exit » (par transition) et le nœud « Comment ». | 495 |
| `C:findVar(source, sourceName, sourceNameTag)` | Soumet à la recherche les entrées « Get x » / « Set x » de chaque variable d'une source. | 456 |
| `C:getFilterType()` | Extrait un préfixe de type du texte de recherche (table typeOrder vide : renvoie en pratique nil et le texte). | 404 |
| `C:hasFoldersOnly(dir)` | Indique si un dossier ne contient (au premier élément examiné) que des sous-dossiers. | 46 |
| `C:highlightText(label, highlightText)` | Écrit un libellé en surlignant les occurrences du texte cherché. | 610 |
| `C:init()` | Initialise recherche, focus, indices de liste, enregistre la fenêtre (visible par défaut) et charge la frecency partagée. | 16 |
| `C:linkState(node)` | Relie un nouvel état au pin de lien en cours (flow d'entrée si le pin est une sortie, sinon première sortie vers ce pin). | 1139 |
| `C:navigateList(up)` | Déplace la sélection clavier (haut/bas) dans la liste. | 135 |
| `C:pinsFilter(node)` | Indique si un modèle de nœud possède un pin compatible avec newNodeLinkPin (et n'est pas le nœud source). | 720 |
| `C:printDir(dir, name, tagIndex, libtxt)` | Ajoute à libtxt une ligne par nœud d'un dossier (récursif) pour l'export CSV. | 1337 |
| `C:printNodesWithTags()` | Exporte nodeLib.csv (Name, File, Path, Pin Schema, Todo, Description) et pinLib.csv (Pin, Count, Node, Desc). Outil développeur. | 1308 |
| `C:ratePinSimilarity(a, b)` | Calcule a.__matchScore pour l'auto-connexion : +1000 nom identique, +300 type identique, +100 nom inclus, -1150 si l'un s'appelle 'reset'. Ne renvoie rien. Utilisée par uiAutoConnectShortcut. | 1035 |
| `C:recursiveGetTags(dir, list, pins)` | Collecte récursivement les tags et pins de tous les nœuds pour l'export. | 1386 |
| `C:refreshMacro()` | Recharge la liste des macros si mgr.newMacroAdded est vrai. | 882 |
| `C:refreshStateTemplates()` | Recharge et trie par nom la liste des modèles d'états. | 889 |
| `C:setNewNodeLinkPin(newNodeLinkPin)` | Définit le pin dont on tire un lien : la liste est alors filtrée sur les nœuds/variables compatibles. | 62 |
| `C:setStatic()` | Marque l'instance comme statique (fenêtre/menu permanent). | 57 |
| `C:variablePinFilter(var, dir)` | Indique si une variable est compatible avec le pin de lien en cours (type identique, 'any', ou flow pour sortie). | 386 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/flowgraph/nodelibrary.lua`.*
