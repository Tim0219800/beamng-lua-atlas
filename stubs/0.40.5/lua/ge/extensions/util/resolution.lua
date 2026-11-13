---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/resolution.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `util_resolution` : `extensions.load("util_resolution")`, puis la globale `util_resolution`
---@class util_resolution
util_resolution = {}

---Source : lua/ge/extensions/util/resolution.lua:9
function util_resolution.getVideoModeSnapshot() end

--- Sets the game window to a specific resolution in Window mode (NOT borderless)
---  Console usage:
---    extensions.reload('util_resolution')
---    extensions.util_resolution.setWindowedResolution(1280, 720)
---Source : lua/ge/extensions/util/resolution.lua:30
---@param width any
---@param height any
function util_resolution.setWindowedResolution(width, height) end

