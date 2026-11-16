# `gameplay_rally_compositors_styles_english_modifiers`

*File: `lua/ge/extensions/gameplay/rally/compositors/styles/english/modifiers.lua` · VM: Game Engine (GE) · 149 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_rally_compositors_styles_english_modifiers`: `extensions.load("gameplay_rally_compositors_styles_english_modifiers")`, then the global `gameplay_rally_compositors_styles_english_modifiers`

Catalog of the English atomic modifiers for rally notes (braking, line guidance, cuts, 'keep', chicanes, jumps, crests, dips, bumps, surfaces, water, roadside landmarks, flow, stage calls). Each entry is {text, tags, visual, variant?}: text = spoken phrase, tags = categories (pace, line, cut, keep, chicane, jump, crest, dip, bump, grade, surface, water, landmark, flow, stage), visual = icon/colors for the visual notes ({} = no tile). Used by the english/casual and english/enthusiast styles.

## Notes

- File WARNING: any change to a text in use requires regenerating the audio.
- The module returns the modifiers table directly (no M).
- visual = {} (noVisual) means text only: the visual compositor ignores the entry. iconVisual(icon) gives a purple tile (modifierBg/modifierStroke); additionalNoteVisual gives a badge (scissors, crossed-out scissors) attached to the corner note.
- Cut: cut/bigCut/earlyCut/lateCut/smallCut = green scissors; dont/dontCut/dontCutLate = red crossed-out scissors.
- overCrest has variant = '1'; the enthusiast style's shapes.overCrest field has variant '2' to avoid an audio file name collision.
- The text of 'bump' is 'over bump' and that of 'finish' is 'over finish'.

## Fields

| Field | Type | Description |
|---|---|---|
| `atJunction` | table | 'at junction' (landmark). |
| `atRock` | table | 'at rock' (landmark). |
| `atTree` | table | 'at tree' (landmark). |
| `badDip` | table | 'bad dip' (dip), pothole icon. |
| `badDipJump` | table | 'bad dip jump' (jump). |
| `badDrop` | table | 'bad drop' (bump). |
| `badJump` | table | 'bad jump' (jump). |
| `badKick` | table | 'bad kick' (bump). |
| `beBrave` | table | 'be brave' (pace). |
| `bigCrest` | table | 'big crest' (crest). |
| `bigCut` | table | 'big cut' (cut), scissors badge. |
| `bigJump` | table | 'big jump' (jump). |
| `brake` | table | 'brake' (pace). |
| `brakeOverBumps` | table | 'brake over bumps' (pace). |
| `brakeOverCrest` | table | 'brake over crest' (pace). |
| `braking` | table | 'braking' (pace). |
| `bump` | table | 'over bump' (bump), bump icon. |
| `bumpy` | table | 'bumpy' (bump), bumps icon. |
| `chicaneLeftEntry` | table | 'chicane left entry' (chicane). |
| `chicaneRightEntry` | table | 'chicane right entry' (chicane). |
| `crest` | table | 'crest' (crest). |
| `cut` | table | 'cut' (cut), scissors badge. |
| `deceptive` | table | 'deceptive' (flow). |
| `dip` | table | 'dip' (dip). |
| `dont` | table | 'don't' (cut), crossed-out scissors badge. |
| `dontCut` | table | 'don't cut' (cut), crossed-out scissors badge. |
| `dontCutLate` | table | 'don't cut late' (cut), crossed-out scissors badge. |
| `dontGoWide` | table | 'don't go wide' (line). |
| `down` | table | 'down' (grade), no visual. |
| `drop` | table | 'drop' (bump). |
| `early` | table | 'early' (line). |
| `earlyCut` | table | 'early cut' (cut). |
| `finish` | table | 'over finish' (stage), black and white finish icon. |
| `getsFasterNow` | table | 'gets faster now' (pace). |
| `goWide` | table | 'go wide' (line). |
| `intoBridge` | table | 'into bridge' (landmark), bridge icon. |
| `intoCrest` | table | 'into crest' (crest). |
| `intoTurn` | table | 'into turn' (pace). |
| `intoWater` | table | 'into water' (water). |
| `jump` | table | 'jump' (jump). |
| `keepIn` | table | 'keep in' (keep). |
| `keepLeft` | table | 'keep left' (keep). |
| `keepLeftOverCrest` | table | 'keep left over crest' (keep). |
| `keepMiddle` | table | 'keep middle' (keep). |
| `keepMiddleOverCrest` | table | 'keep middle over crest' (keep). |
| `keepRight` | table | 'keep right' (keep). |
| `keepRightOverCrest` | table | 'keep right over crest' (keep). |
| `kick` | table | 'kick' (bump). |
| `late` | table | 'late' (line). |
| `lateCut` | table | 'late cut' (cut). |
| `longCrest` | table | 'long crest' (crest). |
| `middle` | table | 'middle' (line). |
| `middleOverCrest` | table | 'middle over crest' (line). |
| `narrowBridge` | table | 'narrow bridge' (landmark), bridge icon. |
| `narrows` | table | 'narrows' (line), narrows icon. |
| `nips` | table | 'nips' (line). |
| `ontoGravel` | table | 'onto gravel' (surface). |
| `ontoIce` | table | 'onto ice' (surface). |
| `ontoMud` | table | 'onto mud' (surface). |
| `ontoTarmac` | table | 'onto tarmac' (surface). |
| `overBridge` | table | 'over bridge' (landmark), bridge icon. |
| `overCrest` | table | 'over crest' (crest), variant '1', crest icon. |
| `overDip` | table | 'over dip' (dip). |
| `overJump` | table | 'over jump' (jump), jumpOverBump icon. |
| `pastFence` | table | 'past fence' (landmark). |
| `pastHouse` | table | 'past house' (landmark). |
| `pastJunction` | table | 'past junction' (landmark). |
| `pastRock` | table | 'past rock' (landmark). |
| `pastTree` | table | 'past tree' (landmark). |
| `pastWall` | table | 'past wall' (landmark). |
| `slippy` | table | 'slippy' (surface). |
| `slowing` | table | 'slowing' (pace). |
| `smallCrest` | table | 'small crest' (crest). |
| `smallCut` | table | 'small cut' (cut). |
| `stop` | table | 'stop' (pace). |
| `sudden` | table | 'sudden' (flow). |
| `throughBridge` | table | 'through bridge' (landmark), bridge icon. |
| `throughDip` | table | 'through dip' (dip). |
| `throughGate` | table | 'through gate' (landmark). |
| `throughTunnel` | table | 'through tunnel' (landmark). |
| `toStop` | table | 'to stop' (stage). |
| `turn` | table | 'turn' (pace). |
| `twisty` | table | 'twisty' (line). |
| `underBridge` | table | 'under bridge' (landmark), bridge icon. |
| `up` | table | 'up' (grade), no visual. |
| `water` | table | 'water' (water). |
| `watersplash` | table | 'watersplash' (water), water icon. |
| `wide` | table | 'wide' (line). |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/rally/compositors/styles/english/modifiers.lua`.*
