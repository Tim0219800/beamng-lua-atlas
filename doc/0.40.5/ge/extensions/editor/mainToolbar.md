# `editor_mainToolbar`

*Fichier : `lua/ge/extensions/editor/mainToolbar.lua` · VM : Game Engine (GE) · 1572 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_mainToolbar` : `extensions.load("editor_mainToolbar")`, puis la globale `editor_mainToolbar`

Barre d'outils principale (fenêtre « Main Toolbar ») du World Editor. Elle contient les boutons généraux (nouveau/ouvrir/sauvegarder niveau…), les boutons de gizmo d'axe (grille, snap de rotation et d'échelle), la caméra, l'heure du jour et l'exposition, ainsi que la liste des modes d'édition regroupables en « sets » enregistrés dans un fichier. Les autres extensions peuvent y ajouter des boutons via les hooks émis.

## Remarques

- Hooks émis : onEditorGuiGeneralToolbar (boutons généraux), onEditorGuiEditModesToolbar et onEditorGuiEditModeToolbar (modes d'édition).
- Ne dessine rien en mode headless ni tant que editor.menuHeight n'est pas défini (menu principal pas encore dessiné).
- À la désactivation de l'éditeur, restaure l'auto-exposition et l'EV manuel de PostEffectLocalExposureObject modifiés depuis la barre.
- Préférence ui.general.enableVehicleControls : active/désactive les action maps VehicleCommonActionMap et VehicleSpecificActionMap.

**Dépendances (chargées avant) :** `core_environment`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_mainToolbar.onEditorDeactivated()` | Appelé à la désactivation de l'éditeur : restaure l'exposition initiale si elle avait été modifiée. *(interne)* *(hook)* | 1553 |
| `editor_mainToolbar.onEditorGuiToolBar()` | Dessine la fenêtre de la barre d'outils à chaque frame et émet les hooks de barre d'outils. *(interne)* *(hook)* | 895 |
| `editor_mainToolbar.onEditorInitialized()` | Enregistre et affiche la fenêtre « mainToolbar » et charge les sets de modes d'édition depuis le fichier. *(interne)* *(hook)* | 1529 |
| `editor_mainToolbar.onEditorLoadState(state)` | Appelé au chargement de l'état de l'éditeur. Corps vide. *(interne)* *(hook)* | 1550 |
| `editor_mainToolbar.onEditorPreferenceValueChanged(path, value)` | Si ui.general.enableVehicleControls change, active/désactive les action maps véhicule. *(interne)* *(hook)* | 1536 |
| `editor_mainToolbar.onEditorSaveState(state)` | Appelé à la sauvegarde de l'état de l'éditeur. Corps vide. *(interne)* *(hook)* | 1547 |

### Détail des paramètres

#### `editor_mainToolbar.onEditorLoadState(state)`

Appelé au chargement de l'état de l'éditeur. Corps vide.

- `state` (*table*) : État de l'éditeur.

#### `editor_mainToolbar.onEditorPreferenceValueChanged(path, value)`

Si ui.general.enableVehicleControls change, active/désactive les action maps véhicule.

- `path` (*string*) : Chemin de la préférence.
- `value` (*any*) : Nouvelle valeur.

#### `editor_mainToolbar.onEditorSaveState(state)`

Appelé à la sauvegarde de l'état de l'éditeur. Corps vide.

- `state` (*table*) : État de l'éditeur.

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table<integer, string> | {'core_environment'}. |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onEditorGuiEditModeToolbar`
- `onEditorGuiEditModesToolbar`
- `onEditorGuiGeneralToolbar`

## Appels vers le moteur (C++)

- `FS:` `fileExists`
- `core_environment.` `getTimeOfDay`, `setTimeOfDay`
- `scenetree.` `findObject`
- `worldEditorCppApi.` `getGridSize`, `getRotateSnapAngle`, `setGridSnap`, `setRotateSnap`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/mainToolbar.lua`.*
