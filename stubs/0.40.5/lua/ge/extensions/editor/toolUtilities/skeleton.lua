---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/skeleton.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_toolUtilities_skeleton` : `extensions.load("editor_toolUtilities_skeleton")`, puis la globale `editor_toolUtilities_skeleton`
---@class editor_toolUtilities_skeleton
editor_toolUtilities_skeleton = {}

--- Estimates the widths from the original .png file.
---Source : lua/ge/extensions/editor/toolUtilities/skeleton.lua:451
---@param paths any
---@param mask any
function editor_toolUtilities_skeleton.estimateWidths(paths, mask) end

--- Extracts all paths from given skeletonised mask.
---Source : lua/ge/extensions/editor/toolUtilities/skeleton.lua:331
---@param mask any
function editor_toolUtilities_skeleton.extractPaths(mask) end

--- Converts a .png file to a skeletonised mask and then vectorises it into a series of polylines.
---  [filepath should direct to a .png file of a supported format.]
---  [Returns an array of paths, where each contains a table of 2D points as vec3() and a corresponding widths table.]
---Source : lua/ge/extensions/editor/toolUtilities/skeleton.lua:652
---@param filepath any
function editor_toolUtilities_skeleton.getPathsFromPng(filepath) end

--- Skeletonises a mask using the Guo-Hall algorithm.
---  [The given mask is processed in place, and returned.]
---Source : lua/ge/extensions/editor/toolUtilities/skeleton.lua:155
---@param mask any
function editor_toolUtilities_skeleton.skeletonise(mask) end

