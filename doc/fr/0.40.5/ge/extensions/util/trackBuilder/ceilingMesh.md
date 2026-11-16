# `util_trackBuilder_ceilingMesh`

*Fichier : `lua/ge/extensions/util/trackBuilder/ceilingMesh.lua` · VM : Game Engine (GE) · 338 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `util_trackBuilder_ceilingMesh` : `extensions.load("util_trackBuilder_ceilingMesh")`, puis la globale `util_trackBuilder_ceilingMesh`

Générateur du plafond d'un segment de piste du Track Builder (utile pour les tunnels). Il définit un profil de section en U inversé (largeur 2, hauteur 1) puis l'extrude le long des points du segment, avec caps de début et de fin selon segment.meshInfo.

## Remarques

- getMeshes renvoie une liste vide si segment.quality == 4 ou si segment.meshInfo.ceilingMesh.active est faux.
- Matériau : segment.materialInfo.ceilingMesh, sinon 'track_editor_A_center'. Tag : 'ceiling'.
- Effet de bord : incrémente segment.submeshCount et enregistre l'indice dans segment.submeshIndexes.ceilingMesh.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `util_trackBuilder_ceilingMesh.getMeshes(segment)` | Renvoie {mesh} pour le plafond du segment, ou {} si le plafond est désactivé ou en basse qualité. | 324 |

### Détail des paramètres

#### `util_trackBuilder_ceilingMesh.getMeshes(segment)`

Renvoie {mesh} pour le plafond du segment, ou {} si le plafond est désactivé ou en basse qualité.

- `segment` (*table*) : Segment du Track Builder (points, quality, meshInfo.ceilingMesh, materialInfo, submeshCount, submeshIndexes).
- **renvoie** : table[] Liste d'au plus une table de mesh {verts, uvs, normals, faces, material, tag}.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/util/trackBuilder/ceilingMesh.lua`.*
