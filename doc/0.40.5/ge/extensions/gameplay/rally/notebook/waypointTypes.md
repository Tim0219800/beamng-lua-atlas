# `gameplay_rally_notebook_waypointTypes`

*Fichier : `lua/ge/extensions/gameplay/rally/notebook/waypointTypes.lua` · VM : Game Engine (GE) · 25 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_rally_notebook_waypointTypes` : `extensions.load("gameplay_rally_notebook_waypointTypes")`, puis la globale `gameplay_rally_notebook_waypointTypes`

Constantes des types de waypoints d'une pacenote de rallye : début de virage ("cornerStart") et fin de virage ("cornerEnd"). Fournit aussi une fonction qui abrège ces types en "Cs" / "Ce" pour l'affichage dans l'éditeur.

## Exemple

```lua
local wpt = require('gameplay_rally_notebook_waypointTypes')
print(wpt.shortenWaypointType(wpt.wpTypeCornerStart)) -- "Cs"
```

## Remarques

- shortenWaypointType renvoie nil pour tout type autre que cornerStart/cornerEnd.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_rally_notebook_waypointTypes.shortenWaypointType(wpType)` | Renvoie l'abréviation d'un type de waypoint : "Cs" pour cornerStart, "Ce" pour cornerEnd, nil sinon. | 15 |

### Détail des paramètres

#### `gameplay_rally_notebook_waypointTypes.shortenWaypointType(wpType)`

Renvoie l'abréviation d'un type de waypoint : "Cs" pour cornerStart, "Ce" pour cornerEnd, nil sinon.

- `wpType` (*string*) : Type de waypoint (wpTypeCornerStart ou wpTypeCornerEnd).
- **renvoie** : string|nil Abréviation, ou nil si le type est inconnu.

## Champs

| Champ | Type | Description |
|---|---|---|
| `wpTypeCornerEnd` | string | Valeur "cornerEnd" : waypoint de fin de virage. |
| `wpTypeCornerStart` | string | Valeur "cornerStart" : waypoint de début de virage. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/rally/notebook/waypointTypes.lua`.*
