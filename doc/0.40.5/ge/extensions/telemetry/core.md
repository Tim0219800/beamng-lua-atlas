# `telemetry_core`

*Fichier : `lua/ge/extensions/telemetry/core.lua` · VM : Game Engine (GE) · 507 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `telemetry_core` : `extensions.load("telemetry_core")`, puis la globale `telemetry_core`

**Dépendances (chargées avant) :** `telemetry_configManager`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `telemetry_core.addEvent(event)` | Answers whether the event was stored, so a caller that keeps its own record of what it<br> sent can tell a dropped event from a delivered one | 75 |
| `telemetry_core.endActivity(activityName, data)` |  | 479 |
| `telemetry_core.getDataFolder()` | A local only run keeps its sessions and survey state apart, so the reporter of a normal<br> run never uploads them and they never stand in for a survey that was really sent | 30 |
| `telemetry_core.getRunIds()` | The telemetry runs this session collects for. Set before any tracker loads. | 457 |
| `telemetry_core.getRunTime()` | Seconds since the game started, used by trackers to measure durations | 452 |
| `telemetry_core.getSessionFile()` | The file of the running session. The reporter must not upload or delete this one. | 40 |
| `telemetry_core.getSessionId()` | Identifies this run inside the report. Unrelated to the account session token, it is<br> a timestamp plus random bytes and carries no identity. Reported so a re-upload after<br> a lost response can be recognized as a duplicate instead of counted twice. | 47 |
| `telemetry_core.isPlatformSupported(platform)` |  | 123 |
| `telemetry_core.isSessionContinued()` |  | 461 |
| `telemetry_core.onExit()` | *(hook)* | 436 |
| `telemetry_core.onExtensionLoaded(previousSession)` | callbacks *(hook)* | 403 |
| `telemetry_core.onExtensionUnloaded()` | *(hook)* | 436 |
| `telemetry_core.onSerialize(reason)` | *(hook)* | 443 |
| `telemetry_core.onSettingsChanged()` | *(hook)* | 421 |
| `telemetry_core.startActivity(activityName, data)` | Duration tracking | 473 |
| `telemetry_core.triggerReportWrite()` | Flush buffered events to disk, so they survive a crash from this point on | 466 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table | declared, not reached for on demand: extensions.<name> loads a missing module, and that<br> load runs the onExtensionLoaded of everything still queued, trackers included. They would<br> then run before the config below is initialized. |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onTelemetryEventAdded`

## Appels vers le moteur (C++)

- `Engine.` `getStartingArgs`, `isAgentMode`
- `FS:` `directoryCreate`, `directoryExists`, `fileExists`, `findFiles`, `removeFile`
- `ResearchVerifier.` `isTechLicenseVerified`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/telemetry/core.lua`.*
