# `gameplay_rally_notebook_pacenoteGenerator`

*Fichier : `lua/ge/extensions/gameplay/rally/notebook/pacenoteGenerator.lua` · VM : Game Engine (GE) · 287 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_rally_notebook_pacenoteGenerator` : `extensions.load("gameplay_rally_notebook_pacenoteGenerator")`, puis la globale `gameplay_rally_notebook_pacenoteGenerator`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_rally_notebook_pacenoteGenerator.detectCorners(pointList, params)` | Main function: detect corners from a list of driveline points<br> @param pointList: array of driveline points with .pos property<br> @param params: optional parameter table (uses defaultParams if nil)<br> @return table with `sections` for debug drawing and `corners` for pacenote generation. | 218 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `defaultParams` | table |  |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/rally/notebook/pacenoteGenerator.lua`.*
