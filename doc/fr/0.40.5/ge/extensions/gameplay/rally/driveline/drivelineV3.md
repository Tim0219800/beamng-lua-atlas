# `gameplay_rally_driveline_drivelineV3`

*Fichier : `lua/ge/extensions/gameplay/rally/driveline/drivelineV3.lua` · VM : Game Engine (GE) · 770 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/gameplay/rally/driveline/drivelineV3")` (fichier sous extensions/ mais pas une extension classique)

Troisième version de la driveline de rallye : transforme l'enregistrement de reconnaissance (recce) en une spline éditable, puis en une liste de points finaux. Pipeline : charge les points bruts (DrivelineRecording.load), les simplifie par l'algorithme RDP en nœuds de spline, calcule la géométrie lissée collée au terrain (zSnap.conformSplineGeometry, avec ou sans raycast), puis génère les points finaux (position, quaternion, normale, ts simulé à 5 Hz). Sait aussi sauvegarder/charger la spline (JSON), charger l'ancienne driveline finale, dessiner les tracés de débogage/éditeur, projeter deux positions sur la driveline pour obtenir les points ou la distance entre elles, et lire les propriétés (limite de vitesse, temps alloué en liaison). Le module renvoie un constructeur : require(...)(missionDir).

## Exemple

```lua
local dl = require('/lua/ge/extensions/gameplay/rally/driveline/drivelineV3')(missionDir)
if dl:loadDrivelineFromFile() or dl:loadFromRecording() then
  local pointList = dl:getFinalPointList()
end
```

## Remarques

- Propriétés (self.properties) : speedLimitKph (100 par défaut), liaisonAllocatedTimeMins (5), useRaycast (false), vertRayRaise (2.0, bornée à [0,1 ; 20]). Elles sont sauvegardées dans le fichier de spline avec 'stats'.
- Le temps ts des points finaux est simulé : indice / 5.0 (5 Hz), ce n'est pas le temps réellement enregistré.
- loadDrivelineFromFile : si le fichier de spline existe on l'utilise, sinon repli sur l'ancien fichier de driveline finale (convertie en spline).
- La simplification force une largeur constante (DrivelineUtil.defaultSplineWidth) pour tous les nœuds.
- calculateDistanceBetweenPoints renvoie 0 si la driveline finale n'est pas disponible. La distance est mesurée le long de la driveline avec projection (xnorm) pour les segments partiels de début et de fin ; l'ordre de p1 et p2 est sans importance.
- Les fichiers sont choisis via rallyUtil.drivelineSplineFile(missionDir) et rallyUtil.finalDrivelineFile(missionDir).

## Classe `C`

Driveline V3 renvoyée par le constructeur. Attributs : missionDir, rawDrivelinePoints, spline, finalDrivelinePoints, simplificationTolerance, properties, stats.

Le module renvoie un constructeur : `local obj = require("gameplay_rally_driveline_drivelineV3")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_findSegmentRange(p1, p2)` | Projette p1 et p2 sur les segments de la driveline finale (projection la plus proche) et renvoie la plage de segments ordonnée : startIdx, startXnorm, endIdx, endXnorm (le début vient toujours en premier). nil si non résolu. | 662 |
| `C:calculateDistanceBetweenPoints(p1, p2)` | Distance le long de la driveline finale entre les projections de p1 et p2 (segments partiels de début et de fin calculés avec xnorm). | 724 |
| `C:convertDrivelineToSpline(drivelinePoints)` | Convertit des points de driveline en spline : positions, largeur constante, normales ; simplification RDP (tolérance simplificationTolerance). Journalise le taux de réduction. | 335 |
| `C:createDrivelineFromSpline()` | Génère finalDrivelinePoints à partir des points subdivisés de la spline (divPoints). Met finalDrivelinePoints à nil si la spline n'est pas prête. | 481 |
| `C:createDrivelinePointsFromPositions(positions)` | Convertit une liste de positions en points complets : orientation (quatFromDir depuis la direction vers le point suivant), ts = indice/5, chaînage prev/next/id, normale (SnaproadNormals.forwardNormalVec), pacenoteDistances et cachedPacenotes vides. | 418 |
| `C:createEmptySpline(name, isLoop, id)` | Crée une table de spline vide ({name, id, isDirty, isEnabled, isLoop, nodes, widths, nmls, divPoints, divWidths, tangents, binormals, normals, discMap}). L'id est un UUID si absent. | 65 |
| `C:deepCopySpline()` | Copie profonde de la spline (nodes, widths, nmls et métadonnées simples) pour annuler/rétablir dans l'éditeur. Ne copie pas la géométrie secondaire. | 503 |
| `C:getFinalPointList()` | Renvoie un PointList construit à partir des points finaux (nil et avertissement s'il y en a moins de 2). | 493 |
| `C:getLiaisonAllocatedTimeSecs()` | Temps alloué pour la liaison, en secondes (liaisonAllocatedTimeMins x 60). | 654 |
| `C:getPointsBetween(p1, p2)` | Liste ordonnée des points finaux couvrant l'intervalle entre p1 et p2 (extrémités de segments incluses). | 713 |
| `C:getSpeedLimitKph()` | Limite de vitesse de la driveline (propriété speedLimitKph). | 650 |
| `C:init(missionDir)` | Mémorise le dossier de mission et initialise l'état (tolérance de simplification par défaut, propriétés par défaut, aucune donnée chargée). | 41 |
| `C:loadDrivelineFromFile()` | Charge la driveline depuis un fichier : spline si présente, sinon driveline finale ancienne convertie en spline puis régénérée. | 266 |
| `C:loadDrivelineSplineFromFile()` | Charge la spline depuis son fichier, calcule sa géométrie et génère les points finaux. | 176 |
| `C:loadFinalDrivelineFromFile()` | Charge l'ancienne driveline finale (liste de points [x,y,z], au moins 2) et en fait des points complets ; lit aussi les propriétés. | 228 |
| `C:loadFromRecording()` | Pipeline complet : charge l'enregistrement recce, convertit en spline, calcule la géométrie, génère les points finaux. | 306 |
| `C:loadPropertiesFromData(data)` | Lit data.properties (speedLimitKph, liaisonAllocatedTimeMins, useRaycast, vertRayRaise) avec valeurs par défaut. | 86 |
| `C:loadRecceRecording()` | Charge les points bruts enregistrés pendant la reconnaissance (DrivelineRecording.load) dans rawDrivelinePoints. | 209 |
| `C:loadSplineFromData(data)` | Construit la spline à partir de données JSON (nodes, widths, nmls, properties, stats). Échoue si moins de 2 nœuds ou un nœud invalide. | 120 |
| `C:renderFinalDriveline()` | Dessine les points finaux en cylindres rouges semi-transparents avec piquets. | 587 |
| `C:renderRawDriveline()` | Dessine (debugDrawer) les points bruts : cylindres rose-violet entre points et petits piquets verticaux. À appeler à chaque frame. | 537 |
| `C:renderSmoothCurve(lineWidth)` | Dessine la courbe lissée (divPoints) comme un prisme bleu de la largeur d'un véhicule. | 563 |
| `C:renderSpline(selectedNodeIdx)` | Dessine la spline éditable (outils d'éditeur rSpline) avec marqueurs de début et de fin ; pour un seul nœud, dessine la sphère du nœud. | 613 |
| `C:saveSplineToFile()` | Écrit la spline dans le fichier de spline de la mission (dossier créé au besoin). | 145 |
| `C:serializeSpline()` | Sérialise la spline courante en table JSON {version=1, name, isLoop, nodes, widths, nmls, properties, stats}. Renvoie nil si moins de 2 nœuds. | 97 |
| `C:updateSplineGeometry()` | Recalcule la géométrie secondaire de la spline (points subdivisés divPoints, tangentes, normales...) conforme au terrain via zSnap.conformSplineGeometry, et sa longueur roadLength. | 383 |

## Appels vers le moteur (C++)

- `Engine.` `generateUUID`
- `FS:` `directoryCreate`, `fileExists`
- `debugDrawer:` `drawCylinder`, `drawSquarePrism`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/rally/driveline/drivelineV3.lua`.*
