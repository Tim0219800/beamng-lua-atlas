# `editor_heroRoadEditor_mesh`

*Fichier : `lua/ge/extensions/editor/heroRoadEditor/mesh.lua` · VM : Game Engine (GE) · 1113 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_heroRoadEditor_mesh` : `extensions.load("editor_heroRoadEditor_mesh")`, puis la globale `editor_heroRoadEditor_mesh`

Génération du maillage de conduite procédural d'un groupe du Hero Road Editor. Balaye les coupes de profile.lua le long de la ligne centrale 3D (divPoints) : chaussée, accotements, chanfreins périphériques, nids-de-poule creusés, et groupes de surface (groundmodels) répartis par matériau. Produit des ProceduralMesh avec collision pour l'édition (nommés 'HeroRoad_<id>_<n>', découpés en chunks) et, pour le bake, les chunks avec niveaux de détail et maillage de collision. Il remplit aussi les champs dérivés que d'autres modules lisent (meshEdgeL/R, meshEdgeDirL/R, meshEdgeUp, meshGrid, meshVArc, meshStationCount, triCount).

## Remarques

- La surface éditable EST le LOD0 : le maillage vivant est construit avec la même tolérance que le niveau proche du bake ; les LOD plus grossiers ne sont produits qu'au bake (buildChunkLODs).
- Découpage en chunks : longueur chunkLenM (défaut 120, min 20 m) ; pas de coupure si la route fait au plus 1.5 chunk. Les coupures sont partagées par tous les LOD et la collision pour éviter les fissures.
- Échelle des LOD (taille px / qualité cm / longueur max de triangle m) : LOD0 400 / 1.0 / 20, LOD1 150 / 3.0 / 30, LOD2 40 / 8.0 / 45 (champs group.lodSize0..2, lodQualityCm0..2, lodMaxSegM0..2). Si group.lodFarNull ~= false (défaut), le dernier niveau devient un niveau 'nulldetail' (rien n'est dessiné en dessous de sa taille) et nullSize est renvoyé. Le LOD visible le plus grossier supprime le chanfrein. Un LOD n'est gardé que s'il économise plus de 2 % de triangles par rapport au précédent.
- Collision : surface de chaussée détaillée sans chanfrein, tolérance group.collisionTolCm (défaut 1.0 cm), longueur max group.lodMaxSegM0 (20 m). Les nids-de-poule ne sont creusés que dans LOD0 et la collision.
- Constantes : matériau par défaut 'm_asphalt_new_01' (chaussée et accotement), texture 4 m x 4 m, chanfrein 0.6 m de large pour 0.1 m de chute (angle max 70 degrés), extension coplanaire de 1.0 m au-delà de chaque extrémité (pour que les décalques se drapent entièrement).
- Les ProceduralMesh vivants ont canSave=false : ils sont reconstruits depuis la spline au chargement.
- Le défaut de group.latRes est 4 dans profile.lua mais 16 dans la signature de cache de lodPreview et à la création d'un groupe (groupMgr) ; seul le défaut du groupe neuf (16) joue en pratique.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_heroRoadEditor_mesh.buildChunkLODs(group, chunkLenM)` | Construit toute la charge utile du bake : pour chaque chunk d'environ chunkLenM, son jeu de LOD visibles et un maillage de collision de chaussée seule. Les coupures sont calculées une fois à partir de la longueur d'arc pleine résolution et partagées par tous les niveaux. Les LOD de nombre de triangles quasi égal sont abandonnés. | 883 |
| `editor_heroRoadEditor_mesh.buildExportParts(group, opts, jLo, jHi, isFirst, isLast, cutArcs)` | Assemble la géométrie de conduite en une liste de parts de matériau (meshPart) ; c'est la fonction interne assemble exportée sous ce nom. Écrase les champs dérivés du groupe (bords, grille, vArc, triCount...). Avec jLo/jHi, ne construit que les stations de ce chunk. | 371 |
| `editor_heroRoadEditor_mesh.buildRibbonEdges(group)` | Reconstruction LÉGÈRE des seuls bords supérieurs extérieurs (group.meshEdgeL/R) pendant un glissement, quand grille, collision et décalques sont démontés. Réutilise profile.build et worldStation sur les deux points extrêmes de la coupe, avec la même extension de fin : le ruban suit exactement le bord que le maillage complet aura. Met aussi à jour group.divBankR (axe droit incliné, pour la carte de chaleur). Efface les bords si la géométrie est insuffisante. | 1033 |
| `editor_heroRoadEditor_mesh.buildTerrainEdges(group)` | Construit des repères de bord PLATS (relevés à l'horizontale) pour une route en mode terrain : group.meshEdgeL/R décalés de leftExtM/rightExtM (défaut 4.0 m) le long du binormal, meshEdgeDirL/R, meshEdgeUp = (0,0,1), et met meshGrid à nil (pas de grille de chaussée en mode terrain). | 1068 |
| `editor_heroRoadEditor_mesh.chunkCount(total, chunkLenM)` | Nombre de chunks DAE qu'un bake produira pour une longueur d'arc totale et une longueur de chunk données (reflète le baker). L'interface doit passer la même longueur d'arc que le bake (group.meshVArc[fin]). | 810 |
| `editor_heroRoadEditor_mesh.lodPreview(group)` | Calcule, pour le panneau Export, le nombre de triangles de la route entière pour chaque LOD visible. Le résultat est mis en cache par groupe (signature des paramètres de LOD, de résolution, de géométrie et des nids-de-poule) et les champs dérivés du groupe écrasés par l'assemblage sont restaurés ensuite. Écrit aussi group.lodMaxEdgeM. | 924 |
| `editor_heroRoadEditor_mesh.removeMesh(group)` | Supprime les ProceduralMesh du groupe : celui hérité sans suffixe ('HeroRoad_<id>') et chaque chunk 'HeroRoad_<id>_<n>' jusqu'au premier trou. | 68 |
| `editor_heroRoadEditor_mesh.updateMesh(group)` | Reconstruit le maillage LOD0 (niveau proche) vivant du groupe : supprime l'ancien, assemble la géométrie, la découpe en chunks, crée un ProceduralMesh avec collision par chunk dans le dossier de scène du groupe et remplit group.meshIds / group.meshId. Appelé par le pipeline de reconstruction à chaque modification ; ne fait rien sans dossier de scène (sceneTreeFolderId). | 1098 |

### Détail des paramètres

#### `editor_heroRoadEditor_mesh.buildChunkLODs(group, chunkLenM)`

Construit toute la charge utile du bake : pour chaque chunk d'environ chunkLenM, son jeu de LOD visibles et un maillage de collision de chaussée seule. Les coupures sont calculées une fois à partir de la longueur d'arc pleine résolution et partagées par tous les niveaux. Les LOD de nombre de triangles quasi égal sont abandonnés.

- `group` (*table*) : Groupe Hero Road.
- `chunkLenM` (*number|nil*) : Longueur de chunk en mètres (min 20, défaut 120).
- **renvoie** : table|nil Liste de chunks { lods = { {size, parts}, ... }, col = { part, ... } }, ou nil s'il n'y a rien à construire.
- **renvoie** : number|nil nullSize : taille en px du niveau 'nulldetail' lointain, ou nil si le dernier niveau est un LOD visible.

#### `editor_heroRoadEditor_mesh.buildExportParts(group, opts, jLo, jHi, isFirst, isLast, cutArcs)`

Assemble la géométrie de conduite en une liste de parts de matériau (meshPart) ; c'est la fonction interne assemble exportée sous ce nom. Écrase les champs dérivés du groupe (bords, grille, vArc, triCount...). Avec jLo/jHi, ne construit que les stations de ce chunk.

- `group` (*table*) : Groupe Hero Road (divPoints, tangents, matériaux, paramètres de profil).
- `opts` (*table|nil*) : Options : tol (tolérance de décimation en m, nil = pleine résolution), maxSeg (longueur max de segment en m), emitChamfer (false pour omettre les chanfreins), potholes (true pour creuser les nids-de-poule).
- `jLo` (*integer|nil*) : Première station du chunk.
- `jHi` (*integer|nil*) : Dernière station du chunk.
- `isFirst` (*boolean|nil*) : Chunk de début de route (déduit du code).
- `isLast` (*boolean|nil*) : Chunk de fin de route (déduit du code).
- `cutArcs` (*number[]|nil*) : Positions d'arc (m) des coupures de chunk.
- **renvoie** : table|nil Liste de parts (matériau, sommets, faces), ou nil si la géométrie est insuffisante.

#### `editor_heroRoadEditor_mesh.buildRibbonEdges(group)`

Reconstruction LÉGÈRE des seuls bords supérieurs extérieurs (group.meshEdgeL/R) pendant un glissement, quand grille, collision et décalques sont démontés. Réutilise profile.build et worldStation sur les deux points extrêmes de la coupe, avec la même extension de fin : le ruban suit exactement le bord que le maillage complet aura. Met aussi à jour group.divBankR (axe droit incliné, pour la carte de chaleur). Efface les bords si la géométrie est insuffisante.

- `group` (*table*) : Groupe Hero Road.

#### `editor_heroRoadEditor_mesh.buildTerrainEdges(group)`

Construit des repères de bord PLATS (relevés à l'horizontale) pour une route en mode terrain : group.meshEdgeL/R décalés de leftExtM/rightExtM (défaut 4.0 m) le long du binormal, meshEdgeDirL/R, meshEdgeUp = (0,0,1), et met meshGrid à nil (pas de grille de chaussée en mode terrain).

- `group` (*table*) : Groupe Hero Road (divPoints, binormals).

#### `editor_heroRoadEditor_mesh.chunkCount(total, chunkLenM)`

Nombre de chunks DAE qu'un bake produira pour une longueur d'arc totale et une longueur de chunk données (reflète le baker). L'interface doit passer la même longueur d'arc que le bake (group.meshVArc[fin]).

- `total` (*number*) : Longueur d'arc totale en mètres.
- `chunkLenM` (*number|nil*) : Longueur de chunk en mètres (min 20, défaut 120).
- **renvoie** : integer Nombre de chunks (au moins 1).

#### `editor_heroRoadEditor_mesh.lodPreview(group)`

Calcule, pour le panneau Export, le nombre de triangles de la route entière pour chaque LOD visible. Le résultat est mis en cache par groupe (signature des paramètres de LOD, de résolution, de géométrie et des nids-de-poule) et les champs dérivés du groupe écrasés par l'assemblage sont restaurés ensuite. Écrit aussi group.lodMaxEdgeM.

- `group` (*table*) : Groupe Hero Road.
- **renvoie** : table { lods = { {size, tris, kept}, ... }, nullSize = number|nil } ; kept indique si le niveau est conservé au bake.

#### `editor_heroRoadEditor_mesh.removeMesh(group)`

Supprime les ProceduralMesh du groupe : celui hérité sans suffixe ('HeroRoad_<id>') et chaque chunk 'HeroRoad_<id>_<n>' jusqu'au premier trou.

- `group` (*table*) : Groupe Hero Road.

#### `editor_heroRoadEditor_mesh.updateMesh(group)`

Reconstruit le maillage LOD0 (niveau proche) vivant du groupe : supprime l'ancien, assemble la géométrie, la découpe en chunks, crée un ProceduralMesh avec collision par chunk dans le dossier de scène du groupe et remplit group.meshIds / group.meshId. Appelé par le pipeline de reconstruction à chaque modification ; ne fait rien sans dossier de scène (sceneTreeFolderId).

- `group` (*table*) : Groupe Hero Road.

## Appels vers le moteur (C++)

- `obj:` `delete`
- `scenetree.` `findObject`, `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/heroRoadEditor/mesh.lua`.*
