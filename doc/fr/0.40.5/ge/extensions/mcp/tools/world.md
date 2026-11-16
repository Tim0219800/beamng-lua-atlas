# `mcp_tools_world`

*Fichier : `lua/ge/extensions/mcp/tools/world.lua` · VM : Game Engine (GE) · 117 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `mcp_tools_world` : `extensions.load("mcp_tools_world")`, puis la globale `mcp_tools_world`

Outils MCP « monde » : lister et charger des niveaux, déclencher une action d'entrée liée (comme une touche), récupérer ou supprimer un véhicule, et interroger le sol (hauteur, adhérence/drivabilité) en un point.

## Remarques

- Incohérence : list_levels renvoie la clé `file` pour chaque niveau, alors que la description du schéma annonce `[{name, title, path}]`.
- load_level est disruptif (recharge le monde). Il cherche le niveau par levelName dans core_levels.getList(), sinon par path.getPathLevelMain(name).
- trigger_action utilise core_input_actions.triggerDown/triggerUp/triggerDownUp ; sans state c'est un appui bref.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `mcp_tools_world.get_ground_at_point(args)` | Hauteur de surface sous un point (be:getSurfaceHeightBelow) et drivabilité du terrain (be:getTerrainDrivability) dans un rayon. | 67 |
| `mcp_tools_world.list_levels()` | Liste les niveaux installés : name (levelName), title, file (fullfilename ou misFilePath). | 12 |
| `mcp_tools_world.load_level(args)` | Charge un niveau (core_levels.startLevel) par chemin ou par nom. | 22 |
| `mcp_tools_world.recover_vehicle(args)` | Replace le véhicule sur la dernière route et le répare (spawn.teleportToLastRoad avec resetVehicle). | 49 |
| `mcp_tools_world.remove_vehicle(args)` | Supprime un véhicule (veh:delete()). | 58 |
| `mcp_tools_world.trigger_action(args)` | Déclenche une action d'entrée du jeu par son nom (ex. recover_vehicle, toggleCamera, switch_next_vehicle). | 38 |

### Détail des paramètres

#### `mcp_tools_world.get_ground_at_point(args)`

Hauteur de surface sous un point (be:getSurfaceHeightBelow) et drivabilité du terrain (be:getTerrainDrivability) dans un rayon.

- `args` (*table|nil*) : {pos?: {x,y,z} (défaut position du véhicule joueur), radius?: number m (défaut 2)}
- **renvoie** : string JSON {pos, surfaceHeight, drivability}.
- **renvoie** : boolean true si aucun point.

#### `mcp_tools_world.list_levels()`

Liste les niveaux installés : name (levelName), title, file (fullfilename ou misFilePath).

- **renvoie** : string JSON.
- **renvoie** : boolean true si core_levels indisponible.

#### `mcp_tools_world.load_level(args)`

Charge un niveau (core_levels.startLevel) par chemin ou par nom.

- `args` (*table*) : {path?: string, name?: string}
- **renvoie** : string « loading level: … ».
- **renvoie** : boolean true en cas d'erreur.

#### `mcp_tools_world.recover_vehicle(args)`

Replace le véhicule sur la dernière route et le répare (spawn.teleportToLastRoad avec resetVehicle).

- `args` (*table|nil*) : {id?: integer}
- **renvoie** : string Message.
- **renvoie** : boolean true en cas d'erreur.

#### `mcp_tools_world.remove_vehicle(args)`

Supprime un véhicule (veh:delete()).

- `args` (*table|nil*) : {id?: integer}
- **renvoie** : string Message.
- **renvoie** : boolean true si le véhicule n'existe pas.

#### `mcp_tools_world.trigger_action(args)`

Déclenche une action d'entrée du jeu par son nom (ex. recover_vehicle, toggleCamera, switch_next_vehicle).

- `args` (*table*) : {action: string, state?: 'down'|'up'}
- **renvoie** : string Message.
- **renvoie** : boolean true en cas d'erreur.

## Champs

| Champ | Type | Description |
|---|---|---|
| `schemas` | table<string, table> | Schémas des outils monde. |

## Appels vers le moteur (C++)

- `be:` `getPlayerVehicle`, `getSurfaceHeightBelow`, `getTerrainDrivability`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/mcp/tools/world.lua`.*
