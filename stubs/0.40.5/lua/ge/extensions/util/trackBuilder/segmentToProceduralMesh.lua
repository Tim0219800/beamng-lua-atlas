---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/trackBuilder/segmentToProceduralMesh.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Transforme un segment de piste du Track Builder en objet ProceduralMesh dans la scène. Il calcule le repère local (nx, ny, nz) de chaque point de contrôle, assemble les meshes des modules basicBorders, basicCenters, borderWallMesh et ceilingMesh, puis crée (ou met à jour) l'objet 'procMesh<subTrackIndex>-<index>' dans MissionGroup.
--- Accès : extension `util_trackBuilder_segmentToProceduralMesh` : `extensions.load("util_trackBuilder_segmentToProceduralMesh")`, puis la globale `util_trackBuilder_segmentToProceduralMesh`
---@class util_trackBuilder_segmentToProceduralMesh
---@field settings nil Toujours nil : exporte une variable locale jamais définie (bug).
util_trackBuilder_segmentToProceduralMesh = {}

--- Pour chaque point du segment disponible pour la qualité courante (controlPoint.quality[segment.quality]), calcule orientation = {nx, ny, nz} en tournant les axes X, Y, Z par controlPoint.finalRot.
---Source : lua/ge/extensions/util/trackBuilder/segmentToProceduralMesh.lua:55
---@param segment table Segment dont les points reçoivent le champ orientation.
function util_trackBuilder_segmentToProceduralMesh.calculatePointCoordinateSystem(segment) end

--- Demande à basicCenters de vider ses caches de profils (sans effet réel, voir notes).
---Source : lua/ge/extensions/util/trackBuilder/segmentToProceduralMesh.lua:48
function util_trackBuilder_segmentToProceduralMesh.clearShapes() end

--- Concatène les meshes des bordures, du centre, des murs et du plafond du segment et les renvoie sous forme de liste. Les caps de début et fin sont gérés par les modules appelés.
---Source : lua/ge/extensions/util/trackBuilder/segmentToProceduralMesh.lua:76
---@param segment table Segment du Track Builder.
---@param lod any Non utilisé.
---@return table[]  Liste de tables de mesh {verts, uvs, normals, faces, material, tag}.
function util_trackBuilder_segmentToProceduralMesh.compileMeshInfo(segment, lod) end

--- Renvoie les modules basicCenters et basicBorders (utilisés pour injecter ces dépendances dans multiTrackMerger.setReferences).
---Source : lua/ge/extensions/util/trackBuilder/segmentToProceduralMesh.lua:95
---@return table  {basicCenters = module, basicBorders = module}.
function util_trackBuilder_segmentToProceduralMesh.getReferences() end

--- Fonction principale : calcule les repères des points, compile les meshes du segment et crée ou met à jour son ProceduralMesh (stocké dans segment.mesh).
---Source : lua/ge/extensions/util/trackBuilder/segmentToProceduralMesh.lua:16
---@param segment table Segment avec points, quality, subTrackIndex, index (et mesh s'il existe déjà).
function util_trackBuilder_segmentToProceduralMesh.materialize(segment) end

--- Renvoie le vecteur v tourné par le quaternion q (q * v).
---Source : lua/ge/extensions/util/trackBuilder/segmentToProceduralMesh.lua:92
---@param v vec3 Vecteur à tourner.
---@param q quat Rotation.
---@return vec3  Vecteur tourné.
function util_trackBuilder_segmentToProceduralMesh.rotateVectorByQuat(v, q) end

