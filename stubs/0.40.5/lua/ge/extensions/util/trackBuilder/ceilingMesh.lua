---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/trackBuilder/ceilingMesh.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Générateur du plafond d'un segment de piste du Track Builder (utile pour les tunnels). Il définit un profil de section en U inversé (largeur 2, hauteur 1) puis l'extrude le long des points du segment, avec caps de début et de fin selon segment.meshInfo.
--- Accès : extension `util_trackBuilder_ceilingMesh` : `extensions.load("util_trackBuilder_ceilingMesh")`, puis la globale `util_trackBuilder_ceilingMesh`
---@class util_trackBuilder_ceilingMesh
util_trackBuilder_ceilingMesh = {}

--- Renvoie {mesh} pour le plafond du segment, ou {} si le plafond est désactivé ou en basse qualité.
---Source : lua/ge/extensions/util/trackBuilder/ceilingMesh.lua:324
---@param segment table Segment du Track Builder (points, quality, meshInfo.ceilingMesh, materialInfo, submeshCount, submeshIndexes).
---@return table[]  Liste d'au plus une table de mesh {verts, uvs, normals, faces, material, tag}.
function util_trackBuilder_ceilingMesh.getMeshes(segment) end

