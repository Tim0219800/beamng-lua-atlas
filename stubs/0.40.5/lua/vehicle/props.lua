---@meta
-- tim19Atlas stub generated from lua/vehicle/props.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Drives the vehicle's animated props (jbeam "props" section: needles, steering wheel, articulated parts, prop lights). Every frame, each prop reads the value electrics.values[prop.func], converts it (multiplier, min, max, offset) and sends it to the engine via obj:propUpdate. Also handles hiding props when a break group (breakGroup) or deform group (deformGroup) is broken.
--- Access: global `props`
---@class props
---@field updateGFX function nop by default; replaced by the props update during reset()/init() if the vehicle has props. ⚠ nop is defined elsewhere (game global).
props = {}

--- Disables and hides all props attached to the given deform group, then sets them back to 0 on the engine side. Called by damage handling (beamstate) when a group deforms.
---Source: lua/vehicle/props.lua:41
---@param deformGroup string Deform group name.
function props.disablePropsInDeformGroup(deformGroup) end

--- Disables and hides all props attached to the given break group, then sets them back to 0 on the engine side. Called when a beam group breaks.
---Source: lua/vehicle/props.lua:54
---@param breakGroup string Break group name.
function props.hidePropsInBreakGroup(breakGroup) end

--- Identical to reset() (M.init = reset). Reads v.data.props, builds the breakGroup/deformGroup tables, normalizes the lightScaling config.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/props.lua:68
function props.init() end

--- Resets the state of each prop (disabled=false, hidden=false, lastVal=math.huge), rebuilds the group indexes and enables updateGFX if there are props.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/props.lua:68
function props.reset() end

