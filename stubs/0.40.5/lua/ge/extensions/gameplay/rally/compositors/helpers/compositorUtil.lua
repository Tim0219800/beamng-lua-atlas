---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/compositors/helpers/compositorUtil.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Toolbox of the rally note compositor. Walks the elements of a structured note in the fixed order of the slots, calls the active style's componentTypes registry rules for each type (corner, caution, modifiers), and produces the phrases (with category and variant), adding the before/after distance markers. It also contains range lookups (intensity by diameter, length by arc length), the phrase hash used as the audio file name, and the phrase enumerations for audio generation and the script player. Unknown types or non-renderable values are silently ignored.
--- Access: extension `gameplay_rally_compositors_helpers_compositorUtil`: `extensions.load("gameplay_rally_compositors_helpers_compositorUtil")`, then the global `gameplay_rally_compositors_helpers_compositorUtil`
---@class gameplay_rally_compositors_helpers_compositorUtil
gameplay_rally_compositors_helpers_compositorUtil = {}

--- Simplified version of compositePhraseEntries that returns only the texts.
---Source: lua/ge/extensions/gameplay/rally/compositors/helpers/compositorUtil.lua:556
---@param config table|nil Style config.
---@param structured table Structured note.
---@param rawDistanceBefore number|nil Distance before (m).
---@param rawDistanceAfter number|nil Distance after (m).
---@param escapeVars boolean|nil true for distance variables.
---@return string[]  Phrases in order.
function gameplay_rally_compositors_helpers_compositorUtil.compositeFromPhrases(config, structured, rawDistanceBefore, rawDistanceAfter, escapeVars) end

--- Walks the structured elements in the fixed order of the slots, calls the type's emitter and adds the before/after distance markers. Elements are spoken one after another with no automatic connector; links between notes ('into', 'and') come from the distance link list if distance calls are enabled.
---Source: lua/ge/extensions/gameplay/rally/compositors/helpers/compositorUtil.lua:455
---@param config table|nil Style config.
---@param structured table Structured note.
---@param rawDistanceBefore number|nil Distance before (m).
---@param rawDistanceAfter number|nil Distance after (m).
---@param opts table|nil escapeVars (boolean: variables instead of values), variantResolver (function(entry) -> entry|nil), distanceAfterBeforePostModifier (boolean: places the after-distance before the first modifier that follows the corner).
---@return table[]  Entries {text, category, variant?, audioFname?}.
function gameplay_rally_compositors_helpers_compositorUtil.compositePhraseEntries(config, structured, rawDistanceBefore, rawDistanceAfter, opts) end

--- Ordered list of the style's corner intensities.
---Source: lua/ge/extensions/gameplay/rally/compositors/helpers/compositorUtil.lua:113
---@param cornerCfg table|nil Corner config.
---@return table[]|nil  Entries {id, text, diameter, visual, afterDirection...}.
function gameplay_rally_compositors_helpers_compositorUtil.cornerIntensityList(cornerCfg) end

--- Finds a length entry by its id for an intensity.
---Source: lua/ge/extensions/gameplay/rally/compositors/helpers/compositorUtil.lua:125
---@param cornerCfg table|nil Corner config.
---@param intensityId string Intensity.
---@param lengthId string Length id.
---@return table|nil  Entry.
---@return integer|nil  Index in the list.
function gameplay_rally_compositors_helpers_compositorUtil.cornerLengthEntryById(cornerCfg, intensityId, lengthId) end

--- Label of a length entry: label, otherwise text, otherwise id.
---Source: lua/ge/extensions/gameplay/rally/compositors/helpers/compositorUtil.lua:152
---@param entry table|nil Entry.
---@return string|nil  Label.
function gameplay_rally_compositors_helpers_compositorUtil.cornerLengthEntryLabel(entry) end

--- Spoken text of a length entry.
---Source: lua/ge/extensions/gameplay/rally/compositors/helpers/compositorUtil.lua:147
---@param entry table|nil Entry.
---@return string|nil  Text.
function gameplay_rally_compositors_helpers_compositorUtil.cornerLengthEntryText(entry) end

--- List of corner lengths for an intensity (lengthsByIntensity[intensityId]).
---Source: lua/ge/extensions/gameplay/rally/compositors/helpers/compositorUtil.lua:118
---@param cornerCfg table|nil Corner config.
---@param intensityId string|nil Intensity identifier.
---@return table[]|nil  Entries {id, text, arcMeters...}.
function gameplay_rally_compositors_helpers_compositorUtil.cornerLengthList(cornerCfg, intensityId) end

--- Returns the numbering sub-table of a corner component (cornerCfg.numbering, or cornerCfg itself if it does not exist, or {} if nil).
---Source: lua/ge/extensions/gameplay/rally/compositors/helpers/compositorUtil.lua:107
---@param cornerCfg table|nil Config of the corner component.
---@return table  Numbering.
function gameplay_rally_compositors_helpers_compositorUtil.cornerNumbering(cornerCfg) end

--- True unless config.distance.callsEnabled is explicitly false.
---Source: lua/ge/extensions/gameplay/rally/compositors/helpers/compositorUtil.lua:417
---@param config table|nil Style config.
---@return boolean  State.
function gameplay_rally_compositors_helpers_compositorUtil.distanceCallsEnabled(config) end

--- Enumerates all speakable phrases of the active style (deduplicated): distance links, corner calls, descriptors, lengths, shapes, cautions, modifiers. Used by the audio pipeline and the script player to know which files to look for or generate.
---Source: lua/ge/extensions/gameplay/rally/compositors/helpers/compositorUtil.lua:784
---@param textCompositor table Not used.
---@param config table Style config.
---@return string[]  Unique phrases.
function gameplay_rally_compositors_helpers_compositorUtil.enumerateConcise(textCompositor, config) end

--- Enumerates the script player entries with category, subcategory, variant and sort keys: distance links, corner calls (by intensity and direction), descriptors, lengths, shapes, caution levels, modifiers. Richer than enumerateConcise.
---Source: lua/ge/extensions/gameplay/rally/compositors/helpers/compositorUtil.lua:660
---@param textCompositor table Not used.
---@param config table Style config.
---@return table[]  Entries {phrase, hash, audioFname, recordingSlug, category, subcategory, sourceContext, variant, sortGroup, sortSubgroup, sortPhrase}.
function gameplay_rally_compositors_helpers_compositorUtil.enumerateScriptEntries(textCompositor, config) end

--- Text of a caution level (cautionCfg.levels[item.level]).
---Source: lua/ge/extensions/gameplay/rally/compositors/helpers/compositorUtil.lua:302
---@param cautionCfg table|nil Caution config.
---@param item table|nil Caution element (level).
---@return string|nil  Text.
function gameplay_rally_compositors_helpers_compositorUtil.getCaution(cautionCfg, item) end

--- Returns the entry whose range is closest to targetValue (distance 0 if contained), with optional filter.
---Source: lua/ge/extensions/gameplay/rally/compositors/helpers/compositorUtil.lua:71
---@param valuesList table[]|nil List of entries.
---@param targetValue number|string Target value.
---@param key string|nil Range key.
---@param filterFn function|nil function(entry) -> boolean to exclude entries.
---@return table|nil  Closest entry.
function gameplay_rally_compositors_helpers_compositorUtil.getClosestEntry(valuesList, targetValue, key, filterFn) end

--- Corner call phrase: descriptor + direction, otherwise intensity (risk-adjusted) + direction + afterDirection. Returns nil if there is no direction, the direction is not defined in the style, or the intensity is not found.
---Source: lua/ge/extensions/gameplay/rally/compositors/helpers/compositorUtil.lua:246
---@param cornerCfg table|nil Corner config.
---@param item table Corner element (direction, descriptor, intensity...).
---@return string|nil  Phrase.
function gameplay_rally_compositors_helpers_compositorUtil.getCornerCall(cornerCfg, item) end

--- Corner length text for a given intensity based on item.arcMeters; lengthMode 'shorter'/'longer' shifts by one entry, 'skip' removes it.
---Source: lua/ge/extensions/gameplay/rally/compositors/helpers/compositorUtil.lua:266
---@param cornerCfg table Corner config.
---@param item table Corner element (arcMeters, lengthMode).
---@param intensityEntry table|nil Intensity entry.
---@return string|nil  Length text.
function gameplay_rally_compositors_helpers_compositorUtil.getCornerLengthForIntensity(cornerCfg, item, intensityEntry) end

--- Corner length text, first looking up the element's intensity (without risk adjustment).
---Source: lua/ge/extensions/gameplay/rally/compositors/helpers/compositorUtil.lua:290
---@param cornerCfg table Corner config.
---@param item table Corner element.
---@return string|nil  Length text.
function gameplay_rally_compositors_helpers_compositorUtil.getCornerLengthForItem(cornerCfg, item) end

--- Spoken text of a corner's shape.
---Source: lua/ge/extensions/gameplay/rally/compositors/helpers/compositorUtil.lua:296
---@param cornerCfg table Corner config.
---@param shape string|nil Shape key.
---@return string|nil  Text.
function gameplay_rally_compositors_helpers_compositorUtil.getCornerShape(cornerCfg, shape) end

--- Returns the entry whose numeric value ('value' key by default) is closest to targetValue.
---Source: lua/ge/extensions/gameplay/rally/compositors/helpers/compositorUtil.lua:24
---@param valuesList table[] List of entries.
---@param targetValue number Target value.
---@param key string|nil Numeric key ('value' by default).
---@return table|nil  Closest entry.
function gameplay_rally_compositors_helpers_compositorUtil.getNearestValue(valuesList, targetValue, key) end

--- Randomly picks an item according to its 'weight' field (1 by default).
---Source: lua/ge/extensions/gameplay/rally/compositors/helpers/compositorUtil.lua:396
---@param items table[] Items with optional weight.
---@return table  Chosen item.
function gameplay_rally_compositors_helpers_compositorUtil.getRandomWeightedItem(items) end

--- Returns the first entry whose range ('value' key by default) contains targetValue.
---Source: lua/ge/extensions/gameplay/rally/compositors/helpers/compositorUtil.lua:58
---@param valuesList table[]|nil List of entries.
---@param targetValue number|string Value searched.
---@param key string|nil Range key.
---@return table|nil  Entry found.
function gameplay_rally_compositors_helpers_compositorUtil.getRangeValue(valuesList, targetValue, key) end

--- Identifier of an intensity entry.
---Source: lua/ge/extensions/gameplay/rally/compositors/helpers/compositorUtil.lua:158
---@param entry table|nil Entry.
---@return string|nil  Id.
function gameplay_rally_compositors_helpers_compositorUtil.intensityEntryId(entry) end

--- Label of an intensity entry: label, otherwise text, otherwise id.
---Source: lua/ge/extensions/gameplay/rally/compositors/helpers/compositorUtil.lua:168
---@param entry table|nil Entry.
---@return string|nil  Label.
function gameplay_rally_compositors_helpers_compositorUtil.intensityEntryLabel(entry) end

--- Spoken text of an intensity entry.
---Source: lua/ge/extensions/gameplay/rally/compositors/helpers/compositorUtil.lua:163
---@param entry table|nil Entry.
---@return string|nil  Text.
function gameplay_rally_compositors_helpers_compositorUtil.intensityEntryText(entry) end

--- Returns the component config for an element type: corner and caution directly, otherwise a modifier (resolving modifierAliases).
---Source: lua/ge/extensions/gameplay/rally/compositors/helpers/compositorUtil.lua:138
---@param componentTypes table|nil componentTypes registry.
---@param itemType string Kind of the item.
---@return table|nil  Component config.
function gameplay_rally_compositors_helpers_compositorUtil.lookupComponentType(componentTypes, itemType) end

--- Descriptor entry of a corner (cornerCfg.descriptors, resolving descriptorAliases).
---Source: lua/ge/extensions/gameplay/rally/compositors/helpers/compositorUtil.lua:232
---@param cornerCfg table Corner config.
---@param descriptor string|nil Descriptor key.
---@return table|nil  Entry.
function gameplay_rally_compositors_helpers_compositorUtil.lookupDescriptorEntry(cornerCfg, descriptor) end

--- Intensity entry of the style matching a measured physical diameter ('diameter' range).
---Source: lua/ge/extensions/gameplay/rally/compositors/helpers/compositorUtil.lua:213
---@param cornerCfg table Corner config.
---@param intensity number Measured diameter (>= 0).
---@return table|nil  Intensity entry.
function gameplay_rally_compositors_helpers_compositorUtil.lookupIntensityEntry(cornerCfg, intensity) end

--- Like lookupIntensityEntry on item.intensity, then shifts the entry according to the sign of item.riskIntensity (positive = toward the start of the list, riskier), clamped at the ends.
---Source: lua/ge/extensions/gameplay/rally/compositors/helpers/compositorUtil.lua:218
---@param cornerCfg table Corner config.
---@param item table Corner element (intensity, riskIntensity).
---@return table|nil  Adjusted intensity entry.
function gameplay_rally_compositors_helpers_compositorUtil.lookupRiskAdjustedIntensityEntry(cornerCfg, item) end

--- Shape entry of a corner (cornerCfg.shapes[shape]).
---Source: lua/ge/extensions/gameplay/rally/compositors/helpers/compositorUtil.lua:238
---@param cornerCfg table Corner config.
---@param shape string|nil Shape key.
---@return table|nil  Entry.
function gameplay_rally_compositors_helpers_compositorUtil.lookupShapeEntry(cornerCfg, shape) end

--- Table of the style's atomic modifiers (componentTypes.modifiers, or {}).
---Source: lua/ge/extensions/gameplay/rally/compositors/helpers/compositorUtil.lua:133
---@param componentTypes table|nil componentTypes registry.
---@return table  Modifiers by key.
function gameplay_rally_compositors_helpers_compositorUtil.modifierComponents(componentTypes) end

--- Turns a phrase into an identifier usable as a file name (see notes).
---Source: lua/ge/extensions/gameplay/rally/compositors/helpers/compositorUtil.lua:385
---@param text string|nil Phrase.
---@return string|nil  Hash, nil if text is nil.
function gameplay_rally_compositors_helpers_compositorUtil.pacenoteHash(text) end

--- Cleans up a phrase (removes leading and trailing spaces via rallyUtil.trimString).
---Source: lua/ge/extensions/gameplay/rally/compositors/helpers/compositorUtil.lua:379
---@param phrase string Raw phrase.
---@return string  Cleaned phrase.
function gameplay_rally_compositors_helpers_compositorUtil.postProcessPhrase(phrase) end

--- Reads a range {min, max}: returns numeric min and max (max nil if absent); nil, nil if value is not a table.
---Source: lua/ge/extensions/gameplay/rally/compositors/helpers/compositorUtil.lua:43
---@param value table|nil Range.
---@return number|nil  min.
---@return number|nil  max.
function gameplay_rally_compositors_helpers_compositorUtil.rangeBounds(value) end

--- True if targetValue is in [min, max[ (or >= min without max).
---Source: lua/ge/extensions/gameplay/rally/compositors/helpers/compositorUtil.lua:51
---@param value table Range {min, max}.
---@param targetValue number Value tested.
---@return boolean  Result.
function gameplay_rally_compositors_helpers_compositorUtil.rangeContains(value, targetValue) end

--- Sign of a value: 1, -1 or 0 (0 if non-numeric).
---Source: lua/ge/extensions/gameplay/rally/compositors/helpers/compositorUtil.lua:174
---@param value number|nil Value.
---@return integer  -1, 0 or 1.
function gameplay_rally_compositors_helpers_compositorUtil.signedStep(value) end

