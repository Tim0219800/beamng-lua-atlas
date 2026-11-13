# `telemetry_trackers_ui`

*Fichier : `lua/ge/extensions/telemetry/trackers/ui.lua` · VM : Game Engine (GE) · 95 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `telemetry_trackers_ui` : `extensions.load("telemetry_trackers_ui")`, puis la globale `telemetry_trackers_ui`

**Dépendances (chargées avant) :** `telemetry_core`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `telemetry_trackers_ui.onAfterRouteChange(entry)` | The router fires this once a navigation completed, so this is the screen on display.<br> Using the modern hook here, not the legacy onUiChangedState compatibility hook. *(hook)* | 56 |
| `telemetry_trackers_ui.onExit()` | close the open screen, otherwise the last one has no duration *(hook)* | 82 |
| `telemetry_trackers_ui.onExtensionLoaded()` | *(hook)* | 77 |
| `telemetry_trackers_ui.onExtensionUnloaded()` | a lua reload tears the trackers down without an onExit, so close the screen here too *(hook)* | 32 |
| `telemetry_trackers_ui.onRouteTiming(routeName, timings)` | The router finishes a navigation after it committed the route, so this arrives just after<br> the activity above opened. A navigation that was cancelled or timed out never gets here,<br> and that screen is reported without a time. *(hook)* | 72 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table |  |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/telemetry/trackers/ui.lua`.*
