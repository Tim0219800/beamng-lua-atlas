---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/cameraModes/bobbing.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Filter object returned by the constructor. Fields: walkBobScale, standingBobScale, t, bobPhase, phase (vec3 of random phases).
---@class core_cameraModes_bobbing
local core_cameraModes_bobbing = {}

--- Initializes: isFilter and hidden to true, reads the settings, resets. Called by the constructor.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/cameraModes/bobbing.lua:8
function core_cameraModes_bobbing:init() end

--- Re-reads the cameraSteadycamWalkBob and cameraSteadycamStandingBob settings (clamped to 0..2, default 1). Called by camera.lua when settings change, or by the owning mode.
---Source: lua/ge/extensions/core/cameraModes/bobbing.lua:15
function core_cameraModes_bobbing:onSettingsChanged() end

--- Resets time and phase to zero and draws new random phases for the sway.
---Source: lua/ge/extensions/core/cameraModes/bobbing.lua:20
function core_cameraModes_bobbing:reset() end

--- Applies the sway to data.res.pos and data.res.rot.
---Source: lua/ge/extensions/core/cameraModes/bobbing.lua:26
---@param data table Frame data: dt, res {pos, rot}, openxrSessionRunning
---@param walkAmt number|nil Walking intensity [0..1], 0 by default
---@param dt number|nil Time step in s, data.dt by default
---@return boolean  Always true
function core_cameraModes_bobbing:update(data, walkAmt, dt) end

