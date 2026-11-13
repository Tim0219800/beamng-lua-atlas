---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/edgeHandles.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_toolUtilities_edgeHandles` : `extensions.load("editor_toolUtilities_edgeHandles")`, puis la globale `editor_toolUtilities_edgeHandles`
---@class editor_toolUtilities_edgeHandles
editor_toolUtilities_edgeHandles = {}

--- A default pair of gates at opposite ends of the ring's long axis (entrance, exit).
---Source : lua/ge/extensions/editor/toolUtilities/edgeHandles.lua:99
---@param ring any
function editor_toolUtilities_edgeHandles.defaultGates(ring) end

--- Draw the widget (given lifted points from handleGeom): a stalk from the edge to the floated bar, the bar with end dots, and
---  the centre grab knob (pulsing when hovered). `base`/`glow` are packed colours.
---Source : lua/ge/extensions/editor/toolUtilities/edgeHandles.lua:127
---@param gp any
---@param cp any
---@param e1 any
---@param e2 any
---@param base any
---@param glow any
---@param hovered any
function editor_toolUtilities_edgeHandles.drawHandle(gp, cp, e1, e2, base, glow, hovered) end

--- World position of a gate plus the OUTWARD unit normal of its edge (pointing away from the ring centre). Returns wx, wy, nx, ny.
---Source : lua/ge/extensions/editor/toolUtilities/edgeHandles.lua:84
---@param ring any
---@param gate any
function editor_toolUtilities_edgeHandles.gateWorldDir(ring, gate) end

--- Geometry of the grabbable widget for `gate`: the bar is floated `outDist` m outside the edge and spans `halfWidth` m each
---  way along it. `liftFn(x,y) -> vec3` lifts a world point to the terrain (identity plane if omitted). Returns the edge point,
---  the bar centre (grab knob), and the two bar ends -- or nil if the gate is invalid.
---Source : lua/ge/extensions/editor/toolUtilities/edgeHandles.lua:115
---@param ring any
---@param gate any
---@param outDist any
---@param halfWidth any
---@param liftFn any
function editor_toolUtilities_edgeHandles.handleGeom(ring, gate, outDist, halfWidth, liftFn) end

--- Snap a world point (px,py) to the nearest gate on the ring. Returns { edge, t }.
---Source : lua/ge/extensions/editor/toolUtilities/edgeHandles.lua:68
---@param ring any
---@param px any
---@param py any
function editor_toolUtilities_edgeHandles.nearestGate(ring, px, py) end

--- Every gate in the list given a name of its own, and the list handed back. A gate is otherwise known only by where it is
---  in its list, which shifts the moment one before it is removed -- no use to anything that has to keep hold of one. Called
---  from the accessors, so a list saved before this is named on the way out of the first one to ask for it.
---Source : lua/ge/extensions/editor/toolUtilities/edgeHandles.lua:60
---@param gates any
function editor_toolUtilities_edgeHandles.tagGates(gates) end

