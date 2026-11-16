# `gameplay_rally_util`

*File: `lua/ge/extensions/gameplay/rally/util.lua` · VM: Game Engine (GE) · 733 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_rally_util`: `extensions.load("gameplay_rally_util")`, then the global `gameplay_rally_util`

Common toolbox of rally mode (GE): constants (folder names, active states, flowgraph colors, co-driver default values), file paths of a mission (notebooks, recce, driveline, cuts, transcriptions), loading of notebooks and race paths, detection of the current mission id, naming of pacenote audio files, computation of a corner call from the steering angle, vehicle debug drawing helpers and time formatting. Almost all the other gameplay/rally files use it via require.

## Example

```lua
local rallyUtil = require('/lua/ge/extensions/gameplay/rally/util')
local missionId, missionDir, err = rallyUtil.detectMissionIdHelper()
local nb = rallyUtil.loadNotebookForMissionDir(missionDir, rallyUtil.defaultNotebookFname)
```

## Notes

- Mission folder structure: <missionDir>/rally/notebooks/*.notebook.json; <missionDir>/rally/recce/primary/{driveline,cuts,transcripts}.json; <missionDir>/rally/finalDriveline.json and drivelineSpline.json.
- formatTimeFromSeconds is broken: formatTime24Hour and formatTime12Hour return {time=...} tables, yet the function concatenates them with `..`; the call raises an error as soon as timeSecs is not nil.
- determineCornerCall returns nil (no value) if the absolute value of the steering falls in no range [fromAngleDegrees, toAngleDegrees[.
- detectRallyEditorMissionId is local and not exported, but detectMissionIdHelper uses it (order: missionManager, rallyEditor, missionEditor).
- detectMissionEditorMissionId calls editor_missionEditor.getSelectedMissionId() then reads `.id` on the result: the function name suggests it is already an id, which could give nil (inferred from code).
- missionRecceDir is local and not exported; the drawVehBB comment talks about green but the color is blue (0.2, 0.2, 1.0).
- getAppropriateTextColor tests clr[1] < 0.1 and clr[2] < 0.5 and clr[3] > 0.7 (blue backgrounds): white in that case, black otherwise.
- The audio names: `pacenote_<hash>.ogg`, variants `pacenote_<hash>_<n>.ogg`, system `pacenote_system_<key>_<n>.ogg`.

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_rally_util.arePointsEqualWithinThreshold(point1, point2, threshold)` | Tests whether two points are at a distance less than or equal to the threshold. | 494 |
| `gameplay_rally_util.calculateForwardNormal(snap_pos, next_pos)` | Unit vector going from snap_pos to next_pos. Raises an error if the two positions are identical. | 315 |
| `gameplay_rally_util.compareCustomPacenoteAudioBasenames(a, b)` | Sort comparator: by number, letter then variant; recognized names come before the others, which are sorted alphabetically. | 432 |
| `gameplay_rally_util.createNotebook(fname)` | Creates an empty notebook (rally/notebook/path) at this path and saves it. | 204 |
| `gameplay_rally_util.customPacenoteAudioBasenameParts(basename)` | Decomposes a name of the form 'pacenote_<number><letter>_<variant>.ogg'. | 420 |
| `gameplay_rally_util.customRound(dist, round_to)` | Rounds a value to the nearest multiple. | 400 |
| `gameplay_rally_util.cutsFile(missionDir)` | Path of the recce's cuts.json. | 306 |
| `gameplay_rally_util.detectMissionEditorMissionId()` | Id of the mission selected in the mission editor (see notes). | 107 |
| `gameplay_rally_util.detectMissionIdHelper()` | Detects the current mission id in the order: missionManager, rallyEditor, missionEditor, and computes its folder. | 140 |
| `gameplay_rally_util.detectMissionManagerMissionId()` | Id of the foreground mission according to gameplay_missions_missionManager. | 99 |
| `gameplay_rally_util.determineCornerCall(angles, steering)` | Finds the angle range matching the absolute value of the steering and builds the corner call in uppercase with direction (L if steering >= 0, R otherwise); a '_deadzone' range gives 'C'. | 347 |
| `gameplay_rally_util.drawVehBB(vehId)` | Draws in blue the 12 edges of the vehicle's OOBB with debugDrawer:drawLineInstance. | 537 |
| `gameplay_rally_util.drawVehLeadingPoint(vehId, inside)` | Draws a small sphere (radius 0.1) at the center of the vehicle's front face: green if inside, red otherwise. | 529 |
| `gameplay_rally_util.drivelineFile(missionDir)` | Path of the recce's driveline.json. | 294 |
| `gameplay_rally_util.drivelineSplineFile(missionDir)` | Path of <missionDir>/rally/drivelineSpline.json. | 302 |
| `gameplay_rally_util.finalDrivelineFile(missionDir)` | Path of <missionDir>/rally/finalDriveline.json. | 298 |
| `gameplay_rally_util.formatTime12Hour(timeSecs, includeSeconds, includeTenths)` | Same in 12 h format. | 600 |
| `gameplay_rally_util.formatTime24Hour(timeSecs, includeSeconds, includeTenths)` | Formats a number of seconds since midnight as HH:MM[:SS[.d]] (modulo 24 h). | 576 |
| `gameplay_rally_util.formatTimeFromSeconds(timeSecs, includeSeconds, includeTenths)` | Supposed to return "24h / 12h"; bug: concatenates two tables (see notes). | 628 |
| `gameplay_rally_util.getAppropriateTextColor(clr)` | Chooses a readable text color on a background: white for a dark blue background, black otherwise. | 490 |
| `gameplay_rally_util.getMissionName(missionId)` | Name (translation key) of a mission; returns the id if the mission is not found. | 450 |
| `gameplay_rally_util.getNotebookFullPath(missionDir, basename)` | Full path of a notebook: <missionDir>/rally/notebooks/<basename>. | 186 |
| `gameplay_rally_util.getTime()` | High-precision time (os.clockhp). The original comment says "seconds since epoch" but it is a process clock. | 64 |
| `gameplay_rally_util.getVehFrontBottom(vehId)` | Midpoint of the bottom front edge of the vehicle's OOBB (points 0 and 3). | 516 |
| `gameplay_rally_util.getVehFrontCenter(vehId)` | Center of the front face of the vehicle's oriented bounding box (OOBB) at spawn (average of points 0 to 3). | 500 |
| `gameplay_rally_util.hasPunctuation(last_char)` | Tests whether a character is one of `?`, `.`, `!`. | 89 |
| `gameplay_rally_util.listNotebooks(missionDir)` | Lists, sorted, the *.notebook.json file names of the mission's notebooks folder. | 191 |
| `gameplay_rally_util.loadCornerAnglesFile()` | Reads lua/ge/extensions/gameplay/rally/corner_angles.json (corner angle styles). | 335 |
| `gameplay_rally_util.loadNotebook(notebookFname)` | Loads a notebook from a file. If the file is empty or blank, initializes it and saves it. Then computes the adjacent notes (setAllAdjacentNotes). | 220 |
| `gameplay_rally_util.loadNotebookForMissionDir(missionDir, basename)` | Loads a mission's notebook from its file name. | 259 |
| `gameplay_rally_util.loadRacePath(missionDir)` | Loads <missionDir>/race.race.json into a gameplay/race/path object. | 264 |
| `gameplay_rally_util.makePacenoteAudioFilename(pacenoteHash)` | Audio file name of a note: 'pacenote_<hash>.ogg'. | 404 |
| `gameplay_rally_util.makePacenoteVariantAudioFilename(pacenoteHash, variant)` | Audio file name of a variant: 'pacenote_<hash>_<n>.ogg' (n integer >= 1). | 408 |
| `gameplay_rally_util.makeSystemPacenoteAudioFilename(systemKey, variantIndex)` | Audio file name of a system note: 'pacenote_system_<key>_<n>.ogg'. | 445 |
| `gameplay_rally_util.matchSearchPattern(searchPattern, stringToMatch)` | Tests a string with a simple pattern: Lua special characters are escaped and `*` becomes `.*`. The match is not anchored. | 384 |
| `gameplay_rally_util.missionDirHelper(missionId)` | Folder of a mission: '/gameplay/missions/<id>'. | 131 |
| `gameplay_rally_util.missionReccePath(missionDir, basename)` | Path of a file in the recce recording folder. | 288 |
| `gameplay_rally_util.missionRecceRecordDir(missionDir)` | Recce recording folder: <missionDir>/rally/recce/primary. | 283 |
| `gameplay_rally_util.normalizeName(name)` | Replaces every non-alphanumeric character with `_` then collapses repeated `_`. | 77 |
| `gameplay_rally_util.pacenoteAudioBasenameVariantIndex(basename)` | Extracts the variant number from an audio file name (suffix _<n>.ogg), 1 by default. | 414 |
| `gameplay_rally_util.pacenoteHashSha1(s)` | SHA-1 hash of a text, truncated to the first 16 characters. | 58 |
| `gameplay_rally_util.randomId()` | Random 8-character identifier (SHA-1 of a random integer). Low entropy: 1 million possible values. | 484 |
| `gameplay_rally_util.stripBasename(thepath)` | Returns the folder of a path (removes the file name or the last folder, and the trailing `/`). | 370 |
| `gameplay_rally_util.transcriptsFile(missionDir)` | Path of the recce's transcripts.json. | 310 |
| `gameplay_rally_util.translatedMissionName(missionName)` | Translates a mission name with _tr. | 461 |
| `gameplay_rally_util.translatedMissionNameFromId(missionId)` | Translated name of a mission from its id. | 472 |
| `gameplay_rally_util.trimString(txt)` | Removes leading and trailing whitespace. | 364 |
| `gameplay_rally_util.useNote(text)` | Indicates whether a note text should be used: non-empty, different from '#' and '<none>'. | 393 |

### Parameter details

#### `gameplay_rally_util.arePointsEqualWithinThreshold(point1, point2, threshold)`

Tests whether two points are at a distance less than or equal to the threshold.

- `point1` (*vec3*) : First point.
- `point2` (*vec3*) : Second point.
- `threshold` (*number*) : Maximum distance in meters.
- **returns**: boolean true if close.

#### `gameplay_rally_util.calculateForwardNormal(snap_pos, next_pos)`

Unit vector going from snap_pos to next_pos. Raises an error if the two positions are identical.

- `snap_pos` (*vec3*) : Start position.
- `next_pos` (*vec3*) : Next position.
- **returns**: vec3 Normalized direction.

#### `gameplay_rally_util.compareCustomPacenoteAudioBasenames(a, b)`

Sort comparator: by number, letter then variant; recognized names come before the others, which are sorted alphabetically.

- `a` (*string*) : First name.
- `b` (*string*) : Second name.
- **returns**: boolean true if a must come before b.

#### `gameplay_rally_util.createNotebook(fname)`

Creates an empty notebook (rally/notebook/path) at this path and saves it.

- `fname` (*string*) : File path.
- **returns**: table|nil Notebook object, nil if the save fails.

#### `gameplay_rally_util.customPacenoteAudioBasenameParts(basename)`

Decomposes a name of the form 'pacenote_<number><letter>_<variant>.ogg'.

- `basename` (*string*) : File name.
- **returns**: table|nil {number, letter, variant, basename} or nil if the format does not match.

#### `gameplay_rally_util.customRound(dist, round_to)`

Rounds a value to the nearest multiple.

- `dist` (*number*) : Value.
- `round_to` (*number*) : Rounding step.
- **returns**: number Rounded value.

#### `gameplay_rally_util.cutsFile(missionDir)`

Path of the recce's cuts.json.

- `missionDir` (*string*) : Mission folder.
- **returns**: string Path.

#### `gameplay_rally_util.detectMissionEditorMissionId()`

Id of the mission selected in the mission editor (see notes).

- **returns**: string|nil Mission id.

#### `gameplay_rally_util.detectMissionIdHelper()`

Detects the current mission id in the order: missionManager, rallyEditor, missionEditor, and computes its folder.

- **returns**: string|nil Mission id.
- **returns**: string|nil Mission folder.
- **returns**: string|nil Error message 'missionId could not be detected' on failure.

#### `gameplay_rally_util.detectMissionManagerMissionId()`

Id of the foreground mission according to gameplay_missions_missionManager.

- **returns**: string|nil Mission id.

#### `gameplay_rally_util.determineCornerCall(angles, steering)`

Finds the angle range matching the absolute value of the steering and builds the corner call in uppercase with direction (L if steering >= 0, R otherwise); a '_deadzone' range gives 'C'.

- `angles` (*table[]*) : List of {fromAngleDegrees, toAngleDegrees, cornerCall}.
- `steering` (*number*) : Steering in degrees (signed).
- **returns**: table|nil Range found.
- **returns**: string Corner call (e.g. '3L').
- **returns**: number Position within the range between 0 and 1.

#### `gameplay_rally_util.drawVehBB(vehId)`

Draws in blue the 12 edges of the vehicle's OOBB with debugDrawer:drawLineInstance.

- `vehId` (*integer*) : Vehicle object id.

#### `gameplay_rally_util.drawVehLeadingPoint(vehId, inside)`

Draws a small sphere (radius 0.1) at the center of the vehicle's front face: green if inside, red otherwise.

- `vehId` (*integer*) : Vehicle object id.
- `inside` (*boolean*) : Color choice.

#### `gameplay_rally_util.drivelineFile(missionDir)`

Path of the recce's driveline.json.

- `missionDir` (*string*) : Mission folder.
- **returns**: string Path.

#### `gameplay_rally_util.drivelineSplineFile(missionDir)`

Path of <missionDir>/rally/drivelineSpline.json.

- `missionDir` (*string*) : Mission folder.
- **returns**: string Path.

#### `gameplay_rally_util.finalDrivelineFile(missionDir)`

Path of <missionDir>/rally/finalDriveline.json.

- `missionDir` (*string*) : Mission folder.
- **returns**: string Path.

#### `gameplay_rally_util.formatTime12Hour(timeSecs, includeSeconds, includeTenths)`

Same in 12 h format.

- `timeSecs` (*number|nil*) : Seconds.
- `includeSeconds` (*boolean|nil*) : Adds the seconds.
- `includeTenths` (*boolean|nil*) : Adds the tenths.
- **returns**: table {time = string, ampm = 'AM'|'PM'}.

#### `gameplay_rally_util.formatTime24Hour(timeSecs, includeSeconds, includeTenths)`

Formats a number of seconds since midnight as HH:MM[:SS[.d]] (modulo 24 h).

- `timeSecs` (*number|nil*) : Seconds.
- `includeSeconds` (*boolean|nil*) : Adds the seconds.
- `includeTenths` (*boolean|nil*) : Adds the tenths (with includeSeconds).
- **returns**: table {time = string}; 'N/A' if timeSecs is nil.

#### `gameplay_rally_util.formatTimeFromSeconds(timeSecs, includeSeconds, includeTenths)`

Supposed to return "24h / 12h"; bug: concatenates two tables (see notes).

- `timeSecs` (*number|nil*) : Seconds.
- `includeSeconds` (*boolean|nil*) : Adds the seconds.
- `includeTenths` (*boolean|nil*) : Adds the tenths.
- **returns**: string 'N/A' if timeSecs is nil; otherwise error.

#### `gameplay_rally_util.getAppropriateTextColor(clr)`

Chooses a readable text color on a background: white for a dark blue background, black otherwise.

- `clr` (*number[]*) : Background color {r, g, b} between 0 and 1.
- **returns**: ColorF Opaque white or black.

#### `gameplay_rally_util.getMissionName(missionId)`

Name (translation key) of a mission; returns the id if the mission is not found.

- `missionId` (*string*) : Mission id.
- **returns**: string Name or id.

#### `gameplay_rally_util.getNotebookFullPath(missionDir, basename)`

Full path of a notebook: <missionDir>/rally/notebooks/<basename>.

- `missionDir` (*string*) : Mission folder.
- `basename` (*string*) : Notebook file name.
- **returns**: string Path.

#### `gameplay_rally_util.getTime()`

High-precision time (os.clockhp). The original comment says "seconds since epoch" but it is a process clock.

- **returns**: number Seconds.

#### `gameplay_rally_util.getVehFrontBottom(vehId)`

Midpoint of the bottom front edge of the vehicle's OOBB (points 0 and 3).

- `vehId` (*integer*) : Vehicle object id.
- **returns**: vec3|nil World position.

#### `gameplay_rally_util.getVehFrontCenter(vehId)`

Center of the front face of the vehicle's oriented bounding box (OOBB) at spawn (average of points 0 to 3).

- `vehId` (*integer*) : Vehicle object id.
- **returns**: vec3|nil World position, nil if the vehicle is not found.

#### `gameplay_rally_util.hasPunctuation(last_char)`

Tests whether a character is one of `?`, `.`, `!`.

- `last_char` (*string*) : Character.
- **returns**: boolean true if end-of-sentence punctuation.

#### `gameplay_rally_util.listNotebooks(missionDir)`

Lists, sorted, the *.notebook.json file names of the mission's notebooks folder.

- `missionDir` (*string|nil*) : Mission folder.
- **returns**: string[] File names; empty if missionDir is nil.

#### `gameplay_rally_util.loadCornerAnglesFile()`

Reads lua/ge/extensions/gameplay/rally/corner_angles.json (corner angle styles).

- **returns**: table|nil JSON content.
- **returns**: string|nil Error message.

#### `gameplay_rally_util.loadNotebook(notebookFname)`

Loads a notebook from a file. If the file is empty or blank, initializes it and saves it. Then computes the adjacent notes (setAllAdjacentNotes).

- `notebookFname` (*string*) : File path.
- **returns**: table|nil Notebook, nil on error (logged).

#### `gameplay_rally_util.loadNotebookForMissionDir(missionDir, basename)`

Loads a mission's notebook from its file name.

- `missionDir` (*string*) : Mission folder.
- `basename` (*string*) : Notebook file name.
- **returns**: table|nil Notebook.

#### `gameplay_rally_util.loadRacePath(missionDir)`

Loads <missionDir>/race.race.json into a gameplay/race/path object.

- `missionDir` (*string*) : Mission folder.
- **returns**: table|nil Race path.
- **returns**: string|nil Error message if the file is absent.

#### `gameplay_rally_util.makePacenoteAudioFilename(pacenoteHash)`

Audio file name of a note: 'pacenote_<hash>.ogg'.

- `pacenoteHash` (*string*) : Note hash.
- **returns**: string File name.

#### `gameplay_rally_util.makePacenoteVariantAudioFilename(pacenoteHash, variant)`

Audio file name of a variant: 'pacenote_<hash>_<n>.ogg' (n integer >= 1).

- `pacenoteHash` (*string*) : Note hash.
- `variant` (*number|string*) : Variant number; default 1, minimum 1.
- **returns**: string File name.

#### `gameplay_rally_util.makeSystemPacenoteAudioFilename(systemKey, variantIndex)`

Audio file name of a system note: 'pacenote_system_<key>_<n>.ogg'.

- `systemKey` (*string*) : System note key.
- `variantIndex` (*number|nil*) : Variant; default 1.
- **returns**: string File name.

#### `gameplay_rally_util.matchSearchPattern(searchPattern, stringToMatch)`

Tests a string with a simple pattern: Lua special characters are escaped and `*` becomes `.*`. The match is not anchored.

- `searchPattern` (*string*) : Pattern with * wildcards.
- `stringToMatch` (*string*) : String tested.
- **returns**: boolean true if found.

#### `gameplay_rally_util.missionDirHelper(missionId)`

Folder of a mission: '/gameplay/missions/<id>'.

- `missionId` (*string|nil*) : Mission id.
- **returns**: string|nil Path, nil if id is nil.

#### `gameplay_rally_util.missionReccePath(missionDir, basename)`

Path of a file in the recce recording folder.

- `missionDir` (*string*) : Mission folder.
- `basename` (*string*) : File name.
- **returns**: string Path.

#### `gameplay_rally_util.missionRecceRecordDir(missionDir)`

Recce recording folder: <missionDir>/rally/recce/primary.

- `missionDir` (*string*) : Mission folder.
- **returns**: string Path.

#### `gameplay_rally_util.normalizeName(name)`

Replaces every non-alphanumeric character with `_` then collapses repeated `_`.

- `name` (*string|nil*) : Name.
- **returns**: string|nil Normalized name, nil if nil.

#### `gameplay_rally_util.pacenoteAudioBasenameVariantIndex(basename)`

Extracts the variant number from an audio file name (suffix _<n>.ogg), 1 by default.

- `basename` (*string*) : File name.
- **returns**: integer|nil Variant, nil if basename is not a string.

#### `gameplay_rally_util.pacenoteHashSha1(s)`

SHA-1 hash of a text, truncated to the first 16 characters.

- `s` (*string*) : Text.
- **returns**: string 16 hexadecimal characters.

#### `gameplay_rally_util.randomId()`

Random 8-character identifier (SHA-1 of a random integer). Low entropy: 1 million possible values.

- **returns**: string 8 hexadecimal characters.

#### `gameplay_rally_util.stripBasename(thepath)`

Returns the folder of a path (removes the file name or the last folder, and the trailing `/`).

- `thepath` (*string|nil*) : Path.
- **returns**: string|nil Parent folder.

#### `gameplay_rally_util.transcriptsFile(missionDir)`

Path of the recce's transcripts.json.

- `missionDir` (*string*) : Mission folder.
- **returns**: string Path.

#### `gameplay_rally_util.translatedMissionName(missionName)`

Translates a mission name with _tr.

- `missionName` (*string|nil*) : Name or key.
- **returns**: string|nil Translated text.

#### `gameplay_rally_util.translatedMissionNameFromId(missionId)`

Translated name of a mission from its id.

- `missionId` (*string*) : Mission id.
- **returns**: string Translated name, or id.

#### `gameplay_rally_util.trimString(txt)`

Removes leading and trailing whitespace.

- `txt` (*string|nil*) : Text.
- **returns**: string|nil Cleaned text.

#### `gameplay_rally_util.useNote(text)`

Indicates whether a note text should be used: non-empty, different from '#' and '<none>'.

- `text` (*string|nil*) : Note text.
- **returns**: boolean|nil Truthy if usable.

## Fields

| Field | Type | Description |
|---|---|---|
| `activeState_countdown` | string | 'countdown'. |
| `activeState_inactive` | string | 'inactive'. |
| `activeState_stageActive` | string | 'stageActive'. |
| `activeState_vehicleProximity` | string | 'vehicleProximity'. |
| `autodist_internal_level1` | string | '<none>': internal value of automatic distance level 1. |
| `autofill_blocker` | string | '#': note text that blocks automatic filling. |
| `defaultCodriverName` | string | 'Sophia'. |
| `defaultNotebookFname` | string | 'primary.notebook.json'. |
| `default_codriver_language` | string | 'english'. |
| `default_codriver_voice` | string | 'british_female'. |
| `default_waypoint_intersect_radius` | number | 40 (default intersection radius of a waypoint, in meters, unit inferred from the name). |
| `extRally` | string | 'gameplay_rally': name of the rally extension. |
| `extRallyLoop` | string | 'gameplay_rallyLoop': name of the rally loop extension. |
| `freeformDir` | string | 'freeform'. |
| `generatedPacenotesDir` | string | 'gen'. |
| `missionRallyDir` | string | 'rally': rally subfolder of a mission. |
| `notebooksDir` | string | 'notebooks'. |
| `notebooksPath` | string | 'rally/notebooks' (relative to the mission folder). |
| `pacenotesMetadataBasename` | string | 'metadata.json'. |
| `pacenotesTranscriptionsBasename` | string | 'transcriptions.json'. |
| `rallyLoop_flowgraph_color` | ImVec4 | Rally loop flowgraph node color (0, 0.97, 1, 0.75). |
| `rallySettingsRoot` | string | '/settings/rally'. |
| `rally_flowgraph_color` | ImVec4 | Rally flowgraph node color (0, 1, 0.87, 0.75). |
| `recceDir` | string | 'recce'. |
| `recceRecordSubdir` | string | 'primary': subfolder of the main recce recording. |
| `structuredDir` | string | 'structured'. |
| `systemDir` | string | 'system'. |
| `transcriptsExt` | string | 'transcripts.json'. |
| `unknown_transcript_str` | string | '[unknown]'. |
| `validPunctuation` | string[] | {'?', '.', '!'}. |
| `var_da` | string | '{da}': note template variable. |
| `var_db` | string | '{db}': note template variable. |

## Calls into the engine (C++)

- `FS:` `fileExists`, `findFiles`
- `debugDrawer:` `drawLineInstance`, `drawSphere`
- `scenetree.` `findObjectById`
- `ui_imgui.` `ImVec4`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/rally/util.lua`.*
