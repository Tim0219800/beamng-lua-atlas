---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/crawlEditor/presets.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Presets object of the Crawl editor. Main fields: presets (categories + metadata), PRESETS_FILE, PRESET_CATEGORIES, showSave*Dialog, showPresetManager(Ptr), *PresetName (256-character ImGui buffers).
---@class editor_crawlEditor_presets
local editor_crawlEditor_presets = {}

--- Deletes a boundary component via saveSystem.
---Source: lua/ge/extensions/editor/crawlEditor/presets.lua:632
---@param id any component identifier
function editor_crawlEditor_presets:deleteBoundaryComponent(id) end

--- Deletes the boundary preset and saves the file. Returns false, nil if the preset does not exist.
---Source: lua/ge/extensions/editor/crawlEditor/presets.lua:469
---@param name string preset name
---@return boolean  success
---@return string|nil  file path
function editor_crawlEditor_presets:deleteBoundaryPreset(name) end

--- Deletes a path component via saveSystem.
---Source: lua/ge/extensions/editor/crawlEditor/presets.lua:636
---@param id any component identifier
function editor_crawlEditor_presets:deletePathnodeComponent(id) end

--- Deletes the path preset and saves the file.
---Source: lua/ge/extensions/editor/crawlEditor/presets.lua:484
---@param name string preset name
---@return boolean  success
---@return string|nil  file path
function editor_crawlEditor_presets:deletePathnodePreset(name) end

--- Deletes a trail component via saveSystem.
---Source: lua/ge/extensions/editor/crawlEditor/presets.lua:628
---@param id any component identifier
function editor_crawlEditor_presets:deleteTrailComponent(id) end

--- Deletes the trail preset and saves the file.
---Source: lua/ge/extensions/editor/crawlEditor/presets.lua:499
---@param name string preset name
---@return boolean  success
---@return string|nil  file path
function editor_crawlEditor_presets:deleteTrailPreset(name) end

--- Draws the ImGui save windows (boundary, path, trail) and the component manager; called every frame by the Crawl editor.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/crawlEditor/presets.lua:791
function editor_crawlEditor_presets:drawDialogs() end

--- Draws the ImGui submenus listing the trail, boundary and path components (click = load into crawlData) and the "Manage Components..." entry. Stores crawlData, trails and waypoints for the dialogs.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/crawlEditor/presets.lua:697
---@param crawlData table current crawl data (trails field)
---@param trails table editor trails module
---@param waypoints table editor waypoints module
function editor_crawlEditor_presets:drawMenu(crawlData, trails, waypoints) end

--- Writes a preset (complete table) to an independent JSON file.
---Source: lua/ge/extensions/editor/crawlEditor/presets.lua:640
---@param category string trails, boundaries or pathnodes
---@param name string preset name
---@param filepath string destination file
---@return boolean  success
---@return string|nil  filepath
function editor_crawlEditor_presets:exportPreset(category, name, filepath) end

--- Lists the boundary components of the current level via saveSystem.
---Source: lua/ge/extensions/editor/crawlEditor/presets.lua:543
---@return table  list of components
function editor_crawlEditor_presets:getAllBoundaryComponents() end

--- Lists the path components of the current level via saveSystem.
---Source: lua/ge/extensions/editor/crawlEditor/presets.lua:548
---@return table  list of components
function editor_crawlEditor_presets:getAllPathnodeComponents() end

--- Lists the trail components of the current level via saveSystem (folder /levels/<level>/crawls/).
---Source: lua/ge/extensions/editor/crawlEditor/presets.lua:538
---@return table  list of components (with id and name)
function editor_crawlEditor_presets:getAllTrailComponents() end

--- Returns the ImGui buffer (256 characters) of the name entered for a boundary.
---Source: lua/ge/extensions/editor/crawlEditor/presets.lua:693
---@return userdata  im.ArrayChar
function editor_crawlEditor_presets:getBoundaryPresetName() end

--- Lists the boundary presets as an array {name, preset} (order not guaranteed, from pairs).
---Source: lua/ge/extensions/editor/crawlEditor/presets.lua:514
---@return table[]  list of {name, preset}
function editor_crawlEditor_presets:getBoundaryPresets() end

--- Returns the ImGui buffer of the name entered for a path.
---Source: lua/ge/extensions/editor/crawlEditor/presets.lua:694
---@return userdata  im.ArrayChar
function editor_crawlEditor_presets:getPathnodePresetName() end

--- Lists the path presets as {name, preset}.
---Source: lua/ge/extensions/editor/crawlEditor/presets.lua:522
---@return table[]  list of {name, preset}
function editor_crawlEditor_presets:getPathnodePresets() end

--- Indicates whether the component management window is displayed.
---Source: lua/ge/extensions/editor/crawlEditor/presets.lua:687
---@return boolean  state
function editor_crawlEditor_presets:getShowPresetManager() end

--- Returns the ImGui BoolPtr linked to the management window.
---Source: lua/ge/extensions/editor/crawlEditor/presets.lua:692
---@return userdata  im.BoolPtr
function editor_crawlEditor_presets:getShowPresetManagerPtr() end

--- Indicates whether the boundary save dialog is displayed.
---Source: lua/ge/extensions/editor/crawlEditor/presets.lua:681
---@return boolean  state
function editor_crawlEditor_presets:getShowSaveBoundaryDialog() end

--- Indicates whether the path save dialog is displayed.
---Source: lua/ge/extensions/editor/crawlEditor/presets.lua:683
---@return boolean  state
function editor_crawlEditor_presets:getShowSavePathnodeDialog() end

--- Indicates whether the trail save dialog is displayed.
---Source: lua/ge/extensions/editor/crawlEditor/presets.lua:685
---@return boolean  state
function editor_crawlEditor_presets:getShowSaveTrailDialog() end

--- Returns the ImGui buffer of the name entered for a trail.
---Source: lua/ge/extensions/editor/crawlEditor/presets.lua:695
---@return userdata  im.ArrayChar
function editor_crawlEditor_presets:getTrailPresetName() end

--- Lists the trail presets as {name, preset}.
---Source: lua/ge/extensions/editor/crawlEditor/presets.lua:530
---@return table[]  list of {name, preset}
function editor_crawlEditor_presets:getTrailPresets() end

--- Reads a preset file, checks name, category and data, adds it to the category (overwrites a preset of the same name) and saves.
---Source: lua/ge/extensions/editor/crawlEditor/presets.lua:657
---@param filepath string file to read
---@param category string expected category
---@return boolean  success
---@return string|nil  presets file
function editor_crawlEditor_presets:importPreset(filepath, category) end

--- Initializes the empty presets table, the dialog states and the ImGui buffers, computes the presets file path for the current level then calls loadPresets().
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/crawlEditor/presets.lua:36
function editor_crawlEditor_presets:init() end

--- Loads a boundary component by id via saveSystem.
---Source: lua/ge/extensions/editor/crawlEditor/presets.lua:558
---@param id any component identifier
---@return table|nil  loaded boundary
function editor_crawlEditor_presets:loadBoundaryComponent(id) end

--- Validates then deserializes the named boundary preset.
---Source: lua/ge/extensions/editor/crawlEditor/presets.lua:400
---@param name string preset name
---@return table|nil  rebuilt boundary
---@return string|nil  presets file
function editor_crawlEditor_presets:loadBoundaryPreset(name) end

--- Loads a path component by id via saveSystem.
---Source: lua/ge/extensions/editor/crawlEditor/presets.lua:563
---@param id any component identifier
---@return table|nil  loaded path
function editor_crawlEditor_presets:loadPathnodeComponent(id) end

--- Validates then deserializes the named path preset.
---Source: lua/ge/extensions/editor/crawlEditor/presets.lua:423
---@param name string preset name
---@return table|nil  rebuilt path
---@return string|nil  presets file
function editor_crawlEditor_presets:loadPathnodePreset(name) end

--- Reads the presets JSON file; if it does not exist, immediately writes an empty file via savePresets().
---Source: lua/ge/extensions/editor/crawlEditor/presets.lua:280
function editor_crawlEditor_presets:loadPresets() end

--- Loads a trail component by id via saveSystem.
---Source: lua/ge/extensions/editor/crawlEditor/presets.lua:553
---@param id any component identifier
---@return table|nil  loaded trail
function editor_crawlEditor_presets:loadTrailComponent(id) end

--- Validates then deserializes the named trail preset.
---Source: lua/ge/extensions/editor/crawlEditor/presets.lua:446
---@param name string preset name
---@return table|nil  rebuilt trail
---@return string|nil  presets file
function editor_crawlEditor_presets:loadTrailPreset(name) end

--- Renames the boundary then records it as a component via saveSystem.
---Source: lua/ge/extensions/editor/crawlEditor/presets.lua:588
---@param name string name, non-empty
---@param boundary table boundary
---@return boolean  success
---@return any  saveSystem result
function editor_crawlEditor_presets:saveBoundaryComponent(name, boundary) end

--- Serializes a boundary (boundary:onSerialize) and records it as a preset of category boundaries, then saves the file. Fails if the name is empty or the boundary has no vertex.
---Source: lua/ge/extensions/editor/crawlEditor/presets.lua:307
---@param name string preset name
---@param boundary table boundary object with onSerialize method
---@return boolean  success
---@return string|nil  file path
function editor_crawlEditor_presets:saveBoundaryPreset(name, boundary) end

--- Renames the path then records it as a component via saveSystem.
---Source: lua/ge/extensions/editor/crawlEditor/presets.lua:608
---@param name string name, non-empty
---@param path table path
---@return boolean  success
---@return any  saveSystem result
function editor_crawlEditor_presets:savePathnodeComponent(name, path) end

--- Records a path (name, description, nodes with position, rotation, default radius 6.0, flags) as a pathnodes preset.
---Source: lua/ge/extensions/editor/crawlEditor/presets.lua:338
---@param name string preset name
---@param path table path with nodes list
---@return boolean  success
---@return string|nil  file path
function editor_crawlEditor_presets:savePathnodePreset(name, path) end

--- Updates the modification date, creates the folder if needed (FS:directoryCreate) and writes the whole presets file.
---Source: lua/ge/extensions/editor/crawlEditor/presets.lua:289
---@return boolean  success
---@return string|nil  path written
function editor_crawlEditor_presets:savePresets() end

--- Renames the trail (trail.name = name) then records it as a component via saveSystem.
---Source: lua/ge/extensions/editor/crawlEditor/presets.lua:568
---@param name string name, non-empty
---@param trail table trail to save
---@return boolean  success
---@return any  saveSystem result
function editor_crawlEditor_presets:saveTrailComponent(name, trail) end

--- Serializes a complete trail (path + boundary) and records it as a trails preset.
---Source: lua/ge/extensions/editor/crawlEditor/presets.lua:369
---@param name string preset name
---@param trail table trail to save
---@return boolean  success
---@return string|nil  file path
function editor_crawlEditor_presets:saveTrailPreset(name, trail) end

--- Shows/hides the management window and synchronizes the ImGui pointer.
---Source: lua/ge/extensions/editor/crawlEditor/presets.lua:688
---@param show boolean show
function editor_crawlEditor_presets:setShowPresetManager(show) end

--- Shows/hides the boundary save dialog.
---Source: lua/ge/extensions/editor/crawlEditor/presets.lua:682
---@param show boolean show
function editor_crawlEditor_presets:setShowSaveBoundaryDialog(show) end

--- Shows/hides the path save dialog.
---Source: lua/ge/extensions/editor/crawlEditor/presets.lua:684
---@param show boolean show
function editor_crawlEditor_presets:setShowSavePathnodeDialog(show) end

--- Shows/hides the trail save dialog.
---Source: lua/ge/extensions/editor/crawlEditor/presets.lua:686
---@param show boolean show
function editor_crawlEditor_presets:setShowSaveTrailDialog(show) end

