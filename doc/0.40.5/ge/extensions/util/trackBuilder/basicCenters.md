# `util_trackBuilder_basicCenters`

*Fichier : `lua/ge/extensions/util/trackBuilder/basicCenters.lua` · VM : Game Engine (GE) · 395 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `util_trackBuilder_basicCenters` : `extensions.load("util_trackBuilder_basicCenters")`, puis la globale `util_trackBuilder_basicCenters`

Générateur de la surface centrale (la chaussée) d'un segment de piste du Track Builder. Trois profils de section sont définis : regular (surface et dessous bombés), halfRegular et low (version simplifiée utilisée en basse qualité). getMeshes calcule les normales et renvoie le mesh extrudé le long des points du segment.

## Remarques

- Le profil est choisi par segment.centerMesh ; si ce nom n'existe pas, getMeshes renvoie une liste vide. Si segment.quality == 4, le profil 'low' est forcé.
- Matériau : segment.materialInfo.centerMesh, sinon 'track_editor_A_center'. Tag du mesh : 'center'.
- Effet de bord : incrémente segment.submeshCount et remplit segment.submeshIndexes.
- Bug : clearShapes utilise ipairs sur la table shapes, qui est indexée par nom (regular, halfRegular, low) ; la boucle ne s'exécute donc jamais et la fonction ne vide rien.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `util_trackBuilder_basicCenters.clearShapes()` | Prévu pour vider le cache de sommets (vertexLUT) de chaque profil et réinitialiser LUTMax/LUTMin. Ne fait rien en pratique (voir notes). | 383 |
| `util_trackBuilder_basicCenters.getMeshes(segment)` | Renvoie {mesh} pour la surface centrale du segment, ou {} si le profil demandé n'existe pas. | 371 |

### Détail des paramètres

#### `util_trackBuilder_basicCenters.getMeshes(segment)`

Renvoie {mesh} pour la surface centrale du segment, ou {} si le profil demandé n'existe pas.

- `segment` (*table*) : Segment du Track Builder (points, centerMesh, quality, materialInfo, meshInfo, submeshCount, submeshIndexes).
- **renvoie** : table[] Liste d'au plus une table de mesh {verts, uvs, normals, faces, material, tag}.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/util/trackBuilder/basicCenters.lua`.*
