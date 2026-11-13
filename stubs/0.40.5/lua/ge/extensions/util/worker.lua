---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/worker.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `util_worker` : `extensions.load("util_worker")`, puis la globale `util_worker`
---@class util_worker
util_worker = {}

--- interface
---Source : lua/ge/extensions/util/worker.lua:115
function util_worker.onExtensionLoaded() end

---Source : lua/ge/extensions/util/worker.lua:97
---@param job any
---@param totalRunning any
function util_worker.onJobDone(job, totalRunning) end

---Source : lua/ge/extensions/util/worker.lua:126
---@param dt any
function util_worker.onPreRender(dt) end

--- Classe locale `N` de lua/ge/extensions/util/worker.lua
---@class util_worker_N
local util_worker_N = {}

---Source : lua/ge/extensions/util/worker.lua:91
---@param w any
function util_worker_N.calibrateESC(w) end

---Source : lua/ge/extensions/util/worker.lua:70
---@param w any
function util_worker_N.compileImposters(w) end

---Source : lua/ge/extensions/util/worker.lua:50
---@param w any
function util_worker_N.compileMesh(w) end

---Source : lua/ge/extensions/util/worker.lua:80
---@param w any
function util_worker_N.renderVehiclePreview(w) end

---Source : lua/ge/extensions/util/worker.lua:60
---@param w any
function util_worker_N.testImage(w) end

---Source : lua/ge/extensions/util/worker.lua:76
---@param w any
function util_worker_N.testMod(w) end

---Source : lua/ge/extensions/util/worker.lua:85
---@param w any
function util_worker_N.testVehiclesPerformances(w) end

