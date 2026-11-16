---@meta
-- tim19Atlas stub generated from lua/ge/extensions/render/playerCompassMarkers.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Direction indicators of the other players for split screen (multiseat in freeroam). For each view, draws at the top of the view one colored dot per other player, positioned horizontally according to the direction they are in (like a compass), in a transparent ImGui texture. Driven by render_splitScreen (update called every frame). Depends on ui_imgui, core_gamestate, core_camera. Global: render_playerCompassMarkers.
--- Access: extension `render_playerCompassMarkers`: `extensions.load("render_playerCompassMarkers")`, then the global `render_playerCompassMarkers`
---@class render_playerCompassMarkers
---@field dependencies table
render_playerCompassMarkers = {}

--- Frees the registered direction textures and resets the states; no effect if already inactive.
---Source: lua/ge/extensions/render/playerCompassMarkers.lua:54
function render_playerCompassMarkers.destroy() end

--- Loading screen hook: when state is 2, lifts the suppression of the markers.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/render/playerCompassMarkers.lua:260
---@param state integer Loading screen state (2 = finished, inferred from code).
function render_playerCompassMarkers.onLoadingScreenInactive(state) end

--- Updates and draws the direction markers for all split screen views (collection, texture, background-less, input-less ImGui window per view).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/render/playerCompassMarkers.lua:179
---@param enabled boolean Enable the feature.
---@param views table[] Views: {name, player, markerRect = {x, y, w, h}}.
---@param players table[] Players: {player, color = '#RRGGBB'}.
---@param vehicleForPlayer function function(player) -> vehicle object or nil.
function render_playerCompassMarkers.update(enabled, views, players, vehicleForPlayer) end

