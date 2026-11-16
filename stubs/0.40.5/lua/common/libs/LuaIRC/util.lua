---@meta
-- tim19Atlas stub generated from lua/common/libs/LuaIRC/util.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Surrounds the text with the mIRC bold control byte (0x02).
---Source: lua/common/libs/LuaIRC/util.lua:105
---@param text string Text
---@return string  IRC bold text
function bold(text) end

--- Checks that a nickname only contains valid IRC characters and does not start with a digit or a hyphen.
---Source: lua/common/libs/LuaIRC/util.lua:114
---@param nick string Nickname
---@return boolean  true if valid
function checkNick(nick) end

--- Generates a replacement nickname by incrementing the code of a randomly chosen character (goes back to 65 if outside 65..125). Used when the nickname is refused (codes 432/433).
---Source: lua/common/libs/LuaIRC/util.lua:118
---@param nick string Refused nickname
---@return string  New nickname
function defaultNickGenerator(nick) end

--- Splits a raw IRC line into prefix (without the leading ':'), command and parameter list. The final parameter introduced by ' :' is added last.
---Source: lua/common/libs/LuaIRC/util.lua:14
---@param line string Line received from the server
---@return string|nil  Prefix
---@return string  Command or numeric code
---@return table<integer, string>  Parameters
function parse(line) end

--- Converts a string of symbols into a table {op, halfop, voice} (@ = op, % = halfop, + = voice).
---Source: lua/common/libs/LuaIRC/util.lua:67
---@param accessString string Access symbols
---@return table  {op = boolean, halfop = boolean, voice = boolean}
function parseAccess(accessString) end

--- Separates the access symbols (@, +) from the nickname, as in a NAMES list.
---Source: lua/common/libs/LuaIRC/util.lua:53
---@param nick string E.g. "@bob"
---@return table  {op, halfop, voice}
---@return string  Nickname without symbols
function parseNick(nick) end

--- Parses a nick!user@host prefix into a table {access, nick, username, host}. Without a valid prefix, only the default access rights are filled in.
---Source: lua/common/libs/LuaIRC/util.lua:58
---@param prefix string|nil Line prefix
---@return table  {access, nick, username, host}
function parsePrefix(prefix) end

--- Surrounds the text with the mIRC underline control byte (0x1F).
---Source: lua/common/libs/LuaIRC/util.lua:110
---@param text string Text
---@return string  IRC underlined text
function underline(text) end

---@type table
color = nil
