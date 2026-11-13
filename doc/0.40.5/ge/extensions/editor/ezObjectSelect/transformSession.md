# `editor_ezObjectSelect_transformSession`

*Fichier : `lua/ge/extensions/editor/ezObjectSelect/transformSession.lua` · VM : Game Engine (GE) · 565 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_ezObjectSelect_transformSession` : `extensions.load("editor_ezObjectSelect_transformSession")`, puis la globale `editor_ezObjectSelect_transformSession`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_ezObjectSelect_transformSession.begin(anchorObject, options)` |  | 133 |
| `editor_ezObjectSelect_transformSession.cancel()` |  | 458 |
| `editor_ezObjectSelect_transformSession.finish()` |  | 364 |
| `editor_ezObjectSelect_transformSession.getDesiredAnchorPosition(surfacePosition, options)` |  | 191 |
| `editor_ezObjectSelect_transformSession.getObjectIds()` |  | 557 |
| `editor_ezObjectSelect_transformSession.isActive()` |  | 539 |
| `editor_ezObjectSelect_transformSession.resetRotation(objectIds)` |  | 497 |
| `editor_ezObjectSelect_transformSession.selectionMatches()` |  | 543 |
| `editor_ezObjectSelect_transformSession.setGrabSurface(surfacePosition, maintainRelativeZ, verticalOffset)` |  | 162 |
| `editor_ezObjectSelect_transformSession.update(surfacePosition, surfaceNormal, options)` |  | 331 |
| `editor_ezObjectSelect_transformSession.updateDelta(delta, options)` |  | 198 |
| `editor_ezObjectSelect_transformSession.updateRotation(pivot, axis, angle)` |  | 245 |
| `editor_ezObjectSelect_transformSession.updateScale(pivot, axes, factors)` |  | 268 |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onEditorObjectSelectionTransformChanged`

## Appels vers le moteur (C++)

- `Sim.` `findObjectById`, `upcast`
- `obj:` `getScale`, `getTransform`, `setScale`, `setTransform`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/ezObjectSelect/transformSession.lua`.*
