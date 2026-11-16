# `ui_pause_features_homeRail`

*File: `lua/ge/extensions/ui/pause/features/homeRail.lua` · VM: Game Engine (GE) · 717 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_pause_features_homeRail`: `extensions.load("ui_pause_features_homeRail")`, then the global `ui_pause_features_homeRail`

Builds the right-hand button rail of the pause menu home. Depending on the context (freeroam, career, mission, multiplayer, garage, freeroamTutorial mode, scenario, first drive, multiseat) it assembles button groups: recovery (resume, repair, career/mission recovery), firstDriveLearning, tutorialLesson, career, auxiliary (vehicle selector, map, photo mode, replay), mainMenu (change level, quit activity, quit level) and multiseat. Used by ui_pause_providers_routeData_home.

## Example

```lua
-- add your multiseat buttons to the rail
function M.onPauseHomeRailBuildMultiseatActions(actions, context, registerButton)
  actions[#actions + 1] = registerButton({id = 'home.monBouton', label = 'Mon bouton', icon = 'play', visible = true, enabled = true}, function() return true end)
end
```

## Notes

- registerButton(definition, callback) is provided by the caller (ui_pause_actions.registerButton); the definition contains id, label, icon, rail, routeTarget, visible, enabled, disabledReason, confirmText, flavor ("danger", "system"), showIndicator, hideInSimpleMenu, cancelLabel. The callback returns true on success.
- Group order: recovery, firstDriveLearning, tutorialLesson, career, then the multiseat group before auxiliary if multiseat is active (otherwise after), finally mainMenu.
- In guided first drive, only two groups exist: recovery (continue) and mainMenu (quit).
- In mission mode, the recovery buttons come from core_recoveryPrompt.getPauseMissionRightRailButtons(); failing that, fixed buttons (restart, flip upright, last road, towing) are created. In career, they come from getPauseCareerRightRailButtons().
- The "quit activity" button is hidden for assistant scenarios (quickrace, lightRunner, busRoute) because "quit" there only clears the scenario state.
- The "Repair here" button (home.repairHere) teleports the vehicle in place with spawn.safeTeleport (repair) and emits onPauseMenuRightRailButtonPressed("repairHere"); it does not exist in multiseat.
- Hooks emitted: onPauseHomeRailBuildMultiseatActions(actions, context, registerButton), onGameplayActivityAborted, onPauseMenuRightRailButtonPressed(name).
- The disabled card's label ("Disabled in current context") is hardcoded, not translated.

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_pause_features_homeRail.build(context, registerButton)` | Builds the list of rail groups for the pause context. Each group comes from Common.asRailGroup(name, actions) and empty groups are omitted. Logs the number of groups and multiseat actions. | 681 |

### Parameter details

#### `ui_pause_features_homeRail.build(context, registerButton)`

Builds the list of rail groups for the pause context. Each group comes from Common.asRailGroup(name, actions) and empty groups are omitted. Logs the number of groups and multiseat actions.

- `context` (*table*) : Pause context: mode, isFirstDriveGuided, isFirstDriveActive, isMultiseatActive, isScenarioActive, isMissionActive, isBigMapAllowed...
- `registerButton` (*function*) : Function (definition, callback) that registers a button and returns its description.
- **returns**: table[] Rail button groups.

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onGameplayActivityAborted`
- `onPauseHomeRailBuildMultiseatActions` — listened to by 2 module(s)
- `onPauseMenuRightRailButtonPressed`

**Loads extensions:** `ui_multiseat_freeroam`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/pause/features/homeRail.lua`.*
