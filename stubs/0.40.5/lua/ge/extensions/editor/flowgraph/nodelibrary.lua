---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/flowgraph/nodelibrary.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe de la fenêtre (windowName 'fg_nodelib', windowDescription 'Node library', arrowControllable = true). Une instance statique est créée par flowgraphEditor (M.nodelib) et sert aussi au menu contextuel.
---@class editor_flowgraph_nodelibrary_C
local editor_flowgraph_nodelibrary_C = {}

--- Comparateur de tri par nom, insensible à la casse.
---Source : lua/ge/extensions/editor/flowgraph/nodelibrary.lua:796
---@param a table Élément avec champ name.
---@param b table Élément avec champ name.
---@return boolean  a avant b.
function editor_flowgraph_nodelibrary_C._sortFunc(a, b) end

--- Compte les éléments de la liste et dessine le cadre de sélection/survol avec défilement automatique.
---Source : lua/ge/extensions/editor/flowgraph/nodelibrary.lua:1271
---@param cursor ImVec2 Position avant l'élément.
---@param itemSize ImVec2 Taille.
---@param doHover boolean Gérer le survol.
---@param hoverFun function|nil Callback au survol.
function editor_flowgraph_nodelibrary_C:arrowHelper(cursor, itemSize, doHover, hoverFun) end

--- Marque récursivement dir.isEmpty selon qu'un dossier contient des éléments.
---Source : lua/ge/extensions/editor/flowgraph/nodelibrary.lua:837
---@param dir table Dossier.
---@param mode string 'nodes' ou 'states'.
function editor_flowgraph_nodelibrary_C:checkEmpty(dir, mode) end

--- Vide le champ de recherche, refiltre nœuds et macros et remet sélection, focus et défilement à zéro.
---Source : lua/ge/extensions/editor/flowgraph/nodelibrary.lua:34
function editor_flowgraph_nodelibrary_C:clear() end

--- Demande la création du nœud sélectionné (Entrée) ou redonne le focus au champ de recherche s'il n'y a aucun bouton.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/flowgraph/nodelibrary.lua:127
function editor_flowgraph_nodelibrary_C:createNode() end

--- Crée un nœud depuis un modèle à la position donnée, le relie au pin en cours et ajoute une entrée d'historique. (Le nom de la fonction contient la faute « Buton ».)
---Source : lua/ge/extensions/editor/flowgraph/nodelibrary.lua:1214
---@param menuPos ImVec2|nil Position.
---@param node table Modèle de nœud.
---@return table  Nœud créé (déduit de l'usage dans createStateExitNode).
function editor_flowgraph_nodelibrary_C:createNodeFromButon(menuPos, node) end

--- Crée un état depuis un modèle et le relie.
---Source : lua/ge/extensions/editor/flowgraph/nodelibrary.lua:1177
---@param menuPos ImVec2|nil Position.
---@param state table Modèle d'état.
function editor_flowgraph_nodelibrary_C:createStateButton(menuPos, state) end

--- Crée le nœud getter/setter correspondant à la variable (et le relie au pin en cours).
---Source : lua/ge/extensions/editor/flowgraph/nodelibrary.lua:981
---@param var table Variable.
---@param menuPos ImVec2|nil Position.
---@param read boolean Getter ou setter.
---@param fromMgr boolean Variable de projet ?
function editor_flowgraph_nodelibrary_C:createVariableButton(var, menuPos, read, fromMgr) end

--- Affiche un dossier en TreeNodes (sous-dossiers puis éléments).
---Source : lua/ge/extensions/editor/flowgraph/nodelibrary.lua:1054
---@param dir table Dossier.
---@param menuPos ImVec2|nil Position.
---@param elementFieldName string Champ contenant les éléments.
---@param elementFunction function Fonction d'affichage d'un élément.
function editor_flowgraph_nodelibrary_C:displayDir(dir, menuPos, elementFieldName, elementFunction) end

--- Affiche une macro avec aperçu au survol et création d'une instance au clic.
---Source : lua/ge/extensions/editor/flowgraph/nodelibrary.lua:1008
---@param macroName string Nom.
---@param macro table Macro.
---@param menuPos ImVec2|nil Position.
function editor_flowgraph_nodelibrary_C:displayMacro(macroName, macro, menuPos) end

--- Affiche un modèle de nœud (bouton, tooltip, aperçu, glisser-déposer).
---Source : lua/ge/extensions/editor/flowgraph/nodelibrary.lua:1194
---@param dir table Dossier.
---@param menuPos ImVec2|nil Position.
---@param nodeName string Nom.
---@param node table Modèle.
function editor_flowgraph_nodelibrary_C:displayNode(dir, menuPos, nodeName, node) end

--- Affiche les résultats triés (frecency puis score) : nœuds, variables, états, macros.
---Source : lua/ge/extensions/editor/flowgraph/nodelibrary.lua:637
---@param menuPos ImVec2|nil Position de création.
function editor_flowgraph_nodelibrary_C:displayResults(menuPos) end

--- Affiche un bouton simple avec un texte et une fonction de clic.
---Source : lua/ge/extensions/editor/flowgraph/nodelibrary.lua:1086
---@param menuPos ImVec2|nil Position.
---@param text string Libellé.
---@param clickFun function Callback au clic.
---@param ... any Arguments supplémentaires (déduit du code).
function editor_flowgraph_nodelibrary_C:displaySimpleElement(menuPos, text, clickFun, ...) end

--- Affiche le bouton de création d'un nœud « State Exit » (avec nom de transition).
---Source : lua/ge/extensions/editor/flowgraph/nodelibrary.lua:1114
---@param menuPos ImVec2|nil Position.
---@param label string|nil Nom de la transition.
function editor_flowgraph_nodelibrary_C:displayStateExitButton(menuPos, label) end

--- Affiche un modèle d'état dans l'arborescence.
---Source : lua/ge/extensions/editor/flowgraph/nodelibrary.lua:1157
---@param dir table Dossier.
---@param menuPos ImVec2|nil Position.
---@param stateName string Nom.
---@param state table Modèle.
function editor_flowgraph_nodelibrary_C:displayStateTemplate(dir, menuPos, stateName, state) end

--- Affiche une variable (Get/Set) comme bouton de création de nœud avec support du glisser-déposer.
---Source : lua/ge/extensions/editor/flowgraph/nodelibrary.lua:934
---@param var table Variable.
---@param menuPos ImVec2|nil Position de création.
---@param read boolean true pour un getter.
---@param fromMgr boolean true si variable de projet.
function editor_flowgraph_nodelibrary_C:displayVariable(var, menuPos, read, fromMgr) end

--- Dessine la fenêtre « Node Library » si visible (pas le menu contextuel).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/flowgraph/nodelibrary.lua:704
function editor_flowgraph_nodelibrary_C:draw() end

--- Dessine le contenu complet (filtre, résultats de recherche ou arborescence) pour la fenêtre ou le menu contextuel.
---Source : lua/ge/extensions/editor/flowgraph/nodelibrary.lua:563
---@param menuPos ImVec2|nil Position de création.
---@param usedForContextMenu boolean|nil true dans le menu contextuel.
function editor_flowgraph_nodelibrary_C:drawContent(menuPos, usedForContextMenu) end

--- Fenêtre qui montre tous les nœuds disponibles en arborescence, avec glisser-déposer.
---Source : lua/ge/extensions/editor/flowgraph/nodelibrary.lua:185
---@param menuPos ImVec2|nil Position de création des nœuds.
function editor_flowgraph_nodelibrary_C:drawContentAsTreeNodes(menuPos) end

--- Dessine le champ « Search: », le bouton d'effacement et, dans le menu contextuel, le bouton Coller.
---Source : lua/ge/extensions/editor/flowgraph/nodelibrary.lua:66
---@param usedForContextMenu boolean true dans le menu contextuel.
function editor_flowgraph_nodelibrary_C:drawTextFilter(usedForContextMenu) end

--- Recalcule filteredMacro à partir de mgr:getAvailableMacros().
---Source : lua/ge/extensions/editor/flowgraph/nodelibrary.lua:901
---@param filterPins boolean Filtre de pins.
function editor_flowgraph_nodelibrary_C:filterMacroTemplates(filterPins) end

--- Renvoie les macros (les filtres de nom/tag sont désactivés : tout passe).
---Source : lua/ge/extensions/editor/flowgraph/nodelibrary.lua:869
---@param dir table Macros disponibles.
---@param filterPins boolean Non utilisé.
---@return table|nil  Macros retenues.
function editor_flowgraph_nodelibrary_C:filterMacros(dir, filterPins) end

--- Filtre récursivement un dossier de modèles (exclut les nœuds cachés ; applique le filtre de pins en mode 'nodes').
---Source : lua/ge/extensions/editor/flowgraph/nodelibrary.lua:798
---@param dir table Dossier.
---@param filterPins boolean Appliquer le filtre de pins.
---@param mode string 'nodes' ou 'states'.
---@return table|nil  Arbre filtré.
function editor_flowgraph_nodelibrary_C:filterNodes(dir, filterPins, mode) end

--- Recalcule filteredTemplates/filteredFolders pour le mode demandé (si le mode a changé) puis marque les dossiers vides.
---Source : lua/ge/extensions/editor/flowgraph/nodelibrary.lua:907
---@param filterPins boolean Filtre de pins.
---@param mode string 'nodes' ou 'states'.
function editor_flowgraph_nodelibrary_C:filterTemplates(filterPins, mode) end

--- Soumet à la recherche tous les nœuds visibles qui passent le filtre de pins, puis les variables du projet et du graphe.
---Source : lua/ge/extensions/editor/flowgraph/nodelibrary.lua:435
function editor_flowgraph_nodelibrary_C:findFlowNodes() end

--- Soumet à la recherche les modèles d'états, « New State », « New Group State », « State Exit » (par transition) et le nœud « Comment ».
---Source : lua/ge/extensions/editor/flowgraph/nodelibrary.lua:495
function editor_flowgraph_nodelibrary_C:findStateNodes() end

--- Soumet à la recherche les entrées « Get x » / « Set x » de chaque variable d'une source.
---Source : lua/ge/extensions/editor/flowgraph/nodelibrary.lua:456
---@param source table Conteneur de variables.
---@param sourceName string Libellé ('Project Variable', 'Graph Variable').
---@param sourceNameTag string 'mgr' ou 'graph'.
function editor_flowgraph_nodelibrary_C:findVar(source, sourceName, sourceNameTag) end

--- Extrait un préfixe de type du texte de recherche (table typeOrder vide : renvoie en pratique nil et le texte).
---Source : lua/ge/extensions/editor/flowgraph/nodelibrary.lua:404
---@return string|nil  Type.
---@return string  Texte.
function editor_flowgraph_nodelibrary_C:getFilterType() end

--- Indique si un dossier ne contient (au premier élément examiné) que des sous-dossiers.
---Source : lua/ge/extensions/editor/flowgraph/nodelibrary.lua:46
---@param dir table Dossier de modèles.
---@return boolean  Résultat du test.
function editor_flowgraph_nodelibrary_C:hasFoldersOnly(dir) end

--- Écrit un libellé en surlignant les occurrences du texte cherché.
---Source : lua/ge/extensions/editor/flowgraph/nodelibrary.lua:610
---@param label string Texte.
---@param highlightText string Texte à surligner.
function editor_flowgraph_nodelibrary_C:highlightText(label, highlightText) end

--- Initialise recherche, focus, indices de liste, enregistre la fenêtre (visible par défaut) et charge la frecency partagée.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/flowgraph/nodelibrary.lua:16
function editor_flowgraph_nodelibrary_C:init() end

--- Relie un nouvel état au pin de lien en cours (flow d'entrée si le pin est une sortie, sinon première sortie vers ce pin).
---Source : lua/ge/extensions/editor/flowgraph/nodelibrary.lua:1139
---@param node table Nœud d'état créé.
function editor_flowgraph_nodelibrary_C:linkState(node) end

--- Déplace la sélection clavier (haut/bas) dans la liste.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/flowgraph/nodelibrary.lua:135
---@param up boolean true pour monter.
function editor_flowgraph_nodelibrary_C:navigateList(up) end

--- Indique si un modèle de nœud possède un pin compatible avec newNodeLinkPin (et n'est pas le nœud source).
---Source : lua/ge/extensions/editor/flowgraph/nodelibrary.lua:720
---@param node table Modèle de nœud.
---@return boolean  true s'il passe le filtre.
function editor_flowgraph_nodelibrary_C:pinsFilter(node) end

--- Ajoute à libtxt une ligne par nœud d'un dossier (récursif) pour l'export CSV.
---Source : lua/ge/extensions/editor/flowgraph/nodelibrary.lua:1337
---@param dir table Dossier.
---@param name string Nom du dossier.
---@param tagIndex table Index des tags.
---@param libtxt string[] Lignes de sortie.
function editor_flowgraph_nodelibrary_C:printDir(dir, name, tagIndex, libtxt) end

--- Exporte nodeLib.csv (Name, File, Path, Pin Schema, Todo, Description) et pinLib.csv (Pin, Count, Node, Desc). Outil développeur.
---Source : lua/ge/extensions/editor/flowgraph/nodelibrary.lua:1308
function editor_flowgraph_nodelibrary_C:printNodesWithTags() end

--- Calcule a.__matchScore pour l'auto-connexion : +1000 nom identique, +300 type identique, +100 nom inclus, -1150 si l'un s'appelle 'reset'. Ne renvoie rien. Utilisée par uiAutoConnectShortcut.
---Source : lua/ge/extensions/editor/flowgraph/nodelibrary.lua:1035
---@param a table Pin source (reçoit __matchScore).
---@param b table Pin cible.
function editor_flowgraph_nodelibrary_C:ratePinSimilarity(a, b) end

--- Collecte récursivement les tags et pins de tous les nœuds pour l'export.
---Source : lua/ge/extensions/editor/flowgraph/nodelibrary.lua:1386
---@param dir table Dossier.
---@param list table Table des tags.
---@param pins table Table {names, pins} des pins.
function editor_flowgraph_nodelibrary_C:recursiveGetTags(dir, list, pins) end

--- Recharge la liste des macros si mgr.newMacroAdded est vrai.
---Source : lua/ge/extensions/editor/flowgraph/nodelibrary.lua:882
function editor_flowgraph_nodelibrary_C:refreshMacro() end

--- Recharge et trie par nom la liste des modèles d'états.
---Source : lua/ge/extensions/editor/flowgraph/nodelibrary.lua:889
function editor_flowgraph_nodelibrary_C:refreshStateTemplates() end

--- Définit le pin dont on tire un lien : la liste est alors filtrée sur les nœuds/variables compatibles.
---Source : lua/ge/extensions/editor/flowgraph/nodelibrary.lua:62
---@param newNodeLinkPin table|nil Pin source du lien en cours de création.
function editor_flowgraph_nodelibrary_C:setNewNodeLinkPin(newNodeLinkPin) end

--- Marque l'instance comme statique (fenêtre/menu permanent).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/flowgraph/nodelibrary.lua:57
function editor_flowgraph_nodelibrary_C:setStatic() end

--- Indique si une variable est compatible avec le pin de lien en cours (type identique, 'any', ou flow pour sortie).
---Source : lua/ge/extensions/editor/flowgraph/nodelibrary.lua:386
---@param var table Variable (champ type).
---@param dir string|nil 'in' ou 'out'.
---@return boolean|nil  true si compatible.
function editor_flowgraph_nodelibrary_C:variablePinFilter(var, dir) end

