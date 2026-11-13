---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/util.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `gameplay_rally_util` : `extensions.load("gameplay_rally_util")`, puis la globale `gameplay_rally_util`
---@class gameplay_rally_util
---@field activeState_countdown string
---@field activeState_inactive string
---@field activeState_stageActive string
---@field activeState_vehicleProximity string
---@field autodist_internal_level1 string
---@field autofill_blocker string
---@field defaultCodriverName string
---@field defaultNotebookFname string
---@field default_codriver_language string
---@field default_codriver_voice string
---@field default_waypoint_intersect_radius number
---@field extRally string
---@field extRallyLoop string
---@field freeformDir string
---@field generatedPacenotesDir string
---@field missionRallyDir string
---@field notebooksDir string
---@field notebooksPath any
---@field pacenotesMetadataBasename string
---@field pacenotesTranscriptionsBasename string
---@field rallyLoop_flowgraph_color any
---@field rallySettingsRoot string
---@field rally_flowgraph_color any
---@field recceDir string
---@field recceRecordSubdir string
---@field structuredDir string
---@field systemDir string
---@field transcriptsExt string
---@field unknown_transcript_str string
---@field validPunctuation table
---@field var_da string
---@field var_db string
gameplay_rally_util = {}

---Source : lua/ge/extensions/gameplay/rally/util.lua:494
---@param point1 any
---@param point2 any
---@param threshold any
function gameplay_rally_util.arePointsEqualWithinThreshold(point1, point2, threshold) end

--- args are both vec3's representing a position.
---Source : lua/ge/extensions/gameplay/rally/util.lua:315
---@param snap_pos any
---@param next_pos any
function gameplay_rally_util.calculateForwardNormal(snap_pos, next_pos) end

---Source : lua/ge/extensions/gameplay/rally/util.lua:432
---@param a any
---@param b any
function gameplay_rally_util.compareCustomPacenoteAudioBasenames(a, b) end

---Source : lua/ge/extensions/gameplay/rally/util.lua:204
---@param fname any
function gameplay_rally_util.createNotebook(fname) end

---Source : lua/ge/extensions/gameplay/rally/util.lua:420
---@param basename any
function gameplay_rally_util.customPacenoteAudioBasenameParts(basename) end

---Source : lua/ge/extensions/gameplay/rally/util.lua:400
---@param dist any
---@param round_to any
function gameplay_rally_util.customRound(dist, round_to) end

---Source : lua/ge/extensions/gameplay/rally/util.lua:306
---@param missionDir any
function gameplay_rally_util.cutsFile(missionDir) end

---Source : lua/ge/extensions/gameplay/rally/util.lua:107
function gameplay_rally_util.detectMissionEditorMissionId() end

---Source : lua/ge/extensions/gameplay/rally/util.lua:140
function gameplay_rally_util.detectMissionIdHelper() end

---Source : lua/ge/extensions/gameplay/rally/util.lua:99
function gameplay_rally_util.detectMissionManagerMissionId() end

---Source : lua/ge/extensions/gameplay/rally/util.lua:347
---@param angles any
---@param steering any
function gameplay_rally_util.determineCornerCall(angles, steering) end

---Source : lua/ge/extensions/gameplay/rally/util.lua:537
---@param vehId any
function gameplay_rally_util.drawVehBB(vehId) end

---Source : lua/ge/extensions/gameplay/rally/util.lua:529
---@param vehId any
---@param inside any
function gameplay_rally_util.drawVehLeadingPoint(vehId, inside) end

---Source : lua/ge/extensions/gameplay/rally/util.lua:294
---@param missionDir any
function gameplay_rally_util.drivelineFile(missionDir) end

---Source : lua/ge/extensions/gameplay/rally/util.lua:302
---@param missionDir any
function gameplay_rally_util.drivelineSplineFile(missionDir) end

---Source : lua/ge/extensions/gameplay/rally/util.lua:298
---@param missionDir any
function gameplay_rally_util.finalDrivelineFile(missionDir) end

---Source : lua/ge/extensions/gameplay/rally/util.lua:600
---@param timeSecs any
---@param includeSeconds any
---@param includeTenths any
function gameplay_rally_util.formatTime12Hour(timeSecs, includeSeconds, includeTenths) end

---Source : lua/ge/extensions/gameplay/rally/util.lua:576
---@param timeSecs any
---@param includeSeconds any
---@param includeTenths any
function gameplay_rally_util.formatTime24Hour(timeSecs, includeSeconds, includeTenths) end

---Source : lua/ge/extensions/gameplay/rally/util.lua:628
---@param timeSecs any
---@param includeSeconds any
---@param includeTenths any
function gameplay_rally_util.formatTimeFromSeconds(timeSecs, includeSeconds, includeTenths) end

---Source : lua/ge/extensions/gameplay/rally/util.lua:490
---@param clr any
function gameplay_rally_util.getAppropriateTextColor(clr) end

---Source : lua/ge/extensions/gameplay/rally/util.lua:450
---@param missionId any
function gameplay_rally_util.getMissionName(missionId) end

---Source : lua/ge/extensions/gameplay/rally/util.lua:186
---@param missionDir any
---@param basename any
function gameplay_rally_util.getNotebookFullPath(missionDir, basename) end

--- returns seconds since epoch
---Source : lua/ge/extensions/gameplay/rally/util.lua:64
function gameplay_rally_util.getTime() end

---Source : lua/ge/extensions/gameplay/rally/util.lua:516
---@param vehId any
function gameplay_rally_util.getVehFrontBottom(vehId) end

---Source : lua/ge/extensions/gameplay/rally/util.lua:500
---@param vehId any
function gameplay_rally_util.getVehFrontCenter(vehId) end

---Source : lua/ge/extensions/gameplay/rally/util.lua:89
---@param last_char any
function gameplay_rally_util.hasPunctuation(last_char) end

---Source : lua/ge/extensions/gameplay/rally/util.lua:191
---@param missionDir any
function gameplay_rally_util.listNotebooks(missionDir) end

---Source : lua/ge/extensions/gameplay/rally/util.lua:335
function gameplay_rally_util.loadCornerAnglesFile() end

---Source : lua/ge/extensions/gameplay/rally/util.lua:220
---@param notebookFname any
function gameplay_rally_util.loadNotebook(notebookFname) end

---Source : lua/ge/extensions/gameplay/rally/util.lua:259
---@param missionDir any
---@param basename any
function gameplay_rally_util.loadNotebookForMissionDir(missionDir, basename) end

---Source : lua/ge/extensions/gameplay/rally/util.lua:264
---@param missionDir any
function gameplay_rally_util.loadRacePath(missionDir) end

---Source : lua/ge/extensions/gameplay/rally/util.lua:404
---@param pacenoteHash any
function gameplay_rally_util.makePacenoteAudioFilename(pacenoteHash) end

---Source : lua/ge/extensions/gameplay/rally/util.lua:408
---@param pacenoteHash any
---@param variant any
function gameplay_rally_util.makePacenoteVariantAudioFilename(pacenoteHash, variant) end

---Source : lua/ge/extensions/gameplay/rally/util.lua:445
---@param systemKey any
---@param variantIndex any
function gameplay_rally_util.makeSystemPacenoteAudioFilename(systemKey, variantIndex) end

---Source : lua/ge/extensions/gameplay/rally/util.lua:384
---@param searchPattern any
---@param stringToMatch any
function gameplay_rally_util.matchSearchPattern(searchPattern, stringToMatch) end

---Source : lua/ge/extensions/gameplay/rally/util.lua:131
---@param missionId any
function gameplay_rally_util.missionDirHelper(missionId) end

---Source : lua/ge/extensions/gameplay/rally/util.lua:288
---@param missionDir any
---@param basename any
function gameplay_rally_util.missionReccePath(missionDir, basename) end

---Source : lua/ge/extensions/gameplay/rally/util.lua:283
---@param missionDir any
function gameplay_rally_util.missionRecceRecordDir(missionDir) end

---Source : lua/ge/extensions/gameplay/rally/util.lua:77
---@param name any
function gameplay_rally_util.normalizeName(name) end

---Source : lua/ge/extensions/gameplay/rally/util.lua:414
---@param basename any
function gameplay_rally_util.pacenoteAudioBasenameVariantIndex(basename) end

---Source : lua/ge/extensions/gameplay/rally/util.lua:58
---@param s any
function gameplay_rally_util.pacenoteHashSha1(s) end

---Source : lua/ge/extensions/gameplay/rally/util.lua:484
function gameplay_rally_util.randomId() end

---Source : lua/ge/extensions/gameplay/rally/util.lua:370
---@param thepath any
function gameplay_rally_util.stripBasename(thepath) end

---Source : lua/ge/extensions/gameplay/rally/util.lua:310
---@param missionDir any
function gameplay_rally_util.transcriptsFile(missionDir) end

---Source : lua/ge/extensions/gameplay/rally/util.lua:461
---@param missionName any
function gameplay_rally_util.translatedMissionName(missionName) end

---Source : lua/ge/extensions/gameplay/rally/util.lua:472
---@param missionId any
function gameplay_rally_util.translatedMissionNameFromId(missionId) end

---Source : lua/ge/extensions/gameplay/rally/util.lua:364
---@param txt any
function gameplay_rally_util.trimString(txt) end

---Source : lua/ge/extensions/gameplay/rally/util.lua:393
---@param text any
function gameplay_rally_util.useNote(text) end

