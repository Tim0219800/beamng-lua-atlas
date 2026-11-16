# `gameplay_achievement`

*File: `lua/ge/extensions/gameplay/achievement.lua` · VM: Game Engine (GE) · 403 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_achievement`: `extensions.load("gameplay_achievement")`, then the global `gameplay_achievement`

GE extension that links the game statistics (gameplay_statistic) to the achievements and statistics of the online provider (OnlineServiceProvider: Steam, EOS...). At startup it reads lua/ge/extensions/gameplay/achievements.json, builds the list of pending achievements and statistics to publish, then subscribes to the corresponding metrics. When a metric reaches the unlockAt threshold, the achievement is unlocked. It also handles three "manual" achievements (VEHICLE_EXPLORER, LEVEL_EXPLORER, VEHICLE_FAVOURITE). A modder mostly uses it through unlockAchievement.

## Example

```lua
gameplay_achievement.unlockAchievement("VEHICLE_EXPLORER")
```

## Notes

- Nothing happens if OnlineServiceProvider.isWorking is false or if no platform is mapped (startup returns false, achievements inactive).
- startup() only runs once (started flag); it is called from onFirstUpdate, onOnlineServiceProviderReady and onClientStartMission.
- Statistic updates are throttled: sent if more than 20 s since the last send or if the change reaches submitMinDelta.
- Manual thresholds: 15 vehicles with odometer >= 10000 (VEHICLE_EXPLORER), 5 levels with time >= 300 (LEVEL_EXPLORER), one odometer >= 1000000 (VEHICLE_FAVOURITE). Metric units inferred from code.
- Inconsistency: in maybeSubmitStat, watcher.valueLastSent receives timer:stop() (a time) while it is also compared to v (a stat value); the math.abs(v - valueLastSent) test therefore mixes time and value. In statCallback, newvalue.career is read before testing newvalue (error if nil).
- flushPendingOnlineStats (sending of queued values) is only called when the extension unloads.

**Dependencies (loaded first):** `gameplay_statistic`

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_achievement.onClientStartMission()` | Hook called when a level starts; launches startup() again (no effect if already started). *(internal)* *(hook)* | 376 |
| `gameplay_achievement.onExtensionUnloaded()` | Hook called when the extension unloads; sends the statistics and progress still queued. *(internal)* *(hook)* | 380 |
| `gameplay_achievement.onFirstUpdate()` | Hook called on the game's first update: launches startup() if the online provider works, otherwise logs a warning. *(internal)* *(hook)* | 364 |
| `gameplay_achievement.onOnlineServiceProviderReady()` | Hook called when the online service provider becomes ready; launches startup(). *(internal)* *(hook)* | 372 |
| `gameplay_achievement.statCallback(key, oldvalue, newvalue)` | Callback registered with gameplay_statistic for each tracked metric. Publishes the corresponding online statistics, pushes achievement progress and unlocks those whose value reaches unlockAt (then removes them from the pending list). Unsubscribes the metric if nobody uses it anymore. *(internal)* | 108 |
| `gameplay_achievement.unlockAchievement(achievementId)` | Unlocks an achievement by its identifier via OnlineServiceProvider.unlockAchievement. Only does so once per session for a given identifier. | 385 |

### Parameter details

#### `gameplay_achievement.statCallback(key, oldvalue, newvalue)`

Callback registered with gameplay_statistic for each tracked metric. Publishes the corresponding online statistics, pushes achievement progress and unlocks those whose value reaches unlockAt (then removes them from the pending list). Unsubscribes the metric if nobody uses it anymore.

- `key` (*string*) : Name of the changed metric.
- `oldvalue` (*table|nil*) : Old entry of the metric (unused).
- `newvalue` (*table*) : New entry: fields value (number) and career (boolean).

#### `gameplay_achievement.unlockAchievement(achievementId)`

Unlocks an achievement by its identifier via OnlineServiceProvider.unlockAchievement. Only does so once per session for a given identifier.

- `achievementId` (*string*) : Achievement identifier on the platform side.

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | table<integer, string> | Extensions loaded before: {"gameplay_statistic"}. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/achievement.lua`.*
