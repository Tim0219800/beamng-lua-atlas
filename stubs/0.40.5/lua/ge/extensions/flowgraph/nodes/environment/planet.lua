---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/environment/planet.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud, avec les fonctions de génération de planète.
---@class flowgraph_nodes_environment_planet_C
local flowgraph_nodes_environment_planet_C = {}

--- Appelle onNodeReset.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/environment/planet.lua:37
function flowgraph_nodes_environment_planet_C:_executionStopped() end

--- Construit les données de maillage (sommets, UV, normales lissées, faces, matériau) à partir d'une grille de points avec bordure.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/environment/planet.lua:163
---@param heightmap table grille 2D de points {x,y,z,origX,origY}
---@param uvScale number|nil échelle des UV (1 par défaut)
---@param material string|nil nom du matériau
---@return table  maillage {verts, uvs, normals, faces, material}
function flowgraph_nodes_environment_planet_C:createheightmapMesh(heightmap, uvScale, material) end

--- Éditeur : dessin de debug et gravité de surface (G*masse/rayon²).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/environment/planet.lua:123
---@param builder table constructeur de nœud
---@param style table style
function flowgraph_nodes_environment_planet_C:drawMiddle(builder, style) end

--- Extrait de la carte en croix la face de cube demandée (f, r, b, l, u, d), avec une bordure d'un point recopiée depuis les faces voisines (table blLookup), et met les coordonnées x/y à l'échelle des dimensions.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/environment/planet.lua:378
---@param grid table grille de hauteurs en croix de cube
---@param size integer taille d'une face
---@param identifier string face : f, r, b, l, u ou d
---@param dimensions number longueur de côté voulue
---@return table  face (size+2)² avec bordure
function flowgraph_nodes_environment_planet_C:getSquare(grid, size, identifier, dimensions) end

--- Charge un PNG (GBitmap) et renvoie une grille vec3(x, y, z) où z = luminosité moyenne 0-1 (signe inversé par défaut).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/environment/planet.lua:323
---@param path string chemin du PNG
---@param scale any non utilisé
---@param invertColors boolean|nil si vrai, z positif au lieu de négatif
---@return table  grille de hauteurs
function flowgraph_nodes_environment_planet_C:heightmapFromPNG(path, scale, invertColors) end

--- Active showDebug.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/environment/planet.lua:32
function flowgraph_nodes_environment_planet_C:init() end

--- Normale (z positif) du triangle p1, p3, p2.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/environment/planet.lua:289
---@param p1 table point central
---@param p3 table second voisin
---@param p2 table premier voisin
---@return vec3  normale normalisée
function flowgraph_nodes_environment_planet_C:normalFromPoints(p1, p3, p2) end

--- Supprime les planètes du véhicule (obj:setPlanets({})) et supprime les objets ProceduralMesh créés.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/environment/planet.lua:41
function flowgraph_nodes_environment_planet_C:onNodeReset() end

--- Crée un ProceduralMesh non sauvegardé dans MissionGroup avec le maillage, position et rotation donnés.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/environment/planet.lua:301
---@param name string|nil nom de l'objet
---@param mesh table maillage
---@param pos vec3|nil position
---@param rot quat|nil rotation
---@return userdata  objet ProceduralMesh
function flowgraph_nodes_environment_planet_C:placeObject(name, mesh, pos, rot) end

--- Déforme une grille plane en calotte sphérique (méthode angulaire, non utilisée par workOnce).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/environment/planet.lua:247
---@param sphereRadius number rayon
---@param heightmap table grille de points
---@param surfaceHeight number non utilisé
---@return table  grille déformée
function flowgraph_nodes_environment_planet_C:warpSphere(sphereRadius, heightmap, surfaceHeight) end

--- Projette une face de cube sur une sphère de rayon donné, avec relief = z * surfaceHeight.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/environment/planet.lua:264
---@param sphereRadius number rayon
---@param heightmap table face de cube avec bordure
---@param cLength number recalculée dans la fonction
---@param surfaceHeight number échelle du relief
---@return table  points projetés avec r
function flowgraph_nodes_environment_planet_C:warpSphereCubic(sphereRadius, heightmap, cLength, surfaceHeight) end

--- Applique la gravité planétaire au véhicule, crée le matériau, charge la carte de hauteur, génère les six faces de la planète et recharge les collisions (be:reloadCollision).
---Source : lua/ge/extensions/flowgraph/nodes/environment/planet.lua:57
function flowgraph_nodes_environment_planet_C:workOnce() end

