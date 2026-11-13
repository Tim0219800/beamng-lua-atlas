# `telemetry_userIdentity`

*Fichier : `lua/ge/extensions/telemetry/userIdentity.lua` · VM : Game Engine (GE) · 108 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `telemetry_userIdentity` : `extensions.load("telemetry_userIdentity")`, puis la globale `telemetry_userIdentity`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `telemetry_userIdentity.getAnonymousUserID()` | Creates an anonymous user ID by hashing the salt<br> This creates a unique identifier that can't be traced back to the user<br> Think of it like turning your secret code into a badge number | 94 |
| `telemetry_userIdentity.onExtensionLoaded()` | *(hook)* | 101 |

## Appels vers le moteur (C++)

- `FS:` `directoryCreate`, `directoryExists`, `fileExists`, `removeFile`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/telemetry/userIdentity.lua`.*
