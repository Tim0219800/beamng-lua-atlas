# `mcp_tools_env`

*Fichier : `lua/ge/extensions/mcp/tools/env.lua` · VM : Game Engine (GE) · 57 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `mcp_tools_env` : `extensions.load("mcp_tools_env")`, puis la globale `mcp_tools_env`

Outils MCP pour l'environnement : lire et régler l'heure du jour et les paramètres astronomiques (latitude, longitude, date, décalage UTC, profil céleste) via core_environment. Disponible seulement dans un niveau.

## Remarques

- time est normalisé 0..1 (0 ou 1 = minuit, 0.5 = midi).
- set_time_of_day lit la table actuelle, ne modifie que les champs fournis, puis la réapplique en entier.
- dstRule : auto, eu, us, au ou none (d'après le schéma).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `mcp_tools_env.get_time_of_day()` | Renvoie en JSON core_environment.getTimeOfDay() : time, play, dayLength, startTime, latitude, longitude, date, utcOffset, dstRule, celestialProfile. | 9 |
| `mcp_tools_env.set_time_of_day(args)` | Modifie l'heure et les champs astronomiques fournis puis appelle core_environment.setTimeOfDay. | 15 |

### Détail des paramètres

#### `mcp_tools_env.get_time_of_day()`

Renvoie en JSON core_environment.getTimeOfDay() : time, play, dayLength, startTime, latitude, longitude, date, utcOffset, dstRule, celestialProfile.

- **renvoie** : string JSON ou erreur « core_environment unavailable ».
- **renvoie** : boolean true en cas d'erreur.

#### `mcp_tools_env.set_time_of_day(args)`

Modifie l'heure et les champs astronomiques fournis puis appelle core_environment.setTimeOfDay.

- `args` (*table|nil*) : {time?: 0..1, play?: boolean, dayLength?: number s réelles, startTime?: number, latitude?: number°, longitude?: number°, year?, month?, day?, utcOffset?: number h, dstRule?: string, celestialProfile?: string}
- **renvoie** : string « time of day set: time=… ».
- **renvoie** : boolean true en cas d'erreur.

## Champs

| Champ | Type | Description |
|---|---|---|
| `schemas` | table<string, table> | Schémas des outils get_time_of_day et set_time_of_day. |

## Appels vers le moteur (C++)

- `core_environment.` `getTimeOfDay`, `setTimeOfDay`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/mcp/tools/env.lua`.*
