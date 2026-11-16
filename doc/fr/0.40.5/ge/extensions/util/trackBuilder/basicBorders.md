# `util_trackBuilder_basicBorders`

*Fichier : `lua/ge/extensions/util/trackBuilder/basicBorders.lua` · VM : Game Engine (GE) · 421 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `util_trackBuilder_basicBorders` : `extensions.load("util_trackBuilder_basicBorders")`, puis la globale `util_trackBuilder_basicBorders`

Générateur des bordures gauche et droite d'un segment de piste du Track Builder. Il contient une bibliothèque de profils de bordure (regular, bevel, smoothedRect, racetrack, smallDiagonal, bigDiagonal, wideBevel, highBevel, rail, none) définis par des points de section et des UV. Au chargement il calcule normales et faces de chaque profil ; getMeshes extrude ensuite le profil choisi le long des points du segment et renvoie les données de mesh (sommets, UV, normales, faces, matériau).

## Remarques

- Le profil de chaque côté est choisi par segment.leftMesh et segment.rightMesh (noms de profil). Si segment.quality == 4 (basse qualité), le profil 'none' est utilisé des deux côtés.
- Le matériau vient de segment.materialInfo.leftMesh / rightMesh, sinon 'track_editor_A_border'.
- Les caps de début et de fin sont ajoutés selon segment.meshInfo.forceStartCap / forceEndCap.
- Chaque appel incrémente segment.submeshCount et enregistre l'indice dans segment.submeshIndexes (effet de bord sur le segment).
- Incohérence : les profils regular, bevel, smoothedRect et racetrack ont 'material = materialNames', variable globale non définie (donc nil) ; sans effet, le matériau réel venant du segment.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `util_trackBuilder_basicBorders.getMeshes(segment)` | Renvoie une liste de deux meshes (bordure gauche, bordure droite) pour le segment. Chaque mesh est une table {verts, uvs, normals, faces, material, tag}, tag valant 'side -1' ou 'side 1'. | 410 |

### Détail des paramètres

#### `util_trackBuilder_basicBorders.getMeshes(segment)`

Renvoie une liste de deux meshes (bordure gauche, bordure droite) pour le segment. Chaque mesh est une table {verts, uvs, normals, faces, material, tag}, tag valant 'side -1' ou 'side 1'.

- `segment` (*table*) : Segment du Track Builder (points, leftMesh, rightMesh, quality, materialInfo, meshInfo, submeshCount, submeshIndexes).
- **renvoie** : table[] Deux tables de mesh procédural.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/util/trackBuilder/basicBorders.lua`.*
