# `editor_roadEditor`

*Fichier : `lua/ge/extensions/editor/roadEditor.lua` · VM : Game Engine (GE) · 2367 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_roadEditor` : `extensions.load("editor_roadEditor")`, puis la globale `editor_roadEditor`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_roadEditor.cycleHoveredRoadsAM(value)` |  | 2150 |
| `editor_roadEditor.onEditorInitialized()` | *(hook)* | 2315 |
| `editor_roadEditor.onEditorInspectorHeaderGui(inspectorInfo)` | *(hook)* | 1213 |
| `editor_roadEditor.onEditorObjectSelectionChanged()` | *(hook)* | 2275 |
| `editor_roadEditor.onEditorPreferenceValueChanged(path, value)` | *(hook)* | 2220 |
| `editor_roadEditor.onEditorRegisterPreferences(prefsRegistry)` | *(hook)* | 2226 |
| `editor_roadEditor.onExtensionLoaded()` | *(hook)* | 2072 |
| `editor_roadEditor.onPreRender()` | *(hook)* | 2077 |

## Appels vers le moteur (C++)

- `Engine.` `sceneGetCameraFrustum`
- `FS:` `fileExists`
- `debugDrawer:` `drawLine`, `drawLineInstance`, `drawSphere`, `drawSquarePrism`, `drawTextAdvanced`, `drawTriSolid`
- `scenetree.` `decalRoadContainsPoint`, `findObjectById`
- `worldEditorCppApi.` `setUpdateDecalRoadsOnStaticMeshTransform`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/roadEditor.lua`.*
