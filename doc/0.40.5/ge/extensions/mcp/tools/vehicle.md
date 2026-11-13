# `mcp_tools_vehicle`

*Fichier : `lua/ge/extensions/mcp/tools/vehicle.lua` · VM : Game Engine (GE) · 165 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `mcp_tools_vehicle` : `extensions.load("mcp_tools_vehicle")`, puis la globale `mcp_tools_vehicle`

Outils MCP véhicules : lister, détailler, fichiers JBeam et arbre de parts, journal d'instabilité physique, reset/rechargement du véhicule joueur, lecture et écriture de la pose (position + rotation).

## Remarques

- get_instability vide le tampon après lecture, sauf si clear=false ; le journal garde 50 événements maximum ({time, vid, jbeam}).
- get_position/set_position utilisent la rotation en quaternion {x,y,z,w} calculée avec quatFromDir(direction, haut) ; set_position passe par spawn.safeTeleport (téléporte et répare).
- reset_vehicle et reload_vehicle ne concernent que le véhicule joueur 0 (pas d'argument id).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `mcp_tools_vehicle.get_instability(args)` | Renvoie les instabilités physiques journalisées et vide le tampon par défaut. | 86 |
| `mcp_tools_vehicle.get_part_tree(args)` | Config de parts sous forme de table chemin de slot -> nom de part choisie (config.partsTree aplati). | 72 |
| `mcp_tools_vehicle.get_player_vehicle_id()` | Id du véhicule joueur 0 (be:getPlayerVehicleID(0)) sous forme de texte. | 33 |
| `mcp_tools_vehicle.get_position(args)` | Pose d'un véhicule : pos {x,y,z} et rot quaternion {x,y,z,w}. | 107 |
| `mcp_tools_vehicle.get_vehicle(args)` | Détails : id, jbeam, name, configKey, pcFile, position, speed (m/s). | 37 |
| `mcp_tools_vehicle.get_vehicle_files(args)` | Fichiers utilisés : vehicleDirectory, directoriesLoaded, pcFile et liste triée des fichiers JBeam des parts actives (jbeam/io getPart). | 55 |
| `mcp_tools_vehicle.get_vehicles()` | Liste les véhicules spawnés : id, jbeam, nom d'affichage (marque + nom). | 18 |
| `mcp_tools_vehicle.onInstabilityDetected(vid, returnData)` | Hook moteur (relayé par mcp_tools) appelé quand la physique détecte un véhicule instable : ajoute {time, vid, jbeam} à shared.instabilityLog (50 max). *(interne)* *(hook)* | 11 |
| `mcp_tools_vehicle.reload_vehicle()` | Recharge le véhicule joueur depuis le disque (core_vehicle_manager.reloadVehicle(0)), ce qui relit ses JBeam. | 99 |
| `mcp_tools_vehicle.reset_vehicle()` | Réinitialise/répare sur place le véhicule joueur (be:resetVehicle(0)). | 92 |
| `mcp_tools_vehicle.set_position(args)` | Téléporte un véhicule à une pose via spawn.safeTeleport ; rot facultatif (garde le cap actuel). | 117 |

### Détail des paramètres

#### `mcp_tools_vehicle.get_instability(args)`

Renvoie les instabilités physiques journalisées et vide le tampon par défaut.

- `args` (*table|nil*) : {clear?: boolean} false pour conserver.
- **renvoie** : string JSON {count, events}.
- **renvoie** : boolean false.

#### `mcp_tools_vehicle.get_part_tree(args)`

Config de parts sous forme de table chemin de slot -> nom de part choisie (config.partsTree aplati).

- `args` (*table|nil*) : {id?: integer}
- **renvoie** : string JSON.
- **renvoie** : boolean true si pas d'arbre.

#### `mcp_tools_vehicle.get_player_vehicle_id()`

Id du véhicule joueur 0 (be:getPlayerVehicleID(0)) sous forme de texte.

- **renvoie** : string Id.
- **renvoie** : boolean false.

#### `mcp_tools_vehicle.get_position(args)`

Pose d'un véhicule : pos {x,y,z} et rot quaternion {x,y,z,w}.

- `args` (*table|nil*) : {id?: integer}
- **renvoie** : string JSON {id, pos, rot}.
- **renvoie** : boolean true si le véhicule n'existe pas.

#### `mcp_tools_vehicle.get_vehicle(args)`

Détails : id, jbeam, name, configKey, pcFile, position, speed (m/s).

- `args` (*table|nil*) : {id?: integer}
- **renvoie** : string JSON.
- **renvoie** : boolean true si le véhicule n'existe pas.

#### `mcp_tools_vehicle.get_vehicle_files(args)`

Fichiers utilisés : vehicleDirectory, directoriesLoaded, pcFile et liste triée des fichiers JBeam des parts actives (jbeam/io getPart).

- `args` (*table|nil*) : {id?: integer}
- **renvoie** : string JSON.
- **renvoie** : boolean true si aucune donnée véhicule.

#### `mcp_tools_vehicle.get_vehicles()`

Liste les véhicules spawnés : id, jbeam, nom d'affichage (marque + nom).

- **renvoie** : string JSON.
- **renvoie** : boolean false.

#### `mcp_tools_vehicle.onInstabilityDetected(vid, returnData)`

Hook moteur (relayé par mcp_tools) appelé quand la physique détecte un véhicule instable : ajoute {time, vid, jbeam} à shared.instabilityLog (50 max).

- `vid` (*integer*) : Id du véhicule.
- `returnData` (*any*) : Fourni par le moteur, non utilisé.

#### `mcp_tools_vehicle.reload_vehicle()`

Recharge le véhicule joueur depuis le disque (core_vehicle_manager.reloadVehicle(0)), ce qui relit ses JBeam.

- **renvoie** : string Message.
- **renvoie** : boolean true s'il n'y a pas de véhicule joueur.

#### `mcp_tools_vehicle.reset_vehicle()`

Réinitialise/répare sur place le véhicule joueur (be:resetVehicle(0)).

- **renvoie** : string Message.
- **renvoie** : boolean true s'il n'y a pas de véhicule joueur.

#### `mcp_tools_vehicle.set_position(args)`

Téléporte un véhicule à une pose via spawn.safeTeleport ; rot facultatif (garde le cap actuel).

- `args` (*table*) : {pos: {x,y,z}, rot?: {x,y,z,w}, id?: integer}
- **renvoie** : string Message.
- **renvoie** : boolean true en cas d'erreur.

## Champs

| Champ | Type | Description |
|---|---|---|
| `schemas` | table<string, table> | Schémas des outils véhicule. |

## Appels vers le moteur (C++)

- `be:` `getPlayerVehicle`, `getPlayerVehicleID`, `resetVehicle`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/mcp/tools/vehicle.lua`.*
