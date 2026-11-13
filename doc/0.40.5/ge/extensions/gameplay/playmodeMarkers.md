# `gameplay_playmodeMarkers`

*Fichier : `lua/ge/extensions/gameplay/playmodeMarkers.lua` · VM : Game Engine (GE) · 219 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_playmodeMarkers` : `extensions.load("gameplay_playmodeMarkers")`, puis la globale `gameplay_playmodeMarkers`

**Dépendances (chargées avant) :** `gameplay_rawPois`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_playmodeMarkers.clear()` |  | 49 |
| `gameplay_playmodeMarkers.getBigmapRendererId()` |  | 102 |
| `gameplay_playmodeMarkers.getBigmapRendererObj()` |  | 106 |
| `gameplay_playmodeMarkers.getIconRendererId()` |  | 94 |
| `gameplay_playmodeMarkers.getIconRendererObj()` |  | 98 |
| `gameplay_playmodeMarkers.getMarkerForCluster(cluster)` |  | 178 |
| `gameplay_playmodeMarkers.getPlaymodeClusters()` |  | 153 |
| `gameplay_playmodeMarkers.getPlaymodeClustersAsQuadtree()` | change to KD Tree? | 164 |
| `gameplay_playmodeMarkers.isStateWithPlaymodeMarkers()` |  | 196 |
| `gameplay_playmodeMarkers.onClientEndMission()` | *(hook)* | 205 |
| `gameplay_playmodeMarkers.onClientStartMission()` | *(hook)* | 79 |
| `gameplay_playmodeMarkers.onSerialize()` | *(hook)* | 211 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table |  |
| `validPlaymodeMarkersStates` | table | this can be adjusted to allow other states to have playmode markers |

## Appels vers le moteur (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/playmodeMarkers.lua`.*
