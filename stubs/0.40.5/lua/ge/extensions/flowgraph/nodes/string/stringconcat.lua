---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/string/stringconcat.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe locale `C` de lua/ge/extensions/flowgraph/nodes/string/stringconcat.lua
---@class flowgraph_nodes_string_stringconcat_C
local flowgraph_nodes_string_stringconcat_C = {}

---Source : lua/ge/extensions/flowgraph/nodes/string/stringconcat.lua:30
function flowgraph_nodes_string_stringconcat_C:_executionStarted() end

--- make sure we have one (and only one) empty pin available at the end of our inPins
---  also make sure we preserve pins that have become empty inbetween the rest of pins (don't remove those)
---Source : lua/ge/extensions/flowgraph/nodes/string/stringconcat.lua:85
function flowgraph_nodes_string_stringconcat_C:cleanupPins() end

---Source : lua/ge/extensions/flowgraph/nodes/string/stringconcat.lua:119
---@param builder any
---@param style any
function flowgraph_nodes_string_stringconcat_C:drawMiddle(builder, style) end

---Source : lua/ge/extensions/flowgraph/nodes/string/stringconcat.lua:23
function flowgraph_nodes_string_stringconcat_C:init() end

---Source : lua/ge/extensions/flowgraph/nodes/string/stringconcat.lua:72
---@param link any
function flowgraph_nodes_string_stringconcat_C:onLink(link) end

---Source : lua/ge/extensions/flowgraph/nodes/string/stringconcat.lua:77
---@param link any
function flowgraph_nodes_string_stringconcat_C:onUnlink(link) end

--- compare the list of concat inputs, return false if they're the same as last time, return true if any input has changed
---  also make sure to update the inputCache (which will be used for the comparison next time)
---Source : lua/ge/extensions/flowgraph/nodes/string/stringconcat.lua:36
function flowgraph_nodes_string_stringconcat_C:updateCache() end

---Source : lua/ge/extensions/flowgraph/nodes/string/stringconcat.lua:65
function flowgraph_nodes_string_stringconcat_C:work() end

