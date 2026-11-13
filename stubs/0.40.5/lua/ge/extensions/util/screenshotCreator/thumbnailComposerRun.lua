---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/screenshotCreator/thumbnailComposerRun.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `util_screenshotCreator_thumbnailComposerRun` : `extensions.load("util_screenshotCreator_thumbnailComposerRun")`, puis la globale `util_screenshotCreator_thumbnailComposerRun`
---@class util_screenshotCreator_thumbnailComposerRun
---@field dependencies table
---@field onClientEndMission any
---@field onExit any
util_screenshotCreator_thumbnailComposerRun = {}

---Source : lua/ge/extensions/util/screenshotCreator/thumbnailComposerRun.lua:385
---@param ownerId any
function util_screenshotCreator_thumbnailComposerRun.cancel(ownerId) end

---Source : lua/ge/extensions/util/screenshotCreator/thumbnailComposerRun.lua:542
function util_screenshotCreator_thumbnailComposerRun.drawShowroomTools() end

---Source : lua/ge/extensions/util/screenshotCreator/thumbnailComposerRun.lua:392
---@param ownerId any
function util_screenshotCreator_thumbnailComposerRun.isActive(ownerId) end

---Source : lua/ge/extensions/util/screenshotCreator/thumbnailComposerRun.lua:415
function util_screenshotCreator_thumbnailComposerRun.onExtensionUnloaded() end

---Source : lua/ge/extensions/util/screenshotCreator/thumbnailComposerRun.lua:397
function util_screenshotCreator_thumbnailComposerRun.onPreRender() end

---Source : lua/ge/extensions/util/screenshotCreator/thumbnailComposerRun.lua:311
---@param ownerId any
---@param handlers any
function util_screenshotCreator_thumbnailComposerRun.sendStatus(ownerId, handlers) end

---Source : lua/ge/extensions/util/screenshotCreator/thumbnailComposerRun.lua:85
---@param message any
function util_screenshotCreator_thumbnailComposerRun.setViewOptions(message) end

--- message: targets (nil captures the player vehicle), captureMode ("defaults" writes default.jpg, otherwise
---  one file per config), missingOnly, outputWidth/outputHeight and the blur/exposure view options
---Source : lua/ge/extensions/util/screenshotCreator/thumbnailComposerRun.lua:335
---@param ownerId any
---@param message any
---@param handlers any
function util_screenshotCreator_thumbnailComposerRun.start(ownerId, message, handlers) end

---Source : lua/ge/extensions/util/screenshotCreator/thumbnailComposerRun.lua:159
---@param message any
function util_screenshotCreator_thumbnailComposerRun.startPreview(message) end

---Source : lua/ge/extensions/util/screenshotCreator/thumbnailComposerRun.lua:152
function util_screenshotCreator_thumbnailComposerRun.stopPreview() end

---Source : lua/ge/extensions/util/screenshotCreator/thumbnailComposerRun.lua:324
---@param ownerId any
---@param handlers any
function util_screenshotCreator_thumbnailComposerRun.subscribe(ownerId, handlers) end

