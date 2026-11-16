---@meta
-- tim19Atlas stub generated from lua/ge/extensions/render/skiaIcons.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- 3D icons (Skia billboards facing the camera) to mark world positions: missions, stations, race markers. Each icon is drawn with the bngIcons font in four layers (shape outline, fill, pattern edge, pattern). Icons with the same appearance share a billboard pool: releasing one puts it away for the next one of the same style instead of rebuilding a texture. A modder calls getIcon, then update every frame, and release at the end.
--- Access: extension `render_skiaIcons`: `extensions.load("render_skiaIcons")`, then the global `render_skiaIcons`
---@class render_skiaIcons
render_skiaIcons = {}

--- Opens one of these folders in the system file explorer (development convenience).
---Source: lua/ge/extensions/render/skiaIcons.lua:568
---@param which string 'presets', 'font', or a path.
---@return string|nil  Opened path, or nil if the platform cannot open it.
function render_skiaIcons.exploreFolder(which) end

--- Returns the table of named colors of the icon config.
---Source: lua/ge/extensions/render/skiaIcons.lua:604
---@return table<string, string>  Color name to value (config format).
function render_skiaIcons.getColors() end

--- Folders read by the system: presets (/art/skiaIcons) and font.
---Source: lua/ge/extensions/render/skiaIcons.lua:562
---@return table<string, string>  {presets = ..., font = ...}.
function render_skiaIcons.getFolders() end

--- Returns an icon for a preset name, a spec table, or a preset with overrides (spec.preset plus fields). If the style cannot be built, returns an already dead icon (isLive false).
---Source: lua/ge/extensions/render/skiaIcons.lua:476
---@param spec string|table Preset name or spec table (see notes).
---@param pos vec3|nil World position. If provided, the icon is built and placed right away; otherwise on the first update.
---@return Icon  Icon object with update, setPos, setScale, setVisible, visibility, isLive, release.
function render_skiaIcons.getIcon(spec, pos) end

--- Sorted list of all motive names (bngIcons glyphs).
---Source: lua/ge/extensions/render/skiaIcons.lua:553
---@return string[]  Motive names usable in spec.motive.
function render_skiaIcons.getMotives() end

--- Returns the presets table (name -> spec) loaded from /art/skiaIcons/*.skiaIcon.json ('presets' field).
---Source: lua/ge/extensions/render/skiaIcons.lua:174
---@return table<string, table>  Presets.
function render_skiaIcons.getPresets() end

--- Sorted list of available shape names.
---Source: lua/ge/extensions/render/skiaIcons.lua:605
---@return string[]  Shape names usable in spec.shape.
function render_skiaIcons.getShapes() end

--- Pool statistics for debugging.
---Source: lua/ge/extensions/render/skiaIcons.lua:575
---@return table  {live, looks, pooled, created, reused, destroyed, hasRenderer}.
function render_skiaIcons.getStats() end

--- End-of-mission hook: the scene and its renderer are lost, all billboard identifiers are invalidated and the pools emptied.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/render/skiaIcons.lua:544
function render_skiaIcons.onClientEndMission() end

--- Hook called when the extension loads: deletes a 'skiaIconBillboards' renderer left by a previous Lua VM.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/render/skiaIcons.lua:589
function render_skiaIcons.onExtensionLoaded() end

--- Hook called on unload: identical to reload().
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/render/skiaIcons.lua:525
function render_skiaIcons.onExtensionUnloaded() end

--- Re-reads the shared config, the glyph table and the presets from disk. Deletes the renderer (all textures); live icons rebuild on their next update.
---Source: lua/ge/extensions/render/skiaIcons.lua:525
---@return boolean  true if the config could be re-read.
function render_skiaIcons.reload() end

--- Forgets the loaded presets so that the next getIcon re-reads the *.skiaIcon.json files. Lighter than reload: already built textures are kept.
---Source: lua/ge/extensions/render/skiaIcons.lua:539
function render_skiaIcons.reloadPresets() end

--- Computes the world height of an icon that behaves like a real object at medium distance but stays bounded on screen: never below minScreen (readable from afar), never above maxScreen (does not flood the view up close). Bounds are expressed as a fraction of the screen height; equal bounds give a constant on-screen size. Uses the core_camera camera; without a camera, returns worldSize.
---Source: lua/ge/extensions/render/skiaIcons.lua:508
---@param pos vec3 Icon position.
---@param worldSize number Height in meters in the intermediate range.
---@param minScreen number|nil Minimum fraction of the screen height (default 0).
---@param maxScreen number|nil Maximum fraction of the screen height (default 1).
---@return number  World height to pass to Icon:update.
function render_skiaIcons.screenBoundedScale(pos, worldSize, minScreen, maxScreen) end

--- Icon handle returned by getIcon. Each state method returns the icon itself (except isLive, visibility, release).
---@class render_skiaIcons_Icon
local render_skiaIcons_Icon = {}

--- False if the icon has no billboard: released, style impossible to build, or no renderer.
---Source: lua/ge/extensions/render/skiaIcons.lua:450
---@return boolean  State.
function render_skiaIcons_Icon:isLive() end

--- Puts the billboard away in the pool for an icon of the same style. The handle is unusable afterward.
---Source: lua/ge/extensions/render/skiaIcons.lua:454
function render_skiaIcons_Icon:release() end

--- Shortcut for update(pos, nil, nil).
---Source: lua/ge/extensions/render/skiaIcons.lua:431
---@param pos vec3 New position.
---@return Icon  The icon.
function render_skiaIcons_Icon:setPos(pos) end

--- Shortcut for update(nil, scale, nil).
---Source: lua/ge/extensions/render/skiaIcons.lua:432
---@param scale number New world height in meters.
---@return Icon  The icon.
function render_skiaIcons_Icon:setScale(scale) end

--- Shows or hides the icon with a fade. With instant, skips the fade and pushes the result right away (useful for a hidden marker that is no longer updated).
---Source: lua/ge/extensions/render/skiaIcons.lua:436
---@param visible boolean true for visible.
---@param instant boolean|nil true to skip the fade.
---@return Icon  The icon.
function render_skiaIcons_Icon:setVisible(visible, instant) end

--- Makes sure the icon has a billboard of its current appearance: rebuilds after a reload or after the scene is lost, takes a billboard from the pool or creates one.
---Source: lua/ge/extensions/render/skiaIcons.lua:369
---@return number|nil  Billboard identifier, or nil if there is nothing to draw.
function render_skiaIcons_Icon:sync() end

--- Per-frame call. pos and scale keep their current value when nil; dt advances the visibility fade (nil or 0 leaves it in place).
---Source: lua/ge/extensions/render/skiaIcons.lua:405
---@param pos vec3|nil World position.
---@param scale number|nil World height in meters.
---@param dt number|nil Frame duration in seconds.
---@return Icon  The icon.
function render_skiaIcons_Icon:update(pos, scale, dt) end

--- Current fade progress between 0 and 1, to sync other visual elements to it.
---Source: lua/ge/extensions/render/skiaIcons.lua:446
---@return number  0 to 1.
function render_skiaIcons_Icon:visibility() end

