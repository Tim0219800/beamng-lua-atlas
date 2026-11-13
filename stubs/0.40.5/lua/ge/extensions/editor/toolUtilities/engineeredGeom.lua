---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/engineeredGeom.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_toolUtilities_engineeredGeom` : `extensions.load("editor_toolUtilities_engineeredGeom")`, puis la globale `editor_toolUtilities_engineeredGeom`
---@class editor_toolUtilities_engineeredGeom
---@field CONTROLS table
---@field DEFAULT_MIN_R number
editor_toolUtilities_engineeredGeom = {}

--- Backfills the four engineered fields on a group in place (new-group creation AND deserialize of sessions saved before the fields
---  existed). Only sets a field when nil, so authored values survive. Call from the tool's addNewGroup and deserializeGroup.
---Source : lua/ge/extensions/editor/toolUtilities/engineeredGeom.lua:574
---@param group any
function editor_toolUtilities_engineeredGeom.applyDefaults(group) end

--- Builds the engineered plan-view centerline. Returns nothing; mutates spline.divPoints/divWidths/normals/divCurv/discMap and runs
---  computeFrenetFrame. p = { R, Ls, minR, minAngleDeg, stepM, lonRes, zMode='free'|'raycast'|'conform' }.
---Source : lua/ge/extensions/editor/toolUtilities/engineeredGeom.lua:290
---@param spline any
---@param p any
function editor_toolUtilities_engineeredGeom.buildCenterline(spline, p) end

---Source : lua/ge/extensions/editor/toolUtilities/engineeredGeom.lua:556
---@param spline any
---@param p any
function editor_toolUtilities_engineeredGeom.buildCenterlineConform(spline, p) end

--- Thin z-mode wrappers mirroring the geom.lua sampler trio, so a tool can branch by name.
---Source : lua/ge/extensions/editor/toolUtilities/engineeredGeom.lua:548
---@param spline any
---@param p any
function editor_toolUtilities_engineeredGeom.buildCenterlineFree(spline, p) end

---Source : lua/ge/extensions/editor/toolUtilities/engineeredGeom.lua:552
---@param spline any
---@param p any
function editor_toolUtilities_engineeredGeom.buildCenterlineRaycast(spline, p) end

---Source : lua/ge/extensions/editor/toolUtilities/engineeredGeom.lua:603
---@param group any
function editor_toolUtilities_engineeredGeom.drawControlPolygon(group) end

--- Single sampling entry point honoring group.geometryMode. opts = { zMode='free'|'raycast'|'conform', lonRes, deckZ, maxStep, levelStart,
---  levelFinish (free mode: that end meets a flat junction pad, so the profile arrives level) }. In engineered
---  mode it fills divPoints/divWidths/normals/divCurv/discMap (+ Frenet frame) and returns true, so the caller need not sample. In
---  spline mode it clears any stale divCurv and returns false, letting the caller run its OWN geom.catmullRom* variant (keeping each
---  tool's banking / conform specifics). This keeps the branch a one-liner and the field set uniform everywhere.
---Source : lua/ge/extensions/editor/toolUtilities/engineeredGeom.lua:591
---@param group any
---@param opts any
function editor_toolUtilities_engineeredGeom.sampleInto(group, opts) end

--- Self-test: builds a single 90-degree corner and checks C0/C1 continuity and the end curvature, logging pass/fail. Call manually.
---Source : lua/ge/extensions/editor/toolUtilities/engineeredGeom.lua:657
function editor_toolUtilities_engineeredGeom.selfTest() end

--- One corner's solved geometry. delta is the SIGNED deflection (rad); turn is its sign (+1 left/CCW, -1 right/CW); R/Ls are this
---  corner's (possibly shrunk) radius and spiral length; thetaS the spiral angle; arc the circular central angle; T the tangent
---  distance the fillet eats along each adjoining straight. through=true means "too shallow, no fillet".
---Source : lua/ge/extensions/editor/toolUtilities/engineeredGeom.lua:62
---@param pPrev any
---@param pI any
---@param pNext any
---@param R any
---@param Ls any
---@param minAngle any
function editor_toolUtilities_engineeredGeom.solveCorner(pPrev, pI, pNext, R, Ls, minAngle) end

