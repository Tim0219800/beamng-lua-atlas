# `gameplay_rally_compositors_helpers_calibrationOverrides`

*File: `lua/ge/extensions/gameplay/rally/compositors/helpers/calibrationOverrides.lua` · VM: Game Engine (GE) · 173 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_rally_compositors_helpers_calibrationOverrides`: `extensions.load("gameplay_rally_compositors_helpers_calibrationOverrides")`, then the global `gameplay_rally_compositors_helpers_calibrationOverrides`

Manages the per-mission calibration of the thresholds of a rally note compositor style (corner intensity diameters, arc lengths per intensity). Settings are stored in <missionDir>/rally/compositorCalibration.json as {version=1, styles={<style>={intensity={diameter={...}}, lengthsByIntensity={<intensity>={arcMeters={...}}}}}} and reapplied to a style's configuration at load time. A list of 'boundaries' is an ascending array of lower bounds starting at 0; the last range is open-ended (no max).

## Example

```lua
local ok = gameplay_rally_compositors_helpers_calibrationOverrides.setBoundaries(missionDir, 'english/casual', 'intensity', 'diameter', {0, 20, 45, 80})
```

## Notes

- A range {min, max} corresponds to [min, max[; the last range has only min.
- validateBoundaries requires: a non-empty numeric array, first element 0, strictly increasing values, and (if expectedCount is given) the right length.
- applyToConfig only applies the sections corner.numbering.intensity (key 'diameter') and corner.numbering.lengthsByIntensity (key 'arcMeters').

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_rally_compositors_helpers_calibrationOverrides.applyBoundariesToList(list, key, boundaries)` | Rewrites the 'key' key of each entry in the list with the range {min, max} derived from the bounds (the last one: {min} only). Changes nothing if the bounds are invalid or of the wrong length. | 75 |
| `gameplay_rally_compositors_helpers_calibrationOverrides.applyToConfig(config, compositorName, missionDir)` | Applies the saved calibrations to a style's configuration (corner.numbering.intensity and lengthsByIntensity). Called by textCompositor:load. | 143 |
| `gameplay_rally_compositors_helpers_calibrationOverrides.boundariesFromList(list, key)` | Extracts the lower bounds from a list of entries whose 'key' key is a range {min, max}. Returns nil if the list is empty, does not start at 0, is not contiguous (previous max = next min) or if a max is missing outside the last entry. | 39 |
| `gameplay_rally_compositors_helpers_calibrationOverrides.calibrationFile(missionDir)` | Path of a mission's calibration file: <missionDir>/rally/compositorCalibration.json. | 17 |
| `gameplay_rally_compositors_helpers_calibrationOverrides.load(missionDir)` | Reads the mission's calibration file. Returns a blank structure {version=1, styles={}} if the file is missing or unreadable (error logged in the latter case). | 87 |
| `gameplay_rally_compositors_helpers_calibrationOverrides.save(missionDir, data)` | Writes the calibration data (indented) to the mission's file, creating the folder if needed. | 101 |
| `gameplay_rally_compositors_helpers_calibrationOverrides.setBoundaries(missionDir, compositorName, groupName, key, boundaries)` | Stores a list of bounds under styles[compositorName][groupName][key] then saves the file. | 126 |
| `gameplay_rally_compositors_helpers_calibrationOverrides.setLengthBoundaries(missionDir, compositorName, intensityName, boundaries)` | Stores the arc length bounds of an intensity under styles[compositorName].lengthsByIntensity[intensityName].arcMeters then saves. | 134 |
| `gameplay_rally_compositors_helpers_calibrationOverrides.validateBoundaries(boundaries, expectedCount)` | Checks that a list of bounds is valid (numeric, starts at 0, strictly increasing, right length). | 59 |

### Parameter details

#### `gameplay_rally_compositors_helpers_calibrationOverrides.applyBoundariesToList(list, key, boundaries)`

Rewrites the 'key' key of each entry in the list with the range {min, max} derived from the bounds (the last one: {min} only). Changes nothing if the bounds are invalid or of the wrong length.

- `list` (*table[]*) : List of entries, modified in place.
- `key` (*string*) : Key to write.
- `boundaries` (*number[]*) : Lower bounds.
- **returns**: boolean true if applied.

#### `gameplay_rally_compositors_helpers_calibrationOverrides.applyToConfig(config, compositorName, missionDir)`

Applies the saved calibrations to a style's configuration (corner.numbering.intensity and lengthsByIntensity). Called by textCompositor:load.

- `config` (*table*) : Style configuration (modified in place).
- `compositorName` (*string*) : Style name.
- `missionDir` (*string*) : Mission folder.
- **returns**: boolean true if at least one list was modified.

#### `gameplay_rally_compositors_helpers_calibrationOverrides.boundariesFromList(list, key)`

Extracts the lower bounds from a list of entries whose 'key' key is a range {min, max}. Returns nil if the list is empty, does not start at 0, is not contiguous (previous max = next min) or if a max is missing outside the last entry.

- `list` (*table[]|nil*) : Ordered list of entries.
- `key` (*string*) : Key containing the range (e.g. 'diameter', 'arcMeters').
- **returns**: number[]|nil Lower bounds, or nil if the list is not valid.

#### `gameplay_rally_compositors_helpers_calibrationOverrides.calibrationFile(missionDir)`

Path of a mission's calibration file: <missionDir>/rally/compositorCalibration.json.

- `missionDir` (*string|nil*) : Mission folder.
- **returns**: string|nil Path, or nil if missionDir is nil.

#### `gameplay_rally_compositors_helpers_calibrationOverrides.load(missionDir)`

Reads the mission's calibration file. Returns a blank structure {version=1, styles={}} if the file is missing or unreadable (error logged in the latter case).

- `missionDir` (*string|nil*) : Mission folder.
- **returns**: table Data {version, styles}.

#### `gameplay_rally_compositors_helpers_calibrationOverrides.save(missionDir, data)`

Writes the calibration data (indented) to the mission's file, creating the folder if needed.

- `missionDir` (*string|nil*) : Mission folder.
- `data` (*table|nil*) : Data; blank if nil.
- **returns**: boolean Result of jsonWriteFile (false if missionDir is nil).

#### `gameplay_rally_compositors_helpers_calibrationOverrides.setBoundaries(missionDir, compositorName, groupName, key, boundaries)`

Stores a list of bounds under styles[compositorName][groupName][key] then saves the file.

- `missionDir` (*string*) : Mission folder.
- `compositorName` (*string*) : Style name.
- `groupName` (*string*) : Group (e.g. 'intensity').
- `key` (*string*) : Key (e.g. 'diameter').
- `boundaries` (*number[]*) : Bounds (copied; nil if a value is not numeric).
- **returns**: boolean Write success.

#### `gameplay_rally_compositors_helpers_calibrationOverrides.setLengthBoundaries(missionDir, compositorName, intensityName, boundaries)`

Stores the arc length bounds of an intensity under styles[compositorName].lengthsByIntensity[intensityName].arcMeters then saves.

- `missionDir` (*string*) : Mission folder.
- `compositorName` (*string*) : Style name.
- `intensityName` (*string*) : Intensity identifier.
- `boundaries` (*number[]*) : Arc bounds in meters.
- **returns**: boolean Write success.

#### `gameplay_rally_compositors_helpers_calibrationOverrides.validateBoundaries(boundaries, expectedCount)`

Checks that a list of bounds is valid (numeric, starts at 0, strictly increasing, right length).

- `boundaries` (*table*) : Array of numbers.
- `expectedCount` (*integer|nil*) : Expected length.
- **returns**: boolean true if valid.

## Calls into the engine (C++)

- `FS:` `directoryCreate`, `fileExists`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/rally/compositors/helpers/calibrationOverrides.lua`.*
