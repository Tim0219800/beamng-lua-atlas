# `editor_api_forestItemTools`

*Fichier : `lua/ge/extensions/editor/api/forestItemTools.lua` · VM : Game Engine (GE) · 718 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_api_forestItemTools` : `extensions.load("editor_api_forestItemTools")`, puis la globale `editor_api_forestItemTools`

Outils partagés de l'éditeur pour placer, sélectionner, déplacer et annuler des items de forêt (Forest / ForestData), extraits de forestEditor.lua pour qu'un second outil (l'éditeur d'intérieurs parallax) réutilise la même mécanique. Tout est paramétré par le handle `forest`/`forestData` (pas d'état de scène dans le module) ; la sélection est le store global `editor.selection.forestItem`, et les modifications passent par `editor.history` (annulables). Contient aussi l'empaquetage des données par-instance des fenêtres « parallax » (customData entier 32 bits) et des filtres sur le préfixe `parallax_` des datablocks ForestItemData.

## Exemple

```lua
-- dans le onUpdate d'un outil :
local tools = require("editor/api/forestItemTools")
tools.updateSelectMode(forest, tools.isParallaxItem)
tools.handleGizmo(forest)
```

## Remarques

- Le module est un `require` classique qui renvoie M ; il dépend d'un `editor` global déjà initialisé (editor.createForestItem, editor.updateForestItem, editor.history, gizmo d'axes).
- customData parallax : bits 0-23 = id du jeu de textures (0xFFFFFF = aucun/désactivé), bits 24-31 = drapeaux (bit 0 = emissive). Valeur < 0 = désactivé et non sauvegardé côté C++. Doit rester synchronisé avec shaders/common/examples/parallaxInterior.h.hlsl.
- Shift au début d'un glissement de gizmo arme un duplicata : le clone n'est créé qu'à la première frame de glissement, et le tout est enregistré comme une seule action « AddForestItems » (undo = suppression des clones).
- En mode échelle, le gizmo ajoute au plus 0.1 par frame à l'échelle uniforme de chaque item.
- `removeItems` ne fait rien (renvoie nil) si la liste est vide ; `addItems`/`removeItems` renvoient le résultat de commitAction.
- Hook émis : onEditorObjectSelectionChanged (depuis select).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_api_forestItemTools.addItems(forestData, items, dontCallRedo)` | Ajoute des items de façon annulable (action "AddForestItems") ; le redo sélectionne les items ajoutés. | 139 |
| `editor_api_forestItemTools.clearSelection(forestData)` | Désélectionne tous les items de forêt sélectionnés, reconstruit les données d'instances et vide la sélection. | 70 |
| `editor_api_forestItemTools.filterItems(items, keep)` | Renvoie une nouvelle liste contenant les items pour lesquels keep(item) est vrai (liste nil = liste vide). | 679 |
| `editor_api_forestItemTools.getSelection()` | Renvoie la sélection courante d'items de forêt (editor.selection.forestItem) ou une table vide. | 43 |
| `editor_api_forestItemTools.handleGizmo(forest)` | Pilote et dessine le gizmo d'axes pour la sélection courante (translation avec accrochage terrain, rotation autour du centroïde, échelle uniforme, duplication par Shift). Enregistre l'action annulable "SetForestItemTransform" (ou "AddForestItems" pour un duplicata) à la fin du glissement. À appeler une fois par frame depuis le onUpdate de l'outil. Ne fait rien sans sélection. | 295 |
| `editor_api_forestItemTools.isParallaxDataObject(cobj)` | Même test sur un objet datablock ForestItemData (issu de scenetree.findObject), pour filtrer la palette de meshes. | 667 |
| `editor_api_forestItemTools.isParallaxItem(item)` | Prédicat pratique pour les filtres de sélection : l'item est-il une fenêtre parallax (préfixe parallax_) ? | 660 |
| `editor_api_forestItemTools.itemDataSelectable(uniqueId, label, isSelected, icon)` | Ligne de liste de meshes partagée : icône de datablock + sélectionnable pleine largeur, surligné si sélectionné. Renvoie true au clic ; l'appelant gère l'état de sélection. | 625 |
| `editor_api_forestItemTools.itemMatchesPrefix(item, prefix)` | Vrai si le nom (ou l'internalName) du datablock de l'item commence par prefix. | 647 |
| `editor_api_forestItemTools.listItemDatas(prefix, matchPrefix)` | Liste les datablocks ForestItemData filtrés par préfixe de nom (ou internalName). matchPrefix = true : seulement ceux qui commencent par prefix (éditeur parallax) ; false : tous les autres (éditeur de forêt). Triée par nom sans casse. | 601 |
| `editor_api_forestItemTools.packParallaxData(setId, emissive)` | Encode (setId, emissive) en customData. setId < 0 ou nil donne -1 (désactivé ; le C++ ne sauvegarde pas customData < 0). | 709 |
| `editor_api_forestItemTools.pick(forest, rayRange, filterFn)` | Renvoie l'item de forêt rendu sous la souris (rayon caméra-souris), ou nil ; filterFn peut rejeter les items qui ne sont pas à l'outil. | 186 |
| `editor_api_forestItemTools.place(forest, itemData, transform, scale, afterCreate)` | Instancie un item à partir d'un datablock à la transformation donnée et renvoie le handle final. N'enregistre PAS d'historique : l'appelant commite (typiquement via addItems). afterCreate peut modifier l'item neuf (ex. customData parallax) et renvoyer le handle final à garder. | 173 |
| `editor_api_forestItemTools.placementBasis(hitNormal, yawRad, alignToNormal, flip)` | Calcule la base de placement du tableau et l'orientation de chaque item : (right, up, forward) unitaires. Colonnes de la transformation : X = right, Y = forward (face de la fenêtre), Z = up ; le tableau avance selon right (colonnes) et up (lignes). Mode monde : axes monde tournés de yawRad autour de Z. alignToNormal : la face suit la normale de la surface, le tableau est dans le plan de la surface et yawRad est une rotation dans ce plan. flip inverse la face. | 453 |
| `editor_api_forestItemTools.removeItems(forestData, items, dontCallRedo)` | Supprime des items de façon annulable (action "RemoveForestItems"). Ne fait rien si la liste est vide. | 145 |
| `editor_api_forestItemTools.select(forestData, forestItems, addToSelection)` | Sélectionne les items donnés (nil ou vide = effacer). Place le gizmo d'axes (sur l'item en mode local avec un seul item, sinon sur le centroïde), reconstruit les instances et émet onEditorObjectSelectionChanged. Ne déclenche pas l'aperçu du mesh de l'éditeur de forêt. | 83 |
| `editor_api_forestItemTools.unpackParallaxData(customData)` | Décode le customData en (setId, emissive). setId vaut -1 si aucun jeu parallax n'est assigné. | 698 |
| `editor_api_forestItemTools.updateInstantiateMode(forest, itemDataId, opts)` | Une frame de l'interaction « instancier un item » : raycast sous le curseur, aperçu (sphère, boîte englobante réelle du mesh, ligne de face ; cellule pivot en orange) et, au clic gauche, création d'un tableau cols x rows d'items du datablock itemDataId (échelle opts.scale, 1 par défaut), commité en UNE action annulable. Renvoie la liste des items créés au clic, sinon nil. | 494 |
| `editor_api_forestItemTools.updateSelectMode(forest, filterFn, rayRange)` | Une frame de l'interaction « sélectionner des items de forêt » (outil Select de l'éditeur de forêt) : survol en blanc, clic = sélection (Ctrl ajoute, clic dans le vide efface), rectangle de sélection (Ctrl ajoute), dessin des boîtes de la sélection (orange) et gizmo de transformation. Restreint aux items passant filterFn. | 327 |

### Détail des paramètres

#### `editor_api_forestItemTools.addItems(forestData, items, dontCallRedo)`

Ajoute des items de façon annulable (action "AddForestItems") ; le redo sélectionne les items ajoutés.

- `forestData` (*userdata*) : ForestData
- `items` (*table*) : items à ajouter
- `dontCallRedo` (*boolean|nil*) : true si les items existent déjà (n'exécute pas le redo) ; défaut false
- **renvoie** : any résultat de editor.history:commitAction

#### `editor_api_forestItemTools.clearSelection(forestData)`

Désélectionne tous les items de forêt sélectionnés, reconstruit les données d'instances et vide la sélection.

- `forestData` (*userdata*) : ForestData

#### `editor_api_forestItemTools.filterItems(items, keep)`

Renvoie une nouvelle liste contenant les items pour lesquels keep(item) est vrai (liste nil = liste vide).

- `items` (*table|nil*) : liste d'items
- `keep` (*function*) : function(item) -> boolean
- **renvoie** : table liste filtrée

#### `editor_api_forestItemTools.getSelection()`

Renvoie la sélection courante d'items de forêt (editor.selection.forestItem) ou une table vide.

- **renvoie** : table liste d'items

#### `editor_api_forestItemTools.handleGizmo(forest)`

Pilote et dessine le gizmo d'axes pour la sélection courante (translation avec accrochage terrain, rotation autour du centroïde, échelle uniforme, duplication par Shift). Enregistre l'action annulable "SetForestItemTransform" (ou "AddForestItems" pour un duplicata) à la fin du glissement. À appeler une fois par frame depuis le onUpdate de l'outil. Ne fait rien sans sélection.

- `forest` (*userdata*) : objet Forest

#### `editor_api_forestItemTools.isParallaxDataObject(cobj)`

Même test sur un objet datablock ForestItemData (issu de scenetree.findObject), pour filtrer la palette de meshes.

- `cobj` (*userdata|nil*) : datablock
- **renvoie** : boolean true si name/internalName commence par parallax_

#### `editor_api_forestItemTools.isParallaxItem(item)`

Prédicat pratique pour les filtres de sélection : l'item est-il une fenêtre parallax (préfixe parallax_) ?

- `item` (*userdata*) : item de forêt
- **renvoie** : boolean résultat

#### `editor_api_forestItemTools.itemDataSelectable(uniqueId, label, isSelected, icon)`

Ligne de liste de meshes partagée : icône de datablock + sélectionnable pleine largeur, surligné si sélectionné. Renvoie true au clic ; l'appelant gère l'état de sélection.

- `uniqueId` (*any*) : id du datablock (distingue l'id ImGui)
- `label` (*string*) : texte affiché
- `isSelected` (*boolean*) : surligner
- `icon` (*any|nil*) : icône de remplacement (défaut editor.icons.forest_brushelement)
- **renvoie** : boolean true si cliqué

#### `editor_api_forestItemTools.itemMatchesPrefix(item, prefix)`

Vrai si le nom (ou l'internalName) du datablock de l'item commence par prefix.

- `item` (*userdata*) : item de forêt
- `prefix` (*string*) : préfixe
- **renvoie** : boolean résultat

#### `editor_api_forestItemTools.listItemDatas(prefix, matchPrefix)`

Liste les datablocks ForestItemData filtrés par préfixe de nom (ou internalName). matchPrefix = true : seulement ceux qui commencent par prefix (éditeur parallax) ; false : tous les autres (éditeur de forêt). Triée par nom sans casse.

- `prefix` (*string*) : préfixe (utilisé dans un motif Lua "^"..prefix)
- `matchPrefix` (*boolean*) : true = garder ceux qui correspondent, false = les autres
- **renvoie** : table[] liste de {id, name}

#### `editor_api_forestItemTools.packParallaxData(setId, emissive)`

Encode (setId, emissive) en customData. setId < 0 ou nil donne -1 (désactivé ; le C++ ne sauvegarde pas customData < 0).

- `setId` (*integer|nil*) : id du jeu de textures (24 bits)
- `emissive` (*boolean|nil*) : drapeau emissive
- **renvoie** : integer customData

#### `editor_api_forestItemTools.pick(forest, rayRange, filterFn)`

Renvoie l'item de forêt rendu sous la souris (rayon caméra-souris), ou nil ; filterFn peut rejeter les items qui ne sont pas à l'outil.

- `forest` (*userdata*) : objet Forest
- `rayRange` (*number*) : portée du rayon en mètres
- `filterFn` (*function|nil*) : function(item) -> boolean
- **renvoie** : userdata|nil item touché

#### `editor_api_forestItemTools.place(forest, itemData, transform, scale, afterCreate)`

Instancie un item à partir d'un datablock à la transformation donnée et renvoie le handle final. N'enregistre PAS d'historique : l'appelant commite (typiquement via addItems). afterCreate peut modifier l'item neuf (ex. customData parallax) et renvoyer le handle final à garder.

- `forest` (*userdata*) : objet Forest
- `itemData` (*userdata*) : datablock ForestItemData
- `transform` (*MatrixF*) : transformation monde
- `scale` (*number*) : échelle
- `afterCreate` (*function|nil*) : function(item, forestData) -> item|nil
- **renvoie** : userdata handle de l'item créé

#### `editor_api_forestItemTools.placementBasis(hitNormal, yawRad, alignToNormal, flip)`

Calcule la base de placement du tableau et l'orientation de chaque item : (right, up, forward) unitaires. Colonnes de la transformation : X = right, Y = forward (face de la fenêtre), Z = up ; le tableau avance selon right (colonnes) et up (lignes). Mode monde : axes monde tournés de yawRad autour de Z. alignToNormal : la face suit la normale de la surface, le tableau est dans le plan de la surface et yawRad est une rotation dans ce plan. flip inverse la face.

- `hitNormal` (*vec3*) : normale de la surface touchée
- `yawRad` (*number*) : rotation en radians
- `alignToNormal` (*boolean*) : aligner sur la normale
- `flip` (*boolean*) : inverser la face
- **renvoie** : vec3 right
- **renvoie** : vec3 up
- **renvoie** : vec3 forward

#### `editor_api_forestItemTools.removeItems(forestData, items, dontCallRedo)`

Supprime des items de façon annulable (action "RemoveForestItems"). Ne fait rien si la liste est vide.

- `forestData` (*userdata*) : ForestData
- `items` (*table*) : items à supprimer
- `dontCallRedo` (*boolean|nil*) : true = ne pas exécuter maintenant ; défaut false
- **renvoie** : any résultat de commitAction

#### `editor_api_forestItemTools.select(forestData, forestItems, addToSelection)`

Sélectionne les items donnés (nil ou vide = effacer). Place le gizmo d'axes (sur l'item en mode local avec un seul item, sinon sur le centroïde), reconstruit les instances et émet onEditorObjectSelectionChanged. Ne déclenche pas l'aperçu du mesh de l'éditeur de forêt.

- `forestData` (*userdata*) : ForestData
- `forestItems` (*table|nil*) : items à sélectionner
- `addToSelection` (*boolean|nil*) : true = garder la sélection actuelle

#### `editor_api_forestItemTools.unpackParallaxData(customData)`

Décode le customData en (setId, emissive). setId vaut -1 si aucun jeu parallax n'est assigné.

- `customData` (*integer|nil*) : entier 32 bits de l'item
- **renvoie** : integer id du jeu de textures, -1 si désactivé
- **renvoie** : boolean drapeau emissive

#### `editor_api_forestItemTools.updateInstantiateMode(forest, itemDataId, opts)`

Une frame de l'interaction « instancier un item » : raycast sous le curseur, aperçu (sphère, boîte englobante réelle du mesh, ligne de face ; cellule pivot en orange) et, au clic gauche, création d'un tableau cols x rows d'items du datablock itemDataId (échelle opts.scale, 1 par défaut), commité en UNE action annulable. Renvoie la liste des items créés au clic, sinon nil.

- `forest` (*userdata*) : objet Forest
- `itemDataId` (*integer*) : id du datablock ForestItemData
- `opts` (*table|nil*) : rayRange (préférence par défaut), cols/rows (1x1), colGap/rowGap (m, bord à bord sur les bornes du mesh, 0), yaw (degrés), alignToNormal, flipNormal, normalOffset (m, décalage le long de la face), scale (1), afterCreate(item, forestData, index) (index 1-based)
- **renvoie** : table|nil items placés (au clic) ou nil

#### `editor_api_forestItemTools.updateSelectMode(forest, filterFn, rayRange)`

Une frame de l'interaction « sélectionner des items de forêt » (outil Select de l'éditeur de forêt) : survol en blanc, clic = sélection (Ctrl ajoute, clic dans le vide efface), rectangle de sélection (Ctrl ajoute), dessin des boîtes de la sélection (orange) et gizmo de transformation. Restreint aux items passant filterFn.

- `forest` (*userdata|nil*) : objet Forest (rien n'est fait si nil)
- `filterFn` (*function|nil*) : function(item) -> boolean ; nil = tous
- `rayRange` (*number|nil*) : portée du rayon (défaut : préférence de distance de travail)

## Champs

| Champ | Type | Description |
|---|---|---|
| `PARALLAX_ITEM_PREFIX` | string | Préfixe "parallax_" du nom (ou internalName) d'un datablock ForestItemData identifiant une fenêtre parallax ; l'éditeur parallax ne touche que ces items, l'éditeur de forêt les autres. |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onEditorObjectSelectionChanged` — écouté par 8 module(s)

## Appels vers le moteur (C++)

- `Sim.` `getUniqueName`
- `debugDrawer:` `drawLine`, `drawSphere`
- `obj:` `delete`, `getData`, `getKey`, `getObjBox`, `getPosition`, `getScale`, `getTransform`, `getUid`, `registerObject`, `setField`
- `scenetree.` `findClassObjects`, `findObject`, `findObjectById`
- `ui_imgui.` `GetIO`, `GetMouseDragDelta`, `GetMousePos`, `IsMouseClicked`, `IsMouseDragging`, `IsMouseReleased`
- `worldEditorCppApi.` `getAxisGizmoScaleOffset`, `getAxisGizmoTotalRotateOffset`, `rebuildForestManagerInstanceData`, `renderForestBBs`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/api/forestItemTools.lua`.*
