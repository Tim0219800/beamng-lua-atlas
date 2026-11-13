# `editor_ezObjectSelect_subtools_fence_session`

*Fichier : `lua/ge/extensions/editor/ezObjectSelect/subtools/fence/session.lua` · VM : Game Engine (GE) · 775 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_ezObjectSelect_subtools_fence_session` : `extensions.load("editor_ezObjectSelect_subtools_fence_session")`, puis la globale `editor_ezObjectSelect_subtools_fence_session`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_ezObjectSelect_subtools_fence_session.begin(options)` |  | 520 |
| `editor_ezObjectSelect_subtools_fence_session.cancel()` |  | 722 |
| `editor_ezObjectSelect_subtools_fence_session.deleteAndCommit()` |  | 698 |
| `editor_ezObjectSelect_subtools_fence_session.exitAndCommit()` |  | 664 |
| `editor_ezObjectSelect_subtools_fence_session.getNodeCount()` |  | 751 |
| `editor_ezObjectSelect_subtools_fence_session.getPieceCount()` |  | 743 |
| `editor_ezObjectSelect_subtools_fence_session.getSelectedPieceCount()` |  | 747 |
| `editor_ezObjectSelect_subtools_fence_session.getStatusMessage()` |  | 770 |
| `editor_ezObjectSelect_subtools_fence_session.isActive()` |  | 735 |
| `editor_ezObjectSelect_subtools_fence_session.isCapped()` |  | 759 |
| `editor_ezObjectSelect_subtools_fence_session.isDragging()` |  | 739 |
| `editor_ezObjectSelect_subtools_fence_session.isLoop()` |  | 755 |
| `editor_ezObjectSelect_subtools_fence_session.setNoOverlap(enabled)` |  | 763 |
| `editor_ezObjectSelect_subtools_fence_session.update(canAcceptInput)` |  | 616 |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onEditorObjectAdded` — écouté par 3 module(s)

## Appels vers le moteur (C++)

- `Engine.` `generateUUID`
- `Sim.` `deserializeObjectsFromText`
- `be:` `reloadCollision`
- `debugDrawer:` `drawSphere`
- `obj:` `delete`, `disableCollision`, `enableCollision`, `getGroup`, `getID`, `registerObject`, `serialize`, `setField`, `setHidden`, `setPosRot`, `setRenderEnabled`
- `scenetree.` `findObjectById`
- `worldEditorCppApi.` `setAxisGizmoSelectedElement`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/ezObjectSelect/subtools/fence/session.lua`.*
