---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/screenshotCreator/job.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `util_screenshotCreator_job` : `extensions.load("util_screenshotCreator_job")`, puis la globale `util_screenshotCreator_job`
---@class util_screenshotCreator_job
---@field dependencies table
util_screenshotCreator_job = {}

---Source : lua/ge/extensions/util/screenshotCreator/job.lua:810
function util_screenshotCreator_job.clearRunDone() end

---Source : lua/ge/extensions/util/screenshotCreator/job.lua:804
function util_screenshotCreator_job.consumeRunDone() end

---Source : lua/ge/extensions/util/screenshotCreator/job.lua:846
function util_screenshotCreator_job.getProgress() end

---Source : lua/ge/extensions/util/screenshotCreator/job.lua:847
function util_screenshotCreator_job.getReviewData() end

---Source : lua/ge/extensions/util/screenshotCreator/job.lua:851
function util_screenshotCreator_job.isCameraSet() end

---Source : lua/ge/extensions/util/screenshotCreator/job.lua:845
function util_screenshotCreator_job.isRunning() end

---Source : lua/ge/extensions/util/screenshotCreator/job.lua:833
function util_screenshotCreator_job.onClientEndMission() end

---Source : lua/ge/extensions/util/screenshotCreator/job.lua:824
---@param data any
function util_screenshotCreator_job.onDeserialized(data) end

---Source : lua/ge/extensions/util/screenshotCreator/job.lua:833
function util_screenshotCreator_job.onExit() end

---Source : lua/ge/extensions/util/screenshotCreator/job.lua:833
function util_screenshotCreator_job.onExtensionUnloaded() end

---Source : lua/ge/extensions/util/screenshotCreator/job.lua:785
function util_screenshotCreator_job.onPreRender() end

---Source : lua/ge/extensions/util/screenshotCreator/job.lua:814
function util_screenshotCreator_job.onSerialize() end

---Source : lua/ge/extensions/util/screenshotCreator/job.lua:117
function util_screenshotCreator_job.resetCamera() end

---Source : lua/ge/extensions/util/screenshotCreator/job.lua:765
---@param vehicle any
---@param configName any
---@param modeOrOptions any
---@param fixedRotation any
function util_screenshotCreator_job.startPreview(vehicle, configName, modeOrOptions, fixedRotation) end

---Source : lua/ge/extensions/util/screenshotCreator/job.lua:769
---@param vehicle any
---@param configName any
---@param modeOrOptions any
---@param fixedRotation any
function util_screenshotCreator_job.startPreviewWithDelay(vehicle, configName, modeOrOptions, fixedRotation) end

---Source : lua/ge/extensions/util/screenshotCreator/job.lua:654
---@param workOptions any
function util_screenshotCreator_job.startWork(workOptions) end

---Source : lua/ge/extensions/util/screenshotCreator/job.lua:779
function util_screenshotCreator_job.stop() end

