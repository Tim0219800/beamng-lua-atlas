---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/photomode/capture.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `ui_photomode_capture` : `extensions.load("ui_photomode_capture")`, puis la globale `ui_photomode_capture`
---@class ui_photomode_capture
---@field DEFAULTS table
---@field dependencies table
ui_photomode_capture = {}

---Source : lua/ge/extensions/ui/photomode/capture.lua:816
---@param currentCaptureSettings any
---@param partialState any
function ui_photomode_capture.applyCaptureStatePatch(currentCaptureSettings, partialState) end

---Source : lua/ge/extensions/ui/photomode/capture.lua:393
---@param preset any
function ui_photomode_capture.applyResolutionPreset(preset) end

---Source : lua/ge/extensions/ui/photomode/capture.lua:412
---@param selectedResolutionPresetId any
function ui_photomode_capture.applySelectedResolutionPresetBeforeCapture(selectedResolutionPresetId) end

---Source : lua/ge/extensions/ui/photomode/capture.lua:524
---@param downscaleLevel any
function ui_photomode_capture.buildCaptureRescaleFactor(downscaleLevel) end

---Source : lua/ge/extensions/ui/photomode/capture.lua:716
---@param captureSettings any
function ui_photomode_capture.buildCaptureState(captureSettings) end

---Source : lua/ge/extensions/ui/photomode/capture.lua:254
function ui_photomode_capture.buildDefaultSettings() end

---Source : lua/ge/extensions/ui/photomode/capture.lua:1043
function ui_photomode_capture.buildMetadataState() end

---Source : lua/ge/extensions/ui/photomode/capture.lua:529
---@param captureSettings any
function ui_photomode_capture.buildNormalizedCaptureSettings(captureSettings) end

---Source : lua/ge/extensions/ui/photomode/capture.lua:1039
function ui_photomode_capture.buildResolutionPresetState() end

---Source : lua/ge/extensions/ui/photomode/capture.lua:1035
function ui_photomode_capture.buildState() end

---Source : lua/ge/extensions/ui/photomode/capture.lua:278
---@param presetId any
function ui_photomode_capture.findResolutionPreset(presetId) end

---Source : lua/ge/extensions/ui/photomode/capture.lua:959
---@param immediateAttachRelease any
function ui_photomode_capture.finishPendingMotionCapture(immediateAttachRelease) end

---Source : lua/ge/extensions/ui/photomode/capture.lua:1065
function ui_photomode_capture.getCaptureState() end

---Source : lua/ge/extensions/ui/photomode/capture.lua:1074
function ui_photomode_capture.getResolutionPresetState() end

---Source : lua/ge/extensions/ui/photomode/capture.lua:1596
---@param dtReal any
---@param dtSim any
---@param dtRaw any
function ui_photomode_capture.handlePreRender(dtReal, dtSim, dtRaw) end

---Source : lua/ge/extensions/ui/photomode/capture.lua:1029
function ui_photomode_capture.isCaptureInProgress() end

---Source : lua/ge/extensions/ui/photomode/capture.lua:266
function ui_photomode_capture.isResolutionPresetFeatureEnabled() end

---Source : lua/ge/extensions/ui/photomode/capture.lua:1018
---@param frames any
function ui_photomode_capture.markCaptureInProgress(frames) end

---Source : lua/ge/extensions/ui/photomode/capture.lua:451
---@param value any
---@param safeMax any
function ui_photomode_capture.normalizeCaptureSuperSampling(value, safeMax) end

---Source : lua/ge/extensions/ui/photomode/capture.lua:1680
function ui_photomode_capture.onScreenshotAllDone() end

---Source : lua/ge/extensions/ui/photomode/capture.lua:1007
function ui_photomode_capture.refreshSessionDefaults() end

---Source : lua/ge/extensions/ui/photomode/capture.lua:1532
---@param options any
function ui_photomode_capture.requestScreenshot(options) end

---Source : lua/ge/extensions/ui/photomode/capture.lua:995
function ui_photomode_capture.resetSettings() end

---Source : lua/ge/extensions/ui/photomode/capture.lua:1001
function ui_photomode_capture.restoreCaptureRuntimeState() end

---Source : lua/ge/extensions/ui/photomode/capture.lua:1081
---@param partialState any
function ui_photomode_capture.setCaptureState(partialState) end

---Source : lua/ge/extensions/ui/photomode/capture.lua:1560
---@param presetId any
function ui_photomode_capture.setResolutionPreset(presetId) end

