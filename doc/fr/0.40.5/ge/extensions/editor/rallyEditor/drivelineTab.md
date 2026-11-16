# `editor_rallyEditor_drivelineTab`

*Fichier : `lua/ge/extensions/editor/rallyEditor/drivelineTab.lua` · VM : Game Engine (GE) · 1326 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/editor/rallyEditor/drivelineTab")` (fichier sous extensions/ mais pas une extension classique)

Onglet « Driveline Editor » de l'éditeur de rallye. Il charge la ligne de conduite (driveline) d'une mission depuis un enregistrement brut, depuis la ligne finale sauvegardée (fichier spline) ou depuis le chemin de course (AI path détaillé), puis permet de l'éditer comme une spline (nœuds, largeurs) via DrivelineEditSurface, de la simplifier, de la sauvegarder et d'en recalculer la distance de course. Il calcule aussi les statistiques de l'étape (distance en km et pourcentages de surface tarmac/gravel/ice/snow par sondage du terrain) et les écrit dans le fichier spline sous la clé « stats ». Le module renvoie un constructeur (classe C). Il s'appuie sur DrivelineV3 pour les données.

## Remarques

- Modes de chargement (self.loadMode) : 'recording', 'final', 'race'. Sans fichier final, loadFromFinal() crée une spline vide avec speedLimitKph = 100 et liaisonAllocatedTimeMins = 5.
- loadFromRace() utilise toujours le chemin AI détaillé (option codée en dur) ; la branche pathnodes est du code mort. La tolérance RDP de simplification est de 4,0 m.
- Surface : un échantillon tous les 5 m le long du tronçon départ -> arrivée, classé par nom de groundmodel (tables codées dans le fichier). rock, grass et other sont fusionnés dans la surface dominante si elle dépasse 90 % des échantillons, sinon dans gravel. Résultat arrondi à 0,1 %.
- computeSurfacePercentages écrit beaucoup de lignes de debug dans le log ([surfaceProbe]).
- calculatedRaceDistance vaut nil (pas calculé), false (échec) ou un nombre en mètres.
- getDrivelineLength et getDrivelinePointCount ne renvoient une valeur non nulle qu'en mode 'recording'.
- Le tampon (buffer) de 10 m de rayon est marqué expérimental ; le bouton affiche « 30m » mais bufferRadius vaut 10.0 dans le code (incohérence du libellé).

## Classe `C`

Objet onglet renvoyé par le constructeur (new(rallyEditor)). Champs principaux : path (carnet), drivelineV3, drivelineLoaded, loadMode, loadError, isSplineView, showRawPoints, showFinalDrivelineVisualization, calculatedRaceDistance, drivelineStats {pointCount, length}, bufferEnabled/bufferPoints/bufferRadius/bufferBounds. windowDescription = 'Driveline Editor'.

Le module renvoie un constructeur : `local obj = require("editor_rallyEditor_drivelineTab")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:calculateRaceDistance()` | Calcule la distance de course via un RallyManager temporaire (getRaceDistanceMeters) et la stocke dans calculatedRaceDistance (false en cas d'échec). | 574 |
| `C:clearState()` | Remet tout l'état à zéro (carnet, driveline chargée, statistiques, tampon). | 94 |
| `C:computeSurfacePercentages(startPos, finishPos)` | Sonde le groundmodel du terrain (un échantillon tous les 5 m) le long de la driveline entre le départ et l'arrivée et renvoie le pourcentage par catégorie de surface (tarmac, gravel, ice, snow ; seules les non nulles). | 618 |
| `C:createDrivelineFromSpline()` | Génère la ligne finale (finalDrivelinePoints) à partir de la spline éditée puis recalcule la distance. | 502 |
| `C:createTempRallyManager()` | Crée un RallyManager temporaire pour la mission en y injectant le drivelineV3 en cours d'édition (même non sauvegardé), afin de calculer distance et départ/arrivée contre la géométrie de l'éditeur. | 548 |
| `C:deepCopySpline()` | Copie profonde de la spline, utilisée pour l'annulation/rétablissement. | 485 |
| `C:draw(mouseInfo, dtReal, dtSim, dtRaw)` | Dessine l'interface imgui : choix de la source, options d'affichage, simplification et sauvegarde de la spline, affichage de la ligne finale, statistiques (« Refresh Stats »), propriétés (vitesse limite, raycast…) et tampon expérimental. | 837 |
| `C:drawDebugEntrypoint(mouseInfo)` | Appelée à chaque image pour le rendu 3D : tracé brut (mode recording), interaction avec la spline, mise à jour de la géométrie si besoin, affichage de la ligne finale. | 1186 |
| `C:formatDistance(dist)` | Formate une distance en mètres : « 0m » si nulle, sinon 3 décimales, en km au-delà de 950 m. | 182 |
| `C:formatDurationSecs(timeSecs)` | Formate une durée en secondes en « MM:SS.d » (dixièmes arrondis). « N/A » si nil ou <= 0. | 208 |
| `C:generateBuffer()` | Expérimental : construit la zone tampon autour de la ligne finale (liste de positions et boîte englobante élargie de bufferRadius) et active bufferEnabled. | 772 |
| `C:getDrivelineLength()` | Longueur du tracé brut en mode 'recording'. | 444 |
| `C:getDrivelinePointCount()` | Nombre de points bruts en mode 'recording'. | 463 |
| `C:getFinalDrivelineLength()` | Somme des distances entre points consécutifs de la ligne finale (finalDrivelinePoints). | 196 |
| `C:getMissionSilverTimeSecs()` | Lit missionTypeData.silverTime dans le info.json de la mission. | 221 |
| `C:handleSplineInteraction()` | Gère la souris et le clavier pour éditer la spline (délègue à DrivelineEditSurface.handleSplineInteraction avec splineEditCallbacks). | 1314 |
| `C:hasFinalDriveline()` | Teste l'existence du fichier spline de la driveline ou, à défaut, du fichier de driveline finale. | 245 |
| `C:hasRecording()` | Teste l'existence du fichier d'enregistrement brut de la driveline de la mission. | 236 |
| `C:init(rallyEditor)` | Constructeur interne : initialise l'état de l'interface, de l'édition et du tampon. | 60 |
| `C:isPointInBuffer(point)` | Teste si un point est à moins de bufferRadius d'un point du tampon (rejet rapide par boîte englobante). | 814 |
| `C:loadFromFinal()` | Charge la driveline sauvegardée ; s'il n'y en a pas, crée une spline vide avec propriétés par défaut. Passe en mode 'final'. | 286 |
| `C:loadFromRace()` | Construit une spline à partir du chemin de course de la mission (points du chemin AI détaillé), met à jour la géométrie et passe en mode 'race'. Échoue si la course n'a pas de chemin AI. | 337 |
| `C:loadFromRecording()` | Charge et traite la driveline depuis l'enregistrement brut via DrivelineV3, passe en mode 'recording' et recalcule la distance. En cas d'échec, remplit loadError. | 256 |
| `C:recalculateDrivelineStats()` | Met à jour drivelineStats avec le nombre de points et la longueur de la ligne finale. | 517 |
| `C:recalculateRaceDistance()` | Si une driveline est chargée, régénère la ligne finale depuis la spline, met à jour les stats puis calcule la distance de course. Sinon remet les valeurs à zéro. | 531 |
| `C:redoSplineEdit(data)` | Callback de rétablissement d'une édition de spline ; recalcule ensuite la distance de course. | 496 |
| `C:refreshStats()` | Recalcule distance (raceDistanceKms, 3 décimales) et pourcentages de surface, les met dans drivelineV3.stats puis sauvegarde le fichier spline. | 731 |
| `C:resetDrivelineStats()` | Remet drivelineStats à {pointCount = 0, length = 0}. | 510 |
| `C:saveFinalDriveline()` | Sauvegarde la driveline finale/spline (délègue à DrivelineEditSurface.saveFinalDriveline). | 767 |
| `C:selected()` | Appelée par l'éditeur quand l'onglet est sélectionné : émet onEditorEditModeChanged(nil, nil) pour redessiner la légende des raccourcis. | 169 |
| `C:setAverageSpeedFromSilverTimeAndRaceDistance()` | Règle properties.speedLimitKph sur distance / temps argent (en km/h, minimum 0). Nécessite le temps argent de la mission et une distance calculée. | 594 |
| `C:setPath(path)` | Définit le carnet courant. Si le dossier de mission change, l'état de chargement est réinitialisé. Crée l'objet DrivelineV3 de la mission si besoin et charge automatiquement la ligne finale si elle existe. | 117 |
| `C:splineEditCallbacks()` | Renvoie les callbacks passés à DrivelineEditSurface : onCommit et onHistoryRestore recalculent la distance de course. | 157 |
| `C:undoSplineEdit(data)` | Callback d'annulation d'une édition de spline ; restaure l'état puis recalcule la distance de course. | 490 |
| `C:unselect()` | Appelée quand l'onglet est quitté : émet onEditorEditModeChanged(nil, nil). | 176 |
| `C:updateSplineGeometry()` | Recalcule la géométrie de la spline (DrivelineV3) puis la distance de course. | 476 |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onEditorEditModeChanged` — écouté par 1 module(s)

## Appels vers le moteur (C++)

- `FS:` `fileExists`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/rallyEditor/drivelineTab.lua`.*
