---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/frustumOffset.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Shifts the camera frustum center (scenetree.OnlyGui:setFrustumCameraCenterOffset) so that the 3D view is recentered when UI panels cover part of the screen (see BngFrustumMover.js). Accepts a raw offset in engine units and/or an offset as a fraction of half the screen, converted taking the screen ratio and the FoV into account.
--- Access: extension `ui_frustumOffset`: `extensions.load("ui_frustumOffset")`, then the global `ui_frustumOffset`
---@class ui_frustumOffset
ui_frustumOffset = {}

--- Per-frame hook: if a screen offset is active and the FoV has changed since the last application, reapplies the offset.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/frustumOffset.lua:44
function ui_frustumOffset.onUpdate() end

--- Sets the offsets and applies them immediately. Any missing value is 0.
---Source: lua/ge/extensions/ui/frustumOffset.lua:38
---@param newRawX number|nil Raw horizontal offset (engine units), passed as is.
---@param newRawY number|nil Raw vertical offset (engine units), passed as is.
---@param newScreenX number|nil Horizontal offset as a fraction of half the screen width.
---@param newScreenY number|nil Vertical offset as a fraction of half the screen height.
function ui_frustumOffset.set(newRawX, newRawY, newScreenX, newScreenY) end

