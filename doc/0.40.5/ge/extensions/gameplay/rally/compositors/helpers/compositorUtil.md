# `gameplay_rally_compositors_helpers_compositorUtil`

*File: `lua/ge/extensions/gameplay/rally/compositors/helpers/compositorUtil.lua` · VM: Game Engine (GE) · 863 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_rally_compositors_helpers_compositorUtil`: `extensions.load("gameplay_rally_compositors_helpers_compositorUtil")`, then the global `gameplay_rally_compositors_helpers_compositorUtil`

Toolbox of the rally note compositor. Walks the elements of a structured note in the fixed order of the slots, calls the active style's componentTypes registry rules for each type (corner, caution, modifiers), and produces the phrases (with category and variant), adding the before/after distance markers. It also contains range lookups (intensity by diameter, length by arc length), the phrase hash used as the audio file name, and the phrase enumerations for audio generation and the script player. Unknown types or non-renderable values are silently ignored.

## Notes

- A range is {min, max} with optional max (last range open-ended); rangeContains tests min <= v < max.
- Intensity lists go from highest to lowest risk: a positive riskIntensity moves toward the start of the list (index - step, clamped).
- A corner's descriptor takes precedence over intensity; in that case the length is not spoken.
- Corner direction: -1 left, 1 right, 0/nil = no corner call. lengthMode can be 'skip', 'shorter' or 'longer'.
- Phrase categories: distance, linkword, corner, caution, modifier, other. A distance text equal to a style link is classified as 'linkword'.
- pacenoteHash: lowercase, apostrophes removed, every character outside a-z0-9 replaced by '_', repeated '_' merged, leading/trailing '_' removed; used to name audio files.
- getRandomWeightedItem uses math.random: non-deterministic result; the default weight is 1.
- enumerateScriptEntries and enumerateConcise receive a textCompositor parameter that is unused.

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_rally_compositors_helpers_compositorUtil.compositeFromPhrases(config, structured, rawDistanceBefore, rawDistanceAfter, escapeVars)` | Simplified version of compositePhraseEntries that returns only the texts. | 556 |
| `gameplay_rally_compositors_helpers_compositorUtil.compositePhraseEntries(config, structured, rawDistanceBefore, rawDistanceAfter, opts)` | Walks the structured elements in the fixed order of the slots, calls the type's emitter and adds the before/after distance markers. Elements are spoken one after another with no automatic connector; links between notes ('into', 'and') come from the distance link list if distance calls are enabled. | 455 |
| `gameplay_rally_compositors_helpers_compositorUtil.cornerIntensityList(cornerCfg)` | Ordered list of the style's corner intensities. | 113 |
| `gameplay_rally_compositors_helpers_compositorUtil.cornerLengthEntryById(cornerCfg, intensityId, lengthId)` | Finds a length entry by its id for an intensity. | 125 |
| `gameplay_rally_compositors_helpers_compositorUtil.cornerLengthEntryLabel(entry)` | Label of a length entry: label, otherwise text, otherwise id. | 152 |
| `gameplay_rally_compositors_helpers_compositorUtil.cornerLengthEntryText(entry)` | Spoken text of a length entry. | 147 |
| `gameplay_rally_compositors_helpers_compositorUtil.cornerLengthList(cornerCfg, intensityId)` | List of corner lengths for an intensity (lengthsByIntensity[intensityId]). | 118 |
| `gameplay_rally_compositors_helpers_compositorUtil.cornerNumbering(cornerCfg)` | Returns the numbering sub-table of a corner component (cornerCfg.numbering, or cornerCfg itself if it does not exist, or {} if nil). | 107 |
| `gameplay_rally_compositors_helpers_compositorUtil.distanceCallsEnabled(config)` | True unless config.distance.callsEnabled is explicitly false. | 417 |
| `gameplay_rally_compositors_helpers_compositorUtil.enumerateConcise(textCompositor, config)` | Enumerates all speakable phrases of the active style (deduplicated): distance links, corner calls, descriptors, lengths, shapes, cautions, modifiers. Used by the audio pipeline and the script player to know which files to look for or generate. | 784 |
| `gameplay_rally_compositors_helpers_compositorUtil.enumerateScriptEntries(textCompositor, config)` | Enumerates the script player entries with category, subcategory, variant and sort keys: distance links, corner calls (by intensity and direction), descriptors, lengths, shapes, caution levels, modifiers. Richer than enumerateConcise. | 660 |
| `gameplay_rally_compositors_helpers_compositorUtil.getCaution(cautionCfg, item)` | Text of a caution level (cautionCfg.levels[item.level]). | 302 |
| `gameplay_rally_compositors_helpers_compositorUtil.getClosestEntry(valuesList, targetValue, key, filterFn)` | Returns the entry whose range is closest to targetValue (distance 0 if contained), with optional filter. | 71 |
| `gameplay_rally_compositors_helpers_compositorUtil.getCornerCall(cornerCfg, item)` | Corner call phrase: descriptor + direction, otherwise intensity (risk-adjusted) + direction + afterDirection. Returns nil if there is no direction, the direction is not defined in the style, or the intensity is not found. | 246 |
| `gameplay_rally_compositors_helpers_compositorUtil.getCornerLengthForIntensity(cornerCfg, item, intensityEntry)` | Corner length text for a given intensity based on item.arcMeters; lengthMode 'shorter'/'longer' shifts by one entry, 'skip' removes it. | 266 |
| `gameplay_rally_compositors_helpers_compositorUtil.getCornerLengthForItem(cornerCfg, item)` | Corner length text, first looking up the element's intensity (without risk adjustment). | 290 |
| `gameplay_rally_compositors_helpers_compositorUtil.getCornerShape(cornerCfg, shape)` | Spoken text of a corner's shape. | 296 |
| `gameplay_rally_compositors_helpers_compositorUtil.getNearestValue(valuesList, targetValue, key)` | Returns the entry whose numeric value ('value' key by default) is closest to targetValue. | 24 |
| `gameplay_rally_compositors_helpers_compositorUtil.getRandomWeightedItem(items)` | Randomly picks an item according to its 'weight' field (1 by default). | 396 |
| `gameplay_rally_compositors_helpers_compositorUtil.getRangeValue(valuesList, targetValue, key)` | Returns the first entry whose range ('value' key by default) contains targetValue. | 58 |
| `gameplay_rally_compositors_helpers_compositorUtil.intensityEntryId(entry)` | Identifier of an intensity entry. | 158 |
| `gameplay_rally_compositors_helpers_compositorUtil.intensityEntryLabel(entry)` | Label of an intensity entry: label, otherwise text, otherwise id. | 168 |
| `gameplay_rally_compositors_helpers_compositorUtil.intensityEntryText(entry)` | Spoken text of an intensity entry. | 163 |
| `gameplay_rally_compositors_helpers_compositorUtil.lookupComponentType(componentTypes, itemType)` | Returns the component config for an element type: corner and caution directly, otherwise a modifier (resolving modifierAliases). | 138 |
| `gameplay_rally_compositors_helpers_compositorUtil.lookupDescriptorEntry(cornerCfg, descriptor)` | Descriptor entry of a corner (cornerCfg.descriptors, resolving descriptorAliases). | 232 |
| `gameplay_rally_compositors_helpers_compositorUtil.lookupIntensityEntry(cornerCfg, intensity)` | Intensity entry of the style matching a measured physical diameter ('diameter' range). | 213 |
| `gameplay_rally_compositors_helpers_compositorUtil.lookupRiskAdjustedIntensityEntry(cornerCfg, item)` | Like lookupIntensityEntry on item.intensity, then shifts the entry according to the sign of item.riskIntensity (positive = toward the start of the list, riskier), clamped at the ends. | 218 |
| `gameplay_rally_compositors_helpers_compositorUtil.lookupShapeEntry(cornerCfg, shape)` | Shape entry of a corner (cornerCfg.shapes[shape]). | 238 |
| `gameplay_rally_compositors_helpers_compositorUtil.modifierComponents(componentTypes)` | Table of the style's atomic modifiers (componentTypes.modifiers, or {}). | 133 |
| `gameplay_rally_compositors_helpers_compositorUtil.pacenoteHash(text)` | Turns a phrase into an identifier usable as a file name (see notes). | 385 |
| `gameplay_rally_compositors_helpers_compositorUtil.postProcessPhrase(phrase)` | Cleans up a phrase (removes leading and trailing spaces via rallyUtil.trimString). | 379 |
| `gameplay_rally_compositors_helpers_compositorUtil.rangeBounds(value)` | Reads a range {min, max}: returns numeric min and max (max nil if absent); nil, nil if value is not a table. | 43 |
| `gameplay_rally_compositors_helpers_compositorUtil.rangeContains(value, targetValue)` | True if targetValue is in [min, max[ (or >= min without max). | 51 |
| `gameplay_rally_compositors_helpers_compositorUtil.signedStep(value)` | Sign of a value: 1, -1 or 0 (0 if non-numeric). | 174 |

### Parameter details

#### `gameplay_rally_compositors_helpers_compositorUtil.compositeFromPhrases(config, structured, rawDistanceBefore, rawDistanceAfter, escapeVars)`

Simplified version of compositePhraseEntries that returns only the texts.

- `config` (*table|nil*) : Style config.
- `structured` (*table*) : Structured note.
- `rawDistanceBefore` (*number|nil*) : Distance before (m).
- `rawDistanceAfter` (*number|nil*) : Distance after (m).
- `escapeVars` (*boolean|nil*) : true for distance variables.
- **returns**: string[] Phrases in order.

#### `gameplay_rally_compositors_helpers_compositorUtil.compositePhraseEntries(config, structured, rawDistanceBefore, rawDistanceAfter, opts)`

Walks the structured elements in the fixed order of the slots, calls the type's emitter and adds the before/after distance markers. Elements are spoken one after another with no automatic connector; links between notes ('into', 'and') come from the distance link list if distance calls are enabled.

- `config` (*table|nil*) : Style config.
- `structured` (*table*) : Structured note.
- `rawDistanceBefore` (*number|nil*) : Distance before (m).
- `rawDistanceAfter` (*number|nil*) : Distance after (m).
- `opts` (*table|nil*) : escapeVars (boolean: variables instead of values), variantResolver (function(entry) -> entry|nil), distanceAfterBeforePostModifier (boolean: places the after-distance before the first modifier that follows the corner).
- **returns**: table[] Entries {text, category, variant?, audioFname?}.

#### `gameplay_rally_compositors_helpers_compositorUtil.cornerIntensityList(cornerCfg)`

Ordered list of the style's corner intensities.

- `cornerCfg` (*table|nil*) : Corner config.
- **returns**: table[]|nil Entries {id, text, diameter, visual, afterDirection...}.

#### `gameplay_rally_compositors_helpers_compositorUtil.cornerLengthEntryById(cornerCfg, intensityId, lengthId)`

Finds a length entry by its id for an intensity.

- `cornerCfg` (*table|nil*) : Corner config.
- `intensityId` (*string*) : Intensity.
- `lengthId` (*string*) : Length id.
- **returns**: table|nil Entry.
- **returns**: integer|nil Index in the list.

#### `gameplay_rally_compositors_helpers_compositorUtil.cornerLengthEntryLabel(entry)`

Label of a length entry: label, otherwise text, otherwise id.

- `entry` (*table|nil*) : Entry.
- **returns**: string|nil Label.

#### `gameplay_rally_compositors_helpers_compositorUtil.cornerLengthEntryText(entry)`

Spoken text of a length entry.

- `entry` (*table|nil*) : Entry.
- **returns**: string|nil Text.

#### `gameplay_rally_compositors_helpers_compositorUtil.cornerLengthList(cornerCfg, intensityId)`

List of corner lengths for an intensity (lengthsByIntensity[intensityId]).

- `cornerCfg` (*table|nil*) : Corner config.
- `intensityId` (*string|nil*) : Intensity identifier.
- **returns**: table[]|nil Entries {id, text, arcMeters...}.

#### `gameplay_rally_compositors_helpers_compositorUtil.cornerNumbering(cornerCfg)`

Returns the numbering sub-table of a corner component (cornerCfg.numbering, or cornerCfg itself if it does not exist, or {} if nil).

- `cornerCfg` (*table|nil*) : Config of the corner component.
- **returns**: table Numbering.

#### `gameplay_rally_compositors_helpers_compositorUtil.distanceCallsEnabled(config)`

True unless config.distance.callsEnabled is explicitly false.

- `config` (*table|nil*) : Style config.
- **returns**: boolean State.

#### `gameplay_rally_compositors_helpers_compositorUtil.enumerateConcise(textCompositor, config)`

Enumerates all speakable phrases of the active style (deduplicated): distance links, corner calls, descriptors, lengths, shapes, cautions, modifiers. Used by the audio pipeline and the script player to know which files to look for or generate.

- `textCompositor` (*table*) : Not used.
- `config` (*table*) : Style config.
- **returns**: string[] Unique phrases.

#### `gameplay_rally_compositors_helpers_compositorUtil.enumerateScriptEntries(textCompositor, config)`

Enumerates the script player entries with category, subcategory, variant and sort keys: distance links, corner calls (by intensity and direction), descriptors, lengths, shapes, caution levels, modifiers. Richer than enumerateConcise.

- `textCompositor` (*table*) : Not used.
- `config` (*table*) : Style config.
- **returns**: table[] Entries {phrase, hash, audioFname, recordingSlug, category, subcategory, sourceContext, variant, sortGroup, sortSubgroup, sortPhrase}.

#### `gameplay_rally_compositors_helpers_compositorUtil.getCaution(cautionCfg, item)`

Text of a caution level (cautionCfg.levels[item.level]).

- `cautionCfg` (*table|nil*) : Caution config.
- `item` (*table|nil*) : Caution element (level).
- **returns**: string|nil Text.

#### `gameplay_rally_compositors_helpers_compositorUtil.getClosestEntry(valuesList, targetValue, key, filterFn)`

Returns the entry whose range is closest to targetValue (distance 0 if contained), with optional filter.

- `valuesList` (*table[]|nil*) : List of entries.
- `targetValue` (*number|string*) : Target value.
- `key` (*string|nil*) : Range key.
- `filterFn` (*function|nil*) : function(entry) -> boolean to exclude entries.
- **returns**: table|nil Closest entry.

#### `gameplay_rally_compositors_helpers_compositorUtil.getCornerCall(cornerCfg, item)`

Corner call phrase: descriptor + direction, otherwise intensity (risk-adjusted) + direction + afterDirection. Returns nil if there is no direction, the direction is not defined in the style, or the intensity is not found.

- `cornerCfg` (*table|nil*) : Corner config.
- `item` (*table*) : Corner element (direction, descriptor, intensity...).
- **returns**: string|nil Phrase.

#### `gameplay_rally_compositors_helpers_compositorUtil.getCornerLengthForIntensity(cornerCfg, item, intensityEntry)`

Corner length text for a given intensity based on item.arcMeters; lengthMode 'shorter'/'longer' shifts by one entry, 'skip' removes it.

- `cornerCfg` (*table*) : Corner config.
- `item` (*table*) : Corner element (arcMeters, lengthMode).
- `intensityEntry` (*table|nil*) : Intensity entry.
- **returns**: string|nil Length text.

#### `gameplay_rally_compositors_helpers_compositorUtil.getCornerLengthForItem(cornerCfg, item)`

Corner length text, first looking up the element's intensity (without risk adjustment).

- `cornerCfg` (*table*) : Corner config.
- `item` (*table*) : Corner element.
- **returns**: string|nil Length text.

#### `gameplay_rally_compositors_helpers_compositorUtil.getCornerShape(cornerCfg, shape)`

Spoken text of a corner's shape.

- `cornerCfg` (*table*) : Corner config.
- `shape` (*string|nil*) : Shape key.
- **returns**: string|nil Text.

#### `gameplay_rally_compositors_helpers_compositorUtil.getNearestValue(valuesList, targetValue, key)`

Returns the entry whose numeric value ('value' key by default) is closest to targetValue.

- `valuesList` (*table[]*) : List of entries.
- `targetValue` (*number*) : Target value.
- `key` (*string|nil*) : Numeric key ('value' by default).
- **returns**: table|nil Closest entry.

#### `gameplay_rally_compositors_helpers_compositorUtil.getRandomWeightedItem(items)`

Randomly picks an item according to its 'weight' field (1 by default).

- `items` (*table[]*) : Items with optional weight.
- **returns**: table Chosen item.

#### `gameplay_rally_compositors_helpers_compositorUtil.getRangeValue(valuesList, targetValue, key)`

Returns the first entry whose range ('value' key by default) contains targetValue.

- `valuesList` (*table[]|nil*) : List of entries.
- `targetValue` (*number|string*) : Value searched.
- `key` (*string|nil*) : Range key.
- **returns**: table|nil Entry found.

#### `gameplay_rally_compositors_helpers_compositorUtil.intensityEntryId(entry)`

Identifier of an intensity entry.

- `entry` (*table|nil*) : Entry.
- **returns**: string|nil Id.

#### `gameplay_rally_compositors_helpers_compositorUtil.intensityEntryLabel(entry)`

Label of an intensity entry: label, otherwise text, otherwise id.

- `entry` (*table|nil*) : Entry.
- **returns**: string|nil Label.

#### `gameplay_rally_compositors_helpers_compositorUtil.intensityEntryText(entry)`

Spoken text of an intensity entry.

- `entry` (*table|nil*) : Entry.
- **returns**: string|nil Text.

#### `gameplay_rally_compositors_helpers_compositorUtil.lookupComponentType(componentTypes, itemType)`

Returns the component config for an element type: corner and caution directly, otherwise a modifier (resolving modifierAliases).

- `componentTypes` (*table|nil*) : componentTypes registry.
- `itemType` (*string*) : Kind of the item.
- **returns**: table|nil Component config.

#### `gameplay_rally_compositors_helpers_compositorUtil.lookupDescriptorEntry(cornerCfg, descriptor)`

Descriptor entry of a corner (cornerCfg.descriptors, resolving descriptorAliases).

- `cornerCfg` (*table*) : Corner config.
- `descriptor` (*string|nil*) : Descriptor key.
- **returns**: table|nil Entry.

#### `gameplay_rally_compositors_helpers_compositorUtil.lookupIntensityEntry(cornerCfg, intensity)`

Intensity entry of the style matching a measured physical diameter ('diameter' range).

- `cornerCfg` (*table*) : Corner config.
- `intensity` (*number*) : Measured diameter (>= 0).
- **returns**: table|nil Intensity entry.

#### `gameplay_rally_compositors_helpers_compositorUtil.lookupRiskAdjustedIntensityEntry(cornerCfg, item)`

Like lookupIntensityEntry on item.intensity, then shifts the entry according to the sign of item.riskIntensity (positive = toward the start of the list, riskier), clamped at the ends.

- `cornerCfg` (*table*) : Corner config.
- `item` (*table*) : Corner element (intensity, riskIntensity).
- **returns**: table|nil Adjusted intensity entry.

#### `gameplay_rally_compositors_helpers_compositorUtil.lookupShapeEntry(cornerCfg, shape)`

Shape entry of a corner (cornerCfg.shapes[shape]).

- `cornerCfg` (*table*) : Corner config.
- `shape` (*string|nil*) : Shape key.
- **returns**: table|nil Entry.

#### `gameplay_rally_compositors_helpers_compositorUtil.modifierComponents(componentTypes)`

Table of the style's atomic modifiers (componentTypes.modifiers, or {}).

- `componentTypes` (*table|nil*) : componentTypes registry.
- **returns**: table Modifiers by key.

#### `gameplay_rally_compositors_helpers_compositorUtil.pacenoteHash(text)`

Turns a phrase into an identifier usable as a file name (see notes).

- `text` (*string|nil*) : Phrase.
- **returns**: string|nil Hash, nil if text is nil.

#### `gameplay_rally_compositors_helpers_compositorUtil.postProcessPhrase(phrase)`

Cleans up a phrase (removes leading and trailing spaces via rallyUtil.trimString).

- `phrase` (*string*) : Raw phrase.
- **returns**: string Cleaned phrase.

#### `gameplay_rally_compositors_helpers_compositorUtil.rangeBounds(value)`

Reads a range {min, max}: returns numeric min and max (max nil if absent); nil, nil if value is not a table.

- `value` (*table|nil*) : Range.
- **returns**: number|nil min.
- **returns**: number|nil max.

#### `gameplay_rally_compositors_helpers_compositorUtil.rangeContains(value, targetValue)`

True if targetValue is in [min, max[ (or >= min without max).

- `value` (*table*) : Range {min, max}.
- `targetValue` (*number*) : Value tested.
- **returns**: boolean Result.

#### `gameplay_rally_compositors_helpers_compositorUtil.signedStep(value)`

Sign of a value: 1, -1 or 0 (0 if non-numeric).

- `value` (*number|nil*) : Value.
- **returns**: integer -1, 0 or 1.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/rally/compositors/helpers/compositorUtil.lua`.*
