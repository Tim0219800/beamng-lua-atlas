# `gameplay_rally_compositors_helpers_textCompositor`

*File: `lua/ge/extensions/gameplay/rally/compositors/helpers/textCompositor.lua` · VM: Game Engine (GE) · 443 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/gameplay/rally/compositors/helpers/textCompositor")` (file under extensions/ but not a regular extension)

Rally note text compositor: loads a style (file compositors/styles/<name>.lua), copies it, applies the mission's calibrations, validates it, then exposes phrase composition for a structured note, the list of system notes (with their audio files according to the mission or voice pack), the enumeration of all phrases to record, and the rules for converting distances to spoken text. The module returns a constructor: require(...)(compositorName, missionDir); load() must be called before any use.

## Example

```lua
local tc = require('/lua/ge/extensions/gameplay/rally/compositors/helpers/textCompositor')('english/casual', missionDir)
if tc:load() then
  local text = tc:compositeText(structured, 120, 40)
end
```

## Notes

- All composition methods return nil (or {} / false depending on the method) until load() has succeeded.
- Distances are in meters; distanceToString rounds according to the style's distance.rounding and switches to the 'large' unit (km) with 'point' for the decimal point, e.g. '1 point 5 km' (each decimal digit is spoken separately).
- enumerateAll raises an error (error) if two identical phrases exist in the style (distances, notes, system).
- getSystemPacenote reads sys[name][i] without checking: errors if the name does not exist or the style is not loaded.
- The result of getSystemPacenotes is cached per mission notes folder; changing the voice pack (setVoicepackEntry with a different id) clears the cache.

## Class `C`

Text compositor. Attributes: compositorName, missionDir, compositor (table of the loaded style or nil), cachedSystemPacenotes, voicepackEntry.

The module returns a constructor: `local obj = require("gameplay_rally_compositors_helpers_textCompositor")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:_requireCompositor()` | Requires the style file (nil if no name). | 65 |
| `C:compositePhraseEntries(structured, distBefore, distAfter, opts)` | Calls compositorUtil.compositePhraseEntries with the style's config: returns entries {text, category, variant, audioFname}. | 81 |
| `C:compositeText(structured, distBefore, distAfter)` | Composes a note's text by calling style.composite(config, structured, distBefore, distAfter). | 71 |
| `C:compositeTextEscaped(structured, distBefore, distAfter)` | Like compositeText, but with escapeVars=true: distances are replaced by the substitution variables (rallyUtil.var_db / var_da) instead of their value. | 76 |
| `C:compositorPath()` | Style module path: '/lua/ge/extensions/gameplay/rally/compositors/styles/<name>'. | 61 |
| `C:distanceCallsEnabled()` | Indicates whether distance calls are enabled in the style (false if not loaded). | 91 |
| `C:distanceToString(dist)` | Converts a distance to spoken text (integer part then rounding); in the 'large' unit, the decimal point is replaced by the style's word 'point' and the digits are separated, then the unit is appended. | 368 |
| `C:enumerateAll()` | Enumerates all phrases (distances, notes, system) with hash, group and statistics (totalChars, totalPhrases...). Raises an error if a phrase is duplicated. | 261 |
| `C:enumerateDistanceEntries()` | Enumerates the speakable distance calls: from the links' max distance up to distance.max, in steps of rounding.small, deduplicated by text. Empty if distance calls are disabled. | 162 |
| `C:enumerateDistances()` | Same as enumerateDistanceEntries but keeps only the phrases. | 196 |
| `C:enumeratePacenotes()` | Enumerates the note phrases via style.enumerate(self, config). | 204 |
| `C:enumerateScriptEntries()` | Enumerates the script player entries with category and variants: system notes, distances, then those from compositorUtil.enumerateScriptEntries. Fills in hash, audioFname and recordingSlug. | 209 |
| `C:getBaseUnit()` | Base unit of distances (distance.units.base). | 402 |
| `C:getConfig()` | Returns the loaded style's table. | 86 |
| `C:getDistanceCallShorthand(dist)` | Returns the text of the first distance link whose threshold is greater than dist (e.g. 'into', 'and'). | 381 |
| `C:getDistanceLinks()` | List of the style's distance links (distance.links). | 392 |
| `C:getLargeUnit()` | Large unit of distances (distance.units.large). | 405 |
| `C:getMaxDistance()` | Maximum spoken distance (distance.max). | 428 |
| `C:getMaxLinkDistance()` | Threshold of the last distance link (0 if there are none). | 396 |
| `C:getPointTranslation()` | Spoken word for the decimal point (distance.units.point). | 408 |
| `C:getRoundingLarge()` | Rounding step for large distances (distance.rounding.large). | 422 |
| `C:getRoundingLargeThreshold()` | Distance from which the large unit is used (distance.rounding.largeThreshold). | 425 |
| `C:getRoundingMedium()` | Rounding step for medium distances (distance.rounding.medium). | 415 |
| `C:getRoundingMediumThreshold()` | Distance from which the medium step is used (distance.rounding.mediumThreshold). | 418 |
| `C:getRoundingSmall()` | Rounding step for small distances (distance.rounding.small). | 412 |
| `C:getSystemPacenote(name, i)` | Returns the i-th variant (1 by default) of the system note 'name'. | 155 |
| `C:getSystemPacenotes(missionPacenotesDirname, voicepackEntry)` | Returns a table {name -> variants[]} where each variant receives audioFname (file in the mission's notes folder, or file of the active or resolved voice pack) and audioBasename. The pairs() order is undefined: use getSystemPacenotesOrdered when order matters. Result is cached. | 105 |
| `C:getSystemPacenotesOrdered()` | Returns the ordered array {name, variants} of system notes as written by the style author. | 97 |
| `C:init(compositorName, missionDir)` | Stores the style name and the mission folder (logs an error if the name is nil). Loads nothing. | 15 |
| `C:load()` | Loads the style: require + deepcopy, applies calibrationOverrides.applyToConfig, validates with styleValidator. If the file is missing or validation fails, logs an error and leaves the style nil. | 27 |
| `C:pacenoteHash(text)` | Text hash of a phrase (see compositorUtil.pacenoteHash). | 432 |
| `C:roundDistance(dist)` | Rounds a distance according to the style's rules: beyond largeThreshold, value in the 'large' unit (km); between mediumThreshold and largeThreshold, medium step (switches to 'large' if the result reaches largeThreshold); otherwise small step. | 338 |
| `C:setVoicepackEntry(entry)` | Sets the active voice pack entry; clears the system notes cache if its identifier (id, dir or dirname) changes. | 52 |
| `C:writeEnumerated(fname, enumerated)` | Writes the result of an enumeration to an indented JSON file. | 334 |

## Calls into the engine (C++)

- `FS:` `fileExists`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/rally/compositors/helpers/textCompositor.lua`.*
