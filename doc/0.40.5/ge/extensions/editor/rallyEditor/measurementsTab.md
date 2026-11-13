# `editor_rallyEditor_measurementsTab`

*Fichier : `lua/ge/extensions/editor/rallyEditor/measurementsTab.lua` · VM : Game Engine (GE) · 1174 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/editor/rallyEditor/measurementsTab")` (fichier sous extensions/ mais pas une extension classique)

Onglet « Measurements » de l'éditeur de rallye : outil de mesure de distances le long de la route (snaproad). L'utilisateur crée des mesures, y clique des points dans la vue 3D (accrochés à la snaproad à moins de 5 m), les réordonne, les déplace par glisser, et lit la distance totale, soit en suivant la route (option « Follow Route »), soit en ligne droite. Les mesures sont sauvegardées automatiquement dans <mission>/measurements.json. Le module renvoie un constructeur (classe C).

## Remarques

- Format du fichier measurements.json : { measurements = { ["id"] = {id, name, points = [{x,y,z}], followRoute, color = {r,g,b}, textColor = {r,g,b}} }, nextMeasurementId, updatedAt }.
- Distances en mètres. La couleur d'une nouvelle mesure est aléatoire (HSV vive) et la couleur du texte est noire ou blanche selon la luminance.
- Rayon de sélection d'un point : 8 m (pointSelectRadius). Sans snaproad, les points ne sont pas accrochés.
- Chaque modification (création, suppression, ajout/retrait/déplacement de point) appelle saveMeasurements(). updateMeasurement (renommage) ne sauvegarde pas immédiatement.
- getMeasurementsFilePath() utilise rallyEditor.getMissionDir(), alors que les autres onglets utilisent getCurrentMissionDir().

## Classe `C`

Objet onglet renvoyé par le constructeur (new(rallyEditor)). Champs : measurements (table id -> mesure {id, name, points (vec3), totalDistance, followRoute, color, textColor}), selectedMeasurementId, selectedPointIndex, nextMeasurementId, snaproad, updatedAt. windowDescription = 'Measurements'.

Le module renvoie un constructeur : `local obj = require("editor_rallyEditor_measurementsTab")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:addPointToMeasurement(measurementId, point)` | Ajoute un point en fin de mesure, le sélectionne, recalcule la distance et sauvegarde. | 576 |
| `C:calculateMeasurementDistance(measurementId)` | Calcule et stocke totalDistance en mètres. Avec followRoute et une snaproad, la distance suit la route entre points consécutifs ; sinon c'est la somme des distances directes. 0 s'il y a moins de 2 points. | 630 |
| `C:clearState()` | Vide les mesures, la sélection et l'état d'interaction. | 45 |
| `C:createMeasurement(name)` | Crée une mesure vide (followRoute = true, couleur aléatoire), la sélectionne et sauvegarde. | 502 |
| `C:deleteMeasurement(measurementId)` | Supprime une mesure, désélectionne si besoin, recalcule nextMeasurementId et sauvegarde. | 546 |
| `C:deserialize(data)` | Reconstruit les mesures depuis les données JSON, avec couleurs par défaut (jaune / noir), et recalcule nextMeasurementId (plus grand id + 1). | 103 |
| `C:draw(mouseInfo, dtReal, dtSim, dtRaw)` | Dessine l'interface imgui : création/suppression de mesures, liste, options (Follow Route, couleurs), distance totale, liste des points et boutons Move Up / Move Down / Delete Point. | 982 |
| `C:drawDebugEntrypoint()` | Rendu 3D appelé à chaque image : dessine la snaproad (noire) puis les points et lignes de mesure. | 236 |
| `C:drawMeasurementPoints()` | Dessine en 3D les points (sphères), les segments, le suivi de route et les libellés de distance de chaque mesure. | 250 |
| `C:findNearestPoint(mousePos)` | Cherche, toutes mesures confondues, le point le plus proche d'une position. | 747 |
| `C:getMeasurement(measurementId)` | Renvoie une mesure par identifiant. | 532 |
| `C:getMeasurementsFilePath()` | Chemin du fichier measurements.json dans le dossier de la mission. | 64 |
| `C:handleMouseInput()` | Gère la souris dans la vue 3D : survol, sélection, glisser-déplacer et ajout de points accrochés à la snaproad (distance < 5 m). | 772 |
| `C:init(rallyEditor)` | Constructeur interne : initialise les mesures et l'état d'interaction (survol, glisser). | 26 |
| `C:loadMeasurements()` | Lit measurements.json s'il existe (updatedAt pris dans la date du fichier s'il manque), désérialise puis recalcule les distances. | 155 |
| `C:movePointDown(measurementId, pointIndex)` | Échange le point avec le suivant (indice + 1), recalcule et sauvegarde. | 617 |
| `C:movePointUp(measurementId, pointIndex)` | Échange le point avec le précédent (indice - 1), recalcule et sauvegarde. | 604 |
| `C:removePointFromMeasurement(measurementId, pointIndex)` | Retire un point (ajuste l'indice sélectionné), recalcule la distance et sauvegarde. | 589 |
| `C:saveMeasurements()` | Met à jour updatedAt et écrit le fichier measurements.json (sauvegarde automatique). | 140 |
| `C:selectMeasurement(measurementId)` | Sélectionne une mesure et annule la sélection de point. | 569 |
| `C:selected()` | Appelée par l'éditeur quand l'onglet est sélectionné : récupère la snaproad de la fenêtre pacenotes, charge measurements.json et émet onEditorEditModeChanged(nil, nil). | 203 |
| `C:serialize()` | Convertit les mesures en table compatible JSON (les points vec3 deviennent {x,y,z}). | 74 |
| `C:setPath(path)` | Définit le carnet courant (le commentaire du code note que « path » désigne en fait le carnet). | 193 |
| `C:setSnaproad(snaproad)` | Définit la snaproad utilisée pour l'accrochage et le calcul des distances. | 198 |
| `C:unselect()` | Appelée quand l'onglet est quitté : émet onEditorEditModeChanged(nil, nil). | 228 |
| `C:updateMeasurement(measurementId, name)` | Renomme une mesure (sans sauvegarde immédiate). | 537 |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onEditorEditModeChanged` — écouté par 1 module(s)

## Appels vers le moteur (C++)

- `FS:` `fileExists`, `stat`
- `debugDrawer:` `drawCylinder`, `drawSphere`, `drawSquarePrism`, `drawTextAdvanced`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/rallyEditor/measurementsTab.lua`.*
