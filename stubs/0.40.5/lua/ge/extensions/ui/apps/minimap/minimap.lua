---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/apps/minimap/minimap.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Minimap displayed in ImGui (API marked experimental by BeamNG). It draws into a texture the roads, the player, the other vehicles, the compass, the playmode markers, etc., in a circle or rectangle shape (setting `minimapMode`). Another module activates it with setDrawTransform (position and size relative to the screen, between 0 and 1) and hides it with hide. Every frame, it emits the hook `onDrawOnMinimap(td)` so that other extensions draw on top. Also contains a debug settings window (profiling, garbage measurement, display options).
--- Access: extension `ui_apps_minimap_minimap`: `extensions.load("ui_apps_minimap_minimap")`, then the global `ui_apps_minimap_minimap`
---@class ui_apps_minimap_minimap
---@field dependencies table<integer, string> Extensions loaded before: topomap, additionalInfo, route, utils, roads, vehicles of the minimap, and gameplay_playmodeMarkers.
---@field onUpdate function|nil nil at start; set by setDrawTransform (drawing function), reset to nil by hide.
ui_apps_minimap_minimap = {}

--- Draws debug markers (corners, margins) and displays the sizes in ImGui.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/apps/minimap/minimap.lua:720
function ui_apps_minimap_minimap.drawDebugOverlay() end

--- Draws the occlusion masks and the circular or rectangular cropping of the minimap into the texture. Called by the minimap's drawing loop.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/apps/minimap/minimap.lua:668
---@param offsetX number Horizontal drawing offset.
---@param offsetY number Vertical drawing offset.
function ui_apps_minimap_minimap.drawOcclusion(offsetX, offsetY) end

--- Returns the choice lists of the debug window (`lookaheadValue`, `profileEveryNthFrame`).
---Source: lua/ge/extensions/ui/apps/minimap/minimap.lua:832
---@return table  `{name, value}` tables per setting.
function ui_apps_minimap_minimap.getDebugSettingsData() end

--- Returns the minimap's shape.
---Source: lua/ge/extensions/ui/apps/minimap/minimap.lua:747
---@return string  "circle" or "rect".
function ui_apps_minimap_minimap.getMode() end

--- Returns the minimap's current scale.
---Source: lua/ge/extensions/ui/apps/minimap/minimap.lua:41
---@return number  Scale in pixels per meter.
function ui_apps_minimap_minimap.getScale() end

--- Hides the minimap: resets the transform to 0 and unhooks onUpdate.
---Source: lua/ge/extensions/ui/apps/minimap/minimap.lua:812
function ui_apps_minimap_minimap.hide() end

--- Hook called at the end of a mission/level. Hides the minimap and resets the roads.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/apps/minimap/minimap.lua:836
function ui_apps_minimap_minimap.onClientEndMission() end

--- Hook called at the start of a mission/level. Hides the minimap and resets the roads (`ui_apps_minimap_roads.reset`).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/apps/minimap/minimap.lua:844
function ui_apps_minimap_minimap.onClientStartMission() end

--- Called on extension initialization. Switches to manual unload and reads the minimap settings.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/apps/minimap/minimap.lua:11
function ui_apps_minimap_minimap.onInit() end

--- Hook called when the minimap settings change. Rereads the mode, orientation, grid and lookahead and the state of the ImGui viewports.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/apps/minimap/minimap.lua:758
---@param m any Unused argument (inferred from code).
function ui_apps_minimap_minimap.onMinimapSettingsChanged(m) end

--- Removes the occlusion zone with this id; if the id is not a non-empty string, removes all zones.
---Source: lua/ge/extensions/ui/apps/minimap/minimap.lua:803
---@param id string|nil Zone identifier, or nil to clear everything.
function ui_apps_minimap_minimap.resetOcclusionTransform(id) end

--- Sets custom margins around the minimap (left, right, top, bottom). A nil value becomes 10.
---Source: lua/ge/extensions/ui/apps/minimap/minimap.lua:771
---@param left number|nil Left margin.
---@param right number|nil Right margin.
---@param top number|nil Top margin.
---@param bottom number|nil Bottom margin.
function ui_apps_minimap_minimap.setBuffers(left, right, top, bottom) end

--- Positions the minimap and activates it (hooks onUpdate). The 4 values must be between 0 and 1, otherwise a warning and a call to hide.
---Source: lua/ge/extensions/ui/apps/minimap/minimap.lua:778
---@param x number Relative horizontal position (0 to 1).
---@param y number Relative vertical position (0 to 1).
---@param width number Relative width (0 to 1).
---@param height number Relative height (0 to 1).
function ui_apps_minimap_minimap.setDrawTransform(x, y, width, height) end

--- Declares a zone that masks part of the minimap (for example an interface element placed over it). Ignored with a warning if a value is outside 0..1.
---Source: lua/ge/extensions/ui/apps/minimap/minimap.lua:795
---@param id string Zone identifier.
---@param x number Relative horizontal position (0 to 1).
---@param y number Relative vertical position (0 to 1).
---@param width number Relative width (0 to 1).
---@param height number Relative height (0 to 1).
function ui_apps_minimap_minimap.setOcclusionTransform(id, x, y, width, height) end

--- Opens or closes the debug settings window.
---Source: lua/ge/extensions/ui/apps/minimap/minimap.lua:820
function ui_apps_minimap_minimap.toggledebugSettings() end

