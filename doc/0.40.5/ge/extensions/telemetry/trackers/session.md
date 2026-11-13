# `telemetry_trackers_session`

*Fichier : `lua/ge/extensions/telemetry/trackers/session.lua` · VM : Game Engine (GE) · 124 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `telemetry_trackers_session` : `extensions.load("telemetry_trackers_session")`, puis la globale `telemetry_trackers_session`

**Dépendances (chargées avant) :** `telemetry_core`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `telemetry_trackers_session.onExtensionLoaded(previousState)` | Lifecycle functions *(hook)* | 59 |
| `telemetry_trackers_session.onExtensionUnloaded()` | *(hook)* | 95 |
| `telemetry_trackers_session.onOnlineStateChanged(connected)` | Fired once the login came back, which is the first moment the server clock is known.<br> utcTimeAdjusted together with the event's own t anchors every other event in this session. *(hook)* | 115 |
| `telemetry_trackers_session.onSerialize(reason)` | *(hook)* | 108 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table |  |

## Appels vers le moteur (C++)

- `Lua:` `getOSLanguage`, `getSelectedLanguage`
- `ResearchVerifier.` `isTechLicenseVerified`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/telemetry/trackers/session.lua`.*
