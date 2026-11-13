# `gameplay_rally_driveline_pointList`

*Fichier : `lua/ge/extensions/gameplay/rally/driveline/pointList.lua` · VM : Game Engine (GE) · 180 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/gameplay/rally/driveline/pointList")` (fichier sous extensions/ mais pas une extension classique)

Liste de points le long d'un chemin (driveline de rallye). Chaque point est une table {pos (vec3), quat, ts, normal, prev, next, id, partition, pacenoteDistances, cachedPacenotes{cs, ce, at, auto_at, half}}. La classe sait chaîner les points (prev/next/id), calculer leurs normales (snaproad/normals), mesurer la longueur, trouver le point le plus proche et dessiner un aperçu de débogage. Le module renvoie un constructeur : require(...)(points).

## Remarques

- BUG : dans createPoint, le paramètre s'appelle 'quat' et masque la fonction globale quat() ; la valeur par défaut 'quat or quat(0,0,0,1)' appelle donc nil si l'argument est omis (erreur Lua). Passer toujours un quaternion.
- setAll remplace les points puis recalcule relations (prev/next/id) et normales ; le constructeur, lui, ne le fait pas.
- La longueur est la somme des distances 3D entre points consécutifs, en mètres.

## Classe `C`

Liste de points renvoyée par le constructeur ; attribut self.points.

Le module renvoie un constructeur : `local obj = require("gameplay_rally_driveline_pointList")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:calculateLength()` | Longueur totale du chemin (0 s'il y a moins de 2 points). | 76 |
| `C:count()` | Nombre de points. | 91 |
| `C:createPoint(pos, quat, ts)` | Crée un point au format standard (normal (0,0,1), pacenoteDistances vide, cachedPacenotes vide). N'ajoute pas le point à la liste. | 17 |
| `C:downsample()` | Stub de compatibilité avec DrivelineRoute : renvoie la liste elle-même (drivelineV3 simplifie déjà). | 134 |
| `C:drawDebug(drawLabels)` | Dessine une sphère par point (couleur recce_driveline_clr, alpha 0,3) et, si demandé, l'horodatage ts en étiquette. À appeler à chaque frame. | 139 |
| `C:findNearestPoint(srcPos)` | Point le plus proche d'une position (distance 3D, parcours linéaire). | 113 |
| `C:get(index)` | Point à l'indice donné. | 96 |
| `C:getAll()` | Table interne de tous les points (pas une copie). | 101 |
| `C:init(points)` | Mémorise la liste de points fournie (vide par défaut) sans calculer relations ni normales. | 12 |
| `C:setAll(points)` | Remplace tous les points puis recalcule relations et normales. | 106 |
| `C:setupPointNormals()` | Calcule la normale de chaque point avec snaproadNormals.forwardNormalVec et crée pacenoteDistances/cachedPacenotes s'ils manquent. | 56 |
| `C:setupPointRelationships()` | Renseigne id (indice), prev et next de chaque point. | 39 |

## Appels vers le moteur (C++)

- `debugDrawer:` `drawSphere`, `drawTextAdvanced`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/rally/driveline/pointList.lua`.*
