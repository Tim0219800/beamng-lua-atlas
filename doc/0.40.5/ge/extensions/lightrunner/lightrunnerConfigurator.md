# `lightrunner_lightrunnerConfigurator`

*File: `lua/ge/extensions/lightrunner/lightrunnerConfigurator.lua` · VM: Game Engine (GE) · 55 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `lightrunner_lightrunnerConfigurator`: `extensions.load("lightrunner_lightrunnerConfigurator")`, then the global `lightrunner_lightrunnerConfigurator`

Configurator of the "Light Runner" wizard: quick race on the glow_city level. It builds a descriptor from quickRaceConfiguratorDescriptor (grid backend lightRunnerSelector, route key lightrunnerWizard, race type lightRunner, vehicle restriction lightRunner) and passes it to oneshotRaceCore.createConfigurator. The returned module therefore exposes the configurator API (getSelection, selectLevel, selectMiddle, selectVehicle, updateSetting, getConfiguration, start, onWizard…RouteEnter) described in oneshotRaceCore.

## Notes

- Default selection (on first entry into the wizard): level glow_city, track "Argon Curves" (or the level's first track), vehicle sbr / config powerglow.
- Starting the race goes through scenario_quickRaceLoader.startQuickrace with the type "lightRunner".

**Dependencies (loaded first):** `scenario_quickRaceLoader`, `core_highscores`, `ui_vehicleSelector_general`, `ui_lightRunnerSelector_general`

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | string[] | scenario_quickRaceLoader, core_highscores, ui_vehicleSelector_general, ui_lightRunnerSelector_general. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/lightrunner/lightrunnerConfigurator.lua`.*
