---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/compositors/helpers/compositorUtil.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `gameplay_rally_compositors_helpers_compositorUtil` : `extensions.load("gameplay_rally_compositors_helpers_compositorUtil")`, puis la globale `gameplay_rally_compositors_helpers_compositorUtil`
---@class gameplay_rally_compositors_helpers_compositorUtil
gameplay_rally_compositors_helpers_compositorUtil = {}

---Source : lua/ge/extensions/gameplay/rally/compositors/helpers/compositorUtil.lua:556
---@param config any
---@param structured any
---@param rawDistanceBefore any
---@param rawDistanceAfter any
---@param escapeVars any
function gameplay_rally_compositors_helpers_compositorUtil.compositeFromPhrases(config, structured, rawDistanceBefore, rawDistanceAfter, escapeVars) end

--- Walks structured items in fixed slot order, dispatches per type, and prepends/appends distance-call
---  placeholders. Unknown item types and unrenderable values silently drop their
---  sub-phrase. Items are spoken back-to-back with no auto-inserted item-to-item
---  connective; cross-pacenote links ("into" / "and") come from the
---  distance-driven link list when the active style enables distance calls.
---Source : lua/ge/extensions/gameplay/rally/compositors/helpers/compositorUtil.lua:455
---@param config any
---@param structured any
---@param rawDistanceBefore any
---@param rawDistanceAfter any
---@param opts any
function gameplay_rally_compositors_helpers_compositorUtil.compositePhraseEntries(config, structured, rawDistanceBefore, rawDistanceAfter, opts) end

---Source : lua/ge/extensions/gameplay/rally/compositors/helpers/compositorUtil.lua:113
---@param cornerCfg any
function gameplay_rally_compositors_helpers_compositorUtil.cornerIntensityList(cornerCfg) end

---Source : lua/ge/extensions/gameplay/rally/compositors/helpers/compositorUtil.lua:125
---@param cornerCfg any
---@param intensityId any
---@param lengthId any
function gameplay_rally_compositors_helpers_compositorUtil.cornerLengthEntryById(cornerCfg, intensityId, lengthId) end

---Source : lua/ge/extensions/gameplay/rally/compositors/helpers/compositorUtil.lua:152
---@param entry any
function gameplay_rally_compositors_helpers_compositorUtil.cornerLengthEntryLabel(entry) end

---Source : lua/ge/extensions/gameplay/rally/compositors/helpers/compositorUtil.lua:147
---@param entry any
function gameplay_rally_compositors_helpers_compositorUtil.cornerLengthEntryText(entry) end

---Source : lua/ge/extensions/gameplay/rally/compositors/helpers/compositorUtil.lua:118
---@param cornerCfg any
---@param intensityId any
function gameplay_rally_compositors_helpers_compositorUtil.cornerLengthList(cornerCfg, intensityId) end

---Source : lua/ge/extensions/gameplay/rally/compositors/helpers/compositorUtil.lua:107
---@param cornerCfg any
function gameplay_rally_compositors_helpers_compositorUtil.cornerNumbering(cornerCfg) end

---Source : lua/ge/extensions/gameplay/rally/compositors/helpers/compositorUtil.lua:417
---@param config any
function gameplay_rally_compositors_helpers_compositorUtil.distanceCallsEnabled(config) end

--- Enumerates every renderable phrase for the active style. Used by audio
---  pipeline + script reader to know what files to look up / generate.
---Source : lua/ge/extensions/gameplay/rally/compositors/helpers/compositorUtil.lua:784
---@param textCompositor any
---@param config any
function gameplay_rally_compositors_helpers_compositorUtil.enumerateConcise(textCompositor, config) end

--- Enumerates script-reader entries with category and variant metadata. This is
---  intentionally richer than enumerateConcise, which remains the compact runtime
---  phrase list used by existing audio validation flows.
---Source : lua/ge/extensions/gameplay/rally/compositors/helpers/compositorUtil.lua:660
---@param textCompositor any
---@param config any
function gameplay_rally_compositors_helpers_compositorUtil.enumerateScriptEntries(textCompositor, config) end

---Source : lua/ge/extensions/gameplay/rally/compositors/helpers/compositorUtil.lua:302
---@param cautionCfg any
---@param item any
function gameplay_rally_compositors_helpers_compositorUtil.getCaution(cautionCfg, item) end

---Source : lua/ge/extensions/gameplay/rally/compositors/helpers/compositorUtil.lua:71
---@param valuesList any
---@param targetValue any
---@param key any
---@param filterFn any
function gameplay_rally_compositors_helpers_compositorUtil.getClosestEntry(valuesList, targetValue, key, filterFn) end

---Source : lua/ge/extensions/gameplay/rally/compositors/helpers/compositorUtil.lua:246
---@param cornerCfg any
---@param item any
function gameplay_rally_compositors_helpers_compositorUtil.getCornerCall(cornerCfg, item) end

---Source : lua/ge/extensions/gameplay/rally/compositors/helpers/compositorUtil.lua:266
---@param cornerCfg any
---@param item any
---@param intensityEntry any
function gameplay_rally_compositors_helpers_compositorUtil.getCornerLengthForIntensity(cornerCfg, item, intensityEntry) end

---Source : lua/ge/extensions/gameplay/rally/compositors/helpers/compositorUtil.lua:290
---@param cornerCfg any
---@param item any
function gameplay_rally_compositors_helpers_compositorUtil.getCornerLengthForItem(cornerCfg, item) end

---Source : lua/ge/extensions/gameplay/rally/compositors/helpers/compositorUtil.lua:296
---@param cornerCfg any
---@param shape any
function gameplay_rally_compositors_helpers_compositorUtil.getCornerShape(cornerCfg, shape) end

---Source : lua/ge/extensions/gameplay/rally/compositors/helpers/compositorUtil.lua:24
---@param valuesList any
---@param targetValue any
---@param key any
function gameplay_rally_compositors_helpers_compositorUtil.getNearestValue(valuesList, targetValue, key) end

---Source : lua/ge/extensions/gameplay/rally/compositors/helpers/compositorUtil.lua:396
---@param items any
function gameplay_rally_compositors_helpers_compositorUtil.getRandomWeightedItem(items) end

---Source : lua/ge/extensions/gameplay/rally/compositors/helpers/compositorUtil.lua:58
---@param valuesList any
---@param targetValue any
---@param key any
function gameplay_rally_compositors_helpers_compositorUtil.getRangeValue(valuesList, targetValue, key) end

---Source : lua/ge/extensions/gameplay/rally/compositors/helpers/compositorUtil.lua:158
---@param entry any
function gameplay_rally_compositors_helpers_compositorUtil.intensityEntryId(entry) end

---Source : lua/ge/extensions/gameplay/rally/compositors/helpers/compositorUtil.lua:168
---@param entry any
function gameplay_rally_compositors_helpers_compositorUtil.intensityEntryLabel(entry) end

---Source : lua/ge/extensions/gameplay/rally/compositors/helpers/compositorUtil.lua:163
---@param entry any
function gameplay_rally_compositors_helpers_compositorUtil.intensityEntryText(entry) end

---Source : lua/ge/extensions/gameplay/rally/compositors/helpers/compositorUtil.lua:138
---@param componentTypes any
---@param itemType any
function gameplay_rally_compositors_helpers_compositorUtil.lookupComponentType(componentTypes, itemType) end

--- Returns the descriptor entry (or nil) for a corner item.
---Source : lua/ge/extensions/gameplay/rally/compositors/helpers/compositorUtil.lua:232
---@param cornerCfg any
---@param descriptor any
function gameplay_rally_compositors_helpers_compositorUtil.lookupDescriptorEntry(cornerCfg, descriptor) end

--- Returns the matching style intensity entry (or nil) for a measured physical diameter.
---Source : lua/ge/extensions/gameplay/rally/compositors/helpers/compositorUtil.lua:213
---@param cornerCfg any
---@param intensity any
function gameplay_rally_compositors_helpers_compositorUtil.lookupIntensityEntry(cornerCfg, intensity) end

---Source : lua/ge/extensions/gameplay/rally/compositors/helpers/compositorUtil.lua:218
---@param cornerCfg any
---@param item any
function gameplay_rally_compositors_helpers_compositorUtil.lookupRiskAdjustedIntensityEntry(cornerCfg, item) end

---Source : lua/ge/extensions/gameplay/rally/compositors/helpers/compositorUtil.lua:238
---@param cornerCfg any
---@param shape any
function gameplay_rally_compositors_helpers_compositorUtil.lookupShapeEntry(cornerCfg, shape) end

---Source : lua/ge/extensions/gameplay/rally/compositors/helpers/compositorUtil.lua:133
---@param componentTypes any
function gameplay_rally_compositors_helpers_compositorUtil.modifierComponents(componentTypes) end

---Source : lua/ge/extensions/gameplay/rally/compositors/helpers/compositorUtil.lua:385
---@param text any
function gameplay_rally_compositors_helpers_compositorUtil.pacenoteHash(text) end

---Source : lua/ge/extensions/gameplay/rally/compositors/helpers/compositorUtil.lua:379
---@param phrase any
function gameplay_rally_compositors_helpers_compositorUtil.postProcessPhrase(phrase) end

---Source : lua/ge/extensions/gameplay/rally/compositors/helpers/compositorUtil.lua:43
---@param value any
function gameplay_rally_compositors_helpers_compositorUtil.rangeBounds(value) end

---Source : lua/ge/extensions/gameplay/rally/compositors/helpers/compositorUtil.lua:51
---@param value any
---@param targetValue any
function gameplay_rally_compositors_helpers_compositorUtil.rangeContains(value, targetValue) end

---Source : lua/ge/extensions/gameplay/rally/compositors/helpers/compositorUtil.lua:174
---@param value any
function gameplay_rally_compositors_helpers_compositorUtil.signedStep(value) end

