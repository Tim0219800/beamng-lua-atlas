# `editor_ezObjectSelect_controller`

*Fichier : `lua/ge/extensions/editor/ezObjectSelect/controller.lua` · VM : Game Engine (GE) · 2383 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_ezObjectSelect_controller` : `extensions.load("editor_ezObjectSelect_controller")`, puis la globale `editor_ezObjectSelect_controller`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_ezObjectSelect_controller.activate()` |  | 1005 |
| `editor_ezObjectSelect_controller.deactivate()` |  | 1033 |
| `editor_ezObjectSelect_controller.drawScreenDebug()` |  | 508 |
| `editor_ezObjectSelect_controller.drawWorkspace()` |  | 1808 |
| `editor_ezObjectSelect_controller.invalidateSelectionCache(reason)` |  | 1112 |
| `editor_ezObjectSelect_controller.isActive()` |  | 1063 |
| `editor_ezObjectSelect_controller.loadPreferences()` |  | 2194 |
| `editor_ezObjectSelect_controller.onAxisGizmoAlignmentChanged()` | *(hook)* | 1098 |
| `editor_ezObjectSelect_controller.onAxisGizmoModeChanged(mode)` | *(hook)* | 1074 |
| `editor_ezObjectSelect_controller.onEditorPreferenceValueChanged(path, value)` | *(hook)* | 2263 |
| `editor_ezObjectSelect_controller.onEditorRegisterPreferences(prefsRegistry)` | *(hook)* | 2330 |
| `editor_ezObjectSelect_controller.refreshSelectedTint()` |  | 1067 |
| `editor_ezObjectSelect_controller.requestFocusShortcut()` |  | 1207 |
| `editor_ezObjectSelect_controller.requestNumpadPreset(preset)` |  | 1272 |
| `editor_ezObjectSelect_controller.requestRotateShortcut()` |  | 1154 |
| `editor_ezObjectSelect_controller.requestScaleShortcut()` |  | 1163 |
| `editor_ezObjectSelect_controller.requestTransformShortcut()` |  | 1145 |
| `editor_ezObjectSelect_controller.resetInputFilters()` |  | 410 |
| `editor_ezObjectSelect_controller.update()` |  | 1594 |

## Classe `prefUi`

| Méthode | Description | Ligne |
|---|---|---|
| `prefUi.boundsDepthTest(_, _, item)` |  | 2057 |
| `prefUi.clipMoveConstraintPlane(_, _, item)` |  | 2109 |
| `prefUi.debug(_, _, item)` |  | 1953 |
| `prefUi.discoveryRadius(_, _, item)` |  | 1967 |
| `prefUi.dragBoundsDepthTest(_, _, item)` |  | 2077 |
| `prefUi.labelPlacementMode(_, _, item)` |  | 2087 |
| `prefUi.maxDiscoveryOutlines(_, _, item)` |  | 1976 |
| `prefUi.maxPickDistance(_, _, item)` |  | 2001 |
| `prefUi.maxPickVolume(_, _, item)` |  | 2017 |
| `prefUi.maxStackDistance(_, _, item)` |  | 2026 |
| `prefUi.maxStackOutlines(_, _, item)` |  | 1985 |
| `prefUi.numpadMode(_, _, item)` |  | 2180 |
| `prefUi.orientationGizmoRightOffset(_, _, item)` |  | 2156 |
| `prefUi.orientationGizmoTopOffset(_, _, item)` |  | 2144 |
| `prefUi.outlineMode(_, _, item)` |  | 2042 |
| `prefUi.selectedBoundsDepthTest(_, _, item)` |  | 2067 |
| `prefUi.selectedTintEnabled(_, _, item)` |  | 2035 |
| `prefUi.selectionGizmoLengthScale(_, _, item)` |  | 2119 |
| `prefUi.selectionGizmoLineWidth(_, _, item)` |  | 2128 |
| `prefUi.showDistanceRing(_, _, item)` |  | 1994 |
| `prefUi.showHoverRing(_, _, item)` |  | 1960 |
| `prefUi.showMoveConstraintPlane(_, _, item)` |  | 2102 |
| `prefUi.showOrientationGizmo(_, _, item)` |  | 2137 |
| `prefUi.showVolumeFilteredObjects(_, _, item)` |  | 2010 |
| `prefUi.suppressCameraForGrs(_, _, item)` |  | 2168 |

## Appels vers le moteur (C++)

- `Engine.` `castRay`
- `debugDrawer:` `drawSphere`
- `obj:` `disableCollision`, `enableCollision`, `getID`, `getPosition`, `getTransform`, `getWorldBox`
- `scenetree.` `findObjectById`
- `worldEditorCppApi.` `setAxisGizmoHighlightSelectedMeshes`, `setAxisGizmoMode`, `setAxisGizmoSelectedElement`, `setHoveredObjectId`

**Charge les extensions :** `core_orthoCamera`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/ezObjectSelect/controller.lua`.*
