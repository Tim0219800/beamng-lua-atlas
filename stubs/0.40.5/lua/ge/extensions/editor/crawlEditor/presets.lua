---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/crawlEditor/presets.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe locale `C` de lua/ge/extensions/editor/crawlEditor/presets.lua (instanciée par la fonction renvoyée par le module)
---@class editor_crawlEditor_presets
local editor_crawlEditor_presets = {}

---Source : lua/ge/extensions/editor/crawlEditor/presets.lua:632
---@param id any
function editor_crawlEditor_presets:deleteBoundaryComponent(id) end

---Source : lua/ge/extensions/editor/crawlEditor/presets.lua:469
---@param name any
function editor_crawlEditor_presets:deleteBoundaryPreset(name) end

---Source : lua/ge/extensions/editor/crawlEditor/presets.lua:636
---@param id any
function editor_crawlEditor_presets:deletePathnodeComponent(id) end

---Source : lua/ge/extensions/editor/crawlEditor/presets.lua:484
---@param name any
function editor_crawlEditor_presets:deletePathnodePreset(name) end

---Source : lua/ge/extensions/editor/crawlEditor/presets.lua:628
---@param id any
function editor_crawlEditor_presets:deleteTrailComponent(id) end

---Source : lua/ge/extensions/editor/crawlEditor/presets.lua:499
---@param name any
function editor_crawlEditor_presets:deleteTrailPreset(name) end

---Source : lua/ge/extensions/editor/crawlEditor/presets.lua:791
function editor_crawlEditor_presets:drawDialogs() end

---Source : lua/ge/extensions/editor/crawlEditor/presets.lua:697
---@param crawlData any
---@param trails any
---@param waypoints any
function editor_crawlEditor_presets:drawMenu(crawlData, trails, waypoints) end

---Source : lua/ge/extensions/editor/crawlEditor/presets.lua:640
---@param category any
---@param name any
---@param filepath any
function editor_crawlEditor_presets:exportPreset(category, name, filepath) end

---Source : lua/ge/extensions/editor/crawlEditor/presets.lua:543
function editor_crawlEditor_presets:getAllBoundaryComponents() end

---Source : lua/ge/extensions/editor/crawlEditor/presets.lua:548
function editor_crawlEditor_presets:getAllPathnodeComponents() end

---Source : lua/ge/extensions/editor/crawlEditor/presets.lua:538
function editor_crawlEditor_presets:getAllTrailComponents() end

---Source : lua/ge/extensions/editor/crawlEditor/presets.lua:693
function editor_crawlEditor_presets:getBoundaryPresetName() end

---Source : lua/ge/extensions/editor/crawlEditor/presets.lua:514
function editor_crawlEditor_presets:getBoundaryPresets() end

---Source : lua/ge/extensions/editor/crawlEditor/presets.lua:694
function editor_crawlEditor_presets:getPathnodePresetName() end

---Source : lua/ge/extensions/editor/crawlEditor/presets.lua:522
function editor_crawlEditor_presets:getPathnodePresets() end

---Source : lua/ge/extensions/editor/crawlEditor/presets.lua:687
function editor_crawlEditor_presets:getShowPresetManager() end

---Source : lua/ge/extensions/editor/crawlEditor/presets.lua:692
function editor_crawlEditor_presets:getShowPresetManagerPtr() end

---Source : lua/ge/extensions/editor/crawlEditor/presets.lua:681
function editor_crawlEditor_presets:getShowSaveBoundaryDialog() end

---Source : lua/ge/extensions/editor/crawlEditor/presets.lua:683
function editor_crawlEditor_presets:getShowSavePathnodeDialog() end

---Source : lua/ge/extensions/editor/crawlEditor/presets.lua:685
function editor_crawlEditor_presets:getShowSaveTrailDialog() end

---Source : lua/ge/extensions/editor/crawlEditor/presets.lua:695
function editor_crawlEditor_presets:getTrailPresetName() end

---Source : lua/ge/extensions/editor/crawlEditor/presets.lua:530
function editor_crawlEditor_presets:getTrailPresets() end

---Source : lua/ge/extensions/editor/crawlEditor/presets.lua:657
---@param filepath any
---@param category any
function editor_crawlEditor_presets:importPreset(filepath, category) end

---Source : lua/ge/extensions/editor/crawlEditor/presets.lua:36
function editor_crawlEditor_presets:init() end

---Source : lua/ge/extensions/editor/crawlEditor/presets.lua:558
---@param id any
function editor_crawlEditor_presets:loadBoundaryComponent(id) end

---Source : lua/ge/extensions/editor/crawlEditor/presets.lua:400
---@param name any
function editor_crawlEditor_presets:loadBoundaryPreset(name) end

---Source : lua/ge/extensions/editor/crawlEditor/presets.lua:563
---@param id any
function editor_crawlEditor_presets:loadPathnodeComponent(id) end

---Source : lua/ge/extensions/editor/crawlEditor/presets.lua:423
---@param name any
function editor_crawlEditor_presets:loadPathnodePreset(name) end

---Source : lua/ge/extensions/editor/crawlEditor/presets.lua:280
function editor_crawlEditor_presets:loadPresets() end

---Source : lua/ge/extensions/editor/crawlEditor/presets.lua:553
---@param id any
function editor_crawlEditor_presets:loadTrailComponent(id) end

---Source : lua/ge/extensions/editor/crawlEditor/presets.lua:446
---@param name any
function editor_crawlEditor_presets:loadTrailPreset(name) end

---Source : lua/ge/extensions/editor/crawlEditor/presets.lua:588
---@param name any
---@param boundary any
function editor_crawlEditor_presets:saveBoundaryComponent(name, boundary) end

---Source : lua/ge/extensions/editor/crawlEditor/presets.lua:307
---@param name any
---@param boundary any
function editor_crawlEditor_presets:saveBoundaryPreset(name, boundary) end

---Source : lua/ge/extensions/editor/crawlEditor/presets.lua:608
---@param name any
---@param path any
function editor_crawlEditor_presets:savePathnodeComponent(name, path) end

---Source : lua/ge/extensions/editor/crawlEditor/presets.lua:338
---@param name any
---@param path any
function editor_crawlEditor_presets:savePathnodePreset(name, path) end

---Source : lua/ge/extensions/editor/crawlEditor/presets.lua:289
function editor_crawlEditor_presets:savePresets() end

---Source : lua/ge/extensions/editor/crawlEditor/presets.lua:568
---@param name any
---@param trail any
function editor_crawlEditor_presets:saveTrailComponent(name, trail) end

---Source : lua/ge/extensions/editor/crawlEditor/presets.lua:369
---@param name any
---@param trail any
function editor_crawlEditor_presets:saveTrailPreset(name, trail) end

---Source : lua/ge/extensions/editor/crawlEditor/presets.lua:688
---@param show any
function editor_crawlEditor_presets:setShowPresetManager(show) end

---Source : lua/ge/extensions/editor/crawlEditor/presets.lua:682
---@param show any
function editor_crawlEditor_presets:setShowSaveBoundaryDialog(show) end

---Source : lua/ge/extensions/editor/crawlEditor/presets.lua:684
---@param show any
function editor_crawlEditor_presets:setShowSavePathnodeDialog(show) end

---Source : lua/ge/extensions/editor/crawlEditor/presets.lua:686
---@param show any
function editor_crawlEditor_presets:setShowSaveTrailDialog(show) end

