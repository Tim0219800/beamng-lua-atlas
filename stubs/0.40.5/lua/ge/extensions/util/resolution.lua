---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/resolution.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Helper to read and change the game window resolution via GFXDevice. getVideoModeSnapshot returns the current width, height and display mode; setWindowedResolution forces a specific resolution in windowed mode (not borderless). Handy for fixed-size screenshots or UI tests.
--- Access: extension `util_resolution`: `extensions.load("util_resolution")`, then the global `util_resolution`
---@class util_resolution
util_resolution = {}

--- Reads the current video mode from GFXDevice.
---Source: lua/ge/extensions/util/resolution.lua:9
---@return table|nil  {width, height, displayMode} or nil if GFXDevice.getVideoMode is unavailable
function util_resolution.getVideoModeSnapshot() end

--- Switches the window to "Window" mode at the given resolution (GFXDevice.setVideoMode).
---Source: lua/ge/extensions/util/resolution.lua:30
---@param width number Width in pixels
---@param height number Height in pixels
function util_resolution.setWindowedResolution(width, height) end

