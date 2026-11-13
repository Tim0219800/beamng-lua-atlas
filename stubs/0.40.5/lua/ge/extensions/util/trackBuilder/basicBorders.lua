---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/trackBuilder/basicBorders.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Générateur des bordures gauche et droite d'un segment de piste du Track Builder. Il contient une bibliothèque de profils de bordure (regular, bevel, smoothedRect, racetrack, smallDiagonal, bigDiagonal, wideBevel, highBevel, rail, none) définis par des points de section et des UV. Au chargement il calcule normales et faces de chaque profil ; getMeshes extrude ensuite le profil choisi le long des points du segment et renvoie les données de mesh (sommets, UV, normales, faces, matériau).
--- Accès : extension `util_trackBuilder_basicBorders` : `extensions.load("util_trackBuilder_basicBorders")`, puis la globale `util_trackBuilder_basicBorders`
---@class util_trackBuilder_basicBorders
util_trackBuilder_basicBorders = {}

--- Renvoie une liste de deux meshes (bordure gauche, bordure droite) pour le segment. Chaque mesh est une table {verts, uvs, normals, faces, material, tag}, tag valant 'side -1' ou 'side 1'.
---Source : lua/ge/extensions/util/trackBuilder/basicBorders.lua:410
---@param segment table Segment du Track Builder (points, leftMesh, rightMesh, quality, materialInfo, meshInfo, submeshCount, submeshIndexes).
---@return table[]  Deux tables de mesh procédural.
function util_trackBuilder_basicBorders.getMeshes(segment) end

