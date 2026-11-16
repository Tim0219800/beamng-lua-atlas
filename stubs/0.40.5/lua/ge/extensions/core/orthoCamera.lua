---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/orthoCamera.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- GE extension `core_orthoCamera`: enables an orthographic view (no perspective) on the main view of the OnlyGui object, via scenetree.OnlyGui:setOrthoMainView. You set the near and far planes and the size of the orthographic window (either left/right/top/bottom, or a `size` with the window ratio). Also contains an ImGui debug window (debugMode, hardcoded off).
--- Access: extension `core_orthoCamera`: `extensions.load("core_orthoCamera")`, then the global `core_orthoCamera`
---@class core_orthoCamera
core_orthoCamera = {}

--- Enables or disables the main orthographic view and sets its parameters (bounds, clip planes, size).
---Source: lua/ge/extensions/core/orthoCamera.lua:52
---@param _enabled boolean true to enable.
---@param options table|nil { left, right, top, bottom, nearClip, farClip, size, useWindowAspectRatio }; useWindowAspectRatio is true if absent.
function core_orthoCamera.enable(_enabled, options) end

--- Returns the current vertical size of the orthographic view.
---Source: lua/ge/extensions/core/orthoCamera.lua:85
---@return number  size (1 by default).
function core_orthoCamera.getSize() end

--- Per-frame hook: displays the ImGui debug window 'OnlyGui OrthoMainView' only if debugMode is true (false in the shipped code, so inactive).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/orthoCamera.lua:106
---@param dtReal number Not used.
---@param dtSim number Not used.
---@param dtRaw number Not used.
function core_orthoCamera.onUpdate(dtReal, dtSim, dtRaw) end

--- Hook called when the window is resized: recomputes the ratio and reapplies the view.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/orthoCamera.lua:89
---@param size any New window size (unused).
function core_orthoCamera.onWindowResized(size) end

--- Updates size, nearClip and farClip (defaults 1, 1, 5000) and reapplies the orthographic view if it has already been configured.
---Source: lua/ge/extensions/core/orthoCamera.lua:75
---@param options table|nil { size, nearClip, farClip }
function core_orthoCamera.setOptions(options) end

