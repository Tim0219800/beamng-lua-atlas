# `editor_meshSpline_populationEngine`

*Fichier : `lua/ge/extensions/editor/meshSpline/populationEngine.lua` · VM : Game Engine (GE) · 102 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_meshSpline_populationEngine` : `extensions.load("editor_meshSpline_populationEngine")`, puis la globale `editor_meshSpline_populationEngine`

Petit moteur de géométrie utilisé par l'outil Mesh Spline : il calcule la géométrie dérivée d'une spline (points subdivisés, largeurs, tangentes, normales) à partir de ses nœuds de contrôle (Catmull-Rom, libre, projetée sur le terrain ou par raycast), puis échantillonne des positions le long de cette courbe pour placer des meshes. S'appuie sur editor/toolUtilities/geom et util. Appelé par splineMgr et populate, pas par un moddeur directement.

## Remarques

- Les tables de sortie (outPositions, outTangents, outNormals) sont réutilisées et modifiées en place pour éviter les allocations ; elles sont vidées si la spline n'a pas au moins 2 points subdivisés.
- Si spline.isConformToTerrain est vrai, les nœuds sont modifiés en z (hauteur du terrain + rayPostFloat, ou raycast vertical).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_meshSpline_populationEngine.clearDerivedGeometry(spline)` | Vide les tables dérivées de la spline : divPoints, divWidths, tangents, binormals, normals et discMap. | 10 |
| `editor_meshSpline_populationEngine.intervalFrame(positions, tangents, normals, index, outPosition, outTangent, outUp, previousAcross)` | Calcule le repère local (position, tangente, vecteur haut) de l'intervalle entre les échantillons index et index+1 (geom.ribbonIntervalFrame). | 75 |
| `editor_meshSpline_populationEngine.sample(spline, spacing, outPositions, outTangents, outNormals, useEvenFit)` | Échantillonne la spline à intervalle régulier. Avec useEvenFit, spacing est une cible : un élément est verrouillé aux deux extrémités et l'intérieur est espacé le plus uniformément possible (geom.sampleSplineEvenFit, tient compte de isLoop). Sinon marche à période fixe (geom.sampleSpline). | 46 |
| `editor_meshSpline_populationEngine.updateGeometry(spline, minimumDivisions)` | Recalcule la géométrie dérivée de la spline. Avec moins de 2 nœuds, vide la géométrie et renvoie false. Si isConformToTerrain : abaisse les nœuds sur le terrain (terrainOnly) ou par raycast vertical, puis utilise catmullRomConformToTerrain / catmullRomRaycast ; sinon catmullRomFree. | 19 |

### Détail des paramètres

#### `editor_meshSpline_populationEngine.clearDerivedGeometry(spline)`

Vide les tables dérivées de la spline : divPoints, divWidths, tangents, binormals, normals et discMap.

- `spline` (*table*) : Spline de l'outil Mesh Spline.

#### `editor_meshSpline_populationEngine.intervalFrame(positions, tangents, normals, index, outPosition, outTangent, outUp, previousAcross)`

Calcule le repère local (position, tangente, vecteur haut) de l'intervalle entre les échantillons index et index+1 (geom.ribbonIntervalFrame).

- `positions` (*table*) : Positions échantillonnées.
- `tangents` (*table*) : Tangentes échantillonnées.
- `normals` (*table*) : Normales échantillonnées.
- `index` (*integer*) : Indice de départ de l'intervalle (base 1).
- `outPosition` (*vec3*) : Reçoit la position (déduit du code).
- `outTangent` (*vec3*) : Reçoit la tangente (déduit du code).
- `outUp` (*vec3*) : Reçoit le vecteur haut (déduit du code).
- `previousAcross` (*vec3|nil*) : Vecteur transversal de l'intervalle précédent, pour la continuité (déduit du code).
- **renvoie** : boolean false si positions[index] ou positions[index+1] n'existe pas, sinon true.

#### `editor_meshSpline_populationEngine.sample(spline, spacing, outPositions, outTangents, outNormals, useEvenFit)`

Échantillonne la spline à intervalle régulier. Avec useEvenFit, spacing est une cible : un élément est verrouillé aux deux extrémités et l'intérieur est espacé le plus uniformément possible (geom.sampleSplineEvenFit, tient compte de isLoop). Sinon marche à période fixe (geom.sampleSpline).

- `spline` (*table*) : Spline avec divPoints, tangents, normals, isLoop.
- `spacing` (*number*) : Période en mètres entre deux positions.
- `outPositions` (*table*) : Table remplie avec les positions.
- `outTangents` (*table*) : Table remplie avec les tangentes.
- `outNormals` (*table*) : Table remplie avec les normales.
- `useEvenFit` (*boolean|nil*) : Active l'échantillonnage extrémités verrouillées.
- **renvoie** : table outPositions.
- **renvoie** : table outTangents.
- **renvoie** : table outNormals.

#### `editor_meshSpline_populationEngine.updateGeometry(spline, minimumDivisions)`

Recalcule la géométrie dérivée de la spline. Avec moins de 2 nœuds, vide la géométrie et renvoie false. Si isConformToTerrain : abaisse les nœuds sur le terrain (terrainOnly) ou par raycast vertical, puis utilise catmullRomConformToTerrain / catmullRomRaycast ; sinon catmullRomFree.

- `spline` (*table*) : Spline avec nodes, widths, nmls, isConformToTerrain, terrainOnly, rayPostFloat.
- `minimumDivisions` (*integer*) : Nombre minimal de subdivisions par segment (transmis à geom).
- **renvoie** : boolean true si la spline a au moins 2 points subdivisés après calcul.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/meshSpline/populationEngine.lua`.*
