---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/dynamicDecalsTool.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Main window of the editor's Dynamic Decals tool (painting decals on the vehicle). Loads its 33 submodules via M.dependencies (editor_api_dynamicDecals API, widgets, layerStack, inspector, brushes, gizmo, vehicleColorPalette, loadSave, layerTypes_*, etc.) and acts as a hub: submodules register with it through setup(tool) using registerSection, registerToolbarToolItem, registerToolbarActionItem, registerEditorOnUpdateFn and registerOnEditorGuiFn. Also exposes the public interface called by keyboard/mouse actions (applyDecal, undo/redo, changeDecalSize/Rotation, depth/normal locking, brush mode, path layer).
--- Access: extension `editor_dynamicDecalsTool`: `extensions.load("editor_dynamicDecalsTool")`, then the global `editor_dynamicDecalsTool`
---@class editor_dynamicDecalsTool
---@field dependencies string[] List of extensions loaded before this module.
---@field directoryPath string Data folder: "/art/dynamicDecals/".
---@field doApiUpdate boolean If true (default), the tool calls the API update every frame; can be changed via a debug checkbox.
---@field toolMode integer Current mode (decal by default).
---@field toolModes table<string, integer> none=0, decal=1, brushStroke=2, path=3.
---@field version integer[] Tool version {1,1,0}.
editor_dynamicDecalsTool = {}

--- Public brush interface: places a decal, a path point, a brush stroke or a mask decal depending on the current mode.
---Source: lua/ge/extensions/editor/dynamicDecalsTool.lua:883
---@param value integer 1 on press, other (0) on release
function editor_dynamicDecalsTool.applyDecal(value) end

--- Rotates the current decal.
---Source: lua/ge/extensions/editor/dynamicDecalsTool.lua:910
---@param clockwise boolean Clockwise
---@param mod number|nil Step multiplier (default 1)
function editor_dynamicDecalsTool.changeDecalRotation(clockwise, mod) end

--- Enlarges or shrinks the current decal.
---Source: lua/ge/extensions/editor/dynamicDecalsTool.lua:909
---@param increase boolean true to enlarge
---@param mod number|nil Step multiplier (default 1)
function editor_dynamicDecalsTool.changeDecalSize(increase, mod) end

--- API hook called when a layer is moved: refreshes the destination parent layer if it is selected.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/dynamicDecalsTool.lua:939
---@param from integer Original position
---@param fromParentUid any Original parent
---@param to integer Destination position
---@param toParentUid any Destination parent
function editor_dynamicDecalsTool.dynamicDecals_moveLayer(from, fromParentUid, to, toParentUid) end

--- API hook: when a layer is modified, copies its data into the inspector selection if it is displayed there.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/dynamicDecalsTool.lua:930
---@param layerUid string|integer Identifier of the modified layer (type inferred from code)
function editor_dynamicDecalsTool.dynamicDecals_onLayerUpdated(layerUid) end

--- Enables/disables the brush stroke; on disabling, adds a stroke layer (api.addBrushStrokeLayer).
---Source: lua/ge/extensions/editor/dynamicDecalsTool.lua:955
---@param value integer 1 to enable
function editor_dynamicDecalsTool.enableBrushStroke(value) end

--- Enables/disables the path layer mode.
---Source: lua/ge/extensions/editor/dynamicDecalsTool.lua:963
---@param value integer 1 to enable
function editor_dynamicDecalsTool.enablePathLayer(value) end

--- Finishes the current path layer.
---Source: lua/ge/extensions/editor/dynamicDecalsTool.lua:967
function editor_dynamicDecalsTool.finishPathLayer() end

--- Uid of the layer whose mask is being edited, or nil.
---Source: lua/ge/extensions/editor/dynamicDecalsTool.lua:997
---@return any|nil
function editor_dynamicDecalsTool.getCurrentMaskEditingLayerUid() end

--- Icon size (integer, 20 by default).
---Source: lua/ge/extensions/editor/dynamicDecalsTool.lua:981
---@return number
function editor_dynamicDecalsTool.getIconSize() end

--- Icon size as an ImVec2.
---Source: lua/ge/extensions/editor/dynamicDecalsTool.lua:985
---@return ImVec2
function editor_dynamicDecalsTool.getIconSizeVec2() end

--- Current vertical scroll of the main window.
---Source: lua/ge/extensions/editor/dynamicDecalsTool.lua:989
---@return number
function editor_dynamicDecalsTool.getMainScrollY() end

--- Open state of a section (or of "Advanced").
---Source: lua/ge/extensions/editor/dynamicDecalsTool.lua:827
---@param name string Section name
---@return boolean|nil  nil if the section is unknown
function editor_dynamicDecalsTool.getSectionOpenState(name) end

--- ImGui window name of a section: "Dynamic Decals Tool - <section.windowName>".
---Source: lua/ge/extensions/editor/dynamicDecalsTool.lua:146
---@param section table Section with windowName
---@return string
function editor_dynamicDecalsTool.getSectionWindowName(section) end

--- Locks or releases the decal projection depth.
---Source: lua/ge/extensions/editor/dynamicDecalsTool.lua:947
---@param value integer 1 to lock
function editor_dynamicDecalsTool.lockDepth(value) end

--- Locks or releases the surface normal used for projection.
---Source: lua/ge/extensions/editor/dynamicDecalsTool.lua:951
---@param value integer 1 to lock
function editor_dynamicDecalsTool.lockSurfaceNormal(value) end

--- Deserialization hook: does nothing.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/dynamicDecalsTool.lua:864
---@param data table Data
function editor_dynamicDecalsTool.onDeserialized(data) end

--- Lua reload serialization hook: returns an empty table.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/dynamicDecalsTool.lua:859
---@return table  {}
function editor_dynamicDecalsTool.onSerialize() end

--- Hook called on vehicle switch: updates the materials (settings.updateMaterials).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/dynamicDecalsTool.lua:975
function editor_dynamicDecalsTool.onVehicleSwitched() end

--- Redoes the undone action and refreshes the selected layers.
---Source: lua/ge/extensions/editor/dynamicDecalsTool.lua:921
function editor_dynamicDecalsTool.redo() end

--- Registers an update function called every frame by the tool (key = name).
---Source: lua/ge/extensions/editor/dynamicDecalsTool.lua:780
---@param name string Unique key
---@param onUpdateFn function Called with (dtReal, dtSim, dtRaw)
function editor_dynamicDecalsTool.registerEditorOnUpdateFn(name, onUpdateFn) end

--- Registers an additional draw function executed with the editor UI.
---Source: lua/ge/extensions/editor/dynamicDecalsTool.lua:848
---@param name string Unique key
---@param guiFn function Draw function
function editor_dynamicDecalsTool.registerOnEditorGuiFn(name, guiFn) end

--- Registers a UI section (and optionally a dedicated window). Sections are sorted by order; those >= 1000 go into "Advanced".
---Source: lua/ge/extensions/editor/dynamicDecalsTool.lua:801
---@param name string Section name
---@param guiFn function Draw function, called with a guiId (both in the section and in the window)
---@param order number|nil Position (smaller = higher), default 1000
---@param defaultOpen boolean|nil Open by default
---@param window table|nil {windowSize = ImVec2} to create a dedicated window with an open button
---@param buttons table|nil Header buttons {icon, tooltip, fn}
function editor_dynamicDecalsTool.registerSection(name, guiFn, order, defaultOpen, window, buttons) end

--- Adds an item to the toolbar (actions part), sorted by order.
---Source: lua/ge/extensions/editor/dynamicDecalsTool.lua:843
---@param name string
---@param guiFn function Draw function
---@param order number|nil Default 1000
function editor_dynamicDecalsTool.registerToolbarActionItem(name, guiFn, order) end

--- Adds an item to the toolbar (tools part), sorted by order.
---Source: lua/ge/extensions/editor/dynamicDecalsTool.lua:838
---@param name string
---@param guiFn function Draw function
---@param order number|nil Default 1000
function editor_dynamicDecalsTool.registerToolbarToolItem(name, guiFn, order) end

--- Removes the last point of the current path.
---Source: lua/ge/extensions/editor/dynamicDecalsTool.lua:971
function editor_dynamicDecalsTool.removeLastPathLayerPoint() end

--- Sets the layer whose mask is being edited (nil to leave this mode).
---Source: lua/ge/extensions/editor/dynamicDecalsTool.lua:993
---@param uid any|nil Layer uid
function editor_dynamicDecalsTool.setCurrentMaskEditingLayerUid(uid) end

--- Opens or closes a section by its name (opening an advanced section also opens "Advanced").
---Source: lua/ge/extensions/editor/dynamicDecalsTool.lua:805
---@param name string Section name
---@param newState boolean Open or closed
---@param setScroll boolean|nil Scrolls to the section
function editor_dynamicDecalsTool.setSectionOpenState(name, newState, setScroll) end

--- Undoes the last action of the dynamicDecals API, then refreshes the layers selected in editor.selection.dynamicDecalLayer.
---Source: lua/ge/extensions/editor/dynamicDecalsTool.lua:912
function editor_dynamicDecalsTool.undo() end

--- Removes a registered update function.
---Source: lua/ge/extensions/editor/dynamicDecalsTool.lua:784
---@param name string Key
function editor_dynamicDecalsTool.unregisterEditorOnUpdateFn(name) end

--- Removes a registered draw function.
---Source: lua/ge/extensions/editor/dynamicDecalsTool.lua:852
---@param name string Key
function editor_dynamicDecalsTool.unregisterOnEditorGuiFn(name) end

