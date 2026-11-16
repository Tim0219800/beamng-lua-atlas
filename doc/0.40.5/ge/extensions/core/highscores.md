# `core_highscores`

*File: `lua/ge/extensions/core/highscores.lua` · VM: Game Engine (GE) · 138 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `core_highscores`: `extensions.load("core_highscores")`, then the global `core_highscores`

GE extension `core_highscores`: storage of the best scenario times in settings/highscores.json, organized by level, scenario and configuration key. Keeps the 50 best records of each combination. A modder uses it to record a time (setScenarioHighscores) or read the ranking (getScenarioHighscores).

## Example

```lua
local place = core_highscores.setScenarioHighscores(65432, 'Ibishu', 'Covet', 'Joueur', 'west_coast_usa', 'monScenario', 'default')
for _, s in ipairs(core_highscores.getScenarioHighscores('west_coast_usa', 'monScenario', 'default')) do
  print(s.place, s.formattedTime, s.playerName)
end
```

## Notes

- File structure: {level = {scenario = {configKey = [sorted records]}}}. Each record: playerName, vehicleBrand, vehicleName (or free fields via ...Custom), detailed = false, timeStamp (os.time), formattedTimestamp (os.date('!%c'), UTC), timeInMillis (rounded integer), formattedTime ('MM:SS.mmm').
- Sorted ascending by timeInMillis (smaller = better). getScenarioHighscores adds the `place` field (1 = best) when reading.
- The return value of setScenarioHighscores(Custom) is the place obtained (1 = best) or -1 if the time does not make the top 50 (nothing is then saved).
- Migration: if the old 'highscores' file exists and settings/highscores.json is empty or absent, it is renamed (checked on every getHighscores) and 'highscores_beautfied' is deleted.
- Inconsistencies: formatMillis is defined but neither exported nor used (the addSign branch calls M.formatMillis which does not exist); setScenarioHighscoresCustom does not require levelName/scenarioName/configKey to be strings (concatenation in the log: error if nil); the provided record is modified in place.

## Functions

| Function | Description | Line |
|---|---|---|
| `core_highscores.getHighscores()` | Reads and decodes the whole settings/highscores.json file (after possible migration of the old file). | 25 |
| `core_highscores.getScenarioHighscores(levelName, scenarioName, configKey)` | Records of a level/scenario/config combination, sorted from best to worst, with the `place` field added. | 38 |
| `core_highscores.setHighscores(scores)` | Writes the complete highscores table to settings/highscores.json (indented JSON). | 34 |
| `core_highscores.setScenarioHighscores(timeInMillis, vehicleBrand, vehicleName, playerName, levelName, scenarioName, configKey)` | Records a time with player and vehicle (builds the record then calls setScenarioHighscoresCustom). | 77 |
| `core_highscores.setScenarioHighscoresCustom(timeInMillis, record, levelName, scenarioName, configKey)` | Records a time with a free-form record: completes record (detailed, timeStamp, formattedTimestamp, timeInMillis, formattedTime), inserts it, sorts, keeps the 50 best and saves. | 86 |

### Parameter details

#### `core_highscores.getHighscores()`

Reads and decodes the whole settings/highscores.json file (after possible migration of the old file).

- **returns**: table Complete table, {} if the file is absent or empty.

#### `core_highscores.getScenarioHighscores(levelName, scenarioName, configKey)`

Records of a level/scenario/config combination, sorted from best to worst, with the `place` field added.

- `levelName` (*string*) : Level name.
- `scenarioName` (*string*) : Scenario name.
- `configKey` (*string*) : Configuration key (vehicle, options…).
- **returns**: table[] List of records, {} if none.

#### `core_highscores.setHighscores(scores)`

Writes the complete highscores table to settings/highscores.json (indented JSON).

- `scores` (*table*) : Complete table level -> scenario -> config -> records.

#### `core_highscores.setScenarioHighscores(timeInMillis, vehicleBrand, vehicleName, playerName, levelName, scenarioName, configKey)`

Records a time with player and vehicle (builds the record then calls setScenarioHighscoresCustom).

- `timeInMillis` (*number*) : Time in milliseconds.
- `vehicleBrand` (*string*) : Vehicle brand.
- `vehicleName` (*string*) : Vehicle name.
- `playerName` (*string*) : Player name.
- `levelName` (*string*) : Level name.
- `scenarioName` (*string*) : Scenario name.
- `configKey` (*string*) : Configuration key.
- **returns**: integer Place obtained (1 = best), -1 if outside the top 50.

#### `core_highscores.setScenarioHighscoresCustom(timeInMillis, record, levelName, scenarioName, configKey)`

Records a time with a free-form record: completes record (detailed, timeStamp, formattedTimestamp, timeInMillis, formattedTime), inserts it, sorts, keeps the 50 best and saves.

- `timeInMillis` (*number*) : Time in milliseconds (rounded to the integer).
- `record` (*table*) : Free data of the record; modified in place.
- `levelName` (*string*) : Level name.
- `scenarioName` (*string*) : Scenario name.
- `configKey` (*string*) : Configuration key.
- **returns**: integer Place obtained (1 = best), -1 if outside the top 50.

## Calls into the engine (C++)

- `FS:` `removeFile`, `renameFile`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/core/highscores.lua`.*
