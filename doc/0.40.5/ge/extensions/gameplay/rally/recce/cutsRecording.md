# `gameplay_rally_recce_cutsRecording`

*File: `lua/ge/extensions/gameplay/rally/recce/cutsRecording.lua` · VM: Game Engine (GE) · 79 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_rally_recce_cutsRecording`: `extensions.load("gameplay_rally_recce_cutsRecording")`, then the global `gameplay_rally_recce_cutsRecording`

Loader of a rally's recce "cuts". A cut is a position marker where the co-driver made a voice recording during the recce. The module reads the mission's cuts file and attaches to it, if they exist, the transcriptions from the transcripts file. It is an extension (gameplay_rally_recce_cutsRecording), used by the recce class.

## Notes

- The file paths come from rallyUtil.cutsFile(missionDir) and rallyUtil.transcriptsFile(missionDir); both files are in JSONL format (one line = one object).
- A transcription is only kept if its cutId is a number > 0; it is attached to the cut whose id is equal.
- The normalization word_map is currently an empty array (TODO in the code: to be reconnected when the work on freeform text resumes), so the text is not modified in practice.

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_rally_recce_cutsRecording.load(missionDir)` | Loads the mission's cuts with their transcriptions. Each line of the cuts file becomes an object whose pos is converted to vec3 and quat to quat, with a transcript field added ({error, text} if a transcription exists, otherwise an empty table). | 36 |

### Parameter details

#### `gameplay_rally_recce_cutsRecording.load(missionDir)`

Loads the mission's cuts with their transcriptions. Each line of the cuts file becomes an object whose pos is converted to vec3 and quat to quat, with a transcript field added ({error, text} if a transcription exists, otherwise an empty table).

- `missionDir` (*string*) : Mission folder containing the recce files
- **returns**: table[] Array of cut objects; empty array (not nil) if the cuts file does not exist

## Calls into the engine (C++)

- `FS:` `fileExists`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/rally/recce/cutsRecording.lua`.*
