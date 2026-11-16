# `libs_LuaIRC_util`

*File: `lua/common/libs/LuaIRC/util.lua` · VM: Common (GE + vehicle) · 137 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("libs/LuaIRC/util")`

Part of the third-party LuaIRC library (IRC client). Module "irc": parsing of IRC protocol lines (parse), nicknames and prefixes (parseNick, parsePrefix, parseAccess), nickname validation, fallback nickname generator, and mIRC formatting (colors, bold, underline).

## Example

```lua
local prefix, cmd, params = irc.parse(":nick!user@host PRIVMSG #chan :hello")
-- prefix = "nick!user@host", cmd = "PRIVMSG", params = {"#chan", "hello"}
```

## Global functions defined here

| Function | Description | Line |
|---|---|---|
| `bold(text)` | Surrounds the text with the mIRC bold control byte (0x02). | 105 |
| `checkNick(nick)` | Checks that a nickname only contains valid IRC characters and does not start with a digit or a hyphen. | 114 |
| `defaultNickGenerator(nick)` | Generates a replacement nickname by incrementing the code of a randomly chosen character (goes back to 65 if outside 65..125). Used when the nickname is refused (codes 432/433). | 118 |
| `parse(line)` | Splits a raw IRC line into prefix (without the leading ':'), command and parameter list. The final parameter introduced by ' :' is added last. | 14 |
| `parseAccess(accessString)` | Converts a string of symbols into a table {op, halfop, voice} (@ = op, % = halfop, + = voice). | 67 |
| `parseNick(nick)` | Separates the access symbols (@, +) from the nickname, as in a NAMES list. | 53 |
| `parsePrefix(prefix)` | Parses a nick!user@host prefix into a table {access, nick, username, host}. Without a valid prefix, only the default access rights are filled in. | 58 |
| `underline(text)` | Surrounds the text with the mIRC underline control byte (0x1F). | 110 |

**Globals assigned:** `color`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/libs/LuaIRC/util.lua`.*
