# `editor_forestEditor`

*Fichier : `lua/ge/extensions/editor/forestEditor.lua` · VM : Game Engine (GE) · 3222 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_forestEditor` : `extensions.load("editor_forestEditor")`, puis la globale `editor_forestEditor`

Outil « Edit Forest » de l'éditeur de monde : peinture et édition des objets de la forêt (ForestItem) avec des pinceaux (brosses de ForestBrush/ForestBrushElement), outils de sélection, de déplacement, rotation, échelle et accrochage au terrain. Il gère aussi l'inspecteur des ForestItemData (aperçu du mesh via ShapePreview), la sauvegarde des brosses (main.forestbrushes4.json) et de la forêt à l'enregistrement du niveau. Un moddeur l'utilise surtout pour sélectionner des items par script ou changer la taille du pinceau.

## Exemple

```lua
extensions.load('editor_forestEditor')
editor_forestEditor.selectToolByName('select')
editor_forestEditor.changeBrush(1, 0.5) -- agrandit le pinceau (ou la pression si Ctrl est enfoncé)
```

## Remarques

- Les items « parallax window » (fenêtres d'intérieur parallaxe) sont filtrés : ils appartiennent à l'éditeur Parallax Interior et sont exclus de la sélection et de la palette de ForestItemData.
- Le mode d'édition enregistré s'appelle « Edit Forest » (actionMap forestTools). Les préférences sont dans la catégorie forestEditor.general (brushSize, brushPressure, brushHardness, brushDepthOffset, forceAlignToTerrain, snapAnyForestItemType, toolWorkingDistance 1000 à 50000 m, pas de redimensionnement clavier/molette).
- Bug probable dans onEditorInspectorFieldChanged : la condition `object and object:getClassName() == 'ForestBrushElement' or object:getClassName() == 'ForestBrush'` a une priorité d'opérateurs incorrecte ; si l'objet est nil, le second terme appelle une méthode sur nil et lève une erreur.
- refreshForestItemDataList et selectBrushByIndex dépendent de l'état interne (var) initialisé par onEditorInitialized ; ne pas les appeler avant l'initialisation de l'éditeur.
- Le module exporte onDeserialize (sans « d ») alors que d'autres modules utilisent onDeserialized ; ici il se contente de mettre deserializeBrushes à false.

**Dépendances (chargées avant) :** `core_forest`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_forestEditor.beginChangeBrushSizeWithKeys(direction)` | Active la répétition automatique du redimensionnement du pinceau au clavier (touches [ ]) : remet le timer à 0 et mémorise la direction. L'update par frame appelle ensuite changeBrush à l'intervalle de la préférence brushSizeChangeIntervalWithKeys. | 3215 |
| `editor_forestEditor.changeBrush(value, step)` | Modifie la taille du pinceau, ou sa pression (densité) si la touche Ctrl est enfoncée. Les valeurs sont bornées puis appliquées à l'outil de pinceau. | 1425 |
| `editor_forestEditor.clearForestItemsSelection()` | Vide la sélection d'items de forêt, y compris la surbrillance dans le viewport : remet l'état « sélectionné » de chaque item à faux puis demande la reconstruction des données d'instances. Ne fait rien (aucune reconstruction) si rien n'est sélectionné. | 208 |
| `editor_forestEditor.dumpBrushProperties()` | Debug : affiche dans la console la taille, la pression et la dureté du pinceau courant. | 144 |
| `editor_forestEditor.dumpForestBrushes()` | Debug : affiche dans la console la liste des brosses de forêt (var.forestBrushes). | 132 |
| `editor_forestEditor.dumpForestBrushesMap()` | Debug : affiche dans la console la table de correspondance des brosses de forêt (var.forestBrushesMap). | 138 |
| `editor_forestEditor.endChangeBrushSizeWithKeys()` | Arrête la répétition automatique du redimensionnement du pinceau au clavier et remet le timer à 0. | 3216 |
| `editor_forestEditor.onDeserialize(data)` | Hook appelé après un rechargement Lua (reçoit les données renvoyées par onSerialize). Met simplement deserializeBrushes à false. *(interne)* *(hook)* | 3192 |
| `editor_forestEditor.onEditorAfterSaveLevel()` | Hook appelé après l'enregistrement du niveau. Sauve les ForestBrushGroup dans <niveau>/main.forestbrushes4.json si les brosses sont modifiées, sauve la forêt (saveForest) si editor.forestDirty, et enregistre les datablocks ForestItemData modifiés. *(interne)* *(hook)* | 3111 |
| `editor_forestEditor.onEditorAxisGizmoAligmentChanged()` | Hook appelé quand l'alignement du gizmo d'axes change (local/monde). Replace le gizmo sur l'item (alignement local, un seul item) ou sur le centroïde de la sélection. Le nom contient la faute « Aligment » telle que dans le moteur. *(interne)* *(hook)* | 2881 |
| `editor_forestEditor.onEditorAxisGizmoModeChanged(mode)` | Hook appelé quand le mode du gizmo (déplacer/tourner/échelle) change. Si le mode d'édition actif est « Edit Forest » et que l'outil courant n'est pas « select », bascule sur l'outil « select ». *(interne)* *(hook)* | 3179 |
| `editor_forestEditor.onEditorGui()` | Hook appelé chaque frame par l'éditeur : dessine la fenêtre de l'outil (barre d'outils, palettes de brosses et de ForestItemData, inspecteur), gère les entrées et le rendu des aides (lignes, sphères, boîtes englobantes). *(interne)* *(hook)* | 2040 |
| `editor_forestEditor.onEditorInitialized()` | Hook appelé à l'initialisation de l'éditeur : enregistre la fenêtre « forestEditor », deux dialogues modaux, l'inspecteur de type forestItem, les éditeurs de champs personnalisés (shapeFile, ForestItemData) et le mode d'édition « Edit Forest » ; initialise ensuite pinceau, pression, dureté et tables de datablocks. *(interne)* *(hook)* | 3073 |
| `editor_forestEditor.onEditorInspectorFieldChanged(selectedIds, fieldName, fieldValue, arrayIndex)` | Hook appelé quand un champ de l'inspecteur est modifié. Marque les brosses comme modifiées (ForestBrush/ForestBrushElement) et met à jour l'aperçu du mesh quand shapeFile d'un ForestItemData ou forestItemData d'un ForestBrushElement change. Ne traite que le cas d'un seul objet sélectionné. *(interne)* *(hook)* | 3133 |
| `editor_forestEditor.onEditorRegisterPreferences(prefsRegistry)` | Hook appelé pour déclarer les préférences de l'éditeur : catégorie forestEditor, sous-catégorie general (taille, pression/densité, dureté, décalage de profondeur, alignement forcé au terrain, accrochage de tous les types, distance de travail). *(interne)* *(hook)* | 3159 |
| `editor_forestEditor.onSerialize()` | Hook appelé avant un rechargement Lua : vide la sélection d'items puis renvoie true pour que onDeserialize soit déclenché ensuite. *(interne)* *(hook)* | 3196 |
| `editor_forestEditor.refreshForestItemDataList()` | Reconstruit la liste var.forestItemData à partir de tous les objets de classe ForestItemData de la scène, en excluant les datablocks parallax window. | 1459 |
| `editor_forestEditor.selectBrushByIndex(index)` | Sélectionne l'outil de pinceau d'indice donné dans var.brushes (indice Lua, à partir de 1). | 3188 |
| `editor_forestEditor.selectForestItems(forestItems, addToSelection)` | Définit (ou complète) la sélection d'items de forêt de l'éditeur. Filtre les items parallax, met à jour la surbrillance, le centroïde, le gizmo d'axes et l'aperçu du mesh du dernier item. | 219 |
| `editor_forestEditor.selectToolByName(toolName)` | Active un outil ou une brosse de la barre d'outils à partir de son libellé (par exemple « select »). Ne fait rien si aucun libellé ne correspond. | 367 |

### Détail des paramètres

#### `editor_forestEditor.beginChangeBrushSizeWithKeys(direction)`

Active la répétition automatique du redimensionnement du pinceau au clavier (touches [ ]) : remet le timer à 0 et mémorise la direction. L'update par frame appelle ensuite changeBrush à l'intervalle de la préférence brushSizeChangeIntervalWithKeys.

- `direction` (*number*) : Sens du changement (positif agrandit, négatif réduit) ; transmis tel quel à changeBrush

#### `editor_forestEditor.changeBrush(value, step)`

Modifie la taille du pinceau, ou sa pression (densité) si la touche Ctrl est enfoncée. Les valeurs sont bornées puis appliquées à l'outil de pinceau.

- `value` (*number*) : Direction/multiplicateur du changement (déduit du code)
- `step` (*number*) : Pas appliqué (unités de la préférence correspondante)

#### `editor_forestEditor.onDeserialize(data)`

Hook appelé après un rechargement Lua (reçoit les données renvoyées par onSerialize). Met simplement deserializeBrushes à false.

- `data` (*any*) : Valeur renvoyée par onSerialize (true)

#### `editor_forestEditor.onEditorAxisGizmoModeChanged(mode)`

Hook appelé quand le mode du gizmo (déplacer/tourner/échelle) change. Si le mode d'édition actif est « Edit Forest » et que l'outil courant n'est pas « select », bascule sur l'outil « select ».

- `mode` (*integer*) : Nouveau mode du gizmo (non utilisé)

#### `editor_forestEditor.onEditorInspectorFieldChanged(selectedIds, fieldName, fieldValue, arrayIndex)`

Hook appelé quand un champ de l'inspecteur est modifié. Marque les brosses comme modifiées (ForestBrush/ForestBrushElement) et met à jour l'aperçu du mesh quand shapeFile d'un ForestItemData ou forestItemData d'un ForestBrushElement change. Ne traite que le cas d'un seul objet sélectionné.

- `selectedIds` (*integer[]*) : Ids des objets sélectionnés dans l'inspecteur
- `fieldName` (*string*) : Nom du champ modifié
- `fieldValue` (*any*) : Nouvelle valeur
- `arrayIndex` (*integer|nil*) : Index dans le champ tableau (non utilisé)

#### `editor_forestEditor.onEditorRegisterPreferences(prefsRegistry)`

Hook appelé pour déclarer les préférences de l'éditeur : catégorie forestEditor, sous-catégorie general (taille, pression/densité, dureté, décalage de profondeur, alignement forcé au terrain, accrochage de tous les types, distance de travail).

- `prefsRegistry` (*table*) : Registre de préférences de l'éditeur

#### `editor_forestEditor.onSerialize()`

Hook appelé avant un rechargement Lua : vide la sélection d'items puis renvoie true pour que onDeserialize soit déclenché ensuite.

- **renvoie** : boolean Toujours true

#### `editor_forestEditor.selectBrushByIndex(index)`

Sélectionne l'outil de pinceau d'indice donné dans var.brushes (indice Lua, à partir de 1).

- `index` (*integer*) : Indice dans la liste des brosses

#### `editor_forestEditor.selectForestItems(forestItems, addToSelection)`

Définit (ou complète) la sélection d'items de forêt de l'éditeur. Filtre les items parallax, met à jour la surbrillance, le centroïde, le gizmo d'axes et l'aperçu du mesh du dernier item.

- `forestItems` (*table|nil*) : Liste d'items de forêt ; nil pour seulement désélectionner
- `addToSelection` (*boolean|nil*) : true pour ajouter à la sélection existante, sinon elle est remplacée

#### `editor_forestEditor.selectToolByName(toolName)`

Active un outil ou une brosse de la barre d'outils à partir de son libellé (par exemple « select »). Ne fait rien si aucun libellé ne correspond.

- `toolName` (*string*) : Libellé (label) de l'outil ou de la brosse

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | string[] | Extensions chargées avant ce module : {"core_forest"}. |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onEditorEditModeChanged` — écouté par 1 module(s)
- `onEditorObjectSelectionChanged` — écouté par 8 module(s)

## Appels vers le moteur (C++)

- `Engine.` `castRay`
- `FS:` `fileExists`
- `Sim.` `deserializeLineObjects`, `findObjectByIdNoUpcast`, `getDataBlockSet`, `getUniqueName`, `serializeToLineObjectsFile`
- `debugDrawer:` `drawLine`, `drawLineInstance`, `drawSphere`
- `obj:` `add`, `delete`, `getClassName`, `getData`, `getId`, `getInternalName`, `getKey`, `getName`, `getPosition`, `getScale`, `getTransform`, `getUid`, `getWorldBox`, `setField`, `setInternalName`, `setName`
- `scenetree.` `findClassObjects`, `findObject`, `findObjectById`
- `worldEditorCppApi.` `createObject`, `findDerivedDatablockClassname`, `getAxisGizmoScaleOffset`, `getAxisGizmoTotalRotateOffset`, `rebuildForestManagerInstanceData`, `renderForestBBs`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/forestEditor.lua`.*
