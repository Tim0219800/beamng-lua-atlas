---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/terrain.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès simplifié au premier TerrainBlock de la scène : hauteur et normale du terrain en un point. Un moddeur s'en sert pour poser des objets au sol ou orienter un élément selon la pente. Le bloc trouvé est mis en cache par son id.
--- Accès : extension `core_terrain` : `extensions.load("core_terrain")`, puis la globale `core_terrain`
---@class core_terrain
core_terrain = {}

--- Renvoie l'objet TerrainBlock (cache par id, sinon premier résultat de scenetree.findClassObjects("TerrainBlock")).
---Source : lua/ge/extensions/core/terrain.lua:9
---@return userdata|nil  Objet TerrainBlock ou nil.
function core_terrain.getTerrain() end

--- Hauteur du terrain au point donné (terrain:getHeight).
---Source : lua/ge/extensions/core/terrain.lua:21
---@param point vec3 Position monde ; seuls x et y comptent (déduit du code).
---@return number|nil  Altitude, nil sans terrain.
function core_terrain.getTerrainHeight(point) end

--- Normale du terrain au point (terrain:getNormal(point, true, true)).
---Source : lua/ge/extensions/core/terrain.lua:28
---@param point vec3 Position monde.
---@return vec3|nil  Normale, nil sans terrain.
function core_terrain.getTerrainNormal(point) end

--- Normale lissée du terrain au point (terrain:getSmoothNormal(point, true, true)).
---Source : lua/ge/extensions/core/terrain.lua:35
---@param point vec3 Position monde.
---@return vec3|nil  Normale lissée, nil sans terrain.
function core_terrain.getTerrainSmoothNormal(point) end

