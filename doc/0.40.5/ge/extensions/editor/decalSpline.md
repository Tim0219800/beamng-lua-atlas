# `editor_decalSpline`

*Fichier : `lua/ge/extensions/editor/decalSpline.lua` · VM : Game Engine (GE) · 1764 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_decalSpline` : `extensions.load("editor_decalSpline")`, puis la globale `editor_decalSpline`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_decalSpline.onClientEndMission()` | Called when leaving the map. We need to remove all decal splines. *(hook)* | 1745 |
| `editor_decalSpline.onDeserialized(data)` | Deserialise callback. *(hook)* | 127 |
| `editor_decalSpline.onEditorGui()` | World editor main callback. *(hook)* | 1664 |
| `editor_decalSpline.onEditorInitialized()` | Called upon world editor initialisation. *(hook)* | 1731 |
| `editor_decalSpline.onSerialize()` | Serialise callback. *(hook)* | 108 |
| `editor_decalSpline.setLockedById(id, isLocked)` | Locks/unlocks the decal spline with this id and rebuilds it now (also used by the Master Spline for linked children). Its<br> decals save through the decal persistence manager either way, so the lock only makes the spline uneditable. | 96 |
| `editor_decalSpline.setSelectedNodeIdx(idx)` | Sets the selected node index (for cross-tool selection). | 92 |
| `editor_decalSpline.setSelectedSplineIdx(idx)` | Sets the selected spline index (for cross-tool selection). | 89 |

## Appels vers le moteur (C++)

- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/decalSpline.lua`.*
