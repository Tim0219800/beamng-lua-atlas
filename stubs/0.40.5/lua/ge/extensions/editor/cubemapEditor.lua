---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/cubemapEditor.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- World Editor cubemap editor (Assets > "Cubemap Editor" menu, "cubemapEditor" window). It lists the CubemapData class objects of the level, lets you create, save and delete a cubemap, assign each of the 6 faces (drag and drop or button), and capture the 6 faces from the camera position (captureCameraCubemap, resolution 128 to 2048 px, power of 2) before assigning them automatically. It also exports the data to a main.materials.json file. Can be opened by another tool via show(onSelectCb) to pick a cubemap.
--- Access: extension `editor_cubemapEditor`: `extensions.load("editor_cubemapEditor")`, then the global `editor_cubemapEditor`
---@class editor_cubemapEditor
editor_cubemapEditor = {}

--- Hook called every editor frame: draws the window.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/cubemapEditor.lua:751
function editor_cubemapEditor.onEditorGui() end

--- Hook called at World Editor initialization: registers the window (750x380, hidden) and the "Cubemap Editor" menu entry in the Assets group.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/cubemapEditor.lua:745
function editor_cubemapEditor.onEditorInitialized() end

--- Opens the cubemap editor window. Loads the cubemap list on the first call, preselects the one whose name is given (otherwise the first if nothing is selected). If a callback is provided, the window shows Select/Cancel buttons; Select calls the callback with the cubemap name and closes the window.
---Source: lua/ge/extensions/editor/cubemapEditor.lua:734
---@param onSelectCb function|nil called with the name (string) of the chosen cubemap
---@param preselectName string|nil name of the cubemap to preselect
function editor_cubemapEditor.show(onSelectCb, preselectName) end

