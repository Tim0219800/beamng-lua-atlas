# `gameplay_rally_enums`

*File: `lua/ge/extensions/gameplay/rally/enums.lua` · VM: Game Engine (GE) · 86 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_rally_enums`: `extensions.load("gameplay_rally_enums")`, then the global `gameplay_rally_enums`

Shared enumerations of the rally system (co-driver notes): pacenote audio mode, trigger type, release type for slow corners, with their readable names. These are constant tables used by the note editor and by the rally engine; the file contains no functions.

## Notes

- The numeric values are persisted in the notebooks: do not renumber them.
- Several triggerType and slowCornerReleaseType values are commented out in the code (csStatic, csHalf, ceMinus5, ceStatic for triggerType) and therefore unavailable.
- slowCornerReleaseType: steps of 10 (10 to 50); csHalf (30) is the default value according to its label.

## Fields

| Field | Type | Description |
|---|---|---|
| `pacenoteAudioMode` | table<string, integer> | Audio modes: auto=1, freeform=2, structuredOnline=3, structuredOffline=4, custom=5. |
| `pacenoteAudioModeDisplayNames` | table<integer, string> | Names shown to the user (editor, debug); structuredOffline is displayed as 'structured'. |
| `pacenoteAudioModeHidden` | table<string, boolean> | Modes hidden in the choice lists (freeform, structuredOnline) but still functional for existing notebooks. |
| `pacenoteAudioModeNames` | table<integer, string> | Technical name of each audio mode, keyed by value. |
| `slowCornerReleaseType` | table<string, integer> | Release moment of a slow corner note: csStaticMinus40=10, csStatic=20, csHalf=30, ceMinus5=40, ceStatic=50. |
| `slowCornerReleaseTypeName` | table<integer, string> | Matching labels (e.g. '40m before corner start', 'at corner end'). |
| `triggerType` | table<string, integer> | Trigger types of a note: dynamic=1, csImmediate=15. |
| `triggerTypeName` | table<integer, string> | Labels of the trigger types ('dynamic (default)', 'immediate (only use for first pacenote)'). |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/rally/enums.lua`.*
