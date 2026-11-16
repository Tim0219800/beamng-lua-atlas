# `inputFilters`

*File: `lua/common/inputFilters.lua` · VM: Common (GE + vehicle) · 19 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("inputFilters")`

Defines global constants identifying the input filter type (keyboard, gamepad, direct, drift keyboard, AI) and the FILTER_NAME table that gives a readable name. Useful when reading or sending input events (input.event) with a filter.

## Notes

- A filter equal to -1 can be sent by the C++: it is guessed and translated engine-side into a filter >= 0 before reaching Lua (code comment).
- FILTER_AI is the string "FILTER_AI" (not a number) and has no entry in FILTER_NAME.

**Globals assigned:** `FILTER_AI`, `FILTER_DIRECT`, `FILTER_KBD`, `FILTER_KBD2`, `FILTER_NAME`, `FILTER_PAD`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/inputFilters.lua`.*
