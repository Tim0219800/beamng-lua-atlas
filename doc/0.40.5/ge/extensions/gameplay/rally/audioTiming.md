# `gameplay_rally_audioTiming`

*File: `lua/ge/extensions/gameplay/rally/audioTiming.lua` · VM: Game Engine (GE) · 44 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_rally_audioTiming`: `extensions.load("gameplay_rally_audioTiming")`, then the global `gameplay_rally_audioTiming`

Bounds and clamp functions for the rally co-driver audio spacing settings, in milliseconds: gap between corners, between phrases, between link words and between notes. Each function rounds the value to an integer and clamps it to the allowed range. Used by the editor/settings and by gameplay_rally_audioManager.

## Notes

- cornerGapMs, phraseGapMs and linkWordGapMs are the SAME table (min -200, max 200): changing one changes the other two.
- pacenoteGapMs: min -100, max 400.
- A negative value means the audio clips overlap (inferred from the field name and its usage in audioManager).

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_rally_audioTiming.clampCornerGapMs(value)` | Rounds and clamps a corner gap to cornerGapMs. | 27 |
| `gameplay_rally_audioTiming.clampLinkWordGapMs(value)` | Rounds and clamps a link word gap to linkWordGapMs. | 35 |
| `gameplay_rally_audioTiming.clampPacenoteGapMs(value)` | Rounds and clamps a note gap to pacenoteGapMs. | 39 |
| `gameplay_rally_audioTiming.clampPhraseGapMs(value)` | Rounds and clamps a phrase gap to phraseGapMs. | 31 |

### Parameter details

#### `gameplay_rally_audioTiming.clampCornerGapMs(value)`

Rounds and clamps a corner gap to cornerGapMs.

- `value` (*number|string*) : Value in ms; converted with tonumber, 0 if invalid.
- **returns**: integer Clamped value in ms.

#### `gameplay_rally_audioTiming.clampLinkWordGapMs(value)`

Rounds and clamps a link word gap to linkWordGapMs.

- `value` (*number|string*) : Value in ms.
- **returns**: integer Clamped value in ms.

#### `gameplay_rally_audioTiming.clampPacenoteGapMs(value)`

Rounds and clamps a note gap to pacenoteGapMs.

- `value` (*number|string*) : Value in ms.
- **returns**: integer Clamped value in ms.

#### `gameplay_rally_audioTiming.clampPhraseGapMs(value)`

Rounds and clamps a phrase gap to phraseGapMs.

- `value` (*number|string*) : Value in ms.
- **returns**: integer Clamped value in ms.

## Fields

| Field | Type | Description |
|---|---|---|
| `cornerGapMs` | table | Bounds {min=-200, max=200} of the gap between corners (ms). Table shared with phraseGapMs and linkWordGapMs. |
| `linkWordGapMs` | table | Bounds {min=-200, max=200} of the gap with link words (ms). |
| `pacenoteGapMs` | table | Bounds {min=-100, max=400} of the gap between two notes (ms). |
| `phraseGapMs` | table | Bounds {min=-200, max=200} of the gap between phrases (ms). |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/rally/audioTiming.lua`.*
