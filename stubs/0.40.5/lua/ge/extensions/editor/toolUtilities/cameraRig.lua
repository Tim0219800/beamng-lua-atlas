---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/cameraRig.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_toolUtilities_cameraRig` : `extensions.load("editor_toolUtilities_cameraRig")`, puis la globale `editor_toolUtilities_cameraRig`
---@class editor_toolUtilities_cameraRig
editor_toolUtilities_cameraRig = {}

--- Seed the PAN sub-state on the footprint origin and return its top-down target pose.
---Source : lua/ge/extensions/editor/toolUtilities/cameraRig.lua:196
---@param originXY any
---@param terrainH any
---@param height any
function editor_toolUtilities_cameraRig.focusFootprint(originXY, terrainH, height) end

--- Seed the ORBIT sub-state on the building centroid and return its 3/4 target pose.
---Source : lua/ge/extensions/editor/toolUtilities/cameraRig.lua:209
---@param centroid any
---@param radius any
---@param yawDeg any
---@param pitchDeg any
function editor_toolUtilities_cameraRig.focusMassing(centroid, radius, yawDeg, pitchDeg) end

---Source : lua/ge/extensions/editor/toolUtilities/cameraRig.lua:241
function editor_toolUtilities_cameraRig.getMode() end

--- Move the orbit PIVOT to `centroid` while KEEPING the current yaw / pitch / dist, and return the pose whose eye preserves that
---  framing (eye translates with the pivot).
---Source : lua/ge/extensions/editor/toolUtilities/cameraRig.lua:223
---@param centroid any
function editor_toolUtilities_cameraRig.recenter(centroid) end

--- Kill any leftover inertia (call when a timed transition ends before interactive drive resumes, so the view doesn't
---  coast from a stale flick).
---Source : lua/ge/extensions/editor/toolUtilities/cameraRig.lua:234
function editor_toolUtilities_cameraRig.settle() end

--- Advance the interactive camera one frame and return the pose to push (pos, yawDeg, pitchDeg, rollDeg). `input` is
---  { dragActive, dragDX, dragDY, wheel, groundZAt, limitXY } - screen-space drag delta in pixels and the wheel notches
---  this frame; groundZAt(x, y[, heightAbove]) -> ground z (the mean over the view when heightAbove is given);
---  limitXY(x, y) -> x, y pens the pan centre in. Pan drags
---  grab the ground (with inertia); orbit drags spin around the pivot (with inertia); the wheel zooms/dollies. pos is a
---  shared vec3 - copy it if you need to keep it.
---Source : lua/ge/extensions/editor/toolUtilities/cameraRig.lua:98
---@param dt any
---@param input any
function editor_toolUtilities_cameraRig.update(dt, input) end

