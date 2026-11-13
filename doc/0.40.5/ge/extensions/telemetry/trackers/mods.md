# `telemetry_trackers_mods`

*Fichier : `lua/ge/extensions/telemetry/trackers/mods.lua` · VM : Game Engine (GE) · 92 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `telemetry_trackers_mods` : `extensions.load("telemetry_trackers_mods")`, puis la globale `telemetry_trackers_mods`

**Dépendances (chargées avant) :** `telemetry_core`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `telemetry_trackers_mods.onExtensionLoaded()` | *(hook)* | 84 |
| `telemetry_trackers_mods.onModManagerReady()` | The mod database is only filled once the mod manager is up, which is well after<br> telemetry starts, so the survey cannot happen in onExtensionLoaded *(hook)* | 57 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table |  |

## Appels vers le moteur (C++)

- `FS:` `stat`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/telemetry/trackers/mods.lua`.*
