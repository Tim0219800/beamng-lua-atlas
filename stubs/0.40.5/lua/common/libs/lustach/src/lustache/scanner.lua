---@meta
-- tim19Atlas stub generated from lua/common/libs/lustach/src/lustache/scanner.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Third-party library lustache: string scanner used by the template parser. It keeps the remaining "tail" of the string (`tail`) and the current position (`pos`) and advances by consuming text with Lua patterns.
--- Access: `require("libs/lustach/src/lustache/scanner")`
---@class libs_lustach_src_lustache_scanner
local libs_lustach_src_lustache_scanner = {}

--- True if the tail is empty (end of string).
---Source: lua/common/libs/lustach/src/lustache/scanner.lua:7
---@param self any
---@return boolean  true at the end.
function libs_lustach_src_lustache_scanner.eos(self) end

--- Creates a scanner on `str` (tail = str, pos = 1).
---Source: lua/common/libs/lustach/src/lustache/scanner.lua:48
---@param self table Scanner class (call with a colon).
---@param str string Text to scan.
---@return table  Scanner instance.
function libs_lustach_src_lustache_scanner.new(self, str) end

--- Tries to match `pattern` exactly at the start of the tail; if so, consumes and returns the text found, otherwise returns nil.
---Source: lua/common/libs/lustach/src/lustache/scanner.lua:13
---@param self any
---@param pattern string Lua pattern.
---@return string|nil  Consumed text or nil.
function libs_lustach_src_lustache_scanner.scan(self, pattern) end

--- Advances to the next match of `pattern` and returns the skipped text. Returns the whole tail if there is no match; returns nil if the pattern matches right at the current position.
---Source: lua/common/libs/lustach/src/lustache/scanner.lua:28
---@param self any
---@param pattern string Lua pattern.
---@return string|nil  Skipped text, or nil.
function libs_lustach_src_lustache_scanner.scan_until(self, pattern) end

return libs_lustach_src_lustache_scanner
