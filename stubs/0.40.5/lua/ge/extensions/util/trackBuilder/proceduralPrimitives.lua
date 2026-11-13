---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/trackBuilder/proceduralPrimitives.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Générateurs de formes simples pour les obstacles du Track Builder : tore (ring), cylindre, cône, cube, bosse (bump) et rampe. Chaque fonction renvoie une table de mesh procédural {verts, uvs, normals, faces, material} prête à être passée à ProceduralMesh:createMesh({{mesh}}) (verts et normals sont des {x,y,z}, uvs des {u,v}, faces des {v,n,u} indexés depuis 0). Le matériau par défaut est 'track_editor_A_border'.
--- Accès : extension `util_trackBuilder_proceduralPrimitives` : `extensions.load("util_trackBuilder_proceduralPrimitives")`, puis la globale `util_trackBuilder_proceduralPrimitives`
---@class util_trackBuilder_proceduralPrimitives
util_trackBuilder_proceduralPrimitives = {}

--- Bosse (dos d'âne) : base de length × width et plateau supérieur de upperLength × upperWidth, d'une hauteur height.
---Source : lua/ge/extensions/util/trackBuilder/proceduralPrimitives.lua:289
---@param length number|nil Longueur de la base (2 par défaut).
---@param width number|nil Largeur de la base (5 par défaut).
---@param height number|nil Hauteur (1 par défaut).
---@param upperLength number|nil Longueur du plateau (0,5 par défaut).
---@param upperWidth number|nil Largeur du plateau (4 par défaut).
---@param material string|nil Matériau.
---@return table  Mesh procédural.
function util_trackBuilder_proceduralPrimitives.createBump(length, width, height, upperLength, upperWidth, material) end

--- Cône d'axe Z centré sur l'origine, pointe en haut.
---Source : lua/ge/extensions/util/trackBuilder/proceduralPrimitives.lua:406
---@param radius number Diamètre de la base (divisé par 2 en interne).
---@param height number Hauteur en mètres.
---@param material string|nil Matériau.
---@return table  Mesh procédural.
function util_trackBuilder_proceduralPrimitives.createCone(radius, height, material) end

--- Parallélépipède centré sur l'origine. uvStyle choisit la disposition des UV (1 par défaut).
---Source : lua/ge/extensions/util/trackBuilder/proceduralPrimitives.lua:472
---@param size vec3|nil Dimensions ; vec3(1,1,1) par défaut. x et y sont échangés en interne.
---@param material string|nil Matériau.
---@param uvStyle any Style d'UV (1 par défaut ; la valeur est comparée à 1).
---@return table  Mesh procédural.
function util_trackBuilder_proceduralPrimitives.createCube(size, material, uvStyle) end

--- Cylindre d'axe Z centré sur l'origine, avec faces haut et bas.
---Source : lua/ge/extensions/util/trackBuilder/proceduralPrimitives.lua:66
---@param radius number Diamètre (divisé par 2 en interne).
---@param height number Hauteur en mètres.
---@param material string|nil Matériau.
---@return table  Mesh procédural.
function util_trackBuilder_proceduralPrimitives.createCylinder(radius, height, material) end

--- Rampe de longueur len, qui monte jusqu'à la hauteur hei. thinning rétrécit la largeur en haut, attack règle la courbure du profil (puissance), twist ajoute une torsion le long de la rampe.
---Source : lua/ge/extensions/util/trackBuilder/proceduralPrimitives.lua:160
---@param width number|nil Largeur de la base (5 par défaut).
---@param len number|nil Longueur (10 par défaut).
---@param hei number|nil Hauteur finale (2 par défaut).
---@param thinning number|nil Facteur de largeur en haut, borné à [0, 2] (0,5 par défaut).
---@param attack number|nil Exposant du profil de hauteur, minimum 1.
---@param twist number|nil Torsion totale (0 par défaut ; unité déduite du code : radians).
---@param material string|nil Matériau.
---@return table  Mesh procédural.
function util_trackBuilder_proceduralPrimitives.createRamp(width, len, hei, thinning, attack, twist, material) end

--- Tore (anneau) centré sur l'origine, dans le plan YZ.
---Source : lua/ge/extensions/util/trackBuilder/proceduralPrimitives.lua:8
---@param radius number Paramètre de rayon ; multiplié par 2 en interne.
---@param thickness number Épaisseur du tube ; divisée par 2 en interne.
---@param material string|nil Matériau (défaut 'track_editor_A_border').
---@return table  Mesh procédural.
function util_trackBuilder_proceduralPrimitives.createRing(radius, thickness, material) end

