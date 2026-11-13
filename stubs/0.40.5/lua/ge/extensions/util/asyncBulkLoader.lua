---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/asyncBulkLoader.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `util_asyncBulkLoader` : `extensions.load("util_asyncBulkLoader")`, puis la globale `util_asyncBulkLoader`
---@class util_asyncBulkLoader
---@field yield any
util_asyncBulkLoader = {}

---Source : lua/ge/extensions/util/asyncBulkLoader.lua:30
---@param count any
function util_asyncBulkLoader.addCount(count) end

---Source : lua/ge/extensions/util/asyncBulkLoader.lua:23
---@param total any
function util_asyncBulkLoader.addTotal(total) end

---Source : lua/ge/extensions/util/asyncBulkLoader.lua:102
function util_asyncBulkLoader.isGameplaySelectorLoaded() end

---Source : lua/ge/extensions/util/asyncBulkLoader.lua:106
function util_asyncBulkLoader.isLevelsLoaded() end

---Source : lua/ge/extensions/util/asyncBulkLoader.lua:135
function util_asyncBulkLoader.isLoading() end

---Source : lua/ge/extensions/util/asyncBulkLoader.lua:98
function util_asyncBulkLoader.isMissionsLoaded() end

---Source : lua/ge/extensions/util/asyncBulkLoader.lua:94
function util_asyncBulkLoader.isVehiclesLoaded() end

---Source : lua/ge/extensions/util/asyncBulkLoader.lua:228
function util_asyncBulkLoader.loadGameplaySelector() end

---Source : lua/ge/extensions/util/asyncBulkLoader.lua:122
function util_asyncBulkLoader.loadGameplaySelectorDirect() end

---Source : lua/ge/extensions/util/asyncBulkLoader.lua:268
function util_asyncBulkLoader.loadLevels() end

---Source : lua/ge/extensions/util/asyncBulkLoader.lua:128
function util_asyncBulkLoader.loadLevelsDirect() end

---Source : lua/ge/extensions/util/asyncBulkLoader.lua:193
function util_asyncBulkLoader.loadMissions() end

---Source : lua/ge/extensions/util/asyncBulkLoader.lua:116
function util_asyncBulkLoader.loadMissionsDirect() end

---Source : lua/ge/extensions/util/asyncBulkLoader.lua:155
function util_asyncBulkLoader.loadVehicles() end

---Source : lua/ge/extensions/util/asyncBulkLoader.lua:110
function util_asyncBulkLoader.loadVehiclesDirect() end

--- File-scan progress for vehicle decode: 0-100 = determinate, -1 = indeterminate.
---Source : lua/ge/extensions/util/asyncBulkLoader.lua:18
---@param percent any
function util_asyncBulkLoader.reportScanPercent(percent) end

---Source : lua/ge/extensions/util/asyncBulkLoader.lua:13
function util_asyncBulkLoader.reportStream() end

---Source : lua/ge/extensions/util/asyncBulkLoader.lua:304
function util_asyncBulkLoader.sendAllCareerSaveSlotsDataAsync() end

---Source : lua/ge/extensions/util/asyncBulkLoader.lua:139
---@param job any
function util_asyncBulkLoader.setupYield(job) end

