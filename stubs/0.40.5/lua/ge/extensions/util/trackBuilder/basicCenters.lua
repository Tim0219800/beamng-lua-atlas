---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/trackBuilder/basicCenters.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Générateur de la surface centrale (la chaussée) d'un segment de piste du Track Builder. Trois profils de section sont définis : regular (surface et dessous bombés), halfRegular et low (version simplifiée utilisée en basse qualité). getMeshes calcule les normales et renvoie le mesh extrudé le long des points du segment.
--- Accès : extension `util_trackBuilder_basicCenters` : `extensions.load("util_trackBuilder_basicCenters")`, puis la globale `util_trackBuilder_basicCenters`
---@class util_trackBuilder_basicCenters
util_trackBuilder_basicCenters = {}

--- Prévu pour vider le cache de sommets (vertexLUT) de chaque profil et réinitialiser LUTMax/LUTMin. Ne fait rien en pratique (voir notes).
---Source : lua/ge/extensions/util/trackBuilder/basicCenters.lua:383
function util_trackBuilder_basicCenters.clearShapes() end

--- Renvoie {mesh} pour la surface centrale du segment, ou {} si le profil demandé n'existe pas.
---Source : lua/ge/extensions/util/trackBuilder/basicCenters.lua:371
---@param segment table Segment du Track Builder (points, centerMesh, quality, materialInfo, meshInfo, submeshCount, submeshIndexes).
---@return table[]  Liste d'au plus une table de mesh {verts, uvs, normals, faces, material, tag}.
function util_trackBuilder_basicCenters.getMeshes(segment) end

