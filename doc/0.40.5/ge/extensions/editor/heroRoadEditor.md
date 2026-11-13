# `editor_heroRoadEditor`

*Fichier : `lua/ge/extensions/editor/heroRoadEditor.lua` · VM : Game Engine (GE) · 2905 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_heroRoadEditor` : `extensions.load("editor_heroRoadEditor")`, puis la globale `editor_heroRoadEditor`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_heroRoadEditor.onClientEndMission()` | Called when leaving the map. We need to remove all groups and templates. *(hook)* | 2888 |
| `editor_heroRoadEditor.onDeserialized(data)` | Deserialisation callback. *(hook)* | 270 |
| `editor_heroRoadEditor.onEditorGui()` | Main editor callback. *(hook)* | 2618 |
| `editor_heroRoadEditor.onEditorInitialized()` | Editor initialization. *(hook)* | 2862 |
| `editor_heroRoadEditor.onSerialize()` | Serialise callback. *(hook)* | 258 |
| `editor_heroRoadEditor.setSelectedNodeIdx(idx)` | Sets the selected node index (for cross-tool selection). | 233 |
| `editor_heroRoadEditor.setSelectedSplineIdx(idx)` | Sets the selected spline index (for cross-tool selection). | 230 |

## Appels vers le moteur (C++)

- `be:` `reloadCollision`
- `obj:` `getClassName`
- `scenetree.` `findObject`, `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/heroRoadEditor.lua`.*
