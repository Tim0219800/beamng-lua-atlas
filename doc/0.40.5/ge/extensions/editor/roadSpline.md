# `editor_roadSpline`

*Fichier : `lua/ge/extensions/editor/roadSpline.lua` · VM : Game Engine (GE) · 1699 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_roadSpline` : `extensions.load("editor_roadSpline")`, puis la globale `editor_roadSpline`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_roadSpline.onClientEndMission()` | Called when leaving the map. We need to remove all groups and templates. *(hook)* | 1680 |
| `editor_roadSpline.onDeserialized(data)` | Deserialisation callback. *(hook)* | 162 |
| `editor_roadSpline.onEditorGui()` | Main editor callback. *(hook)* | 1504 |
| `editor_roadSpline.onEditorInitialized()` | Editor initialization. *(hook)* | 1657 |
| `editor_roadSpline.onSerialize()` | Serialise callback. *(hook)* | 144 |
| `editor_roadSpline.setLockedById(id, isLocked)` | Locks/unlocks the road spline with this id and rebuilds it now (also used by the Master Spline for linked children). | 86 |
| `editor_roadSpline.setSelectedNodeIdx(idx)` | Sets the selected node index (for cross-tool selection). | 119 |
| `editor_roadSpline.setSelectedSplineIdx(idx)` | Sets the selected spline index (for cross-tool selection). | 116 |

## Appels vers le moteur (C++)

- `obj:` `getClassName`
- `scenetree.` `findObject`, `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/roadSpline.lua`.*
