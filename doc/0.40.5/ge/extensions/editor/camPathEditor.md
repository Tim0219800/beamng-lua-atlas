# `editor_camPathEditor`

*Fichier : `lua/ge/extensions/editor/camPathEditor.lua` · VM : Game Engine (GE) · 2496 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_camPathEditor` : `extensions.load("editor_camPathEditor")`, puis la globale `editor_camPathEditor`

**Dépendances (chargées avant) :** `core_camera`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_camPathEditor.getTrackingOffset()` | Function to provide tracking offset to core camera system | 2476 |
| `editor_camPathEditor.onClientStartMission()` | *(hook)* | 2471 |
| `editor_camPathEditor.onEditorGui()` | *(hook)* | 2020 |
| `editor_camPathEditor.onEditorInitialized()` | *(hook)* | 2453 |
| `editor_camPathEditor.onPreRender()` | *(hook)* | 2433 |
| `editor_camPathEditor.onUpdate(dtReal, dtSim, dtRaw)` | *(hook)* | 2429 |
| `editor_camPathEditor.selectPath(path)` |  | 127 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table |  |
| `onExtensionLoaded` | any |  ⚠ référence `onExtensionLoaded` non définie dans le fichier (vaut probablement nil) |

## Appels vers le moteur (C++)

- `FS:` `fileExists`
- `debugDrawer:` `drawLineInstance`, `drawSphere`, `drawText`, `drawTriSolid`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/camPathEditor.lua`.*
