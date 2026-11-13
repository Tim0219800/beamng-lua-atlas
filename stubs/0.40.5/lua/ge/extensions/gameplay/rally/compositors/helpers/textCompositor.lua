---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/compositors/helpers/textCompositor.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe locale `C` de lua/ge/extensions/gameplay/rally/compositors/helpers/textCompositor.lua (instanciée par la fonction renvoyée par le module)
---@class gameplay_rally_compositors_helpers_textCompositor
local gameplay_rally_compositors_helpers_textCompositor = {}

---Source : lua/ge/extensions/gameplay/rally/compositors/helpers/textCompositor.lua:65
function gameplay_rally_compositors_helpers_textCompositor:_requireCompositor() end

---Source : lua/ge/extensions/gameplay/rally/compositors/helpers/textCompositor.lua:81
---@param structured any
---@param distBefore any
---@param distAfter any
---@param opts any
function gameplay_rally_compositors_helpers_textCompositor:compositePhraseEntries(structured, distBefore, distAfter, opts) end

---Source : lua/ge/extensions/gameplay/rally/compositors/helpers/textCompositor.lua:71
---@param structured any
---@param distBefore any
---@param distAfter any
function gameplay_rally_compositors_helpers_textCompositor:compositeText(structured, distBefore, distAfter) end

---Source : lua/ge/extensions/gameplay/rally/compositors/helpers/textCompositor.lua:76
---@param structured any
---@param distBefore any
---@param distAfter any
function gameplay_rally_compositors_helpers_textCompositor:compositeTextEscaped(structured, distBefore, distAfter) end

---Source : lua/ge/extensions/gameplay/rally/compositors/helpers/textCompositor.lua:61
function gameplay_rally_compositors_helpers_textCompositor:compositorPath() end

---Source : lua/ge/extensions/gameplay/rally/compositors/helpers/textCompositor.lua:91
function gameplay_rally_compositors_helpers_textCompositor:distanceCallsEnabled() end

---Source : lua/ge/extensions/gameplay/rally/compositors/helpers/textCompositor.lua:368
---@param dist any
function gameplay_rally_compositors_helpers_textCompositor:distanceToString(dist) end

---Source : lua/ge/extensions/gameplay/rally/compositors/helpers/textCompositor.lua:261
function gameplay_rally_compositors_helpers_textCompositor:enumerateAll() end

---Source : lua/ge/extensions/gameplay/rally/compositors/helpers/textCompositor.lua:162
function gameplay_rally_compositors_helpers_textCompositor:enumerateDistanceEntries() end

---Source : lua/ge/extensions/gameplay/rally/compositors/helpers/textCompositor.lua:196
function gameplay_rally_compositors_helpers_textCompositor:enumerateDistances() end

---Source : lua/ge/extensions/gameplay/rally/compositors/helpers/textCompositor.lua:204
function gameplay_rally_compositors_helpers_textCompositor:enumeratePacenotes() end

---Source : lua/ge/extensions/gameplay/rally/compositors/helpers/textCompositor.lua:209
function gameplay_rally_compositors_helpers_textCompositor:enumerateScriptEntries() end

---Source : lua/ge/extensions/gameplay/rally/compositors/helpers/textCompositor.lua:402
function gameplay_rally_compositors_helpers_textCompositor:getBaseUnit() end

---Source : lua/ge/extensions/gameplay/rally/compositors/helpers/textCompositor.lua:86
function gameplay_rally_compositors_helpers_textCompositor:getConfig() end

---Source : lua/ge/extensions/gameplay/rally/compositors/helpers/textCompositor.lua:381
---@param dist any
function gameplay_rally_compositors_helpers_textCompositor:getDistanceCallShorthand(dist) end

---Source : lua/ge/extensions/gameplay/rally/compositors/helpers/textCompositor.lua:392
function gameplay_rally_compositors_helpers_textCompositor:getDistanceLinks() end

---Source : lua/ge/extensions/gameplay/rally/compositors/helpers/textCompositor.lua:405
function gameplay_rally_compositors_helpers_textCompositor:getLargeUnit() end

---Source : lua/ge/extensions/gameplay/rally/compositors/helpers/textCompositor.lua:428
function gameplay_rally_compositors_helpers_textCompositor:getMaxDistance() end

---Source : lua/ge/extensions/gameplay/rally/compositors/helpers/textCompositor.lua:396
function gameplay_rally_compositors_helpers_textCompositor:getMaxLinkDistance() end

---Source : lua/ge/extensions/gameplay/rally/compositors/helpers/textCompositor.lua:408
function gameplay_rally_compositors_helpers_textCompositor:getPointTranslation() end

---Source : lua/ge/extensions/gameplay/rally/compositors/helpers/textCompositor.lua:422
function gameplay_rally_compositors_helpers_textCompositor:getRoundingLarge() end

---Source : lua/ge/extensions/gameplay/rally/compositors/helpers/textCompositor.lua:425
function gameplay_rally_compositors_helpers_textCompositor:getRoundingLargeThreshold() end

---Source : lua/ge/extensions/gameplay/rally/compositors/helpers/textCompositor.lua:415
function gameplay_rally_compositors_helpers_textCompositor:getRoundingMedium() end

---Source : lua/ge/extensions/gameplay/rally/compositors/helpers/textCompositor.lua:418
function gameplay_rally_compositors_helpers_textCompositor:getRoundingMediumThreshold() end

---Source : lua/ge/extensions/gameplay/rally/compositors/helpers/textCompositor.lua:412
function gameplay_rally_compositors_helpers_textCompositor:getRoundingSmall() end

---Source : lua/ge/extensions/gameplay/rally/compositors/helpers/textCompositor.lua:155
---@param name any
---@param i any
function gameplay_rally_compositors_helpers_textCompositor:getSystemPacenote(name, i) end

--- Returns a `{ name -> variants[] }` map (each variant has audioFname filled in).
---  Iteration order via pairs() is undefined; use `getSystemPacenotesOrdered()` when
---  order matters (script reader, audio generation, etc.).
---Source : lua/ge/extensions/gameplay/rally/compositors/helpers/textCompositor.lua:105
---@param missionPacenotesDirname any
---@param voicepackEntry any
function gameplay_rally_compositors_helpers_textCompositor:getSystemPacenotes(missionPacenotesDirname, voicepackEntry) end

--- Returns the ordered { name, variants } array as authored by the style.
---Source : lua/ge/extensions/gameplay/rally/compositors/helpers/textCompositor.lua:97
function gameplay_rally_compositors_helpers_textCompositor:getSystemPacenotesOrdered() end

---Source : lua/ge/extensions/gameplay/rally/compositors/helpers/textCompositor.lua:15
---@param compositorName any
---@param missionDir any
function gameplay_rally_compositors_helpers_textCompositor:init(compositorName, missionDir) end

---Source : lua/ge/extensions/gameplay/rally/compositors/helpers/textCompositor.lua:27
function gameplay_rally_compositors_helpers_textCompositor:load() end

---Source : lua/ge/extensions/gameplay/rally/compositors/helpers/textCompositor.lua:432
---@param text any
function gameplay_rally_compositors_helpers_textCompositor:pacenoteHash(text) end

---Source : lua/ge/extensions/gameplay/rally/compositors/helpers/textCompositor.lua:338
---@param dist any
function gameplay_rally_compositors_helpers_textCompositor:roundDistance(dist) end

---Source : lua/ge/extensions/gameplay/rally/compositors/helpers/textCompositor.lua:52
---@param entry any
function gameplay_rally_compositors_helpers_textCompositor:setVoicepackEntry(entry) end

---Source : lua/ge/extensions/gameplay/rally/compositors/helpers/textCompositor.lua:334
---@param fname any
---@param enumerated any
function gameplay_rally_compositors_helpers_textCompositor:writeEnumerated(fname, enumerated) end

