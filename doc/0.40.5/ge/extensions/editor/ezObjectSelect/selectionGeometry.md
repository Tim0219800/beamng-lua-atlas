# `editor_ezObjectSelect_selectionGeometry`

*Fichier : `lua/ge/extensions/editor/ezObjectSelect/selectionGeometry.lua` · VM : Game Engine (GE) · 473 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_ezObjectSelect_selectionGeometry` : `extensions.load("editor_ezObjectSelect_selectionGeometry")`, puis la globale `editor_ezObjectSelect_selectionGeometry`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_ezObjectSelect_selectionGeometry.boundsSignaturesEqual(first, second)` |  | 91 |
| `editor_ezObjectSelect_selectionGeometry.createCameraContext()` |  | 99 |
| `editor_ezObjectSelect_selectionGeometry.createProjectedProxy(obj, camera, boundsSignature)` |  | 414 |
| `editor_ezObjectSelect_selectionGeometry.createProxy(obj, camera, mousePosition, rayOrigin, rayDirection)` |  | 464 |
| `editor_ezObjectSelect_selectionGeometry.getBoundsSignature(obj, result)` |  | 55 |
| `editor_ezObjectSelect_selectionGeometry.getObjectVolume(obj)` |  | 185 |
| `editor_ezObjectSelect_selectionGeometry.getWorldCorners(obj)` |  | 181 |
| `editor_ezObjectSelect_selectionGeometry.updateCursorMetrics(proxy, mousePosition)` |  | 449 |
| `editor_ezObjectSelect_selectionGeometry.updateRayEntry(proxy, rayOrigin, rayDirection)` |  | 458 |
| `editor_ezObjectSelect_selectionGeometry.validBox(box)` |  | 23 |

## Appels vers le moteur (C++)

- `Engine.` `castRay`, `sceneGetCameraFrustum`
- `obj:` `getID`, `getObjBox`, `getScale`, `getTransform`, `getWorldBox`, `isSubClassOf`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/ezObjectSelect/selectionGeometry.lua`.*
