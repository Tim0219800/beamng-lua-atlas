---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/compositors/helpers/textCompositor.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Text compositor. Attributes: compositorName, missionDir, compositor (table of the loaded style or nil), cachedSystemPacenotes, voicepackEntry.
---@class gameplay_rally_compositors_helpers_textCompositor
local gameplay_rally_compositors_helpers_textCompositor = {}

--- Requires the style file (nil if no name).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/compositors/helpers/textCompositor.lua:65
---@return table|nil  Style module (shared: load makes a copy of it).
function gameplay_rally_compositors_helpers_textCompositor:_requireCompositor() end

--- Calls compositorUtil.compositePhraseEntries with the style's config: returns entries {text, category, variant, audioFname}.
---Source: lua/ge/extensions/gameplay/rally/compositors/helpers/textCompositor.lua:81
---@param structured table Structured note.
---@param distBefore number|nil Distance before (m).
---@param distAfter number|nil Distance after (m).
---@param opts table|nil Options: escapeVars, variantResolver, distanceAfterBeforePostModifier.
---@return table[]|nil  Phrase entries.
function gameplay_rally_compositors_helpers_textCompositor:compositePhraseEntries(structured, distBefore, distAfter, opts) end

--- Composes a note's text by calling style.composite(config, structured, distBefore, distAfter).
---Source: lua/ge/extensions/gameplay/rally/compositors/helpers/textCompositor.lua:71
---@param structured table Structured note.
---@param distBefore number|nil Distance from the previous note (m).
---@param distAfter number|nil Distance to the next note (m).
---@return table|nil  Style result (list of phrases) or nil if the style is not loaded.
function gameplay_rally_compositors_helpers_textCompositor:compositeText(structured, distBefore, distAfter) end

--- Like compositeText, but with escapeVars=true: distances are replaced by the substitution variables (rallyUtil.var_db / var_da) instead of their value.
---Source: lua/ge/extensions/gameplay/rally/compositors/helpers/textCompositor.lua:76
---@param structured table Structured note.
---@param distBefore number|nil Distance before (m).
---@param distAfter number|nil Distance after (m).
---@return table|nil  List of phrases or nil.
function gameplay_rally_compositors_helpers_textCompositor:compositeTextEscaped(structured, distBefore, distAfter) end

--- Style module path: '/lua/ge/extensions/gameplay/rally/compositors/styles/<name>'.
---Source: lua/ge/extensions/gameplay/rally/compositors/helpers/textCompositor.lua:61
---@return string  Path without extension.
function gameplay_rally_compositors_helpers_textCompositor:compositorPath() end

--- Indicates whether distance calls are enabled in the style (false if not loaded).
---Source: lua/ge/extensions/gameplay/rally/compositors/helpers/textCompositor.lua:91
---@return boolean  State.
function gameplay_rally_compositors_helpers_textCompositor:distanceCallsEnabled() end

--- Converts a distance to spoken text (integer part then rounding); in the 'large' unit, the decimal point is replaced by the style's word 'point' and the digits are separated, then the unit is appended.
---Source: lua/ge/extensions/gameplay/rally/compositors/helpers/textCompositor.lua:368
---@param dist number Distance in meters.
---@return string  Distance text.
function gameplay_rally_compositors_helpers_textCompositor:distanceToString(dist) end

--- Enumerates all phrases (distances, notes, system) with hash, group and statistics (totalChars, totalPhrases...). Raises an error if a phrase is duplicated.
---Source: lua/ge/extensions/gameplay/rally/compositors/helpers/textCompositor.lua:261
---@return table  {stats, phrases, groups = {distances, pacenotes, system}}.
function gameplay_rally_compositors_helpers_textCompositor:enumerateAll() end

--- Enumerates the speakable distance calls: from the links' max distance up to distance.max, in steps of rounding.small, deduplicated by text. Empty if distance calls are disabled.
---Source: lua/ge/extensions/gameplay/rally/compositors/helpers/textCompositor.lua:162
---@return table[]  Sorted list of {phrase, distance}.
function gameplay_rally_compositors_helpers_textCompositor:enumerateDistanceEntries() end

--- Same as enumerateDistanceEntries but keeps only the phrases.
---Source: lua/ge/extensions/gameplay/rally/compositors/helpers/textCompositor.lua:196
---@return string[]  Sorted distance phrases.
function gameplay_rally_compositors_helpers_textCompositor:enumerateDistances() end

--- Enumerates the note phrases via style.enumerate(self, config).
---Source: lua/ge/extensions/gameplay/rally/compositors/helpers/textCompositor.lua:204
---@return string[]  Phrases (empty if not loaded).
function gameplay_rally_compositors_helpers_textCompositor:enumeratePacenotes() end

--- Enumerates the script player entries with category and variants: system notes, distances, then those from compositorUtil.enumerateScriptEntries. Fills in hash, audioFname and recordingSlug.
---Source: lua/ge/extensions/gameplay/rally/compositors/helpers/textCompositor.lua:209
---@return table[]  Entries {phrase, hash, audioFname, recordingSlug, category, subcategory, sourceContext, variant, sortGroup, sortSubgroup}.
function gameplay_rally_compositors_helpers_textCompositor:enumerateScriptEntries() end

--- Base unit of distances (distance.units.base).
---Source: lua/ge/extensions/gameplay/rally/compositors/helpers/textCompositor.lua:402
---@return string  Unit.
function gameplay_rally_compositors_helpers_textCompositor:getBaseUnit() end

--- Returns the loaded style's table.
---Source: lua/ge/extensions/gameplay/rally/compositors/helpers/textCompositor.lua:86
---@return table|nil  Style config.
function gameplay_rally_compositors_helpers_textCompositor:getConfig() end

--- Returns the text of the first distance link whose threshold is greater than dist (e.g. 'into', 'and').
---Source: lua/ge/extensions/gameplay/rally/compositors/helpers/textCompositor.lua:381
---@param dist number Distance in meters.
---@return string|nil  Link text.
---@return boolean  true if a link was found.
function gameplay_rally_compositors_helpers_textCompositor:getDistanceCallShorthand(dist) end

--- List of the style's distance links (distance.links).
---Source: lua/ge/extensions/gameplay/rally/compositors/helpers/textCompositor.lua:392
---@return table[]  Links {threshold, text}.
function gameplay_rally_compositors_helpers_textCompositor:getDistanceLinks() end

--- Large unit of distances (distance.units.large).
---Source: lua/ge/extensions/gameplay/rally/compositors/helpers/textCompositor.lua:405
---@return string  Unit.
function gameplay_rally_compositors_helpers_textCompositor:getLargeUnit() end

--- Maximum spoken distance (distance.max).
---Source: lua/ge/extensions/gameplay/rally/compositors/helpers/textCompositor.lua:428
---@return number  Distance in m.
function gameplay_rally_compositors_helpers_textCompositor:getMaxDistance() end

--- Threshold of the last distance link (0 if there are none).
---Source: lua/ge/extensions/gameplay/rally/compositors/helpers/textCompositor.lua:396
---@return number  Distance in meters.
function gameplay_rally_compositors_helpers_textCompositor:getMaxLinkDistance() end

--- Spoken word for the decimal point (distance.units.point).
---Source: lua/ge/extensions/gameplay/rally/compositors/helpers/textCompositor.lua:408
---@return string  Word.
function gameplay_rally_compositors_helpers_textCompositor:getPointTranslation() end

--- Rounding step for large distances (distance.rounding.large).
---Source: lua/ge/extensions/gameplay/rally/compositors/helpers/textCompositor.lua:422
---@return number  Step in m.
function gameplay_rally_compositors_helpers_textCompositor:getRoundingLarge() end

--- Distance from which the large unit is used (distance.rounding.largeThreshold).
---Source: lua/ge/extensions/gameplay/rally/compositors/helpers/textCompositor.lua:425
---@return number  Threshold in m.
function gameplay_rally_compositors_helpers_textCompositor:getRoundingLargeThreshold() end

--- Rounding step for medium distances (distance.rounding.medium).
---Source: lua/ge/extensions/gameplay/rally/compositors/helpers/textCompositor.lua:415
---@return number  Step in m.
function gameplay_rally_compositors_helpers_textCompositor:getRoundingMedium() end

--- Distance from which the medium step is used (distance.rounding.mediumThreshold).
---Source: lua/ge/extensions/gameplay/rally/compositors/helpers/textCompositor.lua:418
---@return number  Threshold in m.
function gameplay_rally_compositors_helpers_textCompositor:getRoundingMediumThreshold() end

--- Rounding step for small distances (distance.rounding.small).
---Source: lua/ge/extensions/gameplay/rally/compositors/helpers/textCompositor.lua:412
---@return number  Step in m.
function gameplay_rally_compositors_helpers_textCompositor:getRoundingSmall() end

--- Returns the i-th variant (1 by default) of the system note 'name'.
---Source: lua/ge/extensions/gameplay/rally/compositors/helpers/textCompositor.lua:155
---@param name string System note name.
---@param i integer|nil Variant index.
---@return table|nil  Variant {text, audioFname, audioBasename...}.
function gameplay_rally_compositors_helpers_textCompositor:getSystemPacenote(name, i) end

--- Returns a table {name -> variants[]} where each variant receives audioFname (file in the mission's notes folder, or file of the active or resolved voice pack) and audioBasename. The pairs() order is undefined: use getSystemPacenotesOrdered when order matters. Result is cached.
---Source: lua/ge/extensions/gameplay/rally/compositors/helpers/textCompositor.lua:105
---@param missionPacenotesDirname string|nil Mission audio notes folder; nil = use the voice pack.
---@param voicepackEntry table|nil Voice pack entry to activate (via setVoicepackEntry).
---@return table<string, table[]>|nil  System notes by name; nil if style not loaded.
function gameplay_rally_compositors_helpers_textCompositor:getSystemPacenotes(missionPacenotesDirname, voicepackEntry) end

--- Returns the ordered array {name, variants} of system notes as written by the style author.
---Source: lua/ge/extensions/gameplay/rally/compositors/helpers/textCompositor.lua:97
---@return table[]  Ordered list (empty if not loaded).
function gameplay_rally_compositors_helpers_textCompositor:getSystemPacenotesOrdered() end

--- Stores the style name and the mission folder (logs an error if the name is nil). Loads nothing.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/compositors/helpers/textCompositor.lua:15
---@param compositorName string Style name relative to compositors/styles/ (e.g. 'english/casual').
---@param missionDir string|nil Mission folder, for calibrations.
function gameplay_rally_compositors_helpers_textCompositor:init(compositorName, missionDir) end

--- Loads the style: require + deepcopy, applies calibrationOverrides.applyToConfig, validates with styleValidator. If the file is missing or validation fails, logs an error and leaves the style nil.
---Source: lua/ge/extensions/gameplay/rally/compositors/helpers/textCompositor.lua:27
---@return boolean  true if the style is loaded and valid.
function gameplay_rally_compositors_helpers_textCompositor:load() end

--- Text hash of a phrase (see compositorUtil.pacenoteHash).
---Source: lua/ge/extensions/gameplay/rally/compositors/helpers/textCompositor.lua:432
---@param text string Phrase.
---@return string|nil  Hash.
function gameplay_rally_compositors_helpers_textCompositor:pacenoteHash(text) end

--- Rounds a distance according to the style's rules: beyond largeThreshold, value in the 'large' unit (km); between mediumThreshold and largeThreshold, medium step (switches to 'large' if the result reaches largeThreshold); otherwise small step.
---Source: lua/ge/extensions/gameplay/rally/compositors/helpers/textCompositor.lua:338
---@param dist number Distance in meters.
---@return number  Rounded value.
---@return string  Unit (base or large).
function gameplay_rally_compositors_helpers_textCompositor:roundDistance(dist) end

--- Sets the active voice pack entry; clears the system notes cache if its identifier (id, dir or dirname) changes.
---Source: lua/ge/extensions/gameplay/rally/compositors/helpers/textCompositor.lua:52
---@param entry table|nil Voicepack entry.
function gameplay_rally_compositors_helpers_textCompositor:setVoicepackEntry(entry) end

--- Writes the result of an enumeration to an indented JSON file.
---Source: lua/ge/extensions/gameplay/rally/compositors/helpers/textCompositor.lua:334
---@param fname string Output file.
---@param enumerated table Data to write.
function gameplay_rally_compositors_helpers_textCompositor:writeEnumerated(fname, enumerated) end

