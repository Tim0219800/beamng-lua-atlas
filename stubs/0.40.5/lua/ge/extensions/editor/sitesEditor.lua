---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/sitesEditor.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Editor for 'sites' files (*.sites.json): locations, zones and parking spots (parkingSpots), with their tags. It opens the 'Sites: Locations and Zones Editor' window with a File menu (New, Load, Save, Save as, Sites in Manager) and a Tools menu (sort by name, spot numbering, naming by zone), and one tab per sub-editor (editor/sitesEditor/*). It creates the 'Edit Sites' edit mode. A map modder uses it to place locations and parking spots.
--- Access: extension `editor_sitesEditor`: `extensions.load("editor_sitesEditor")`, then the global `editor_sitesEditor`
---@class editor_sitesEditor
---@field onExtensionLoaded nil Exported field but always nil (local variable not defined in the file).
editor_sitesEditor = {}

--- Tells whether the active edit mode is 'Edit Sites' (hence whether gizmos and clicks are allowed).
---Source: lua/ge/extensions/editor/sitesEditor.lua:387
---@return boolean  true if Edit Sites mode is active.
function editor_sitesEditor.allowGizmo() end

--- Returns the location selected in the Locations tab.
---Source: lua/ge/extensions/editor/sitesEditor.lua:389
---@return table|nil  Selected location or nil.
function editor_sitesEditor.getCurrentLocation() end

--- Returns the parking spot selected in the Parking Spots tab.
---Source: lua/ge/extensions/editor/sitesEditor.lua:391
---@return table|nil  Selected spot or nil.
function editor_sitesEditor.getCurrentParkingSpot() end

--- Returns the sites object being edited.
---Source: lua/ge/extensions/editor/sitesEditor.lua:388
---@return table  Current sites.
function editor_sitesEditor.getCurrentSites() end

--- Returns the zone selected in the Zones tab.
---Source: lua/ge/extensions/editor/sitesEditor.lua:390
---@return table|nil  Selected zone or nil.
function editor_sitesEditor.getCurrentZone() end

--- Loads a sites file via gameplay_sites_sitesManager.loadSites, makes it current, passes it to all sub-editors and resets their selection.
---Source: lua/ge/extensions/editor/sitesEditor.lua:30
---@param loadPath string Path of the .sites.json file.
---@return table  The current sites (the old object if loading failed).
function editor_sitesEditor.loadSites(loadPath) end

--- Draws the 'Sites in Manager...' submenu: list of the sites per level and those of /gameplay, with Refresh, and loads the chosen one.
---Source: lua/ge/extensions/editor/sitesEditor.lua:216
function editor_sitesEditor.managerSites() end

--- Restore hook after a Lua reload: reinjects data.path into the current sites.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/sitesEditor.lua:364
---@param data table Data returned by onSerialize.
function editor_sitesEditor.onDeserialized(data) end

--- Hook called every frame of the editor UI: draws the window, the menus, the tabs, updates the mouse info (camera ray) and draws the sites in debug.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/sitesEditor.lua:79
function editor_sitesEditor.onEditorGui() end

--- Editor initialization hook: registers the window, the sitesEditMode edit mode, the menu entry (Gameplay group) and creates the six sub-editors.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/sitesEditor.lua:307
function editor_sitesEditor.onEditorInitialized() end

--- Hook: if the tool window gains focus, activates the sitesEditMode edit mode.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/sitesEditor.lua:378
---@param windowName string Window name.
function editor_sitesEditor.onEditorToolWindowGotFocus(windowName) end

--- Hook: if the tool window is hidden, goes back to objectSelect mode.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/sitesEditor.lua:372
---@param windowName string Name of the hidden window.
function editor_sitesEditor.onEditorToolWindowHide(windowName) end

--- Serialization hook (Lua reload): returns {path = serialization of the current sites}.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/sitesEditor.lua:357
---@return table  Data to restore.
function editor_sitesEditor.onSerialize() end

--- Serializes a sites object and writes it as JSON to the given path; updates sites.dir and sites.name and remembers the folder as the last path.
---Source: lua/ge/extensions/editor/sitesEditor.lua:21
---@param sites table Sites object (gameplay/sites/sites).
---@param savePath string Full path of the .sites.json file.
function editor_sitesEditor.saveSites(sites, savePath) end

--- Selects a zone in the Zones tab (used by the click in the world).
---Source: lua/ge/extensions/editor/sitesEditor.lua:392
---@param elem integer Zone id (inferred from code).
---@param mode string|nil 'toggle' to toggle, nil to replace the selection.
function editor_sitesEditor.selectZone(elem, mode) end

--- Clears the object selection, shows the tool window and activates the sitesEditMode edit mode.
---Source: lua/ge/extensions/editor/sitesEditor.lua:284
function editor_sitesEditor.show() end

