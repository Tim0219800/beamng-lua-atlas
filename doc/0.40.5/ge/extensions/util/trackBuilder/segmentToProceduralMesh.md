# `util_trackBuilder_segmentToProceduralMesh`

*Fichier : `lua/ge/extensions/util/trackBuilder/segmentToProceduralMesh.lua` · VM : Game Engine (GE) · 106 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `util_trackBuilder_segmentToProceduralMesh` : `extensions.load("util_trackBuilder_segmentToProceduralMesh")`, puis la globale `util_trackBuilder_segmentToProceduralMesh`

Transforme un segment de piste du Track Builder en objet ProceduralMesh dans la scène. Il calcule le repère local (nx, ny, nz) de chaque point de contrôle, assemble les meshes des modules basicBorders, basicCenters, borderWallMesh et ceilingMesh, puis crée (ou met à jour) l'objet 'procMesh<subTrackIndex>-<index>' dans MissionGroup.

## Remarques

- materialize réutilise segment.mesh s'il existe (createMesh à nouveau) et le crée sinon ; l'objet a canSave = false.
- Le même tableau de meshes est donné trois fois (segment.meshes[1], [2], [3]) : il n'y a pas de LOD distinct.
- materialize remet submeshIndexes/submeshCount à zéro, puis submeshCount à nil après la compilation ; segment.meshes est effacé à la fin.
- Bug : M.settings = settings, mais la variable settings n'existe pas dans ce fichier ; le champ vaut nil.
- Le paramètre lod de compileMeshInfo n'est pas utilisé.
- clearShapes délègue à basicCenters.clearShapes, qui ne fait rien en pratique.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `util_trackBuilder_segmentToProceduralMesh.calculatePointCoordinateSystem(segment)` | Pour chaque point du segment disponible pour la qualité courante (controlPoint.quality[segment.quality]), calcule orientation = {nx, ny, nz} en tournant les axes X, Y, Z par controlPoint.finalRot. | 55 |
| `util_trackBuilder_segmentToProceduralMesh.clearShapes()` | Demande à basicCenters de vider ses caches de profils (sans effet réel, voir notes). | 48 |
| `util_trackBuilder_segmentToProceduralMesh.compileMeshInfo(segment, lod)` | Concatène les meshes des bordures, du centre, des murs et du plafond du segment et les renvoie sous forme de liste. Les caps de début et fin sont gérés par les modules appelés. | 76 |
| `util_trackBuilder_segmentToProceduralMesh.getReferences()` | Renvoie les modules basicCenters et basicBorders (utilisés pour injecter ces dépendances dans multiTrackMerger.setReferences). | 95 |
| `util_trackBuilder_segmentToProceduralMesh.materialize(segment)` | Fonction principale : calcule les repères des points, compile les meshes du segment et crée ou met à jour son ProceduralMesh (stocké dans segment.mesh). | 16 |
| `util_trackBuilder_segmentToProceduralMesh.rotateVectorByQuat(v, q)` | Renvoie le vecteur v tourné par le quaternion q (q * v). | 92 |

### Détail des paramètres

#### `util_trackBuilder_segmentToProceduralMesh.calculatePointCoordinateSystem(segment)`

Pour chaque point du segment disponible pour la qualité courante (controlPoint.quality[segment.quality]), calcule orientation = {nx, ny, nz} en tournant les axes X, Y, Z par controlPoint.finalRot.

- `segment` (*table*) : Segment dont les points reçoivent le champ orientation.

#### `util_trackBuilder_segmentToProceduralMesh.compileMeshInfo(segment, lod)`

Concatène les meshes des bordures, du centre, des murs et du plafond du segment et les renvoie sous forme de liste. Les caps de début et fin sont gérés par les modules appelés.

- `segment` (*table*) : Segment du Track Builder.
- `lod` (*any*) : Non utilisé.
- **renvoie** : table[] Liste de tables de mesh {verts, uvs, normals, faces, material, tag}.

#### `util_trackBuilder_segmentToProceduralMesh.getReferences()`

Renvoie les modules basicCenters et basicBorders (utilisés pour injecter ces dépendances dans multiTrackMerger.setReferences).

- **renvoie** : table {basicCenters = module, basicBorders = module}.

#### `util_trackBuilder_segmentToProceduralMesh.materialize(segment)`

Fonction principale : calcule les repères des points, compile les meshes du segment et crée ou met à jour son ProceduralMesh (stocké dans segment.mesh).

- `segment` (*table*) : Segment avec points, quality, subTrackIndex, index (et mesh s'il existe déjà).

#### `util_trackBuilder_segmentToProceduralMesh.rotateVectorByQuat(v, q)`

Renvoie le vecteur v tourné par le quaternion q (q * v).

- `v` (*vec3*) : Vecteur à tourner.
- `q` (*quat*) : Rotation.
- **renvoie** : vec3 Vecteur tourné.

## Champs

| Champ | Type | Description |
|---|---|---|
| `settings` | nil | Toujours nil : exporte une variable locale jamais définie (bug). |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/util/trackBuilder/segmentToProceduralMesh.lua`.*
