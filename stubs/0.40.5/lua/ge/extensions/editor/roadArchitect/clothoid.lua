---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/roadArchitect/clothoid.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Clothoid evaluation (Euler spirals, curvature varying linearly with arc length) for Road Architect. The code is largely based on the Clothoids library by Enrico Bertolazzi and Marco Frego (BSD license, copyright 2024 Bertolazzi, Frego and BeamNG): the generalized Fresnel integrals are computed internally (fresnelCS, evalXYaSmall, evalXYaLarge, generalizedFresnelCS). A modder uses it to get points on a transition curve (roads, junctions).
--- Access: extension `editor_roadArchitect_clothoid`: `extensions.load("editor_roadArchitect_clothoid")`, then the global `editor_roadArchitect_clothoid`
---@class editor_roadArchitect_clothoid
editor_roadArchitect_clothoid = {}

--- Evaluates a clothoid at parameter p (arc length, from 0 to the total geodesic length): computes the generalized Fresnel integral with a = dKappa·p², b = kappa·p and c = theta0, then returns start + p·(C, S).
---Source: lua/ge/extensions/editor/roadArchitect/clothoid.lua:296
---@param start vec3 Start point of the spiral (only x and y are used).
---@param theta0 number Initial heading in radians.
---@param kappa number Initial curvature (1/m).
---@param dKappa number Rate of change of curvature per unit length (1/m²).
---@param p number Arc length to evaluate, between 0 and the spiral length.
---@return vec3  Position (x, y) of the point on the clothoid, z at 0.
function editor_roadArchitect_clothoid.evaluate(start, theta0, kappa, dKappa, p) end

