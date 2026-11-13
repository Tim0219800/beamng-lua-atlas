---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/screenshotCreator/thumbnailPaths.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `util_screenshotCreator_thumbnailPaths` : `extensions.load("util_screenshotCreator_thumbnailPaths")`, puis la globale `util_screenshotCreator_thumbnailPaths`
---@class util_screenshotCreator_thumbnailPaths
util_screenshotCreator_thumbnailPaths = {}

---Source : lua/ge/extensions/util/screenshotCreator/thumbnailPaths.lua:12
---@param item any
---@param captureMode any
function util_screenshotCreator_thumbnailPaths.getFinalOutputPath(item, captureMode) end

--- the game picks up either a .png or a .jpg thumbnail, from the game or the user folder
---Source : lua/ge/extensions/util/screenshotCreator/thumbnailPaths.lua:19
---@param item any
function util_screenshotCreator_thumbnailPaths.hasThumbnail(item) end

---Source : lua/ge/extensions/util/screenshotCreator/thumbnailPaths.lua:24
---@param item any
---@param captureMode any
function util_screenshotCreator_thumbnailPaths.makeOutputPaths(item, captureMode) end

---Source : lua/ge/extensions/util/screenshotCreator/thumbnailPaths.lua:7
---@param value any
function util_screenshotCreator_thumbnailPaths.safePathPart(value) end

