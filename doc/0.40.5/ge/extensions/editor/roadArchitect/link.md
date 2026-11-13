# `editor_roadArchitect_link`

*Fichier : `lua/ge/extensions/editor/roadArchitect/link.lua` · VM : Game Engine (GE) · 1478 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_roadArchitect_link` : `extensions.load("editor_roadArchitect_link")`, puis la globale `editor_roadArchitect_link`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_roadArchitect_link.computePossibleJct(rIdx, nIdx, rIdxs, nIdxs)` | Computes a structure contain the data for a candidate junction. | 1071 |
| `editor_roadArchitect_link.computePossibleLinks(rIdx1, nIdx1, rIdxs, nIdxs)` | Computes a collection of possible linkages between two given roads. | 371 |
| `editor_roadArchitect_link.createSplitJunction(candJct)` | Creates the proposed junction which will split an existing road, place a T-junction in, and join to the new trunk and second road. | 1180 |
| `editor_roadArchitect_link.joinRoads(link)` | Join the roads described by the given linkage data. | 1020 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/roadArchitect/link.lua`.*
