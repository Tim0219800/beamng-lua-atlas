---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/groundModelDebug.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- ImGui window for debugging and tuning ground models (friction, surface fluid, collision type). It can display in 3D, around the mouse pointer (or the debugger's focus point), the ground models height map, its depth and the static collision triangles, with one color per ground model, and a collision triangle density per tile. Each ground model can be modified live (be:setGroundModel, aliases included) then saved to /art/groundmodels.json; the "Default" button reloads the original values. The display settings are stored in settings/editor/groundModelDebug_settings.json.
--- Access: extension `util_groundModelDebug`: `extensions.load("util_groundModelDebug")`, then the global `util_groundModelDebug`
---@class util_groundModelDebug
---@field dependencies string[] {"ui_imguiUtils"}: used to load the editor icon atlas
util_groundModelDebug = {}

--- Deserialization hook: restores the saved state and re-enables static collision debugging on the engine side if needed.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/groundModelDebug.lua:563
---@param data table Data returned by onSerialize
function util_groundModelDebug.onDeserialized(data) end

--- Called on load: builds the ground models list from core_environment.groundModels and re-reads the saved settings.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/groundModelDebug.lua:551
function util_groundModelDebug.onExtensionLoaded() end

--- Serialization hook before an extension reload: keeps the open state of the window, of the static triangles display and of the density.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/groundModelDebug.lua:555
---@return table  {windowOpen, staticDebug, colDensityEnabled}
function util_groundModelDebug.onSerialize() end

--- Hook called every frame: as long as the window is open, determines the focus point (mouse raycast or Lua.lastDebugFocusPos), draws the debug visualizations of each active ground model and the ImGui interface.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/groundModelDebug.lua:232
---@param dt number Time delta in seconds (unused)
function util_groundModelDebug.onUpdate(dt) end

--- Opens the "GroundModel Debug Window".
---Source: lua/ge/extensions/util/groundModelDebug.lua:207
function util_groundModelDebug.openWindow() end

