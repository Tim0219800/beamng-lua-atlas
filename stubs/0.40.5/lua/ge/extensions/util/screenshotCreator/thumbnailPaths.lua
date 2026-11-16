---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/screenshotCreator/thumbnailPaths.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Computation of the vehicle thumbnail output paths for the thumbnail composer. All files go in vehicles/<modelKey>/ in .jpg format; a config's thumbnail is named <config>.jpg, and default.jpg for the default config in "defaults" mode. Names are sanitized (characters other than letters, digits, _, . and - replaced by _).
--- Access: extension `util_screenshotCreator_thumbnailPaths`: `extensions.load("util_screenshotCreator_thumbnailPaths")`, then the global `util_screenshotCreator_thumbnailPaths`
---@class util_screenshotCreator_thumbnailPaths
util_screenshotCreator_thumbnailPaths = {}

--- Computes the final path of a thumbnail and its folder.
---Source: lua/ge/extensions/util/screenshotCreator/thumbnailPaths.lua:12
---@param item table Item {modelKey, configName, isDefaultConfig}.
---@param captureMode string "defaults" or "all".
---@return string  File path, e.g. vehicles/pickup/d15_4wd.jpg.
---@return string  Output folder, e.g. vehicles/pickup/.
function util_screenshotCreator_thumbnailPaths.getFinalOutputPath(item, captureMode) end

--- Indicates whether a thumbnail (.jpg or .png) already exists for the item.
---Source: lua/ge/extensions/util/screenshotCreator/thumbnailPaths.lua:19
---@param item table Item {modelKey, configName}.
---@return boolean  true if the file exists.
function util_screenshotCreator_thumbnailPaths.hasThumbnail(item) end

--- Creates the output folder and returns the paths to use for the capture.
---Source: lua/ge/extensions/util/screenshotCreator/thumbnailPaths.lua:24
---@param item table Item {modelKey, configName, isDefaultConfig}.
---@param captureMode string "defaults" or "all".
---@return table  {outputFolder, final, defaultFinal = default.jpg path to copy ("all" mode, default config)}.
function util_screenshotCreator_thumbnailPaths.makeOutputPaths(item, captureMode) end

--- Sanitizes a piece of file name: replaces any character outside [A-Za-z0-9_.-] with _; returns "unknown" if the result is empty.
---Source: lua/ge/extensions/util/screenshotCreator/thumbnailPaths.lua:7
---@param value any Value converted to a string.
---@return string  Safe name.
function util_screenshotCreator_thumbnailPaths.safePathPart(value) end

