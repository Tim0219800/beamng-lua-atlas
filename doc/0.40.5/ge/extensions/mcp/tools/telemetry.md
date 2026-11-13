# `mcp_tools_telemetry`

*Fichier : `lua/ge/extensions/mcp/tools/telemetry.lua` · VM : Game Engine (GE) · 88 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `mcp_tools_telemetry` : `extensions.load("mcp_tools_telemetry")`, puis la globale `mcp_tools_telemetry`

Outils MCP de télémétrie véhicule : valeurs électriques (régime, vitesse, rapport, carburant…), résumé de dommages, et instantané d'état global côté GE.

## Remarques

- get_electrics est asynchrone (VM véhicule -> callback `_cb.electrics` -> shared.asyncResults.electrics) : l'appel renvoie le résultat de la demande précédente.
- Sans `keys`, seules les valeurs scalaires (number, string, boolean) de electrics.values sont renvoyées.
- get_status n'inclut pas rpm/gear/IA (VM véhicule) : utiliser get_electrics et get_ai.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `mcp_tools_telemetry.get_electrics(args)` | Récupère electrics.values d'un véhicule (asynchrone). | 15 |
| `mcp_tools_telemetry.get_status()` | Instantané : sim {physicsRunning, timeScale}, vehicleCount, level, camera {mode, pos}, vehicle joueur {id, jbeam, configKey, pos, speed (m/s), damage}. | 43 |
| `mcp_tools_telemetry.get_vehicle_damage(args)` | Résumé de dommages : id et damageSum (veh:getSectionDamageSum()). | 32 |

### Détail des paramètres

#### `mcp_tools_telemetry.get_electrics(args)`

Récupère electrics.values d'un véhicule (asynchrone).

- `args` (*table|nil*) : {keys?: string[], id?: integer}
- **renvoie** : string JSON précédent ou message « requested (async) ».
- **renvoie** : boolean true si le véhicule n'existe pas.

#### `mcp_tools_telemetry.get_status()`

Instantané : sim {physicsRunning, timeScale}, vehicleCount, level, camera {mode, pos}, vehicle joueur {id, jbeam, configKey, pos, speed (m/s), damage}.

- **renvoie** : string JSON.
- **renvoie** : boolean false.

#### `mcp_tools_telemetry.get_vehicle_damage(args)`

Résumé de dommages : id et damageSum (veh:getSectionDamageSum()).

- `args` (*table|nil*) : {id?: integer}
- **renvoie** : string JSON.
- **renvoie** : boolean true si le véhicule n'existe pas.

## Champs

| Champ | Type | Description |
|---|---|---|
| `cb` | table<string, function> | Callback `electrics(vid, json)` : stocke le JSON dans shared.asyncResults.electrics. |
| `schemas` | table<string, table> | Schémas des outils de télémétrie. |

## Appels vers le moteur (C++)

- `be:` `getPhysicsRunning`, `getPlayerVehicle`, `getSimulationTimeScale`, `queueObjectLua`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/mcp/tools/telemetry.lua`.*
