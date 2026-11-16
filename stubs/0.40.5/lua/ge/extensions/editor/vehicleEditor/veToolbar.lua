---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/vehicleEditor/veToolbar.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Toolbar of the Vehicle Editor. It shows two tabs, "Static Editor" and "Live Editor" (a click changes vEditor.editorMode), each with Apps and View menus (window layouts, adding a view). The Live tab adds a Vehicles menu (spawn a Car or Truck vehicle at the camera position, remove one or all) and Camera Speed and Time of day sliders. It also handles the Save Layout, Delete Layout and Reset Layouts windows.
--- Access: extension `editor_vehicleEditor_veToolbar`: `extensions.load("editor_vehicleEditor_veToolbar")`, then the global `editor_vehicleEditor_veToolbar`
---@class editor_vehicleEditor_veToolbar
---@field dependencies table<integer, string> {'core_environment'}: extension loaded before this one.
editor_vehicleEditor_veToolbar = {}

--- Editor hook called when the main toolbar must be drawn. Draws the "veToolbar" window with the Static/Live tabs, the menus and the layout windows, then optionally the bar of the current edit mode. No effect if the vehicle editor is not active.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/vehicleEditor/veToolbar.lua:262
function editor_vehicleEditor_veToolbar.onEditorGuiToolBar() end

--- Editor hook called at initialization: builds the sorted list of Car or Truck vehicles (core_vehicles.getVehicleList()), registers the veToolbar window (800x40, 'vehicleEditor' tool) and shows it.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/vehicleEditor/veToolbar.lua:353
function editor_vehicleEditor_veToolbar.onEditorInitialized() end

