---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/sceneTree.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Fenêtre « Scene Tree » de l'éditeur de niveaux : affiche la hiérarchie des objets de la scène (MissionGroup, SimGroups, objets) sous forme d'arbre ImGui avec défilement virtuel, recherche (par nom, ID, ID persistant, classe ou tout), sélection multiple, glisser-déposer, renommage, tri, suppression, création d'objets et menus contextuels. Il met en cache l'arbre côté Lua (nœuds) et le synchronise avec le moteur via les transactions de SimSet. Il installe aussi des fonctions dans la table editor (voir classe « editor »). Un moddeur s'en sert surtout pour ajouter des entrées au menu contextuel et rafraîchir l'arbre après avoir créé/supprimé des objets par script.
--- Accès : extension `editor_sceneTree` : `extensions.load("editor_sceneTree")`, puis la globale `editor_sceneTree`
---@class editor_sceneTree
editor_sceneTree = {}

--- Ferme et désenregistre toutes les fenêtres Scene Tree.
---Source : lua/ge/extensions/editor/sceneTree.lua:2608
function editor_sceneTree.closeAllInstances() end

--- Journalise (log niveau I) le nœud de cache correspondant à l'objet donné, dans chaque instance qui le contient.
---Source : lua/ge/extensions/editor/sceneTree.lua:2616
---@param id integer Id de l'objet.
---@param level integer|nil Profondeur passée à dumpsz.
function editor_sceneTree.debugNode(id, level) end

--- Déplace la sélection d'une ligne dans l'instance qui a le focus (utilisé par les flèches de l'action map « SceneTree »).
---Source : lua/ge/extensions/editor/sceneTree.lua:1009
---@param up boolean true pour monter, false pour descendre.
function editor_sceneTree.moveSelectionIndex(up) end

--- Appelé à l'activation de l'éditeur : resynchronise la sélection de l'arbre.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/sceneTree.lua:2455
function editor_sceneTree.onEditorActivated() end

--- Appelé après l'ouverture d'un niveau dans l'éditeur : lève le focus lock, reconstruit le cache, vide la sélection et le filtre.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/sceneTree.lua:2459
function editor_sceneTree.onEditorAfterOpenLevel() end

--- Appelé avant la sauvegarde du niveau : remplit editor.orderTable avec les ids de tous les objets sous MissionGroup (parcours en profondeur).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/sceneTree.lua:2552
function editor_sceneTree.onEditorBeforeSaveLevel() end

--- Appelé à la désactivation de l'éditeur : lève le focus lock s'il est actif.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/sceneTree.lua:2470
function editor_sceneTree.onEditorDeactivated() end

--- Appelé quand le focus lock change : ré-enracine toutes les instances sur le groupe verrouillé (ou la racine) en gardant l'état ouvert, et force la racine ouverte.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/sceneTree.lua:2628
function editor_sceneTree.onEditorFocusLockChanged() end

--- Appelé à chaque image : dessine chaque instance de fenêtre Scene Tree (arbre virtualisé, barre de recherche, menus, glisser-déposer).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/sceneTree.lua:2167
function editor_sceneTree.onEditorGui() end

--- Appelé à l'initialisation de l'éditeur : récupère les icônes de classes (worldEditorCppApi.getObjectClassIcons), met en cache l'arbre, installe les fonctions editor.* (removeObjectFromSet, submitTransactions, getSelectedSceneTreeNodes, getSceneTreeSelectedGroup, refreshSceneTreeWindow, hideAll/showAllSceneTreeInstances) et ajoute l'entrée de menu « Scene Tree ».
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/sceneTree.lua:2474
function editor_sceneTree.onEditorInitialized() end

--- Appelé quand un champ est modifié dans l'inspecteur : rafraîchit les noms des nœuds et, pour les objets contenus dans une instance de prefab, met à jour le décalage de transformation de l'enfant.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/sceneTree.lua:2590
---@param selectedIds integer[] Ids des objets modifiés.
function editor_sceneTree.onEditorInspectorFieldChanged(selectedIds) end

--- Restaure les instances de fenêtre Scene Tree depuis l'état sauvegardé de la disposition de l'éditeur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/sceneTree.lua:2430
---@param state table État global du guiInstancer.
function editor_sceneTree.onEditorLoadGuiInstancerState(state) end

--- Appelé quand un objet est ajouté dans l'éditeur : reconstruit le cache (en gardant les groupes ouverts) et rafraîchit le cache de nœuds.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/sceneTree.lua:2561
function editor_sceneTree.onEditorObjectAdded() end

--- Appelé quand la sélection d'objets de l'éditeur change : met à jour les nœuds sélectionnés de chaque instance.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/sceneTree.lua:821
function editor_sceneTree.onEditorObjectSelectionChanged() end

--- Sauvegarde les instances de fenêtre (sans sélection, cache ni filtre) dans l'état de disposition de l'éditeur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/sceneTree.lua:2441
---@param state table État global à remplir.
function editor_sceneTree.onEditorSaveGuiInstancerState(state) end

--- Appelé quand une fenêtre d'outil prend le focus : si c'est un Scene Tree, marque l'instance comme focalisée et pousse l'action map « SceneTree ».
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/sceneTree.lua:2512
---@param windowName string Nom de la fenêtre.
function editor_sceneTree.onEditorToolWindowGotFocus(windowName) end

--- Appelé quand une fenêtre d'outil perd le focus : retire le focus de l'instance et dépile l'action map « SceneTree » quand plus aucune instance n'est focalisée.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/sceneTree.lua:2522
---@param windowName string Nom de la fenêtre.
function editor_sceneTree.onEditorToolWindowLostFocus(windowName) end

--- Appelé au chargement de l'extension : prépare la liste des modes de recherche et installe editor.addExtendedSceneTreeObjectMenuItem.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/sceneTree.lua:2409
function editor_sceneTree.onExtensionLoaded() end

--- Ouvre une fenêtre Scene Tree si aucune n'existe encore (une seule instance autorisée).
---Source : lua/ge/extensions/editor/sceneTree.lua:2161
function editor_sceneTree.openSceneTree() end

--- Reconstruit entièrement le cache de nœuds de toutes les instances depuis la scène Sim. Avec keepOpenStatus, l'état ouvert/fermé des groupes est conservé.
---Source : lua/ge/extensions/editor/sceneTree.lua:732
---@param keepOpenStatus boolean|nil true pour garder les groupes ouverts dans leur état actuel.
function editor_sceneTree.recacheAllNodes(keepOpenStatus) end

--- Met à jour le cache des groupes de chaque instance (à partir de sa racine) puis invalide le cache de taille ; version plus légère que recacheAllNodes.
---Source : lua/ge/extensions/editor/sceneTree.lua:1030
---@param incomingObjectIds table|nil Ids des objets entrants à intégrer (déduit du code).
function editor_sceneTree.refreshAllNodes(incomingObjectIds) end

--- Recalcule le nom et le nom affiché des nœuds dont l'id est dans la liste. Ne fait rien si objectIds est nil.
---Source : lua/ge/extensions/editor/sceneTree.lua:2569
---@param objectIds integer[]|nil Ids d'objets renommés.
function editor_sceneTree.refreshNodeNames(objectIds) end

--- Fonctions ajoutées à la table globale `editor` par cette extension (et non un objet instancié). Elles sont disponibles une fois l'extension et l'éditeur initialisés. Autres ajouts non listés ici : addExtendedSceneTreeObjectMenuItem, getSelectedSceneTreeNodes, refreshSceneTreeWindow, hideAllSceneTreeInstances, showAllSceneTreeInstances.
---@class editor_sceneTree_editor
local editor_sceneTree_editor = {}

--- Renvoie le groupe de la scène dans lequel ajouter de nouveaux objets : le groupe focus-locké s'il y en a un, sinon le groupe sélectionné (ou le parent du premier nœud sélectionné), sinon MissionGroup.
---Source : lua/ge/extensions/editor/sceneTree.lua:155
---@param instance table|nil Instance de Scene Tree dont on lit la sélection.
---@return userdata  Objet SimGroup.
function editor_sceneTree_editor.getSceneTreeSelectedGroup(instance) end

--- Retire l'objet des nœuds de toutes les instances et rafraîchit l'arbre (appelé quand un objet quitte un SimSet).
---Source : lua/ge/extensions/editor/sceneTree.lua:1068
---@param object userdata Objet retiré.
---@param simset userdata SimSet d'origine (non utilisé dans le code).
function editor_sceneTree_editor.removeObjectFromSet(object, simset) end

--- Traite le lot d'opérations de SimSet envoyé par le moteur : tableau plat de triplets (type, objId, groupId) pour ClearSet, AddObject, RemoveObject, AssignObjectName, ReorderObject, et met à jour l'arbre en conséquence (par lots).
---Source : lua/ge/extensions/editor/sceneTree.lua:1100
---@param transactions integer[] Tableau plat de triplets d'entiers.
function editor_sceneTree_editor.submitTransactions(transactions) end

