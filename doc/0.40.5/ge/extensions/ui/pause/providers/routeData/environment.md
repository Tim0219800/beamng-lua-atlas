# `ui_pause_providers_routeData_environment`

*Fichier : `lua/ge/extensions/ui/pause/providers/routeData/environment.lua` · VM : Game Engine (GE) · 247 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_pause_providers_routeData_environment` : `extensions.load("ui_pause_providers_routeData_environment")`, puis la globale `ui_pause_providers_routeData_environment`

**Dépendances (chargées avant) :** `ui_pause_providers_trafficControls`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_pause_providers_routeData_environment.getEnvironmentData(context)` |  | 79 |
| `ui_pause_providers_routeData_environment.getEnvironmentSimulationData(context)` |  | 194 |
| `ui_pause_providers_routeData_environment.getEnvironmentTrafficData(context)` |  | 217 |
| `ui_pause_providers_routeData_environment.getEnvironmentWeatherData(context)` |  | 163 |
| `ui_pause_providers_routeData_environment.requestEnvironmentTrafficPayload(payload)` |  | 242 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table |  |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onEnvironmentGetOtherButtons`

## Appels vers le moteur (C++)

- `core_environment.` `getInitState`, `getTimeOfDayOptions`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/pause/providers/routeData/environment.lua`.*
