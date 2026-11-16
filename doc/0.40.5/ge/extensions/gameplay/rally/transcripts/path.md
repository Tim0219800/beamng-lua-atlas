# `gameplay_rally_transcripts_path`

*File: `lua/ge/extensions/gameplay/rally/transcripts/path.lua` · VM: Game Engine (GE) · 134 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/gameplay/rally/transcripts/path")` (file under extensions/ but not a regular extension)

Container of a rally's transcriptions (recognized text of the co-driver's voice during the recce). It loads and saves a JSON file, and manages a `sortedList` of entries (transcripts/entry.lua). It also provides the unique identifiers and the debug drawing of the transcriptions. The module returns a constructor: `require(...)(fname)`.

## Notes

- The big comment above drawDebugTranscripts is commented-out test code (quaternion rotation): it is not executed.
- _draw_debug_hover_tsc_id is never modified in this file; only the nil value is used.

## Class `C`

Transcriptions path. Fields: fname, selection_sphere_r (4), _draw_debug_hover_tsc_id, transcripts (sortedList of entries).

The module returns a constructor: `local obj = require("gameplay_rally_transcripts_path")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:drawDebug(selected_id)` | Entry point of the debug drawing; calls drawDebugTranscripts. | 75 |
| `C:drawDebugTranscripts(selected_id)` | Calls drawDebug(is_hovered, is_selected) on each entry of the sorted list. | 119 |
| `C:getNextUniqueIdentifier()` | Returns an increasing integer (1, 2, 3…) used as the entries' id. | 11 |
| `C:init(fname)` | Constructor: stores the file name and creates the `transcripts` sortedList. | 19 |
| `C:load()` | Loads the JSON file (jsonReadFile) and deserializes. Logs a warning and returns false if fname is nil or the file is absent, an error if reading fails. | 32 |
| `C:onDeserialized(data)` | Empties the list and reloads it from data.transcripts. Does nothing if data is nil. | 67 |
| `C:onSerialize()` | Returns {transcripts = <serialized list>}. | 59 |
| `C:save()` | Serializes and writes the JSON file (jsonWriteFile with the compact parameter set to false). | 53 |

## Calls into the engine (C++)

- `FS:` `fileExists`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/rally/transcripts/path.lua`.*
