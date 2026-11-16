# `editor_sceneTree`

*Fichier : `lua/ge/extensions/editor/sceneTree.lua` · VM : Game Engine (GE) · 2664 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_sceneTree` : `extensions.load("editor_sceneTree")`, puis la globale `editor_sceneTree`

Fenêtre « Scene Tree » de l'éditeur de niveaux : affiche la hiérarchie des objets de la scène (MissionGroup, SimGroups, objets) sous forme d'arbre ImGui avec défilement virtuel, recherche (par nom, ID, ID persistant, classe ou tout), sélection multiple, glisser-déposer, renommage, tri, suppression, création d'objets et menus contextuels. Il met en cache l'arbre côté Lua (nœuds) et le synchronise avec le moteur via les transactions de SimSet. Il installe aussi des fonctions dans la table editor (voir classe « editor »). Un moddeur s'en sert surtout pour ajouter des entrées au menu contextuel et rafraîchir l'arbre après avoir créé/supprimé des objets par script.

## Exemple

```lua
-- ajouter une entrée au menu contextuel d'un objet
editor.addExtendedSceneTreeObjectMenuItem({
  title = 'Mon action',
  extendedSceneTreeObjectMenuItems = function(node) log('I','', 'noeud '..node.id) end,
  validator = function(node) return true end
})
-- rafraichir l'arbre
editor.refreshSceneTreeWindow()
```

## Remarques

- Le commentaire du code cite un champ onExtendedSceneTreeObjectMenuItemSelected, mais c'est bien le champ extendedSceneTreeObjectMenuItems (fonction appelée avec le nœud) que lit le menu contextuel. Le validator est facultatif et n'est pas vérifié par addExtendedSceneTreeObjectMenuItem.
- Une seule instance de fenêtre est permise : openSceneTree ne fait rien si une instance existe déjà.
- Les fonctions de la table editor ne sont installées qu'à partir de onExtensionLoaded / onEditorInitialized (par ex. editor.addExtendedSceneTreeObjectMenuItem existe seulement après le chargement de cette extension).
- Avant la sauvegarde du niveau (onEditorBeforeSaveLevel), l'ordre de tous les objets sous MissionGroup est stocké dans editor.orderTable (liste d'ids, parcours en profondeur).
- Le focus d'un groupe (focus lock) fait de ce groupe la racine de l'arbre ; il est levé à l'ouverture d'un niveau et à la désactivation de l'éditeur.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_sceneTree.closeAllInstances()` | Ferme et désenregistre toutes les fenêtres Scene Tree. | 2608 |
| `editor_sceneTree.debugNode(id, level)` | Journalise (log niveau I) le nœud de cache correspondant à l'objet donné, dans chaque instance qui le contient. | 2616 |
| `editor_sceneTree.moveSelectionIndex(up)` | Déplace la sélection d'une ligne dans l'instance qui a le focus (utilisé par les flèches de l'action map « SceneTree »). | 1009 |
| `editor_sceneTree.onEditorActivated()` | Appelé à l'activation de l'éditeur : resynchronise la sélection de l'arbre. *(interne)* *(hook)* | 2455 |
| `editor_sceneTree.onEditorAfterOpenLevel()` | Appelé après l'ouverture d'un niveau dans l'éditeur : lève le focus lock, reconstruit le cache, vide la sélection et le filtre. *(interne)* *(hook)* | 2459 |
| `editor_sceneTree.onEditorBeforeSaveLevel()` | Appelé avant la sauvegarde du niveau : remplit editor.orderTable avec les ids de tous les objets sous MissionGroup (parcours en profondeur). *(interne)* *(hook)* | 2552 |
| `editor_sceneTree.onEditorDeactivated()` | Appelé à la désactivation de l'éditeur : lève le focus lock s'il est actif. *(interne)* *(hook)* | 2470 |
| `editor_sceneTree.onEditorFocusLockChanged()` | Appelé quand le focus lock change : ré-enracine toutes les instances sur le groupe verrouillé (ou la racine) en gardant l'état ouvert, et force la racine ouverte. *(interne)* *(hook)* | 2628 |
| `editor_sceneTree.onEditorGui()` | Appelé à chaque image : dessine chaque instance de fenêtre Scene Tree (arbre virtualisé, barre de recherche, menus, glisser-déposer). *(interne)* *(hook)* | 2167 |
| `editor_sceneTree.onEditorInitialized()` | Appelé à l'initialisation de l'éditeur : récupère les icônes de classes (worldEditorCppApi.getObjectClassIcons), met en cache l'arbre, installe les fonctions editor.* (removeObjectFromSet, submitTransactions, getSelectedSceneTreeNodes, getSceneTreeSelectedGroup, refreshSceneTreeWindow, hideAll/showAllSceneTreeInstances) et ajoute l'entrée de menu « Scene Tree ». *(interne)* *(hook)* | 2474 |
| `editor_sceneTree.onEditorInspectorFieldChanged(selectedIds)` | Appelé quand un champ est modifié dans l'inspecteur : rafraîchit les noms des nœuds et, pour les objets contenus dans une instance de prefab, met à jour le décalage de transformation de l'enfant. *(interne)* *(hook)* | 2590 |
| `editor_sceneTree.onEditorLoadGuiInstancerState(state)` | Restaure les instances de fenêtre Scene Tree depuis l'état sauvegardé de la disposition de l'éditeur. *(interne)* *(hook)* | 2430 |
| `editor_sceneTree.onEditorObjectAdded()` | Appelé quand un objet est ajouté dans l'éditeur : reconstruit le cache (en gardant les groupes ouverts) et rafraîchit le cache de nœuds. *(interne)* *(hook)* | 2561 |
| `editor_sceneTree.onEditorObjectSelectionChanged()` | Appelé quand la sélection d'objets de l'éditeur change : met à jour les nœuds sélectionnés de chaque instance. *(interne)* *(hook)* | 821 |
| `editor_sceneTree.onEditorSaveGuiInstancerState(state)` | Sauvegarde les instances de fenêtre (sans sélection, cache ni filtre) dans l'état de disposition de l'éditeur. *(interne)* *(hook)* | 2441 |
| `editor_sceneTree.onEditorToolWindowGotFocus(windowName)` | Appelé quand une fenêtre d'outil prend le focus : si c'est un Scene Tree, marque l'instance comme focalisée et pousse l'action map « SceneTree ». *(interne)* *(hook)* | 2512 |
| `editor_sceneTree.onEditorToolWindowLostFocus(windowName)` | Appelé quand une fenêtre d'outil perd le focus : retire le focus de l'instance et dépile l'action map « SceneTree » quand plus aucune instance n'est focalisée. *(interne)* *(hook)* | 2522 |
| `editor_sceneTree.onExtensionLoaded()` | Appelé au chargement de l'extension : prépare la liste des modes de recherche et installe editor.addExtendedSceneTreeObjectMenuItem. *(interne)* *(hook)* | 2409 |
| `editor_sceneTree.openSceneTree()` | Ouvre une fenêtre Scene Tree si aucune n'existe encore (une seule instance autorisée). | 2161 |
| `editor_sceneTree.recacheAllNodes(keepOpenStatus)` | Reconstruit entièrement le cache de nœuds de toutes les instances depuis la scène Sim. Avec keepOpenStatus, l'état ouvert/fermé des groupes est conservé. | 732 |
| `editor_sceneTree.refreshAllNodes(incomingObjectIds)` | Met à jour le cache des groupes de chaque instance (à partir de sa racine) puis invalide le cache de taille ; version plus légère que recacheAllNodes. | 1030 |
| `editor_sceneTree.refreshNodeNames(objectIds)` | Recalcule le nom et le nom affiché des nœuds dont l'id est dans la liste. Ne fait rien si objectIds est nil. | 2569 |

### Détail des paramètres

#### `editor_sceneTree.debugNode(id, level)`

Journalise (log niveau I) le nœud de cache correspondant à l'objet donné, dans chaque instance qui le contient.

- `id` (*integer*) : Id de l'objet.
- `level` (*integer|nil*) : Profondeur passée à dumpsz.

#### `editor_sceneTree.moveSelectionIndex(up)`

Déplace la sélection d'une ligne dans l'instance qui a le focus (utilisé par les flèches de l'action map « SceneTree »).

- `up` (*boolean*) : true pour monter, false pour descendre.

#### `editor_sceneTree.onEditorInspectorFieldChanged(selectedIds)`

Appelé quand un champ est modifié dans l'inspecteur : rafraîchit les noms des nœuds et, pour les objets contenus dans une instance de prefab, met à jour le décalage de transformation de l'enfant.

- `selectedIds` (*integer[]*) : Ids des objets modifiés.

#### `editor_sceneTree.onEditorLoadGuiInstancerState(state)`

Restaure les instances de fenêtre Scene Tree depuis l'état sauvegardé de la disposition de l'éditeur.

- `state` (*table*) : État global du guiInstancer.

#### `editor_sceneTree.onEditorSaveGuiInstancerState(state)`

Sauvegarde les instances de fenêtre (sans sélection, cache ni filtre) dans l'état de disposition de l'éditeur.

- `state` (*table*) : État global à remplir.

#### `editor_sceneTree.onEditorToolWindowGotFocus(windowName)`

Appelé quand une fenêtre d'outil prend le focus : si c'est un Scene Tree, marque l'instance comme focalisée et pousse l'action map « SceneTree ».

- `windowName` (*string*) : Nom de la fenêtre.

#### `editor_sceneTree.onEditorToolWindowLostFocus(windowName)`

Appelé quand une fenêtre d'outil perd le focus : retire le focus de l'instance et dépile l'action map « SceneTree » quand plus aucune instance n'est focalisée.

- `windowName` (*string*) : Nom de la fenêtre.

#### `editor_sceneTree.recacheAllNodes(keepOpenStatus)`

Reconstruit entièrement le cache de nœuds de toutes les instances depuis la scène Sim. Avec keepOpenStatus, l'état ouvert/fermé des groupes est conservé.

- `keepOpenStatus` (*boolean|nil*) : true pour garder les groupes ouverts dans leur état actuel.

#### `editor_sceneTree.refreshAllNodes(incomingObjectIds)`

Met à jour le cache des groupes de chaque instance (à partir de sa racine) puis invalide le cache de taille ; version plus légère que recacheAllNodes.

- `incomingObjectIds` (*table|nil*) : Ids des objets entrants à intégrer (déduit du code).

#### `editor_sceneTree.refreshNodeNames(objectIds)`

Recalcule le nom et le nom affiché des nœuds dont l'id est dans la liste. Ne fait rien si objectIds est nil.

- `objectIds` (*integer[]|nil*) : Ids d'objets renommés.

## Classe `editor`

Fonctions ajoutées à la table globale `editor` par cette extension (et non un objet instancié). Elles sont disponibles une fois l'extension et l'éditeur initialisés. Autres ajouts non listés ici : addExtendedSceneTreeObjectMenuItem, getSelectedSceneTreeNodes, refreshSceneTreeWindow, hideAllSceneTreeInstances, showAllSceneTreeInstances.

Objet `editor` construit dans le module (par ex. par `new`), avec ces méthodes :

| Méthode | Description | Ligne |
|---|---|---|
| `editor.getSceneTreeSelectedGroup(instance)` | Renvoie le groupe de la scène dans lequel ajouter de nouveaux objets : le groupe focus-locké s'il y en a un, sinon le groupe sélectionné (ou le parent du premier nœud sélectionné), sinon MissionGroup. | 155 |
| `editor.removeObjectFromSet(object, simset)` | Retire l'objet des nœuds de toutes les instances et rafraîchit l'arbre (appelé quand un objet quitte un SimSet). | 1068 |
| `editor.submitTransactions(transactions)` | Traite le lot d'opérations de SimSet envoyé par le moteur : tableau plat de triplets (type, objId, groupId) pour ClearSet, AddObject, RemoveObject, AssignObjectName, ReorderObject, et met à jour l'arbre en conséquence (par lots). | 1100 |

## Appels vers le moteur (C++)

- `FS:` `directoryExists`
- `Sim.` `findObject`, `getRootGroup`, `upcast`
- `obj:` `at`, `deleteObject`, `getId`, `isSubClassOf`, `size`
- `scenetree.` `findObject`, `findObjectById`
- `worldEditorCppApi.` `createObject`, `getObjectClassIcons`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/sceneTree.lua`.*
