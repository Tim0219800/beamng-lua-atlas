---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/rallyEditor/pacenotes.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Objet onglet renvoyé par le constructeur (new(rallyEditor)). Champs principaux : rallyEditor, path (carnet), mouseInfo, pacenoteToolsState, pacenoteForm, ghostNotebookRenderer, notes_valid, invalid_notes_count, todo_count, validation_issues, validationDirty, pacenotesDrivelineHost, drivelineEditSnapshot, customAudioAnchorPick, previewAudioManager. windowDescription = 'Pacenotes'.
---@class editor_rallyEditor_pacenotes
local editor_rallyEditor_pacenotes = {}

--- Déplace le waypoint sélectionné le long de la snaproad ; efface le TODO du pacenote.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:2487
---@param fwd boolean Vers l'avant.
---@param steps integer Nombre de pas.
function editor_rallyEditor_pacenotes:_moveSelectedWaypointHelper(fwd, steps) end

--- Crée la table « hôte » (état d'édition) passée à DrivelineEditSurface.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:412
---@return table  Hôte vide.
function editor_rallyEditor_pacenotes:_newPacenotesDrivelineHost() end

--- Applique la reprojection si elle est demandée et le délai écoulé (ou si force). Régénère la driveline depuis la spline, remplace la snaproad et rafraîchit.
---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:547
---@param force boolean|nil Ignorer l'état dirty et le délai.
function editor_rallyEditor_pacenotes:applyLiveDrivelineReproject(force) end

--- Remet le gizmo à l'origine (contournement d'un problème en bord de carte).
---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:789
function editor_rallyEditor_pacenotes:attemptToFixMapEdgeIssue() end

--- Demande au carnet de remplir automatiquement les appels de distance, puis marque la validation à refaire.
---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:2385
function editor_rallyEditor_pacenotes:autofillDistanceCalls() end

--- Démarre le mode « choisir un pacenote ancre » pour un clip audio personnalisé (le prochain clic dans la vue 3D choisit le pacenote).
---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:333
---@param basename string Nom de base du fichier audio.
function editor_rallyEditor_pacenotes:beginCustomAudioAnchorPick(basename) end

--- Début de manipulation au gizmo : mémorise l'état du waypoint (données, rotation, rayon).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:823
function editor_rallyEditor_pacenotes:beginDrag() end

--- Indique si la caméra active est la caméra « path ».
---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:2553
---@return boolean  Résultat.
function editor_rallyEditor_pacenotes:cameraPathIsPlaying() end

--- Démarre ou arrête la lecture de la caméra le long de la route pour le pacenote sélectionné ; au démarrage mémorise la caméra et lance l'audio de prévisualisation, à l'arrêt restaure la caméra.
---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:2516
function editor_rallyEditor_pacenotes:cameraPathPlay() end

--- Annule le choix d'ancre en cours.
---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:347
function editor_rallyEditor_pacenotes:cancelCustomAudioAnchorPick() end

--- Enregistre, pour chaque pacenote, les positions, normales et emplacements le long de la route de ses waypoints corner start/end avant une édition de driveline.
---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:459
---@return table|nil  {pacenotes, snaproad}.
function editor_rallyEditor_pacenotes:captureDrivelineEditSnapshot() end

--- Renumérote proprement les noms de pacenotes ; par défaut avec une entrée d'historique annulable.
---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:2361
---@param recordHistory boolean|nil false pour ne pas enregistrer d'historique.
function editor_rallyEditor_pacenotes:cleanupPacenoteNames(recordHistory) end

--- Réinitialise tout l'état (arrête l'audio, vide la sélection, la validation, l'édition de driveline, le formulaire).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:135
function editor_rallyEditor_pacenotes:clearState() end

--- Mode Ctrl : affiche « Click to Create New Pacenote » sur la route et, au clic, crée un pacenote (corner start au clic, corner end 10 m plus loin) à sa place dans l'ordre, en respectant l'espace entre pacenotes voisins.
---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:1450
function editor_rallyEditor_pacenotes:createMouseDragPacenote() end

--- Aperçu de debug d'un nouveau pacenote entre deux positions (variante 1).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:1406
---@param pos_cs vec3 Début de virage.
---@param pos_ce vec3 Fin de virage.
function editor_rallyEditor_pacenotes:debugDrawNewPacenote(pos_cs, pos_ce) end

--- Aperçu de debug d'un nouveau pacenote entre deux positions (variante 2).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:1428
---@param pos_cs vec3 Début de virage.
---@param pos_ce vec3 Fin de virage.
function editor_rallyEditor_pacenotes:debugDrawNewPacenote2(pos_cs, pos_ce) end

--- Supprime tous les pacenotes du carnet et désélectionne.
---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:2021
function editor_rallyEditor_pacenotes:deleteAllPacenotes() end

--- Supprime le pacenote sélectionné s'il y en a un.
---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:1767
function editor_rallyEditor_pacenotes:deleteSelected() end

--- Supprime le pacenote sélectionné puis sélectionne le précédent (ou le suivant) ; voir la note sur le calcul de shouldSelect.
---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:1773
---@param shouldSelect boolean|nil Sélectionner un voisin après suppression (comportement inversé, voir notes).
function editor_rallyEditor_pacenotes:deleteSelectedPacenote(shouldSelect) end

--- Désélectionne le waypoint, ou à défaut le pacenote (sans effet pendant la lecture caméra).
---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:777
function editor_rallyEditor_pacenotes:deselect() end

--- Cherche le waypoint corner start survolé (rayon de la souris contre la sphère du waypoint) pendant le choix d'ancre audio.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:1553
---@return table|nil  Waypoint le plus proche de la caméra.
function editor_rallyEditor_pacenotes:detectCustomAudioAnchorPickHover() end

--- Détermine quel waypoint est survolé par le rayon de la souris, selon la sélection et les préférences d'affichage des pacenotes précédent/suivant. Garde le plus proche de la caméra.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:1613
---@return table|nil  Waypoint survolé.
function editor_rallyEditor_pacenotes:detectMouseHoverWaypoint() end

--- Pendant la manipulation au gizmo : applique translation, rotation ou échelle (rayon) au waypoint.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:837
function editor_rallyEditor_pacenotes:dragging() end

--- Dessine l'onglet imgui : mémorise mouseInfo, met à jour l'audio de prévisualisation, traite la souris puis dessine la liste de pacenotes.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:1392
---@param mouseInfo table Informations souris.
---@param dtReal number Delta temps réel.
---@param dtSim number Delta temps simulation.
---@param dtRaw number Delta temps brut.
function editor_rallyEditor_pacenotes:draw(mouseInfo, dtReal, dtSim, dtRaw) end

--- Dessine les sphères de départ de virage colorées selon la possibilité d'ancrer le clip, avec texte au survol.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:937
---@param globalOpacity number|nil Opacité globale.
function editor_rallyEditor_pacenotes:drawCustomAudioAnchorPickOverlay(globalOpacity) end

--- Dessine l'état de la snaproad pendant la lecture caméra.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:1117
function editor_rallyEditor_pacenotes:drawDebugCameraPlaying() end

--- Rendu 3D principal appelé à chaque image : aperçu sans sélection, carnet, snaproad, carnet fantôme, partitions, ancres audio, position de caméra et surface d'édition de driveline.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:985
---@param globalOpacity number|nil Opacité globale.
---@param dt number|nil Delta temps pour l'animation de pulsation.
function editor_rallyEditor_pacenotes:drawDebugEntrypoint(globalOpacity, dt) end

--- Dessine le bouton « Edit Driveline » (orange quand actif).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:2031
function editor_rallyEditor_pacenotes:drawDrivelineEditToggle() end

--- En mode édition de driveline : gère l'interaction avec la spline, la mise à jour de géométrie, le rendu et la reprojection anti-rebond.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:1082
function editor_rallyEditor_pacenotes:drawPacenotesDrivelineEditSurface() end

--- Dessine les onglets « Pacenote » (formulaire) et « Audio » (liste de clips si le carnet est en mode audio custom).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:2105
function editor_rallyEditor_pacenotes:drawPacenotesList() end

--- Fin de manipulation au gizmo : enregistre une action annulable dans l'historique.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:874
function editor_rallyEditor_pacenotes:endDragging() end

--- Prend l'instantané s'il n'existe pas encore.
---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:505
---@return table|nil  Instantané.
function editor_rallyEditor_pacenotes:ensureDrivelineEditSnapshot() end

--- Crée l'hôte d'édition de driveline et charge la driveline depuis le fichier si besoin.
---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:429
---@return table|nil  Hôte, ou nil en cas d'échec (loadError rempli).
function editor_rallyEditor_pacenotes:ensurePacenotesDrivelineHost() end

--- Crée (ou recrée si le carnet a changé) le gestionnaire audio de prévisualisation.
---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:256
---@return table|nil  AudioManager.
function editor_rallyEditor_pacenotes:ensurePreviewAudioManager() end

--- Relance validate() si la validation est marquée à refaire.
---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:1979
function editor_rallyEditor_pacenotes:ensureValidationFresh() end

--- Construit un RallyManager pour la mission et appelle drivelineRoute:buildElevationProfile().
---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:2627
---@return table|nil  Profil d'élévation (liste de points), ou nil en cas d'échec.
function editor_rallyEditor_pacenotes:generateElevationProfile() end

--- Renvoie le clip pour lequel on choisit une ancre.
---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:358
---@return string|nil  Nom de base, ou nil.
function editor_rallyEditor_pacenotes:getCustomAudioAnchorPickBasename() end

--- Renvoie le chemin de course courant de l'éditeur de course (editor_raceEditor.getCurrentPath()).
---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:212
---@return table|nil  Chemin de course.
function editor_rallyEditor_pacenotes:getRacePath() end

--- Renvoie la snaproad courante.
---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:366
---@return table|nil  Snaproad.
function editor_rallyEditor_pacenotes:getSnaproad() end

--- Gère la souris pendant le choix d'ancre : clic sur un pacenote valide pose l'ancre, sinon affiche la raison du refus ; clic dans le vide annule.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:1576
---@return boolean  Toujours true quand un choix est actif.
function editor_rallyEditor_pacenotes:handleCustomAudioAnchorPickMouseInput() end

--- Gère le clic : sélection de pacenote/waypoint survolé, début de glisser ; Maj recentre la caméra ; clic dans le vide désélectionne.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:1123
---@param hoveredWp table|nil Waypoint survolé.
function editor_rallyEditor_pacenotes:handleMouseDown(hoveredWp) end

--- Pendant le maintien : déplace le waypoint sélectionné (non verrouillé) vers la position de la souris accrochée à la route et oriente sa normale.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:1218
function editor_rallyEditor_pacenotes:handleMouseHold() end

--- Point d'entrée de la souris : gizmo, choix d'ancre audio, édition de driveline, création Ctrl-clic ou interaction normale.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:1328
function editor_rallyEditor_pacenotes:handleMouseInput() end

--- Au relâchement : enregistre le déplacement dans l'historique (annuler/rétablir) et remet à zéro l'état de glisser.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:1247
function editor_rallyEditor_pacenotes:handleMouseUp() end

--- Aiguille l'entrée souris (down, hold, up, survol) sans modificateur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:1316
---@param hoveredWp table|nil Waypoint survolé.
function editor_rallyEditor_pacenotes:handleUnmodifiedMouseInteraction(hoveredWp) end

--- Constructeur interne : crée l'état des outils, le formulaire pacenote et le rendu du carnet fantôme.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:107
---@param rallyEditor table Instance de l'éditeur de rallye.
function editor_rallyEditor_pacenotes:init(rallyEditor) end

--- Active le mode insertion (sans effet pendant la lecture caméra).
---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:1970
function editor_rallyEditor_pacenotes:insertMode() end

--- Crée un pacenote après le pacenote donné, avec un numéro intermédiaire (ou +1 à la fin), puis retrie par nom.
---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:2413
---@param note table Pacenote de référence.
function editor_rallyEditor_pacenotes:insertNewPacenoteAfter(note) end

--- Invalide l'aperçu affiché quand aucun pacenote n'est sélectionné.
---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:180
function editor_rallyEditor_pacenotes:invalidateNoSelectionPreview() end

--- Indique si un choix d'ancre est en cours.
---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:354
---@return boolean|nil  Vrai si actif.
function editor_rallyEditor_pacenotes:isCustomAudioAnchorPickActive() end

--- Indique si l'édition de driveline dans l'onglet Pacenotes est active.
---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:408
---@return boolean|nil  Vrai si actif.
function editor_rallyEditor_pacenotes:isPacenotesDrivelineEditActive() end

--- Indique si le choix d'ancre en cours concerne ce clip.
---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:362
---@param basename string|nil Nom de base.
---@return boolean  Résultat.
function editor_rallyEditor_pacenotes:isPickingCustomAudioAnchorFor(basename) end

--- Rafraîchit la validation si besoin puis indique si le carnet est valide.
---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:175
---@return boolean  true si notes_valid et aucune issue.
function editor_rallyEditor_pacenotes:isValid() end

--- Charge la driveline sauvegardée, construit la Snaproad, la donne au carnet (setSnaproad) et reprojette les waypoints si une snaproad précédente ou un instantané existe.
---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:370
---@param snapshot table|nil Instantané d'édition de driveline (voir captureDrivelineEditSnapshot).
function editor_rallyEditor_pacenotes:loadSnaproad(snapshot) end

--- Demande une reprojection en direct après le délai anti-rebond.
---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:542
function editor_rallyEditor_pacenotes:markLiveDrivelineReprojectDirty() end

--- Marque la géométrie des pacenotes comme à recalculer (invalide l'aperçu sans sélection).
---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:186
function editor_rallyEditor_pacenotes:markPacenoteGeometryDirty() end

--- Marque la validation comme à refaire.
---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:1975
function editor_rallyEditor_pacenotes:markValidationDirty() end

--- Mesure la géométrie du virage du pacenote sélectionné via la snaproad (measurePartition) et applique optionnellement les mesures au pacenote.
---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:1796
---@param applyMeasurements boolean|nil Appeler pacenote:applyMeasurements().
function editor_rallyEditor_pacenotes:measureSelectedPacenote(applyMeasurements) end

--- Concatène le texte libre du pacenote sélectionné au début de celui du suivant, supprime le sélectionné et sélectionne le suivant.
---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:2608
function editor_rallyEditor_pacenotes:mergeSelectedWithNextPacenote() end

--- Concatène le texte libre du pacenote sélectionné à la fin de celui du précédent, supprime le sélectionné et sélectionne le précédent.
---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:2589
function editor_rallyEditor_pacenotes:mergeSelectedWithPrevPacenote() end

--- Recule le waypoint sélectionné le long de la route.
---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:2510
---@param steps integer|nil Pas, 1 par défaut.
function editor_rallyEditor_pacenotes:moveSelectedWaypointBackward(steps) end

--- Avance le waypoint sélectionné le long de la route.
---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:2504
---@param steps integer|nil Pas, 1 par défaut.
function editor_rallyEditor_pacenotes:moveSelectedWaypointForward(steps) end

--- Appelée à l'activation du mode d'édition du carnet : resélectionne le pacenote courant.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:203
function editor_rallyEditor_pacenotes:onEditModeActivate() end

--- Appelée à la désactivation du mode d'édition : arrête l'audio et remet la caméra libre.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:207
function editor_rallyEditor_pacenotes:onEditModeDeactivate() end

--- Après un déplacement de waypoint : met à jour voisins, demi-point, distances, mesure et textes structurés des notes précédente/courante/suivante.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:1191
---@param pn_sel table Pacenote déplacé.
function editor_rallyEditor_pacenotes:onPacenoteDrag(pn_sel) end

--- Callback de fin d'édition de spline : régénère la driveline, la sauvegarde, puis force la reprojection.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:569
---@param host table Hôte d'édition.
function editor_rallyEditor_pacenotes:onPacenotesDrivelineEditCommitted(host) end

--- Teste le pacenote contre le texte de recherche courant (vrai si la recherche est vide).
---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:2322
---@param pacenote table Pacenote.
---@return boolean  Résultat.
function editor_rallyEditor_pacenotes:pacenoteSearchMatches(pacenote) end

--- Téléporte le véhicule du joueur à la position de départ associée au pacenote sélectionné.
---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:2402
function editor_rallyEditor_pacenotes:placeVehicleAtPacenote() end

--- Après reprojection : remesure tous les pacenotes, remplit les appels de distance, rafraîchit le carnet et la sélection.
---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:530
function editor_rallyEditor_pacenotes:refreshAfterDrivelineReproject() end

--- Nettoie les noms puis rafraîchit les pacenotes du carnet sans remesure.
---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:2392
---@param opts table|nil Options (recordHistory).
function editor_rallyEditor_pacenotes:refreshPacenotes(opts) end

--- Recharge la snaproad, invalide la correspondance audio custom, remesure tous les pacenotes et rafraîchit les notes.
---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:1959
---@param snapshot table|nil Instantané de reprojection.
---@param opts table|nil Options (recordHistory).
function editor_rallyEditor_pacenotes:refreshPacenotesTab(snapshot, opts) end

--- Remesure tous les pacenotes (partition de la snaproad par pacenote) puis restaure la partition du pacenote sélectionné.
---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:1812
function editor_rallyEditor_pacenotes:remeasureAllPacenotes() end

--- Remplace la snaproad par une nouvelle construite depuis la driveline éditée et reprojette les waypoints d'après l'instantané.
---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:512
---@param drivelineV3 table Driveline en cours d'édition.
---@param snapshot table|nil Instantané.
---@return boolean  Succès.
function editor_rallyEditor_pacenotes:replaceSnaproadFromDrivelineV3(drivelineV3, snapshot) end

--- Place le gizmo d'axes très bas (z = -1000) pour le cacher.
---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:793
function editor_rallyEditor_pacenotes:resetGizmoTransformToOrigin() end

--- Prédicat de recherche : pacenote non manquant et correspondant au texte de recherche.
---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:2318
---@param pacenote table|nil Pacenote.
---@return boolean|nil  Vrai si correspond.
function editor_rallyEditor_pacenotes:searchPacenoteMatchFn(pacenote) end

--- Sélectionne le pacenote suivant qui correspond à la recherche (ou le premier si rien n'est sélectionné). Sans effet pendant la lecture caméra.
---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:1909
function editor_rallyEditor_pacenotes:selectNextPacenote() end

--- Alterne la sélection entre corner start et corner end du pacenote courant (corner start si aucun waypoint n'est sélectionné).
---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:2450
function editor_rallyEditor_pacenotes:selectNextWaypoint() end

--- Sélectionne un pacenote par id (nil pour désélectionner) : met à jour le formulaire, la partition de snaproad, la mesure et la caméra. Ignoré pendant l'édition de driveline si id est donné.
---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:685
---@param id integer|nil Id du pacenote.
function editor_rallyEditor_pacenotes:selectPacenote(id) end

--- Sélectionne le pacenote précédent qui correspond à la recherche (ou le dernier si rien n'est sélectionné). Sans effet pendant la lecture caméra.
---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:1859
function editor_rallyEditor_pacenotes:selectPrevPacenote() end

--- Si rien n'est sélectionné, resélectionne le dernier pacenote sélectionné.
---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:1842
---@return boolean  true si une resélection a eu lieu.
function editor_rallyEditor_pacenotes:selectRecentPacenote() end

--- Sélectionne un waypoint par id (sélectionne aussi son pacenote) et règle le filtre de la snaproad. nil désélectionne le waypoint.
---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:736
---@param id integer|nil Id du waypoint.
function editor_rallyEditor_pacenotes:selectWaypoint(id) end

--- Appelée par l'éditeur quand l'onglet est sélectionné : prépare le mode d'édition, recharge snaproad et pacenotes, ajoute les raccourcis (Ctrl : créer, Delete : supprimer) et émet onEditorEditModeChanged(nil, nil).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:640
function editor_rallyEditor_pacenotes:selected() end

--- Renvoie le pacenote sélectionné.
---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:234
---@return table|nil  Pacenote, ou nil.
function editor_rallyEditor_pacenotes:selectedPacenote() end

--- Renvoie le waypoint sélectionné du pacenote sélectionné.
---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:243
---@return table|nil  Waypoint, ou nil.
function editor_rallyEditor_pacenotes:selectedWaypoint() end

--- Mémorise le waypoint survolé (hover_wp_id) et l'état de la touche Maj.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:1290
---@param wp table|nil Waypoint survolé.
function editor_rallyEditor_pacenotes:setHover(wp) end

--- Passe en mode 'edit_all' et déverrouille les waypoints.
---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:2570
function editor_rallyEditor_pacenotes:setModeEditAll() end

--- Passe en mode 'edit_corners' et déverrouille les waypoints.
---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:2575
function editor_rallyEditor_pacenotes:setModeEditCorners() end

--- Oriente la caméra (orbite pacenoteOrbit ou caméra V2) sur le pacenote sélectionné.
---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:671
function editor_rallyEditor_pacenotes:setOrbitCameraToSelectedPacenote() end

--- Active ou désactive le mode d'édition de driveline (désélectionne tout et prend un instantané à l'activation).
---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:583
---@param active boolean Nouvel état.
function editor_rallyEditor_pacenotes:setPacenotesDrivelineEditActive(active) end

--- Définit le carnet courant ; s'il change, arrête l'audio et abandonne l'édition de driveline en cours. Marque la validation à refaire.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:190
---@param path table Carnet.
function editor_rallyEditor_pacenotes:setPath(path) end

--- Désélectionne le waypoint, passe en mode edit_corners et règle la partition de snaproad sur le pacenote sélectionné.
---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:2580
function editor_rallyEditor_pacenotes:setupEditMode() end

--- Met en file les clips audio du pacenote pour les jouer pendant la lecture de la caméra.
---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:270
---@param pacenote table Pacenote à prévisualiser.
---@return boolean  true si un audio est en attente ou en cours.
function editor_rallyEditor_pacenotes:startPreviewAudio(pacenote) end

--- Vide la file audio de prévisualisation et la désactive.
---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:304
function editor_rallyEditor_pacenotes:stopPreviewAudio() end

--- Stub : journalise seulement que la fonction sera implémentée.
---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:2557
function editor_rallyEditor_pacenotes:toggleCornerCalls() end

--- Appelée quand l'onglet est quitté : arrête l'audio, remet la caméra libre, retire les raccourcis et émet onEditorEditModeChanged(nil, nil).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:659
function editor_rallyEditor_pacenotes:unselect() end

--- Place le gizmo sur un waypoint si le gizmo est autorisé.
---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:803
---@param index integer Id du waypoint.
function editor_rallyEditor_pacenotes:updateGizmoTransform(index) end

--- Appelée à chaque image : fait avancer le gestionnaire audio tant que la caméra path joue, et s'arrête sinon ou quand la file est vide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:311
---@param dtReal number Delta temps réel.
---@param dtSim number Delta temps simulation.
---@param dtRaw number Delta temps brut.
function editor_rallyEditor_pacenotes:updatePreviewAudio(dtReal, dtSim, dtRaw) end

--- Valide chaque pacenote, compte les TODO et les notes invalides, remplit validation_issues et notes_valid.
---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:1985
function editor_rallyEditor_pacenotes:validate() end

--- Calcule la nouvelle position d'un waypoint glissé (accrochage en z puis à la snaproad) et une position servant à orienter sa normale perpendiculairement.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/rallyEditor/pacenotes.lua:1696
---@param wp table Waypoint.
---@param mousePos vec3 Position de la souris.
---@param mouseOffset vec3 Décalage mémorisé au clic.
---@return vec3|nil  Nouvelle position.
---@return vec3|nil  Position d'alignement de la normale.
function editor_rallyEditor_pacenotes:wpPosForSimpleDrag(wp, mousePos, mouseOffset) end

