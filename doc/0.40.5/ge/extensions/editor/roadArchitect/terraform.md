# `editor_roadArchitect_terraform`

*Fichier : `lua/ge/extensions/editor/roadArchitect/terraform.lua` · VM : Game Engine (GE) · 741 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_roadArchitect_terraform` : `extensions.load("editor_roadArchitect_terraform")`, puis la globale `editor_roadArchitect_terraform`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_roadArchitect_terraform.conformTerrainToRoad(rIdx, DOI, margin)` | Conforms the local terrain to the road. | 303 |
| `editor_roadArchitect_terraform.getRoadMasks(DOI, margin, group)` | Returns the road masks for the given road group (roads only and roads + margins). | 672 |
| `editor_roadArchitect_terraform.setHeightmapFromPng(path)` | Imports a terrain from the given path. | 632 |
| `editor_roadArchitect_terraform.terraformMultiRoads(DOI, margin, group)` | Terraforms the whole terrain block to the existing road network (or the group with the given index).<br> [Does not include overlays or bridges]. | 451 |
| `editor_roadArchitect_terraform.writeHeightmapToPng(path)` | Saves the heightmap to the given .png file. | 604 |

## Appels vers le moteur (C++)

- `scenetree.` `findClassObjects`, `findObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/roadArchitect/terraform.lua`.*
