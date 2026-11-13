# `editor_cameraV2_controller`

*Fichier : `lua/ge/extensions/editor/cameraV2/controller.lua` · VM : Game Engine (GE) · 530 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_cameraV2_controller` : `extensions.load("editor_cameraV2_controller")`, puis la globale `editor_cameraV2_controller`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_cameraV2_controller.activate()` |  | 458 |
| `editor_cameraV2_controller.cancel()` |  | 463 |
| `editor_cameraV2_controller.consumeFocusDoubleClick()` |  | 291 |
| `editor_cameraV2_controller.deactivate()` |  | 477 |
| `editor_cameraV2_controller.lastZoomUsedTerrainOnly()` |  | 483 |
| `editor_cameraV2_controller.onEditorMouseWheel(value)` | *(hook)* | 346 |
| `editor_cameraV2_controller.onRelativeInput(axis, value, player)` | *(hook)* | 358 |
| `editor_cameraV2_controller.orbitDebugState()` |  | 487 |
| `editor_cameraV2_controller.panDebugState()` |  | 491 |
| `editor_cameraV2_controller.setPlanarTranslation(planar)` |  | 504 |
| `editor_cameraV2_controller.update(deltaTime)` |  | 397 |

## Appels vers le moteur (C++)

- `Engine.` `castRay`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/cameraV2/controller.lua`.*
