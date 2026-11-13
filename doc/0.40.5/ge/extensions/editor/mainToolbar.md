# `editor_mainToolbar`

*Fichier : `lua/ge/extensions/editor/mainToolbar.lua` · VM : Game Engine (GE) · 1572 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_mainToolbar` : `extensions.load("editor_mainToolbar")`, puis la globale `editor_mainToolbar`

**Dépendances (chargées avant) :** `core_environment`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_mainToolbar.onEditorDeactivated()` | *(hook)* | 1553 |
| `editor_mainToolbar.onEditorGuiToolBar()` | *(hook)* | 895 |
| `editor_mainToolbar.onEditorInitialized()` | *(hook)* | 1529 |
| `editor_mainToolbar.onEditorLoadState(state)` | *(hook)* | 1550 |
| `editor_mainToolbar.onEditorPreferenceValueChanged(path, value)` | *(hook)* | 1536 |
| `editor_mainToolbar.onEditorSaveState(state)` | *(hook)* | 1547 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table |  |

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
