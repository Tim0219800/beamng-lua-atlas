# `util_trackBuilder_borderWallMesh`

*Fichier : `lua/ge/extensions/util/trackBuilder/borderWallMesh.lua` · VM : Game Engine (GE) · 248 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `util_trackBuilder_borderWallMesh` : `extensions.load("util_trackBuilder_borderWallMesh")`, puis la globale `util_trackBuilder_borderWallMesh`

Générateur des murs latéraux (gauche et droit) d'un segment de piste du Track Builder. Il définit un profil de mur en boîte (24 faces) et, selon la hauteur du mur du segment et la qualité, extrude ce profil le long des points du segment, avec des caps de début et de fin facultatifs.

## Remarques

- Chaque mur n'est généré que si segment.meshInfo.leftWall.active (ou rightWall.active) est vrai ; sinon la liste contient nil à sa place.
- Les hauteurs viennent de segment.leftWallHeight / rightWallHeight (via les champs 'leftWallHeight' et 'rightWallHeight' passés à compileMeshInfo).
- Si segment.quality == 4, getMeshes renvoie une table vide.
- Matériau : segment.materialInfo.leftWall / rightWall, sinon 'track_editor_A_border'. Tag : 'side -1' ou 'side 1'.
- Effet de bord : incrémente segment.submeshCount et remplit segment.submeshIndexes.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `util_trackBuilder_borderWallMesh.getMeshes(segment)` | Renvoie les meshes des murs gauche et droit actifs du segment. | 239 |

### Détail des paramètres

#### `util_trackBuilder_borderWallMesh.getMeshes(segment)`

Renvoie les meshes des murs gauche et droit actifs du segment.

- `segment` (*table*) : Segment du Track Builder (points, quality, meshInfo.leftWall/rightWall, materialInfo, submeshCount, submeshIndexes).
- **renvoie** : table[] Liste de tables de mesh {verts, uvs, normals, faces, material, tag} (peut contenir des nil).

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/util/trackBuilder/borderWallMesh.lua`.*
