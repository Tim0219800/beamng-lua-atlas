---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/inputSystemUtils.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Maintenance tools for inputmaps files (controller profiles in /settings/inputmaps/, JSON format). printStats counts the bindings and prints the 20 most used actions; resave re-reads all inputmaps, completes vidpid and vendorName (from vendorNames.json), sorts the bindings by control then action and rewrites them with custom JSON formatting. Intended for game developers and controller profile creators.
--- Access: extension `util_inputSystemUtils`: `extensions.load("util_inputSystemUtils")`, then the global `util_inputSystemUtils`
---@class util_inputSystemUtils
util_inputSystemUtils = {}

--- Walks all JSON files whose path contains inputmaps/, prints the total number of bindings and the 20 most frequent actions.
---Source: lua/ge/extensions/util/inputSystemUtils.lua:20
function util_inputSystemUtils.printStats() end

--- Rewrites all inputmaps with normalized formatting (control key first, bindings last, small tables folded onto one line); writes the file only if the content changes, and prints the result per file.
---Source: lua/ge/extensions/util/inputSystemUtils.lua:77
function util_inputSystemUtils.resave() end

