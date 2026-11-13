---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/rallyEditor/drivelineTab.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Objet onglet renvoyé par le constructeur (new(rallyEditor)). Champs principaux : path (carnet), drivelineV3, drivelineLoaded, loadMode, loadError, isSplineView, showRawPoints, showFinalDrivelineVisualization, calculatedRaceDistance, drivelineStats {pointCount, length}, bufferEnabled/bufferPoints/bufferRadius/bufferBounds. windowDescription = 'Driveline Editor'.
---@class editor_rallyEditor_drivelineTab
local editor_rallyEditor_drivelineTab = {}

--- Calcule la distance de course via un RallyManager temporaire (getRaceDistanceMeters) et la stocke dans calculatedRaceDistance (false en cas d'échec).
---Source : lua/ge/extensions/editor/rallyEditor/drivelineTab.lua:574
---@return number|nil  Distance en mètres, ou nil.
function editor_rallyEditor_drivelineTab:calculateRaceDistance() end

--- Remet tout l'état à zéro (carnet, driveline chargée, statistiques, tampon).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/rallyEditor/drivelineTab.lua:94
function editor_rallyEditor_drivelineTab:clearState() end

--- Sonde le groundmodel du terrain (un échantillon tous les 5 m) le long de la driveline entre le départ et l'arrivée et renvoie le pourcentage par catégorie de surface (tarmac, gravel, ice, snow ; seules les non nulles).
---Source : lua/ge/extensions/editor/rallyEditor/drivelineTab.lua:618
---@param startPos vec3 Position de départ.
---@param finishPos vec3 Position d'arrivée.
---@return table<string, number>|nil  Pourcentages avec 1 décimale, ou nil si impossible (pas de points, pas de terrain, aucun échantillon).
function editor_rallyEditor_drivelineTab:computeSurfacePercentages(startPos, finishPos) end

--- Génère la ligne finale (finalDrivelinePoints) à partir de la spline éditée puis recalcule la distance.
---Source : lua/ge/extensions/editor/rallyEditor/drivelineTab.lua:502
---@return boolean  Succès de la création.
function editor_rallyEditor_drivelineTab:createDrivelineFromSpline() end

--- Crée un RallyManager temporaire pour la mission en y injectant le drivelineV3 en cours d'édition (même non sauvegardé), afin de calculer distance et départ/arrivée contre la géométrie de l'éditeur.
---Source : lua/ge/extensions/editor/rallyEditor/drivelineTab.lua:548
---@return table|nil  RallyManager, ou nil si pas de carnet, de mission ou si les ressources ne se reconstruisent pas.
function editor_rallyEditor_drivelineTab:createTempRallyManager() end

--- Copie profonde de la spline, utilisée pour l'annulation/rétablissement.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/rallyEditor/drivelineTab.lua:485
---@return table  Copie de la spline.
function editor_rallyEditor_drivelineTab:deepCopySpline() end

--- Dessine l'interface imgui : choix de la source, options d'affichage, simplification et sauvegarde de la spline, affichage de la ligne finale, statistiques (« Refresh Stats »), propriétés (vitesse limite, raycast…) et tampon expérimental.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/rallyEditor/drivelineTab.lua:837
---@param mouseInfo table Informations souris.
---@param dtReal number Delta temps réel.
---@param dtSim number Delta temps simulation.
---@param dtRaw number Delta temps brut.
function editor_rallyEditor_drivelineTab:draw(mouseInfo, dtReal, dtSim, dtRaw) end

--- Appelée à chaque image pour le rendu 3D : tracé brut (mode recording), interaction avec la spline, mise à jour de la géométrie si besoin, affichage de la ligne finale.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/rallyEditor/drivelineTab.lua:1186
---@param mouseInfo table Informations souris.
function editor_rallyEditor_drivelineTab:drawDebugEntrypoint(mouseInfo) end

--- Formate une distance en mètres : « 0m » si nulle, sinon 3 décimales, en km au-delà de 950 m.
---Source : lua/ge/extensions/editor/rallyEditor/drivelineTab.lua:182
---@param dist number|nil Distance en mètres.
---@return string  Texte du type « 1.234km ».
function editor_rallyEditor_drivelineTab:formatDistance(dist) end

--- Formate une durée en secondes en « MM:SS.d » (dixièmes arrondis). « N/A » si nil ou <= 0.
---Source : lua/ge/extensions/editor/rallyEditor/drivelineTab.lua:208
---@param timeSecs number|nil Durée en secondes.
---@return string  Durée formatée.
function editor_rallyEditor_drivelineTab:formatDurationSecs(timeSecs) end

--- Expérimental : construit la zone tampon autour de la ligne finale (liste de positions et boîte englobante élargie de bufferRadius) et active bufferEnabled.
---Source : lua/ge/extensions/editor/rallyEditor/drivelineTab.lua:772
---@return boolean  false s'il n'y a pas de points de ligne finale.
function editor_rallyEditor_drivelineTab:generateBuffer() end

--- Longueur du tracé brut en mode 'recording'.
---Source : lua/ge/extensions/editor/rallyEditor/drivelineTab.lua:444
---@return number  Mètres, 0 dans les autres modes.
function editor_rallyEditor_drivelineTab:getDrivelineLength() end

--- Nombre de points bruts en mode 'recording'.
---Source : lua/ge/extensions/editor/rallyEditor/drivelineTab.lua:463
---@return integer  Nombre de points, 0 dans les autres modes.
function editor_rallyEditor_drivelineTab:getDrivelinePointCount() end

--- Somme des distances entre points consécutifs de la ligne finale (finalDrivelinePoints).
---Source : lua/ge/extensions/editor/rallyEditor/drivelineTab.lua:196
---@return number  Longueur en mètres (0 si absente).
function editor_rallyEditor_drivelineTab:getFinalDrivelineLength() end

--- Lit missionTypeData.silverTime dans le info.json de la mission.
---Source : lua/ge/extensions/editor/rallyEditor/drivelineTab.lua:221
---@return number|nil  Temps argent en secondes, ou nil s'il est absent ou non positif.
function editor_rallyEditor_drivelineTab:getMissionSilverTimeSecs() end

--- Gère la souris et le clavier pour éditer la spline (délègue à DrivelineEditSurface.handleSplineInteraction avec splineEditCallbacks).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/rallyEditor/drivelineTab.lua:1314
function editor_rallyEditor_drivelineTab:handleSplineInteraction() end

--- Teste l'existence du fichier spline de la driveline ou, à défaut, du fichier de driveline finale.
---Source : lua/ge/extensions/editor/rallyEditor/drivelineTab.lua:245
---@return boolean  true si l'un des deux existe.
function editor_rallyEditor_drivelineTab:hasFinalDriveline() end

--- Teste l'existence du fichier d'enregistrement brut de la driveline de la mission.
---Source : lua/ge/extensions/editor/rallyEditor/drivelineTab.lua:236
---@return boolean  true si le fichier existe.
function editor_rallyEditor_drivelineTab:hasRecording() end

--- Constructeur interne : initialise l'état de l'interface, de l'édition et du tampon.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/rallyEditor/drivelineTab.lua:60
---@param rallyEditor table Instance de l'éditeur de rallye.
function editor_rallyEditor_drivelineTab:init(rallyEditor) end

--- Teste si un point est à moins de bufferRadius d'un point du tampon (rejet rapide par boîte englobante).
---Source : lua/ge/extensions/editor/rallyEditor/drivelineTab.lua:814
---@param point vec3 Point à tester.
---@return boolean  false si le tampon n'est pas actif.
function editor_rallyEditor_drivelineTab:isPointInBuffer(point) end

--- Charge la driveline sauvegardée ; s'il n'y en a pas, crée une spline vide avec propriétés par défaut. Passe en mode 'final'.
---Source : lua/ge/extensions/editor/rallyEditor/drivelineTab.lua:286
---@return boolean  true si le chargement a réussi.
function editor_rallyEditor_drivelineTab:loadFromFinal() end

--- Construit une spline à partir du chemin de course de la mission (points du chemin AI détaillé), met à jour la géométrie et passe en mode 'race'. Échoue si la course n'a pas de chemin AI.
---Source : lua/ge/extensions/editor/rallyEditor/drivelineTab.lua:337
---@return boolean  true si la spline a été créée.
function editor_rallyEditor_drivelineTab:loadFromRace() end

--- Charge et traite la driveline depuis l'enregistrement brut via DrivelineV3, passe en mode 'recording' et recalcule la distance. En cas d'échec, remplit loadError.
---Source : lua/ge/extensions/editor/rallyEditor/drivelineTab.lua:256
---@return boolean  true si le chargement a réussi.
function editor_rallyEditor_drivelineTab:loadFromRecording() end

--- Met à jour drivelineStats avec le nombre de points et la longueur de la ligne finale.
---Source : lua/ge/extensions/editor/rallyEditor/drivelineTab.lua:517
---@return table  {pointCount, length}.
function editor_rallyEditor_drivelineTab:recalculateDrivelineStats() end

--- Si une driveline est chargée, régénère la ligne finale depuis la spline, met à jour les stats puis calcule la distance de course. Sinon remet les valeurs à zéro.
---Source : lua/ge/extensions/editor/rallyEditor/drivelineTab.lua:531
---@return number|nil  Distance de course en mètres, ou nil.
function editor_rallyEditor_drivelineTab:recalculateRaceDistance() end

--- Callback de rétablissement d'une édition de spline ; recalcule ensuite la distance de course.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/rallyEditor/drivelineTab.lua:496
---@param data table Données d'historique.
function editor_rallyEditor_drivelineTab:redoSplineEdit(data) end

--- Recalcule distance (raceDistanceKms, 3 décimales) et pourcentages de surface, les met dans drivelineV3.stats puis sauvegarde le fichier spline.
---Source : lua/ge/extensions/editor/rallyEditor/drivelineTab.lua:731
---@return boolean  true si les stats ont été calculées et sauvegardées.
function editor_rallyEditor_drivelineTab:refreshStats() end

--- Remet drivelineStats à {pointCount = 0, length = 0}.
---Source : lua/ge/extensions/editor/rallyEditor/drivelineTab.lua:510
function editor_rallyEditor_drivelineTab:resetDrivelineStats() end

--- Sauvegarde la driveline finale/spline (délègue à DrivelineEditSurface.saveFinalDriveline).
---Source : lua/ge/extensions/editor/rallyEditor/drivelineTab.lua:767
---@return boolean  Succès de la sauvegarde.
function editor_rallyEditor_drivelineTab:saveFinalDriveline() end

--- Appelée par l'éditeur quand l'onglet est sélectionné : émet onEditorEditModeChanged(nil, nil) pour redessiner la légende des raccourcis.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/rallyEditor/drivelineTab.lua:169
function editor_rallyEditor_drivelineTab:selected() end

--- Règle properties.speedLimitKph sur distance / temps argent (en km/h, minimum 0). Nécessite le temps argent de la mission et une distance calculée.
---Source : lua/ge/extensions/editor/rallyEditor/drivelineTab.lua:594
---@return boolean  true si la vitesse a été modifiée.
function editor_rallyEditor_drivelineTab:setAverageSpeedFromSilverTimeAndRaceDistance() end

--- Définit le carnet courant. Si le dossier de mission change, l'état de chargement est réinitialisé. Crée l'objet DrivelineV3 de la mission si besoin et charge automatiquement la ligne finale si elle existe.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/rallyEditor/drivelineTab.lua:117
---@param path table Carnet (utilise getMissionDir).
function editor_rallyEditor_drivelineTab:setPath(path) end

--- Renvoie les callbacks passés à DrivelineEditSurface : onCommit et onHistoryRestore recalculent la distance de course.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/rallyEditor/drivelineTab.lua:157
---@return table  Table {onCommit, onHistoryRestore}.
function editor_rallyEditor_drivelineTab:splineEditCallbacks() end

--- Callback d'annulation d'une édition de spline ; restaure l'état puis recalcule la distance de course.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/rallyEditor/drivelineTab.lua:490
---@param data table Données d'historique.
function editor_rallyEditor_drivelineTab:undoSplineEdit(data) end

--- Appelée quand l'onglet est quitté : émet onEditorEditModeChanged(nil, nil).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/rallyEditor/drivelineTab.lua:176
function editor_rallyEditor_drivelineTab:unselect() end

--- Recalcule la géométrie de la spline (DrivelineV3) puis la distance de course.
---Source : lua/ge/extensions/editor/rallyEditor/drivelineTab.lua:476
---@return boolean  Succès de la mise à jour.
function editor_rallyEditor_drivelineTab:updateSplineGeometry() end

