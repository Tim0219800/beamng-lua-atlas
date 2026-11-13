# `editor_ezObjectSelect_nativeGizmo`

*Fichier : `lua/ge/extensions/editor/ezObjectSelect/nativeGizmo.lua` · VM : Game Engine (GE) · 375 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_ezObjectSelect_nativeGizmo` : `extensions.load("editor_ezObjectSelect_nativeGizmo")`, puis la globale `editor_ezObjectSelect_nativeGizmo`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_ezObjectSelect_nativeGizmo.consumeFinished()` |  | 355 |
| `editor_ezObjectSelect_nativeGizmo.draw(options)` |  | 332 |
| `editor_ezObjectSelect_nativeGizmo.isInteracting()` |  | 351 |
| `editor_ezObjectSelect_nativeGizmo.reset()` |  | 363 |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onEditorObjectSelectionTransformChanged`

## Appels vers le moteur (C++)

- `Sim.` `upcast`
- `obj:` `getField`, `getScale`, `getTransform`, `setScale`, `setTransform`
- `scenetree.` `findObjectById`
- `ui_imgui.` `IsMouseDown`
- `worldEditorCppApi.` `getAxisGizmoScaleOffset`, `getAxisGizmoTranslateOffset`, `getGridSize`, `getRotateSnapAngle`, `setAxisGizmoSelectedElement`, `setGridSnap`, `setRotateSnap`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/ezObjectSelect/nativeGizmo.lua`.*
