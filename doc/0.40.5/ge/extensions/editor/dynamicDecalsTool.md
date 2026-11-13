# `editor_dynamicDecalsTool`

*Fichier : `lua/ge/extensions/editor/dynamicDecalsTool.lua` · VM : Game Engine (GE) · 1003 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_dynamicDecalsTool` : `extensions.load("editor_dynamicDecalsTool")`, puis la globale `editor_dynamicDecalsTool`

Fenêtre principale de l'outil Dynamic Decals de l'éditeur (peinture de décalcomanies sur le véhicule). Charge ses 33 sous-modules via M.dependencies (api editor_api_dynamicDecals, widgets, layerStack, inspector, brushes, gizmo, vehicleColorPalette, loadSave, layerTypes_*, etc.) et sert de hub : les sous-modules s'enregistrent auprès de lui par setup(tool) avec registerSection, registerToolbarToolItem, registerToolbarActionItem, registerEditorOnUpdateFn et registerOnEditorGuiFn. Expose aussi l'interface publique appelée par les actions clavier/souris (applyDecal, undo/redo, changeDecalSize/Rotation, verrouillage profondeur/normale, mode pinceau, calque chemin).

## Remarques

- Les hooks onEditorGui, onEditorInitialized, onEditorActivated, etc. sont commentés dans le code (« DISABLED, SPAMS LOG, DEPENDENCIES NOT FOUND ») : ils ne sont pas exportés par ce module.
- applyDecal(value) attend 1 à l'appui et autre valeur au relâchement. Priorité : édition de masque (currentMaskEditingLayerUid), calque chemin actif, mode brushStroke, sinon décalque simple (ajoute aussi la couleur à l'historique de couleurs).
- Les sections ayant un order >= 1000 sont rangées dans la section « Advanced ».
- M.toolModes = {none = 0, decal = 1, brushStroke = 2, path = 3} ; toolMode vaut decal au départ. M.version = {1,1,0}. M.directoryPath = "/art/dynamicDecals/".
- changeDecalSize/Rotation multiplient les pas des préférences dynamicDecalsTool.decalProperties.scaleStep et rotationStep (degrés convertis en radians) par mod.

**Dépendances (chargées avant) :** `editor_api_dynamicDecals`, `editor_dynamicDecals_docs`, `editor_dynamicDecals_helper`, `editor_dynamicDecals_widgets`, `editor_dynamicDecals_notification`, `editor_dynamicDecals_news`, `editor_dynamicDecals_layerStack`, `editor_dynamicDecals_selection`, `editor_dynamicDecals_inspector`, `editor_dynamicDecals_inspector_utils`, `editor_dynamicDecals_browser`, `editor_dynamicDecals_textures`, `editor_dynamicDecals_export`, `editor_dynamicDecals_fonts`, `editor_dynamicDecals_brushes`, `editor_dynamicDecals_gizmo`, `editor_dynamicDecals_vehicleColorPalette`, `editor_dynamicDecals_colorPresets`, `editor_dynamicDecals_colorHistory`, `editor_dynamicDecals_camera`, `editor_dynamicDecals_loadSave`, `editor_dynamicDecals_settings`, `editor_dynamicDecals_history`, `editor_dynamicDecals_meshes`, `editor_dynamicDecals_layerTypes_decal`, `editor_dynamicDecals_layerTypes_brushStroke`, `editor_dynamicDecals_layerTypes_path`, `editor_dynamicDecals_layerTypes_fill`, `editor_dynamicDecals_layerTypes_textureFill`, `editor_dynamicDecals_layerTypes_group`, `editor_dynamicDecals_layerTypes_linkedSet`, `editor_dynamicDecals_debugTextures`, `editor_dynamicDecals_debugSection`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_dynamicDecalsTool.applyDecal(value)` | Interface publique du pinceau : pose un décalque, un point de chemin, un trait de pinceau ou un décalque de masque selon le mode courant. | 883 |
| `editor_dynamicDecalsTool.changeDecalRotation(clockwise, mod)` | Fait tourner le décalque courant. | 910 |
| `editor_dynamicDecalsTool.changeDecalSize(increase, mod)` | Agrandit ou réduit le décalque courant. | 909 |
| `editor_dynamicDecalsTool.dynamicDecals_moveLayer(from, fromParentUid, to, toParentUid)` | Hook de l'API appelé quand un calque est déplacé : rafraîchit le calque parent de destination s'il est sélectionné. *(interne)* | 939 |
| `editor_dynamicDecalsTool.dynamicDecals_onLayerUpdated(layerUid)` | Hook de l'API : quand un calque est modifié, recopie ses données dans la sélection de l'inspecteur s'il y est affiché. *(interne)* | 930 |
| `editor_dynamicDecalsTool.enableBrushStroke(value)` | Active/désactive le trait de pinceau ; à la désactivation, ajoute un calque de trait (api.addBrushStrokeLayer). | 955 |
| `editor_dynamicDecalsTool.enablePathLayer(value)` | Active/désactive le mode calque chemin. | 963 |
| `editor_dynamicDecalsTool.finishPathLayer()` | Termine le calque chemin en cours. | 967 |
| `editor_dynamicDecalsTool.getCurrentMaskEditingLayerUid()` | Uid du calque dont le masque est édité, ou nil. | 997 |
| `editor_dynamicDecalsTool.getIconSize()` | Taille d'icône (entier, 20 par défaut). | 981 |
| `editor_dynamicDecalsTool.getIconSizeVec2()` | Taille d'icône sous forme d'ImVec2. | 985 |
| `editor_dynamicDecalsTool.getMainScrollY()` | Défilement vertical courant de la fenêtre principale. | 989 |
| `editor_dynamicDecalsTool.getSectionOpenState(name)` | État ouvert d'une section (ou de « Advanced »). | 827 |
| `editor_dynamicDecalsTool.getSectionWindowName(section)` | Nom de la fenêtre imgui d'une section : « Dynamic Decals Tool - <section.windowName> ». | 146 |
| `editor_dynamicDecalsTool.lockDepth(value)` | Verrouille ou libère la profondeur de projection du décalque. | 947 |
| `editor_dynamicDecalsTool.lockSurfaceNormal(value)` | Verrouille ou libère la normale de surface utilisée pour la projection. | 951 |
| `editor_dynamicDecalsTool.onDeserialized(data)` | Hook de désérialisation : ne fait rien. *(interne)* *(hook)* | 864 |
| `editor_dynamicDecalsTool.onSerialize()` | Hook de sérialisation du rechargement Lua : renvoie une table vide. *(interne)* *(hook)* | 859 |
| `editor_dynamicDecalsTool.onVehicleSwitched()` | Hook appelé au changement de véhicule : met à jour les matériaux (settings.updateMaterials). *(interne)* *(hook)* | 975 |
| `editor_dynamicDecalsTool.redo()` | Rétablit l'action annulée et rafraîchit les calques sélectionnés. | 921 |
| `editor_dynamicDecalsTool.registerEditorOnUpdateFn(name, onUpdateFn)` | Enregistre une fonction de mise à jour appelée chaque frame par l'outil (clé = name). | 780 |
| `editor_dynamicDecalsTool.registerOnEditorGuiFn(name, guiFn)` | Enregistre une fonction de dessin supplémentaire exécutée avec l'interface de l'éditeur. | 848 |
| `editor_dynamicDecalsTool.registerSection(name, guiFn, order, defaultOpen, window, buttons)` | Enregistre une section de l'interface (et éventuellement une fenêtre dédiée). Les sections sont triées par order ; celles >= 1000 vont dans « Advanced ». | 801 |
| `editor_dynamicDecalsTool.registerToolbarActionItem(name, guiFn, order)` | Ajoute un élément à la barre d'outils (partie actions), trié par order. | 843 |
| `editor_dynamicDecalsTool.registerToolbarToolItem(name, guiFn, order)` | Ajoute un élément à la barre d'outils (partie outils), trié par order. | 838 |
| `editor_dynamicDecalsTool.removeLastPathLayerPoint()` | Supprime le dernier point du chemin en cours. | 971 |
| `editor_dynamicDecalsTool.setCurrentMaskEditingLayerUid(uid)` | Définit le calque dont le masque est en cours d'édition (nil pour quitter ce mode). | 993 |
| `editor_dynamicDecalsTool.setSectionOpenState(name, newState, setScroll)` | Ouvre ou ferme une section par son nom (ouvrir une section avancée ouvre aussi « Advanced »). | 805 |
| `editor_dynamicDecalsTool.undo()` | Annule la dernière action de l'API dynamicDecals, puis rafraîchit les calques sélectionnés dans editor.selection.dynamicDecalLayer. | 912 |
| `editor_dynamicDecalsTool.unregisterEditorOnUpdateFn(name)` | Retire une fonction de mise à jour enregistrée. | 784 |
| `editor_dynamicDecalsTool.unregisterOnEditorGuiFn(name)` | Retire une fonction de dessin enregistrée. | 852 |

### Détail des paramètres

#### `editor_dynamicDecalsTool.applyDecal(value)`

Interface publique du pinceau : pose un décalque, un point de chemin, un trait de pinceau ou un décalque de masque selon le mode courant.

- `value` (*integer*) : 1 à l'appui, autre (0) au relâchement

#### `editor_dynamicDecalsTool.changeDecalRotation(clockwise, mod)`

Fait tourner le décalque courant.

- `clockwise` (*boolean*) : Sens horaire
- `mod` (*number|nil*) : Multiplicateur du pas (défaut 1)

#### `editor_dynamicDecalsTool.changeDecalSize(increase, mod)`

Agrandit ou réduit le décalque courant.

- `increase` (*boolean*) : true pour agrandir
- `mod` (*number|nil*) : Multiplicateur du pas (défaut 1)

#### `editor_dynamicDecalsTool.dynamicDecals_moveLayer(from, fromParentUid, to, toParentUid)`

Hook de l'API appelé quand un calque est déplacé : rafraîchit le calque parent de destination s'il est sélectionné.

- `from` (*integer*) : Position d'origine
- `fromParentUid` (*any*) : Parent d'origine
- `to` (*integer*) : Position de destination
- `toParentUid` (*any*) : Parent de destination

#### `editor_dynamicDecalsTool.dynamicDecals_onLayerUpdated(layerUid)`

Hook de l'API : quand un calque est modifié, recopie ses données dans la sélection de l'inspecteur s'il y est affiché.

- `layerUid` (*string|integer*) : Identifiant du calque modifié (type déduit du code)

#### `editor_dynamicDecalsTool.enableBrushStroke(value)`

Active/désactive le trait de pinceau ; à la désactivation, ajoute un calque de trait (api.addBrushStrokeLayer).

- `value` (*integer*) : 1 pour activer

#### `editor_dynamicDecalsTool.enablePathLayer(value)`

Active/désactive le mode calque chemin.

- `value` (*integer*) : 1 pour activer

#### `editor_dynamicDecalsTool.getCurrentMaskEditingLayerUid()`

Uid du calque dont le masque est édité, ou nil.

- **renvoie** : any|nil 

#### `editor_dynamicDecalsTool.getIconSize()`

Taille d'icône (entier, 20 par défaut).

- **renvoie** : number 

#### `editor_dynamicDecalsTool.getIconSizeVec2()`

Taille d'icône sous forme d'ImVec2.

- **renvoie** : ImVec2 

#### `editor_dynamicDecalsTool.getMainScrollY()`

Défilement vertical courant de la fenêtre principale.

- **renvoie** : number 

#### `editor_dynamicDecalsTool.getSectionOpenState(name)`

État ouvert d'une section (ou de « Advanced »).

- `name` (*string*) : Nom de la section
- **renvoie** : boolean|nil nil si la section est inconnue

#### `editor_dynamicDecalsTool.getSectionWindowName(section)`

Nom de la fenêtre imgui d'une section : « Dynamic Decals Tool - <section.windowName> ».

- `section` (*table*) : Section avec windowName
- **renvoie** : string 

#### `editor_dynamicDecalsTool.lockDepth(value)`

Verrouille ou libère la profondeur de projection du décalque.

- `value` (*integer*) : 1 pour verrouiller

#### `editor_dynamicDecalsTool.lockSurfaceNormal(value)`

Verrouille ou libère la normale de surface utilisée pour la projection.

- `value` (*integer*) : 1 pour verrouiller

#### `editor_dynamicDecalsTool.onDeserialized(data)`

Hook de désérialisation : ne fait rien.

- `data` (*table*) : Données

#### `editor_dynamicDecalsTool.onSerialize()`

Hook de sérialisation du rechargement Lua : renvoie une table vide.

- **renvoie** : table {}

#### `editor_dynamicDecalsTool.registerEditorOnUpdateFn(name, onUpdateFn)`

Enregistre une fonction de mise à jour appelée chaque frame par l'outil (clé = name).

- `name` (*string*) : Clé unique
- `onUpdateFn` (*function*) : Appelée avec (dtReal, dtSim, dtRaw)

#### `editor_dynamicDecalsTool.registerOnEditorGuiFn(name, guiFn)`

Enregistre une fonction de dessin supplémentaire exécutée avec l'interface de l'éditeur.

- `name` (*string*) : Clé unique
- `guiFn` (*function*) : Fonction de dessin

#### `editor_dynamicDecalsTool.registerSection(name, guiFn, order, defaultOpen, window, buttons)`

Enregistre une section de l'interface (et éventuellement une fenêtre dédiée). Les sections sont triées par order ; celles >= 1000 vont dans « Advanced ».

- `name` (*string*) : Nom de la section
- `guiFn` (*function*) : Fonction de dessin, appelée avec un guiId (dans la section comme dans la fenêtre)
- `order` (*number|nil*) : Position (plus petit = plus haut), défaut 1000
- `defaultOpen` (*boolean|nil*) : Ouverte par défaut
- `window` (*table|nil*) : {windowSize = ImVec2} pour créer une fenêtre dédiée avec bouton d'ouverture
- `buttons` (*table|nil*) : Boutons d'en-tête {icon, tooltip, fn}

#### `editor_dynamicDecalsTool.registerToolbarActionItem(name, guiFn, order)`

Ajoute un élément à la barre d'outils (partie actions), trié par order.

- `name` (*string*) : 
- `guiFn` (*function*) : Fonction de dessin
- `order` (*number|nil*) : Défaut 1000

#### `editor_dynamicDecalsTool.registerToolbarToolItem(name, guiFn, order)`

Ajoute un élément à la barre d'outils (partie outils), trié par order.

- `name` (*string*) : 
- `guiFn` (*function*) : Fonction de dessin
- `order` (*number|nil*) : Défaut 1000

#### `editor_dynamicDecalsTool.setCurrentMaskEditingLayerUid(uid)`

Définit le calque dont le masque est en cours d'édition (nil pour quitter ce mode).

- `uid` (*any|nil*) : Uid du calque

#### `editor_dynamicDecalsTool.setSectionOpenState(name, newState, setScroll)`

Ouvre ou ferme une section par son nom (ouvrir une section avancée ouvre aussi « Advanced »).

- `name` (*string*) : Nom de la section
- `newState` (*boolean*) : Ouvert ou fermé
- `setScroll` (*boolean|nil*) : Fait défiler jusqu'à la section

#### `editor_dynamicDecalsTool.unregisterEditorOnUpdateFn(name)`

Retire une fonction de mise à jour enregistrée.

- `name` (*string*) : Clé

#### `editor_dynamicDecalsTool.unregisterOnEditorGuiFn(name)`

Retire une fonction de dessin enregistrée.

- `name` (*string*) : Clé

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | string[] | Liste des extensions chargées avant ce module. |
| `directoryPath` | string | Dossier des données : "/art/dynamicDecals/". |
| `doApiUpdate` | boolean | Si true (défaut), l'outil appelle la mise à jour de l'API chaque frame ; modifiable par une case de debug. |
| `toolMode` | integer | Mode courant (decal par défaut). |
| `toolModes` | table<string, integer> | none=0, decal=1, brushStroke=2, path=3. |
| `version` | integer[] | Version {1,1,0} de l'outil. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/dynamicDecalsTool.lua`.*
