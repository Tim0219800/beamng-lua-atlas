---@meta
-- tim19Atlas stub generated from lua/common/libs/lustach/src/lustache/scanner.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : `require("libs/lustach/src/lustache/scanner")`
---@class libs_lustach_src_lustache_scanner
local libs_lustach_src_lustache_scanner = {}

--- Returns `true` if the tail is empty (end of string).
---Source : lua/common/libs/lustach/src/lustache/scanner.lua:7
---@param self any
function libs_lustach_src_lustache_scanner.eos(self) end

---Source : lua/common/libs/lustach/src/lustache/scanner.lua:48
---@param self any
---@param str any
function libs_lustach_src_lustache_scanner.new(self, str) end

--- Tries to match the given regular expression at the current position.
---  Returns the matched text if it can match, `null` otherwise.
---Source : lua/common/libs/lustach/src/lustache/scanner.lua:13
---@param self any
---@param pattern any
function libs_lustach_src_lustache_scanner.scan(self, pattern) end

--- Skips all text until the given regular expression can be matched. Returns
---  the skipped string, which is the entire tail of this scanner if no match
---  can be made.
---Source : lua/common/libs/lustach/src/lustache/scanner.lua:28
---@param self any
---@param pattern any
function libs_lustach_src_lustache_scanner.scan_until(self, pattern) end

return libs_lustach_src_lustache_scanner
