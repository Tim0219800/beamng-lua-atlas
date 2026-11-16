---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/util.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Common toolbox of rally mode (GE): constants (folder names, active states, flowgraph colors, co-driver default values), file paths of a mission (notebooks, recce, driveline, cuts, transcriptions), loading of notebooks and race paths, detection of the current mission id, naming of pacenote audio files, computation of a corner call from the steering angle, vehicle debug drawing helpers and time formatting. Almost all the other gameplay/rally files use it via require.
--- Access: extension `gameplay_rally_util`: `extensions.load("gameplay_rally_util")`, then the global `gameplay_rally_util`
---@class gameplay_rally_util
---@field activeState_countdown string 'countdown'.
---@field activeState_inactive string 'inactive'.
---@field activeState_stageActive string 'stageActive'.
---@field activeState_vehicleProximity string 'vehicleProximity'.
---@field autodist_internal_level1 string '<none>': internal value of automatic distance level 1.
---@field autofill_blocker string '#': note text that blocks automatic filling.
---@field defaultCodriverName string 'Sophia'.
---@field defaultNotebookFname string 'primary.notebook.json'.
---@field default_codriver_language string 'english'.
---@field default_codriver_voice string 'british_female'.
---@field default_waypoint_intersect_radius number 40 (default intersection radius of a waypoint, in meters, unit inferred from the name).
---@field extRally string 'gameplay_rally': name of the rally extension.
---@field extRallyLoop string 'gameplay_rallyLoop': name of the rally loop extension.
---@field freeformDir string 'freeform'.
---@field generatedPacenotesDir string 'gen'.
---@field missionRallyDir string 'rally': rally subfolder of a mission.
---@field notebooksDir string 'notebooks'.
---@field notebooksPath string 'rally/notebooks' (relative to the mission folder).
---@field pacenotesMetadataBasename string 'metadata.json'.
---@field pacenotesTranscriptionsBasename string 'transcriptions.json'.
---@field rallyLoop_flowgraph_color ImVec4 Rally loop flowgraph node color (0, 0.97, 1, 0.75).
---@field rallySettingsRoot string '/settings/rally'.
---@field rally_flowgraph_color ImVec4 Rally flowgraph node color (0, 1, 0.87, 0.75).
---@field recceDir string 'recce'.
---@field recceRecordSubdir string 'primary': subfolder of the main recce recording.
---@field structuredDir string 'structured'.
---@field systemDir string 'system'.
---@field transcriptsExt string 'transcripts.json'.
---@field unknown_transcript_str string '[unknown]'.
---@field validPunctuation string[] {'?', '.', '!'}.
---@field var_da string '{da}': note template variable.
---@field var_db string '{db}': note template variable.
gameplay_rally_util = {}

--- Tests whether two points are at a distance less than or equal to the threshold.
---Source: lua/ge/extensions/gameplay/rally/util.lua:494
---@param point1 vec3 First point.
---@param point2 vec3 Second point.
---@param threshold number Maximum distance in meters.
---@return boolean  true if close.
function gameplay_rally_util.arePointsEqualWithinThreshold(point1, point2, threshold) end

--- Unit vector going from snap_pos to next_pos. Raises an error if the two positions are identical.
---Source: lua/ge/extensions/gameplay/rally/util.lua:315
---@param snap_pos vec3 Start position.
---@param next_pos vec3 Next position.
---@return vec3  Normalized direction.
function gameplay_rally_util.calculateForwardNormal(snap_pos, next_pos) end

--- Sort comparator: by number, letter then variant; recognized names come before the others, which are sorted alphabetically.
---Source: lua/ge/extensions/gameplay/rally/util.lua:432
---@param a string First name.
---@param b string Second name.
---@return boolean  true if a must come before b.
function gameplay_rally_util.compareCustomPacenoteAudioBasenames(a, b) end

--- Creates an empty notebook (rally/notebook/path) at this path and saves it.
---Source: lua/ge/extensions/gameplay/rally/util.lua:204
---@param fname string File path.
---@return table|nil  Notebook object, nil if the save fails.
function gameplay_rally_util.createNotebook(fname) end

--- Decomposes a name of the form 'pacenote_<number><letter>_<variant>.ogg'.
---Source: lua/ge/extensions/gameplay/rally/util.lua:420
---@param basename string File name.
---@return table|nil  {number, letter, variant, basename} or nil if the format does not match.
function gameplay_rally_util.customPacenoteAudioBasenameParts(basename) end

--- Rounds a value to the nearest multiple.
---Source: lua/ge/extensions/gameplay/rally/util.lua:400
---@param dist number Value.
---@param round_to number Rounding step.
---@return number  Rounded value.
function gameplay_rally_util.customRound(dist, round_to) end

--- Path of the recce's cuts.json.
---Source: lua/ge/extensions/gameplay/rally/util.lua:306
---@param missionDir string Mission folder.
---@return string  Path.
function gameplay_rally_util.cutsFile(missionDir) end

--- Id of the mission selected in the mission editor (see notes).
---Source: lua/ge/extensions/gameplay/rally/util.lua:107
---@return string|nil  Mission id.
function gameplay_rally_util.detectMissionEditorMissionId() end

--- Detects the current mission id in the order: missionManager, rallyEditor, missionEditor, and computes its folder.
---Source: lua/ge/extensions/gameplay/rally/util.lua:140
---@return string|nil  Mission id.
---@return string|nil  Mission folder.
---@return string|nil  Error message 'missionId could not be detected' on failure.
function gameplay_rally_util.detectMissionIdHelper() end

--- Id of the foreground mission according to gameplay_missions_missionManager.
---Source: lua/ge/extensions/gameplay/rally/util.lua:99
---@return string|nil  Mission id.
function gameplay_rally_util.detectMissionManagerMissionId() end

--- Finds the angle range matching the absolute value of the steering and builds the corner call in uppercase with direction (L if steering >= 0, R otherwise); a '_deadzone' range gives 'C'.
---Source: lua/ge/extensions/gameplay/rally/util.lua:347
---@param angles table[] List of {fromAngleDegrees, toAngleDegrees, cornerCall}.
---@param steering number Steering in degrees (signed).
---@return table|nil  Range found.
---@return string  Corner call (e.g. '3L').
---@return number  Position within the range between 0 and 1.
function gameplay_rally_util.determineCornerCall(angles, steering) end

--- Draws in blue the 12 edges of the vehicle's OOBB with debugDrawer:drawLineInstance.
---Source: lua/ge/extensions/gameplay/rally/util.lua:537
---@param vehId integer Vehicle object id.
function gameplay_rally_util.drawVehBB(vehId) end

--- Draws a small sphere (radius 0.1) at the center of the vehicle's front face: green if inside, red otherwise.
---Source: lua/ge/extensions/gameplay/rally/util.lua:529
---@param vehId integer Vehicle object id.
---@param inside boolean Color choice.
function gameplay_rally_util.drawVehLeadingPoint(vehId, inside) end

--- Path of the recce's driveline.json.
---Source: lua/ge/extensions/gameplay/rally/util.lua:294
---@param missionDir string Mission folder.
---@return string  Path.
function gameplay_rally_util.drivelineFile(missionDir) end

--- Path of <missionDir>/rally/drivelineSpline.json.
---Source: lua/ge/extensions/gameplay/rally/util.lua:302
---@param missionDir string Mission folder.
---@return string  Path.
function gameplay_rally_util.drivelineSplineFile(missionDir) end

--- Path of <missionDir>/rally/finalDriveline.json.
---Source: lua/ge/extensions/gameplay/rally/util.lua:298
---@param missionDir string Mission folder.
---@return string  Path.
function gameplay_rally_util.finalDrivelineFile(missionDir) end

--- Same in 12 h format.
---Source: lua/ge/extensions/gameplay/rally/util.lua:600
---@param timeSecs number|nil Seconds.
---@param includeSeconds boolean|nil Adds the seconds.
---@param includeTenths boolean|nil Adds the tenths.
---@return table  {time = string, ampm = 'AM'|'PM'}.
function gameplay_rally_util.formatTime12Hour(timeSecs, includeSeconds, includeTenths) end

--- Formats a number of seconds since midnight as HH:MM[:SS[.d]] (modulo 24 h).
---Source: lua/ge/extensions/gameplay/rally/util.lua:576
---@param timeSecs number|nil Seconds.
---@param includeSeconds boolean|nil Adds the seconds.
---@param includeTenths boolean|nil Adds the tenths (with includeSeconds).
---@return table  {time = string}; 'N/A' if timeSecs is nil.
function gameplay_rally_util.formatTime24Hour(timeSecs, includeSeconds, includeTenths) end

--- Supposed to return "24h / 12h"; bug: concatenates two tables (see notes).
---Source: lua/ge/extensions/gameplay/rally/util.lua:628
---@param timeSecs number|nil Seconds.
---@param includeSeconds boolean|nil Adds the seconds.
---@param includeTenths boolean|nil Adds the tenths.
---@return string  'N/A' if timeSecs is nil; otherwise error.
function gameplay_rally_util.formatTimeFromSeconds(timeSecs, includeSeconds, includeTenths) end

--- Chooses a readable text color on a background: white for a dark blue background, black otherwise.
---Source: lua/ge/extensions/gameplay/rally/util.lua:490
---@param clr number[] Background color {r, g, b} between 0 and 1.
---@return ColorF  Opaque white or black.
function gameplay_rally_util.getAppropriateTextColor(clr) end

--- Name (translation key) of a mission; returns the id if the mission is not found.
---Source: lua/ge/extensions/gameplay/rally/util.lua:450
---@param missionId string Mission id.
---@return string  Name or id.
function gameplay_rally_util.getMissionName(missionId) end

--- Full path of a notebook: <missionDir>/rally/notebooks/<basename>.
---Source: lua/ge/extensions/gameplay/rally/util.lua:186
---@param missionDir string Mission folder.
---@param basename string Notebook file name.
---@return string  Path.
function gameplay_rally_util.getNotebookFullPath(missionDir, basename) end

--- High-precision time (os.clockhp). The original comment says "seconds since epoch" but it is a process clock.
---Source: lua/ge/extensions/gameplay/rally/util.lua:64
---@return number  Seconds.
function gameplay_rally_util.getTime() end

--- Midpoint of the bottom front edge of the vehicle's OOBB (points 0 and 3).
---Source: lua/ge/extensions/gameplay/rally/util.lua:516
---@param vehId integer Vehicle object id.
---@return vec3|nil  World position.
function gameplay_rally_util.getVehFrontBottom(vehId) end

--- Center of the front face of the vehicle's oriented bounding box (OOBB) at spawn (average of points 0 to 3).
---Source: lua/ge/extensions/gameplay/rally/util.lua:500
---@param vehId integer Vehicle object id.
---@return vec3|nil  World position, nil if the vehicle is not found.
function gameplay_rally_util.getVehFrontCenter(vehId) end

--- Tests whether a character is one of `?`, `.`, `!`.
---Source: lua/ge/extensions/gameplay/rally/util.lua:89
---@param last_char string Character.
---@return boolean  true if end-of-sentence punctuation.
function gameplay_rally_util.hasPunctuation(last_char) end

--- Lists, sorted, the *.notebook.json file names of the mission's notebooks folder.
---Source: lua/ge/extensions/gameplay/rally/util.lua:191
---@param missionDir string|nil Mission folder.
---@return string[]  File names; empty if missionDir is nil.
function gameplay_rally_util.listNotebooks(missionDir) end

--- Reads lua/ge/extensions/gameplay/rally/corner_angles.json (corner angle styles).
---Source: lua/ge/extensions/gameplay/rally/util.lua:335
---@return table|nil  JSON content.
---@return string|nil  Error message.
function gameplay_rally_util.loadCornerAnglesFile() end

--- Loads a notebook from a file. If the file is empty or blank, initializes it and saves it. Then computes the adjacent notes (setAllAdjacentNotes).
---Source: lua/ge/extensions/gameplay/rally/util.lua:220
---@param notebookFname string File path.
---@return table|nil  Notebook, nil on error (logged).
function gameplay_rally_util.loadNotebook(notebookFname) end

--- Loads a mission's notebook from its file name.
---Source: lua/ge/extensions/gameplay/rally/util.lua:259
---@param missionDir string Mission folder.
---@param basename string Notebook file name.
---@return table|nil  Notebook.
function gameplay_rally_util.loadNotebookForMissionDir(missionDir, basename) end

--- Loads <missionDir>/race.race.json into a gameplay/race/path object.
---Source: lua/ge/extensions/gameplay/rally/util.lua:264
---@param missionDir string Mission folder.
---@return table|nil  Race path.
---@return string|nil  Error message if the file is absent.
function gameplay_rally_util.loadRacePath(missionDir) end

--- Audio file name of a note: 'pacenote_<hash>.ogg'.
---Source: lua/ge/extensions/gameplay/rally/util.lua:404
---@param pacenoteHash string Note hash.
---@return string  File name.
function gameplay_rally_util.makePacenoteAudioFilename(pacenoteHash) end

--- Audio file name of a variant: 'pacenote_<hash>_<n>.ogg' (n integer >= 1).
---Source: lua/ge/extensions/gameplay/rally/util.lua:408
---@param pacenoteHash string Note hash.
---@param variant number|string Variant number; default 1, minimum 1.
---@return string  File name.
function gameplay_rally_util.makePacenoteVariantAudioFilename(pacenoteHash, variant) end

--- Audio file name of a system note: 'pacenote_system_<key>_<n>.ogg'.
---Source: lua/ge/extensions/gameplay/rally/util.lua:445
---@param systemKey string System note key.
---@param variantIndex number|nil Variant; default 1.
---@return string  File name.
function gameplay_rally_util.makeSystemPacenoteAudioFilename(systemKey, variantIndex) end

--- Tests a string with a simple pattern: Lua special characters are escaped and `*` becomes `.*`. The match is not anchored.
---Source: lua/ge/extensions/gameplay/rally/util.lua:384
---@param searchPattern string Pattern with * wildcards.
---@param stringToMatch string String tested.
---@return boolean  true if found.
function gameplay_rally_util.matchSearchPattern(searchPattern, stringToMatch) end

--- Folder of a mission: '/gameplay/missions/<id>'.
---Source: lua/ge/extensions/gameplay/rally/util.lua:131
---@param missionId string|nil Mission id.
---@return string|nil  Path, nil if id is nil.
function gameplay_rally_util.missionDirHelper(missionId) end

--- Path of a file in the recce recording folder.
---Source: lua/ge/extensions/gameplay/rally/util.lua:288
---@param missionDir string Mission folder.
---@param basename string File name.
---@return string  Path.
function gameplay_rally_util.missionReccePath(missionDir, basename) end

--- Recce recording folder: <missionDir>/rally/recce/primary.
---Source: lua/ge/extensions/gameplay/rally/util.lua:283
---@param missionDir string Mission folder.
---@return string  Path.
function gameplay_rally_util.missionRecceRecordDir(missionDir) end

--- Replaces every non-alphanumeric character with `_` then collapses repeated `_`.
---Source: lua/ge/extensions/gameplay/rally/util.lua:77
---@param name string|nil Name.
---@return string|nil  Normalized name, nil if nil.
function gameplay_rally_util.normalizeName(name) end

--- Extracts the variant number from an audio file name (suffix _<n>.ogg), 1 by default.
---Source: lua/ge/extensions/gameplay/rally/util.lua:414
---@param basename string File name.
---@return integer|nil  Variant, nil if basename is not a string.
function gameplay_rally_util.pacenoteAudioBasenameVariantIndex(basename) end

--- SHA-1 hash of a text, truncated to the first 16 characters.
---Source: lua/ge/extensions/gameplay/rally/util.lua:58
---@param s string Text.
---@return string  16 hexadecimal characters.
function gameplay_rally_util.pacenoteHashSha1(s) end

--- Random 8-character identifier (SHA-1 of a random integer). Low entropy: 1 million possible values.
---Source: lua/ge/extensions/gameplay/rally/util.lua:484
---@return string  8 hexadecimal characters.
function gameplay_rally_util.randomId() end

--- Returns the folder of a path (removes the file name or the last folder, and the trailing `/`).
---Source: lua/ge/extensions/gameplay/rally/util.lua:370
---@param thepath string|nil Path.
---@return string|nil  Parent folder.
function gameplay_rally_util.stripBasename(thepath) end

--- Path of the recce's transcripts.json.
---Source: lua/ge/extensions/gameplay/rally/util.lua:310
---@param missionDir string Mission folder.
---@return string  Path.
function gameplay_rally_util.transcriptsFile(missionDir) end

--- Translates a mission name with _tr.
---Source: lua/ge/extensions/gameplay/rally/util.lua:461
---@param missionName string|nil Name or key.
---@return string|nil  Translated text.
function gameplay_rally_util.translatedMissionName(missionName) end

--- Translated name of a mission from its id.
---Source: lua/ge/extensions/gameplay/rally/util.lua:472
---@param missionId string Mission id.
---@return string  Translated name, or id.
function gameplay_rally_util.translatedMissionNameFromId(missionId) end

--- Removes leading and trailing whitespace.
---Source: lua/ge/extensions/gameplay/rally/util.lua:364
---@param txt string|nil Text.
---@return string|nil  Cleaned text.
function gameplay_rally_util.trimString(txt) end

--- Indicates whether a note text should be used: non-empty, different from '#' and '<none>'.
---Source: lua/ge/extensions/gameplay/rally/util.lua:393
---@param text string|nil Note text.
---@return boolean|nil  Truthy if usable.
function gameplay_rally_util.useNote(text) end

