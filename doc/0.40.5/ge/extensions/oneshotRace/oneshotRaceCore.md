# `oneshotRace_oneshotRaceCore`

*Fichier : `lua/ge/extensions/oneshotRace/oneshotRaceCore.lua` · VM : Game Engine (GE) · 283 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `oneshotRace_oneshotRaceCore` : `extensions.load("oneshotRace_oneshotRaceCore")`, puis la globale `oneshotRace_oneshotRaceCore`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `oneshotRace_oneshotRaceCore.createConfigurator(descriptor)` | descriptor contract:<br>   logTag: string<br>   gridBackendName: ui_gridSelector backend name (levels + tracks/routes source of truth)<br>   routeDataKey: key under router route-data payloads (e.g. "quickraceWizard")<br>   vehicleRestrictionMode: optional, passed to<br>     ui_vehicleSelector_general.setVehicleRestrictionMode() while the wizard's<br>     vehicle route is active (e.g. "lightRunner", "busRoute"); nil means no restriction<br>   defaultSettings(): -> table<br>   onSelectMiddle(settings, middle): mutate `settings` in place from the newly selected middle item<br>   onUpdateSetting(settings, key, value, middle): optional, extra side effects on setting change<br>   extraSettingKeys: optional table of setting keys allowed beyond defaultSettings()'s own keys (e.g. {seed = true})<br>   buildLevelSummary(level) -> table<br>   buildMiddleSummary(middle, selection) -> table (must include a `settings` field)<br>   getHighscoreKey(selection, middle) -> {levelName, scenarioName, configKey} or nil to skip highscores<br>   start(level, middle, settings, vehicleFile, selection): actually starts the race/route<br>   getDefaultSelection(selector): optional, called once when the wizard is<br>     entered with nothing selected yet (e.g. lightRunner defaults to<br>     "glow_city"); `selector` is the ui_gridSelector backend (findLevel/<br>     findMiddle) for gridBackendName. -> {levelName, middleName, vehicle =<br>     {model, config}} or nil for "no default" (quickrace/busRoute) | 78 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `todNames` | table |  |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/oneshotRace/oneshotRaceCore.lua`.*
