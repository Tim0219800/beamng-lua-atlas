# `telemetry_configManager`

*Fichier : `lua/ge/extensions/telemetry/configManager.lua` · VM : Game Engine (GE) · 257 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `telemetry_configManager` : `extensions.load("telemetry_configManager")`, puis la globale `telemetry_configManager`

**Dépendances (chargées avant) :** `telemetry_userIdentity`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `telemetry_configManager.checkConfigExpiry()` |  | 145 |
| `telemetry_configManager.fetchConfigFromAPI(callback)` |  | 105 |
| `telemetry_configManager.getConfig()` |  | 158 |
| `telemetry_configManager.getModuleConfig(moduleName)` |  | 162 |
| `telemetry_configManager.getSurveyIntervalHours(moduleName, defaultHours)` | Older cached configs used days. Keep reading them until every installation has fetched<br> the hours-based server format. | 176 |
| `telemetry_configManager.getTelemetryVersion()` |  | 187 |
| `telemetry_configManager.initializeConfig(callback)` |  | 191 |
| `telemetry_configManager.isLocalOnly()` | -telemetryLocal: every tracker on with its defaults, the server is never asked and<br> nothing is uploaded | 31 |
| `telemetry_configManager.isModuleEnabled(moduleName)` |  | 170 |
| `telemetry_configManager.onExtensionLoaded()` | *(hook)* | 241 |
| `telemetry_configManager.setPollingEnabled(enabled)` |  | 230 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table |  |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onOnlineStateChanged` — écouté par 3 module(s)
- `onUpdate` — écouté par 186 module(s)

## Appels vers le moteur (C++)

- `Engine.` `getStartingArgs`
- `FS:` `directoryCreate`, `directoryExists`, `fileExists`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/telemetry/configManager.lua`.*
