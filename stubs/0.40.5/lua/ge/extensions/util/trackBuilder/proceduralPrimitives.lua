---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/trackBuilder/proceduralPrimitives.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `util_trackBuilder_proceduralPrimitives` : `extensions.load("util_trackBuilder_proceduralPrimitives")`, puis la globale `util_trackBuilder_proceduralPrimitives`
---@class util_trackBuilder_proceduralPrimitives
util_trackBuilder_proceduralPrimitives = {}

--- BUMP
---Source : lua/ge/extensions/util/trackBuilder/proceduralPrimitives.lua:289
---@param length any
---@param width any
---@param height any
---@param upperLength any
---@param upperWidth any
---@param material any
function util_trackBuilder_proceduralPrimitives.createBump(length, width, height, upperLength, upperWidth, material) end

--- CONE
---Source : lua/ge/extensions/util/trackBuilder/proceduralPrimitives.lua:406
---@param radius any
---@param height any
---@param material any
function util_trackBuilder_proceduralPrimitives.createCone(radius, height, material) end

--- CUBE
---Source : lua/ge/extensions/util/trackBuilder/proceduralPrimitives.lua:472
---@param size any
---@param material any
---@param uvStyle any
function util_trackBuilder_proceduralPrimitives.createCube(size, material, uvStyle) end

--- CYLINDER
---Source : lua/ge/extensions/util/trackBuilder/proceduralPrimitives.lua:66
---@param radius any
---@param height any
---@param material any
function util_trackBuilder_proceduralPrimitives.createCylinder(radius, height, material) end

--- RÄMP
---Source : lua/ge/extensions/util/trackBuilder/proceduralPrimitives.lua:160
---@param width any
---@param len any
---@param hei any
---@param thinning any
---@param attack any
---@param twist any
---@param material any
function util_trackBuilder_proceduralPrimitives.createRamp(width, len, hei, thinning, attack, twist, material) end

--- TORUS
---Source : lua/ge/extensions/util/trackBuilder/proceduralPrimitives.lua:8
---@param radius any
---@param thickness any
---@param material any
function util_trackBuilder_proceduralPrimitives.createRing(radius, thickness, material) end

