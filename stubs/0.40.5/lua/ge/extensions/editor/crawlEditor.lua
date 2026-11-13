---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/crawlEditor.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_crawlEditor` : `extensions.load("editor_crawlEditor")`, puis la globale `editor_crawlEditor`
---@class editor_crawlEditor
editor_crawlEditor = {}

---Source : lua/ge/extensions/editor/crawlEditor.lua:1419
function editor_crawlEditor.getAllBoundaries() end

---Source : lua/ge/extensions/editor/crawlEditor.lua:1420
function editor_crawlEditor.getAllMissionBoundaries() end

---Source : lua/ge/extensions/editor/crawlEditor.lua:1418
function editor_crawlEditor.getAllMissionPaths() end

---Source : lua/ge/extensions/editor/crawlEditor.lua:1416
function editor_crawlEditor.getAllMissionTrails() end

---Source : lua/ge/extensions/editor/crawlEditor.lua:1417
function editor_crawlEditor.getAllPaths() end

---Source : lua/ge/extensions/editor/crawlEditor.lua:1421
function editor_crawlEditor.getAllStartingPositions() end

---Source : lua/ge/extensions/editor/crawlEditor.lua:1415
function editor_crawlEditor.getAllTrails() end

---Source : lua/ge/extensions/editor/crawlEditor.lua:280
function editor_crawlEditor.getSelectedBoundary() end

---Source : lua/ge/extensions/editor/crawlEditor.lua:1424
function editor_crawlEditor.getSelectedBoundaryIndex() end

---Source : lua/ge/extensions/editor/crawlEditor.lua:271
function editor_crawlEditor.getSelectedPath() end

---Source : lua/ge/extensions/editor/crawlEditor.lua:1423
function editor_crawlEditor.getSelectedPathIndex() end

---Source : lua/ge/extensions/editor/crawlEditor.lua:289
function editor_crawlEditor.getSelectedStartingPosition() end

---Source : lua/ge/extensions/editor/crawlEditor.lua:1425
function editor_crawlEditor.getSelectedStartingPositionIndex() end

---Source : lua/ge/extensions/editor/crawlEditor.lua:262
function editor_crawlEditor.getSelectedTrail() end

---Source : lua/ge/extensions/editor/crawlEditor.lua:1422
function editor_crawlEditor.getSelectedTrailIndex() end

---Source : lua/ge/extensions/editor/crawlEditor.lua:167
function editor_crawlEditor.loadAllObjects() end

---Source : lua/ge/extensions/editor/crawlEditor.lua:304
---@param objectType any
---@param index any
function editor_crawlEditor.markAsDirty(objectType, index) end

---Source : lua/ge/extensions/editor/crawlEditor.lua:456
---@param trail any
function editor_crawlEditor.moveTrailToLevel(trail) end

---Source : lua/ge/extensions/editor/crawlEditor.lua:860
---@param data any
function editor_crawlEditor.onDeserialized(data) end

---Source : lua/ge/extensions/editor/crawlEditor.lua:873
function editor_crawlEditor.onEditorGui() end

---Source : lua/ge/extensions/editor/crawlEditor.lua:781
function editor_crawlEditor.onEditorInitialized() end

---Source : lua/ge/extensions/editor/crawlEditor.lua:846
function editor_crawlEditor.onSerialize() end

---Source : lua/ge/extensions/editor/crawlEditor.lua:74
---@param oldFilePath any
---@param newFilePath any
---@param objectType any
function editor_crawlEditor.renameObjectFile(oldFilePath, newFilePath, objectType) end

---Source : lua/ge/extensions/editor/crawlEditor.lua:1428
---@param index any
function editor_crawlEditor.setSelectedBoundaryIndex(index) end

---Source : lua/ge/extensions/editor/crawlEditor.lua:1427
---@param index any
function editor_crawlEditor.setSelectedPathIndex(index) end

---Source : lua/ge/extensions/editor/crawlEditor.lua:1429
---@param index any
function editor_crawlEditor.setSelectedStartingPositionIndex(index) end

---Source : lua/ge/extensions/editor/crawlEditor.lua:1426
---@param index any
function editor_crawlEditor.setSelectedTrailIndex(index) end

