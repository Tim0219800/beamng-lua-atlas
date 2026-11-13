# `editor_cameraV2_orbit`

*Fichier : `lua/ge/extensions/editor/cameraV2/orbit.lua` · VM : Game Engine (GE) · 590 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_cameraV2_orbit` : `extensions.load("editor_cameraV2_orbit")`, puis la globale `editor_cameraV2_orbit`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_cameraV2_orbit.cancel()` |  | 576 |
| `editor_cameraV2_orbit.getDebugState()` |  | 563 |
| `editor_cameraV2_orbit.getPivot()` |  | 528 |
| `editor_cameraV2_orbit.getZoomPivot()` |  | 532 |
| `editor_cameraV2_orbit.hasPose()` |  | 524 |
| `editor_cameraV2_orbit.isActive()` |  | 515 |
| `editor_cameraV2_orbit.isOrbitActive()` |  | 520 |
| `editor_cameraV2_orbit.markForReacquire()` |  | 572 |
| `editor_cameraV2_orbit.onMouseInput(axis, value, mode, mouseButton)` | *(hook)* | 278 |
| `editor_cameraV2_orbit.reset()` |  | 584 |
| `editor_cameraV2_orbit.setPivot(pivot, source)` |  | 536 |
| `editor_cameraV2_orbit.syncDistanceFromCamera()` |  | 553 |
| `editor_cameraV2_orbit.update(mode, mouseButton, deltaTime)` |  | 495 |

## Appels vers le moteur (C++)

- `Engine.` `castRay`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/cameraV2/orbit.lua`.*
