---@meta
-- tim19Atlas stub generated from lua/common/utils/calltracer.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Profiling/diagnostic tool: using a debug.sethook hook on function calls, records who calls whom during a period, then exports the call graph in TGF format (openable in yEd). Loaded with require('utils/calltracer'). Debugging only.
--- Access: `require("utils/calltracer")`
---@class utils_calltracer
local utils_calltracer = {}

--- Clears all recorded nodes and edges.
---Source: lua/common/utils/calltracer.lua:86
function utils_calltracer.reset() end

--- Writes the recorded call graph in TGF format (list of numbered nodes, '#' line, then the edges) to a file.
---Source: lua/common/utils/calltracer.lua:61
---@param filename string Output file, e.g. 'callgraph.tgf'
function utils_calltracer.save(filename) end

--- Installs the call hook (debug.sethook(trace, 'c')): calls are recorded from that moment.
---Source: lua/common/utils/calltracer.lua:52
function utils_calltracer.start() end

--- Removes the hook (debug.sethook()). Nodes already recorded are kept.
---Source: lua/common/utils/calltracer.lua:56
function utils_calltracer.stop() end

return utils_calltracer
