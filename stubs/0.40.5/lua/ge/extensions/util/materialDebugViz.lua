---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/materialDebugViz.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Material (PBR) debug visualizations for the editor and rendering tools. It defines 22 modes (none, quad overdraw, wireframe, mipmap level, base color, opacity, metallic, roughness, world normals, ambient occlusion, emissive, clear coat, clear coat roughness, UV0/UV1 with checkerboard and grid, deprecated material, layer count, Draw ID uniformity). Each mode enables a debug flag in the engine (materialDebugSetFlag / enableMaterialDebug). When a mode is active, an ImGui legend window is shown at the bottom of the screen (gradient, color swatches and explanations).
--- Access: extension `util_materialDebugViz`: `extensions.load("util_materialDebugViz")`, then the global `util_materialDebugViz`
---@class util_materialDebugViz
util_materialDebugViz = {}

--- Draws the legend window of the active mode (horizontally centered, at 80% of the view height). Draws nothing if no mode is active or if it has no legend. Also hooked as onUpdate.
---Source: lua/ge/extensions/util/materialDebugViz.lua:361
function util_materialDebugViz.drawLegendWindow() end

--- Returns the integer ImGui pointer (IntPtr) holding the current mode index (0-based), usable with an ImGui combo.
---Source: lua/ge/extensions/util/materialDebugViz.lua:359
---@return userdata  im.IntPtr of the current index
function util_materialDebugViz.getIndexPtr() end

--- Returns the list of visualization modes (tables {type='Custom', name, displayName, setter, getter}), nil before loading.
---Source: lua/ge/extensions/util/materialDebugViz.lua:358
---@return table[]|nil  Available modes
function util_materialDebugViz.getTypes() end

--- Called on load: builds the table of visualization modes (type, name, displayName, setter, getter) and selects the index of the mode already active in the engine.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/materialDebugViz.lua:257
function util_materialDebugViz.onExtensionLoaded() end

--- Hook called every frame; alias of drawLegendWindow. (dynamically assigned)
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/materialDebugViz.lua:dyn
function util_materialDebugViz.onUpdate() end

--- Activates a visualization mode by name; with no argument or with Material_None, disables the visualization. Logs an error for an unknown name.
---Source: lua/ge/extensions/util/materialDebugViz.lua:410
---@param mode string|nil Mode name, for example Material_Roughness
function util_materialDebugViz.set(mode) end

