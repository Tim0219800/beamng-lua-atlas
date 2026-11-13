# `editor_assemblySpline_distribution`

*Fichier : `lua/ge/extensions/editor/assemblySpline/distribution.lua` · VM : Game Engine (GE) · 180 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_assemblySpline_distribution` : `extensions.load("editor_assemblySpline_distribution")`, puis la globale `editor_assemblySpline_distribution`

Calcule, pour l'outil Assembly Spline, quel mesh placer à chaque emplacement le long de la spline pour chaque composant rigide et chaque pont (bridge) de la molécule. Chaque composant est un groupe (mesh de base + variations) : si isRandom, chaque emplacement tire une variation selon ses poids randomWeight normalisés ; sinon les variations activées sont alternées en tourniquet (round robin). Ne tient compte que des composants activés pour la spline (mol.getRigidEnabled / getBridgeEnabled).

## Remarques

- Les tableaux de résultat sont préalloués et réutilisés d'un appel à l'autre (indexés par id de mesh) : ne pas les conserver après un nouvel appel de computeMeshMap.
- Les ponts reçoivent numPlacements - 1 emplacements (un pont relie deux placements consécutifs).
- Un groupe sans composant activé donne un tableau vide partagé (emptyTable) : ne pas le modifier.
- Le tirage utilise math.random (non déterministe sauf si la graine globale est fixée ailleurs).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_assemblySpline_distribution.computeMeshMap(molecule, numPlacements, spline)` | Calcule les cartes de meshes pour tous les composants rigides et ponts de la molécule. | 114 |

### Détail des paramètres

#### `editor_assemblySpline_distribution.computeMeshMap(molecule, numPlacements, spline)`

Calcule les cartes de meshes pour tous les composants rigides et ponts de la molécule.

- `molecule` (*table*) : Molécule avec les listes rigids et bridges (chaque entrée : mesh, variations, isRandom, randomWeight).
- `numPlacements` (*integer*) : Nombre d'emplacements le long de la spline.
- `spline` (*table*) : Assembly spline (pour l'état activé/désactivé des composants).
- **renvoie** : table rigidMaps : pour chaque rigide (même indice que molecule.rigids), tableau des meshPath par emplacement.
- **renvoie** : table bridgeMaps : idem pour les ponts, sur numPlacements - 1 emplacements.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/assemblySpline/distribution.lua`.*
