# `gameplay_rally_loop_rallyLoopTime`

*Fichier : `lua/ge/extensions/gameplay/rally/loop/rallyLoopTime.lua` · VM : Game Engine (GE) · 188 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_rally_loop_rallyLoopTime` : `extensions.load("gameplay_rally_loop_rallyLoopTime")`, puis la globale `gameplay_rally_loop_rallyLoopTime`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_rally_loop_rallyLoopTime.advancePlayingTime(seconds)` |  | 158 |
| `gameplay_rally_loop_rallyLoopTime.applyCurrentDate()` | Apply today's real-world date to the sky (drives sun/moon/star position) while<br> leaving the current time-of-day untouched. Only send the date fields. | 145 |
| `gameplay_rally_loop_rallyLoopTime.applyToEnvironment(environment, selectedValue)` | Map the chosen option into the environment setup module so the battle-tested<br> missionManager code applies and restores the time-of-day. This only touches<br> time-related fields; authored weather is preserved (nil weather fields are<br> zero-filled purely for nil-safety so missionManager's setters don't error). | 81 |
| `gameplay_rally_loop_rallyLoopTime.buildMissionSetting(missionTypeData)` | Build the single player-facing "Loop Time" select. Order: Default, Now, then<br> each authored CSV start time (labeled by its clock string). | 55 |
| `gameplay_rally_loop_rallyLoopTime.parseTimes(str)` | Parse a comma-separated list of "HH:MM" times, skipping invalid entries. | 39 |
| `gameplay_rally_loop_rallyLoopTime.setPlaying(play, time)` | Force the time-of-day play state. Used to guarantee play=false for the static<br> Default option after missionManager has applied the environment. An optional<br> time can be supplied to snap the clock back (Default may drift slightly during<br> the brief window before this runs). IMPORTANT: only send the fields we want to<br> change - passing a full getTimeOfDay() table (with startTime/date fields) fails<br> to actually stop the clock. | 130 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `defaultValue` | string |  |
| `key` | string |  |
| `nowValue` | string |  |

## Appels vers le moteur (C++)

- `core_environment.` `getCloudCover`, `getFogDensity`, `getTimeOfDay`, `getWindSpeed`, `setTimeOfDay`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/rally/loop/rallyLoopTime.lua`.*
