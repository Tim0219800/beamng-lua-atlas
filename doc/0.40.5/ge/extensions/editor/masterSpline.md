# `editor_masterSpline`

*Fichier : `lua/ge/extensions/editor/masterSpline.lua` · VM : Game Engine (GE) · 1954 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_masterSpline` : `extensions.load("editor_masterSpline")`, puis la globale `editor_masterSpline`

**Dépendances (chargées avant) :** `editor_assemblySpline`, `editor_decalSpline`, `editor_meshSpline`, `editor_roadSpline`, `editor_treeSpline`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_masterSpline.onClientEndMission()` | Called when leaving the map. We need to remove all Master Splines. *(hook)* | 1922 |
| `editor_masterSpline.onDeserialized(data)` | Deserialisation callback. *(hook)* | 203 |
| `editor_masterSpline.onEditorGui()` | Main editor callback. *(hook)* | 1788 |
| `editor_masterSpline.onEditorInitialized()` | Editor initialisation. *(hook)* | 1908 |
| `editor_masterSpline.onSerialize()` | Serialisation callback. *(hook)* | 183 |
| `editor_masterSpline.setSelectedNodeIdx(idx)` | Sets the selected node index (for cross-tool selection). | 145 |
| `editor_masterSpline.setSelectedSplineIdx(idx)` | Sets the selected spline index (for cross-tool selection). | 142 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table | Dependencies (ensures proper serialisation order). |

## Appels vers le moteur (C++)

- `be:` `reloadCollision`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/masterSpline.lua`.*
