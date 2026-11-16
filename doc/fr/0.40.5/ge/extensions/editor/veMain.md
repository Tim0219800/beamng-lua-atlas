# `editor_veMain`

*Fichier : `lua/ge/extensions/editor/veMain.lua` · VM : Game Engine (GE) · 446 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_veMain` : `extensions.load("editor_veMain")`, puis la globale `editor_veMain`

Noyau du Vehicle Editor (éditeur de véhicule, modes statique et live). L'extension s'enregistre aussi comme globale `vEditor` : elle y stocke le véhicule courant (vEditor.vehicle, vEditor.vdata, vEditor.vehData, vEditor.vehiclePos), les nœuds/poutres sélectionnés et les menus. Elle charge automatiquement toutes les extensions `ve*.lua` des dossiers vehicleEditor/, staticEditor/ et liveEditor/, construit les menus à partir de leur `menuEntry`/`open`, et émet chaque frame le hook `onVehicleEditorRenderJBeams` pour que les outils de debug dessinent avec debugDrawer.

## Exemple

```lua
extensions.load("editor_veMain")
editor_veMain.toggleActive() -- entre/sort du Vehicle Editor
local veh = vEditor.vehicle -- véhicule joueur suivi par l'éditeur
```

## Remarques

- Les autres outils de l'éditeur lisent l'état via la globale vEditor (rawset(_G, 'vEditor', M)) ; vEditor.vehiclePos est mis à jour à chaque onPreRender.
- Les extensions live/static sont découvertes par FS:findFiles sur le motif 've*.lua' : un nouveau fichier ve*.lua avec menuEntry (string) et open (function) apparaît automatiquement dans le menu. Les menuEntry avec '/' créent des sous-menus (ex. 'Other/Crash Tester').
- vEditor.EDITOR_MODE_STATIC = 1, EDITOR_MODE_LIVE = 2 ; mode par défaut = live.
- Incohérence : le module exporte `onDeserialize` (sans 'd') alors que le système d'extensions appelle `onDeserialized` ; le mode d'éditeur sauvegardé par onSerialize n'est donc probablement pas restauré.
- L'écran 'Mirror Debug' est ajouté en dur dans la liste des apps live (BeamNGVehicle.mirrorDebugEnabled = true).

**Dépendances (chargées avant) :** `core_vehicle_manager`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_veMain.onDeserialize(data)` | Restaure vEditor.editorMode depuis data.editorMode. Nom non standard (le hook d'extension est onDeserialized). *(interne)* *(hook)* | 427 |
| `editor_veMain.onEditorHeadlessChange(enabled, toolName)` | Hook de l'éditeur appelé quand un outil headless est activé/désactivé. Si toolName correspond à l'éditeur véhicule courant (vehicleEditorStatic/vehicleEditorLive), prépare l'éditeur (setupEditor) et marque vEditor.editorActive, ou retire l'action map 'VehicleEditor'. *(interne)* *(hook)* | 318 |
| `editor_veMain.onEditorHeadlessMainMenuBar()` | Appelé par l'éditeur en mode headless pour dessiner la barre de menu : menus File (Exit Vehicle Editor...), View (Reset Layout) et indicateurs FPS / GpuWait / Poly. *(interne)* *(hook)* | 405 |
| `editor_veMain.onEditorInitialized()` | Appelé quand l'éditeur est initialisé : ajoute l'entrée 'Vehicle Editor' (groupe Vehicles) au menu Window. *(interne)* *(hook)* | 310 |
| `editor_veMain.onEditorInspectorFieldChanged(selectedIds, fieldName, fieldValue, arrayIndex)` | Quand le champ color, colorPalette0 ou colorPalette1 d'un BeamNGVehicle est modifié dans l'inspecteur, convertit la couleur et applique la peinture via core_vehicle_partmgmt.setConfigPaints. *(interne)* *(hook)* | 341 |
| `editor_veMain.onPreRender(dtReal, dtSim, dtRaw)` | Appelé chaque frame avant le rendu. Si aucun véhicule n'est suivi, initialise vEditor depuis le véhicule joueur (be:getPlayerVehicleID(0)). Sinon met à jour vEditor.vehiclePos puis émet le hook `onVehicleEditorRenderJBeams(dtReal, dtSim, dtRaw)`. *(interne)* *(hook)* | 251 |
| `editor_veMain.onSerialize()` | Sérialisation avant rechargement Lua : renvoie {editorMode = vEditor.editorMode}. *(interne)* *(hook)* | 421 |
| `editor_veMain.onVehicleDestroyed()` | Appelé à la destruction d'un véhicule : remet à nil vEditor.vehicle, vehData, vdata, nodeCIDToName et vehiclePos (sans vérifier de quel véhicule il s'agit). *(interne)* *(hook)* | 333 |
| `editor_veMain.onVehicleSwitched(oldVehicle, newVehicle, player)` | Appelé au changement de véhicule joueur : recharge les données (vEditor.vehData, vdata, nodeCIDToName, vehicle) pour newVehicle. *(interne)* *(hook)* | 314 |
| `editor_veMain.saveCurrentWindowLayout()` | Sauvegarde la disposition de fenêtres courante du Vehicle Editor via editor_layoutManager.saveCurrentWindowLayout. | 417 |
| `editor_veMain.toggleActive()` | Active le Vehicle Editor s'il est inactif (active l'éditeur monde, le mode headless, charge les apps), sinon le quitte (deactivateEditor(false)) en désactivant core_vehicle_manager.setDebug. | 302 |

### Détail des paramètres

#### `editor_veMain.onDeserialize(data)`

Restaure vEditor.editorMode depuis data.editorMode. Nom non standard (le hook d'extension est onDeserialized).

- `data` (*table*) : Table renvoyée par onSerialize.

#### `editor_veMain.onEditorHeadlessChange(enabled, toolName)`

Hook de l'éditeur appelé quand un outil headless est activé/désactivé. Si toolName correspond à l'éditeur véhicule courant (vehicleEditorStatic/vehicleEditorLive), prépare l'éditeur (setupEditor) et marque vEditor.editorActive, ou retire l'action map 'VehicleEditor'.

- `enabled` (*boolean*) : true si l'outil est activé.
- `toolName` (*string*) : Nom de l'outil headless.

#### `editor_veMain.onEditorInspectorFieldChanged(selectedIds, fieldName, fieldValue, arrayIndex)`

Quand le champ color, colorPalette0 ou colorPalette1 d'un BeamNGVehicle est modifié dans l'inspecteur, convertit la couleur et applique la peinture via core_vehicle_partmgmt.setConfigPaints.

- `selectedIds` (*table<integer, integer>*) : IDs des objets sélectionnés.
- `fieldName` (*string*) : Nom du champ modifié.
- `fieldValue` (*string*) : Nouvelle valeur (chaîne de couleur).
- `arrayIndex` (*any*) : Index de tableau du champ (non utilisé).

#### `editor_veMain.onPreRender(dtReal, dtSim, dtRaw)`

Appelé chaque frame avant le rendu. Si aucun véhicule n'est suivi, initialise vEditor depuis le véhicule joueur (be:getPlayerVehicleID(0)). Sinon met à jour vEditor.vehiclePos puis émet le hook `onVehicleEditorRenderJBeams(dtReal, dtSim, dtRaw)`.

- `dtReal` (*number*) : Delta temps réel (s).
- `dtSim` (*number*) : Delta temps simulation (s).
- `dtRaw` (*number*) : Delta temps brut (s).

#### `editor_veMain.onSerialize()`

Sérialisation avant rechargement Lua : renvoie {editorMode = vEditor.editorMode}.

- **renvoie** : table Données à restaurer.

#### `editor_veMain.onVehicleSwitched(oldVehicle, newVehicle, player)`

Appelé au changement de véhicule joueur : recharge les données (vEditor.vehData, vdata, nodeCIDToName, vehicle) pour newVehicle.

- `oldVehicle` (*integer*) : ID de l'ancien véhicule.
- `newVehicle` (*integer*) : ID du nouveau véhicule.
- `player` (*integer*) : Index du joueur.

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table<integer, string> | Extensions chargées avant : {'core_vehicle_manager'}. |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onVehicleEditorRenderJBeams` — écouté par 5 module(s)

## Appels vers le moteur (C++)

- `FS:` `findFiles`
- `be:` `getPlayerVehicleID`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/veMain.lua`.*
