---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/jbeamStats.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Computes statistics over all .jbeam files accessible to the game (including mounted mods): number of files, parts, lines, root parts (slotType "main"), number of occurrences of each section and of data rows per section. Used by developers for documentation (see docCreator) and by curious modders interested in the scale of JBeam data.
--- Access: extension `util_jbeamStats`: `extensions.load("util_jbeamStats")`, then the global `util_jbeamStats`
---@class util_jbeamStats
util_jbeamStats = {}

--- Walks all .jbeam files and returns a statistics table.
---Source: lua/ge/extensions/util/jbeamStats.lua:13
---@return table  Fields: totalJbeamFiles, partCount, sectionCount (name -> count), sectionCountOrdered (list of {section, count} pairs sorted in descending order), sectionRowCount (name -> rows excluding header), totalLineCount, totalRootParts, totalModifiersCount
function util_jbeamStats.getStats() end

