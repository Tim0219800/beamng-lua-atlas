# `util_trackBuilder_obstaclePlacer`

*Fichier : `lua/ge/extensions/util/trackBuilder/obstaclePlacer.lua` · VM : Game Engine (GE) · 180 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `util_trackBuilder_obstaclePlacer` : `extensions.load("util_trackBuilder_obstaclePlacer")`, puis la globale `util_trackBuilder_obstaclePlacer`

Place les obstacles d'une piste du Track Builder. Les obstacles à forme prédéfinie (sharp1, sharp2, obstacle1, obstacle2 : fichiers .dae du niveau GridMap) sont des objets TSStatic réutilisés et redimensionnés dynamiquement. Les obstacles procéduraux (ring, cube, cylinder, cone, bump, ramp) sont des ProceduralMesh créés par proceduralPrimitives, un ou plusieurs par segment.

## Remarques

- Un obstacle o est une table avec : value (type), variant, scale (vec3), position (vec3), rotation (quat), anchor, offset (0 à 1 le long du segment, 1 = repère de fin), material, et extra (vec3) pour bump et ramp. Un obstacle est prédéfini si shapeNames[o.value..o.variant] existe.
- La position est calculée depuis markerInfo (offset == 1 ou pas de points), le premier point (offset 0) ou le point correspondant à la longueur interpolée ; width/2*(anchor-1) décale latéralement.
- Pour les formes prédéfinies, l'échelle est permutée en vec3(scale.y, scale.x, scale.z) et une rotation de 90° autour de Z est appliquée.
- Les objets sont créés avec canSave = false et enregistrés sous les noms '<type>Obstacle<n>' et 'procObstacle<index>x<n>'.
- placeProceduralObstacles ne fait rien si segment.obstaclesChanged est faux. Détail : le drapeau n'est remis à false que si au moins un obstacle procédural existe (procCount > 0), il reste donc vrai sinon.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `util_trackBuilder_obstaclePlacer.clearReferences()` | Oublie les TSStatic d'obstacles mémorisés (vide les listes sans supprimer les objets de la scène). À appeler quand la scène est vidée. | 172 |
| `util_trackBuilder_obstaclePlacer.placeObstacles(track)` | Place tous les obstacles prédéfinis de la piste (en créant ou supprimant des TSStatic selon le besoin), puis appelle placeProceduralObstacles pour chaque segment. | 135 |
| `util_trackBuilder_obstaclePlacer.placeProceduralObstacles(segment)` | Crée, ajuste ou supprime les ProceduralMesh d'obstacles d'un segment, génère leur mesh selon le type (ring, cube, cylinder, cone, bump, ramp), les positionne et les oriente. Ne fait rien si segment.obstaclesChanged est faux. | 72 |

### Détail des paramètres

#### `util_trackBuilder_obstaclePlacer.placeObstacles(track)`

Place tous les obstacles prédéfinis de la piste (en créant ou supprimant des TSStatic selon le besoin), puis appelle placeProceduralObstacles pour chaque segment.

- `track` (*table[]*) : Liste ordonnée de segments/pièces avec leurs champs obstacles, points, markerInfo, startLength, endLength.

#### `util_trackBuilder_obstaclePlacer.placeProceduralObstacles(segment)`

Crée, ajuste ou supprime les ProceduralMesh d'obstacles d'un segment, génère leur mesh selon le type (ring, cube, cylinder, cone, bump, ramp), les positionne et les oriente. Ne fait rien si segment.obstaclesChanged est faux.

- `segment` (*table*) : Segment avec obstacles, obstaclesChanged, index, procObstacles, procObstacleIndexes.

## Appels vers le moteur (C++)

- `obj:` `registerObject`, `setField`, `setPosition`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/util/trackBuilder/obstaclePlacer.lua`.*
