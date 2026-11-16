# `gameplay_rally_compositors_styles_english_systemPacenotes`

*File: `lua/ge/extensions/gameplay/rally/compositors/styles/english/systemPacenotes.lua` · VM: Game Engine (GE) · 38 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/gameplay/rally/compositors/styles/english/systemPacenotes")` (file under extensions/ but not a regular extension)

System notes in English (co-driver announcements that do not come from corners): start countdown (five to go), time warnings (60, 30, 15, 10 seconds), intercom and belts check, new start minute, false start. The file returns the result of systemPacenotes.localized(...) (module notebook/systemPacenotes) from a table name -> text or list of variants {text, weight}.

## Notes

- File WARNING: any change to a string requires regenerating the audio files.
- 'precountdown' has two weighted variants: 'Good luck!' (weight 0.5) and 'Best of luck!' (weight 0.1).
- Defined names: precountdown, countdown5 to countdown1, countdowngo, warningSeconds60/30/15/10, commsCheck, beltsCheck, rescheduled, falseStart. They are validated by styleValidator via systemPacenotes.validate.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/rally/compositors/styles/english/systemPacenotes.lua`.*
