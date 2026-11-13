---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/trackBuilder/borderWallMesh.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Générateur des murs latéraux (gauche et droit) d'un segment de piste du Track Builder. Il définit un profil de mur en boîte (24 faces) et, selon la hauteur du mur du segment et la qualité, extrude ce profil le long des points du segment, avec des caps de début et de fin facultatifs.
--- Accès : extension `util_trackBuilder_borderWallMesh` : `extensions.load("util_trackBuilder_borderWallMesh")`, puis la globale `util_trackBuilder_borderWallMesh`
---@class util_trackBuilder_borderWallMesh
util_trackBuilder_borderWallMesh = {}

--- Renvoie les meshes des murs gauche et droit actifs du segment.
---Source : lua/ge/extensions/util/trackBuilder/borderWallMesh.lua:239
---@param segment table Segment du Track Builder (points, quality, meshInfo.leftWall/rightWall, materialInfo, submeshCount, submeshIndexes).
---@return table[]  Liste de tables de mesh {verts, uvs, normals, faces, material, tag} (peut contenir des nil).
function util_trackBuilder_borderWallMesh.getMeshes(segment) end

