---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/photomodeFlash.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `util_photomodeFlash` : `extensions.load("util_photomodeFlash")`, puis la globale `util_photomodeFlash`
---@class util_photomodeFlash
---@field capturePulseActive boolean
---@field enabled boolean
---@field hue any
---@field intensity any
---@field mode string
---@field outerAngle any
---@field saturation any
util_photomodeFlash = {}

---Source : lua/ge/extensions/util/photomodeFlash.lua:330
---@param enabled any
---@param fireOnCapture any
---@param intensity any
---@param outerAngle any
---@param hue any
---@param saturation any
function util_photomodeFlash.applyFromUi(enabled, fireOnCapture, intensity, outerAngle, hue, saturation) end

---Source : lua/ge/extensions/util/photomodeFlash.lua:268
---@param en any
function util_photomodeFlash.enable(en) end

---Source : lua/ge/extensions/util/photomodeFlash.lua:402
function util_photomodeFlash.onExtensionUnloaded() end

---Source : lua/ge/extensions/util/photomodeFlash.lua:346
---@param dtReal any
---@param dtSim any
---@param dtRaw any
function util_photomodeFlash.onPreRender(dtReal, dtSim, dtRaw) end

---Source : lua/ge/extensions/util/photomodeFlash.lua:394
function util_photomodeFlash.onScreenshotAllDone() end

---Source : lua/ge/extensions/util/photomodeFlash.lua:291
---@param kind any
---@param ... any
function util_photomodeFlash.runCapture(kind, ...) end

