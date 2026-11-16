---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/trackBuilder/proceduralPrimitives.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Simple shape generators for Track Builder obstacles: torus (ring), cylinder, cone, cube, bump and ramp. Each function returns a procedural mesh table {verts, uvs, normals, faces, material} ready to be passed to ProceduralMesh:createMesh({{mesh}}) (verts and normals are {x,y,z}, uvs are {u,v}, faces are {v,n,u} 0-indexed). The default material is 'track_editor_A_border'.
--- Access: extension `util_trackBuilder_proceduralPrimitives`: `extensions.load("util_trackBuilder_proceduralPrimitives")`, then the global `util_trackBuilder_proceduralPrimitives`
---@class util_trackBuilder_proceduralPrimitives
util_trackBuilder_proceduralPrimitives = {}

--- Bump (speed bump): base of length × width and top plateau of upperLength × upperWidth, with height height.
---Source: lua/ge/extensions/util/trackBuilder/proceduralPrimitives.lua:289
---@param length number|nil Base length (2 by default).
---@param width number|nil Base width (5 by default).
---@param height number|nil Height (1 by default).
---@param upperLength number|nil Plateau length (0.5 by default).
---@param upperWidth number|nil Plateau width (4 by default).
---@param material string|nil Material.
---@return table  Procedural mesh.
function util_trackBuilder_proceduralPrimitives.createBump(length, width, height, upperLength, upperWidth, material) end

--- Cone with a Z axis centered on the origin, tip pointing up.
---Source: lua/ge/extensions/util/trackBuilder/proceduralPrimitives.lua:406
---@param radius number Base diameter (divided by 2 internally).
---@param height number Height in meters.
---@param material string|nil Material.
---@return table  Procedural mesh.
function util_trackBuilder_proceduralPrimitives.createCone(radius, height, material) end

--- Cuboid centered on the origin. uvStyle chooses the UV layout (1 by default).
---Source: lua/ge/extensions/util/trackBuilder/proceduralPrimitives.lua:472
---@param size vec3|nil Dimensions; vec3(1,1,1) by default. x and y are swapped internally.
---@param material string|nil Material.
---@param uvStyle any UV style (1 by default; the value is compared to 1).
---@return table  Procedural mesh.
function util_trackBuilder_proceduralPrimitives.createCube(size, material, uvStyle) end

--- Cylinder with a Z axis centered on the origin, with top and bottom faces.
---Source: lua/ge/extensions/util/trackBuilder/proceduralPrimitives.lua:66
---@param radius number Diameter (divided by 2 internally).
---@param height number Height in meters.
---@param material string|nil Material.
---@return table  Procedural mesh.
function util_trackBuilder_proceduralPrimitives.createCylinder(radius, height, material) end

--- Ramp of length len, rising up to height hei. thinning narrows the width at the top, attack sets the curvature of the profile (power), twist adds a twist along the ramp.
---Source: lua/ge/extensions/util/trackBuilder/proceduralPrimitives.lua:160
---@param width number|nil Base width (5 by default).
---@param len number|nil Length (10 by default).
---@param hei number|nil Final height (2 by default).
---@param thinning number|nil Width factor at the top, clamped to [0, 2] (0.5 by default).
---@param attack number|nil Exponent of the height profile, minimum 1.
---@param twist number|nil Total twist (0 by default; unit inferred from code: radians).
---@param material string|nil Material.
---@return table  Procedural mesh.
function util_trackBuilder_proceduralPrimitives.createRamp(width, len, hei, thinning, attack, twist, material) end

--- Torus (ring) centered on the origin, in the YZ plane.
---Source: lua/ge/extensions/util/trackBuilder/proceduralPrimitives.lua:8
---@param radius number Radius parameter; multiplied by 2 internally.
---@param thickness number Tube thickness; divided by 2 internally.
---@param material string|nil Material (default 'track_editor_A_border').
---@return table  Procedural mesh.
function util_trackBuilder_proceduralPrimitives.createRing(radius, thickness, material) end

