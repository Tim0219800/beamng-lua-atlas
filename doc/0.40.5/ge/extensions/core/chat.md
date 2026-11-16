# `core_chat`

*File: `lua/ge/extensions/core/chat.lua` · VM: Game Engine (GE) · 179 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/core/chat")` (file under extensions/ but not a regular extension)

Old IRC chat client (irc.beamng.com, channel #beamng). All the code in the file is commented out (--[[ ... ]] block, marked "not working atm"): the module therefore returns nothing usable and defines no function.

## Notes

- The file contains no active code; require returns nil. Do not use it.
- The commented-out code provided for M.activate, M.deactivate, M.send(target, message), M.requestState, M.onInit, M.onUpdate and emitted the onChatMessage hook and the ChatMessage/ChatState UI event.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/core/chat.lua`.*
