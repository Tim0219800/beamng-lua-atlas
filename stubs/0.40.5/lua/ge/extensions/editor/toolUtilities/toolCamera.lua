---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/toolCamera.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_toolUtilities_toolCamera` : `extensions.load("editor_toolUtilities_toolCamera")`, puis la globale `editor_toolUtilities_toolCamera`
---@class editor_toolUtilities_toolCamera
editor_toolUtilities_toolCamera = {}

--- Per-frame interactive drive: gather the viewport RMB-drag + wheel (gated so UI / a host-declared busy state don't
---  pan/orbit) and push the rig pose to scriptedFree.
---Source : lua/ge/extensions/editor/toolUtilities/toolCamera.lua:183
---@param blocked any
function editor_toolUtilities_toolCamera.drive(blocked) end

--- Fly to an ORBIT focus framing (x,y,z) over `time` s (nil = scaled to the distance). radius (optional) sizes the dolly so the subject frames nicely; yaw /
---  pitch (optional) override the default 3/4 angle (used to approach a detail from a known outward direction). No-op unless
---  we're driving.
---Source : lua/ge/extensions/editor/toolUtilities/toolCamera.lua:160
---@param x any
---@param y any
---@param z any
---@param radius any
---@param yaw any
---@param pitch any
---@param time any
function editor_toolUtilities_toolCamera.flyOrbit(x, y, z, radius, yaw, pitch, time) end

--- Fly to a top-down PAN focus over `time` s (0 = snap, nil = scaled to the distance).
---Source : lua/ge/extensions/editor/toolUtilities/toolCamera.lua:137
---@param x any
---@param y any
---@param groundZ any
---@param height any
---@param time any
function editor_toolUtilities_toolCamera.flyPan(x, y, groundZ, height, time) end

--- Hand the editor camera back.
---Source : lua/ge/extensions/editor/toolUtilities/toolCamera.lua:121
---@param animate any
function editor_toolUtilities_toolCamera.handBack(animate) end

---Source : lua/ge/extensions/editor/toolUtilities/toolCamera.lua:132
function editor_toolUtilities_toolCamera.isActive() end

--- Slide the orbit PIVOT onto (x,y,z) KEEPING the current yaw / pitch / dist, over a short ease. Unlike flyOrbit (a fresh 3/4
---  reframe) this preserves the viewing angle + zoom - the gentle "recentre on what I just selected" move. No-op unless we're
---  driving.
---Source : lua/ge/extensions/editor/toolUtilities/toolCamera.lua:172
---@param x any
---@param y any
---@param z any
---@param time any
function editor_toolUtilities_toolCamera.recenterOrbit(x, y, z, time) end

--- Take over the editor camera.
---Source : lua/ge/extensions/editor/toolUtilities/toolCamera.lua:96
function editor_toolUtilities_toolCamera.takeOver() end

