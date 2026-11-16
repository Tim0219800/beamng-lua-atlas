# `quickrace_quickraceConfigurator`

*File: `lua/ge/extensions/quickrace/quickraceConfigurator.lua` · VM: Game Engine (GE) · 27 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `quickrace_quickraceConfigurator`: `extensions.load("quickrace_quickraceConfigurator")`, then the global `quickrace_quickraceConfigurator`

Configurator of the quick race (quickrace) wizard: level, track, vehicle and settings (reverse, rolling start, lap count, time of day, seed). It builds a descriptor via quickRaceConfiguratorDescriptor (backend quickraceSelector, route key quickraceWizard, no race type or vehicle restriction) and passes it to oneshotRaceCore.createConfigurator. The returned module exposes the configurator API described in oneshotRaceCore.

## Notes

- No default selection: the user chooses level, track and vehicle themselves.
- Starting goes through scenario_quickRaceLoader.startQuickrace.

**Dependencies (loaded first):** `scenario_quickRaceLoader`, `core_highscores`, `ui_vehicleSelector_general`, `ui_quickraceSelector_general`

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | string[] | scenario_quickRaceLoader, core_highscores, ui_vehicleSelector_general, ui_quickraceSelector_general. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/quickrace/quickraceConfigurator.lua`.*
