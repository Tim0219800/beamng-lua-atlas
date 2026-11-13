# `editor_rallyEditor_pacenotes`

*Fichier : `lua/ge/extensions/editor/rallyEditor/pacenotes.lua` · VM : Game Engine (GE) · 2677 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/editor/rallyEditor/pacenotes")` (fichier sous extensions/ mais pas une extension classique)

Onglet « Pacenotes » de l'éditeur de rallye, le plus important de l'éditeur : il gère la sélection de pacenotes et de waypoints (corner start / corner end) dans la vue 3D, leur création (Ctrl + clic sur la snaproad), leur déplacement à la souris avec accrochage à la route, la mesure géométrique des virages, la validation du carnet, la lecture d'une caméra le long de la route avec prévisualisation audio, l'édition additive de la driveline (spline) avec reprojection en direct des waypoints, et le choix d'ancres pour les clips audio personnalisés. Il contient aussi la liste/formulaire de pacenotes (PacenoteForm) et l'onglet « Audio » (customAudioList) pour les carnets en mode audio custom. Le module renvoie un constructeur (classe C). L'état partagé est dans self.pacenoteToolsState (selected_pn_id, selected_wp_id, hover_wp_id, snaproad, mode, drivelineEditActive, etc.).

## Exemple

```lua
local tab = editor_rallyEditor.getPacenotesWindow()
tab:selectPacenote(id)
tab:measureSelectedPacenote(true)
if not tab:isValid() then dump(tab.validation_issues) end
```

## Remarques

- La snaproad est construite depuis la driveline finale sauvegardée (DrivelineV3:loadDrivelineFromFile). Sans driveline sauvegardée, loadSnaproad() journalise une erreur et met snaproad à nil : il faut d'abord créer la driveline dans l'onglet Driveline.
- Modes d'édition : 'edit_all' et 'edit_corners' ; setModeEditAll/Corners désactivent aussi le verrouillage des waypoints.
- La reprojection en direct pendant l'édition de driveline est anti-rebond de 0,15 s (drivelineReprojectDebounceSecs).
- Création d'un pacenote : la fin de virage est placée à 10 m le long de la route (réduite si l'espace manque, minGap respecté) ; le pacenote reçoit un élément structuré de type 'corner' au slot "4".
- Bug probable : deleteSelectedPacenote(shouldSelect) calcule `shouldSelect = (shouldSelect == nil) and true`. Appelé sans argument, il vaut true ; appelé avec true ou false, il vaut false, donc le pacenote voisin n'est alors pas sélectionné. Les fusions (merge) passent false volontairement.
- toggleCornerCalls() est un stub (journalise « will be implemented in the future »).
- Dans _moveSelectedWaypointHelper, quand aucun waypoint n'est sélectionné, la fonction sélectionne le suivant puis retourne sans déplacer.
- Le gizmo d'axes est caché sous la carte (z = -1000) car le gizmo n'est pas utilisé pour l'édition ; les fonctions beginDrag/dragging/endDragging sont néanmoins branchées sur editor.updateAxisGizmo.
- Le code de handleMouseInput contient un commentaire sur un bug connu de l'éditeur : getAxisGizmoSelectedElement renvoie 6 après un démarrage à froid, d'où l'absence du test isAxisGizmoHovered.

## Classe `C`

Objet onglet renvoyé par le constructeur (new(rallyEditor)). Champs principaux : rallyEditor, path (carnet), mouseInfo, pacenoteToolsState, pacenoteForm, ghostNotebookRenderer, notes_valid, invalid_notes_count, todo_count, validation_issues, validationDirty, pacenotesDrivelineHost, drivelineEditSnapshot, customAudioAnchorPick, previewAudioManager. windowDescription = 'Pacenotes'.

Le module renvoie un constructeur : `local obj = require("editor_rallyEditor_pacenotes")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_moveSelectedWaypointHelper(fwd, steps)` | Déplace le waypoint sélectionné le long de la snaproad ; efface le TODO du pacenote. | 2487 |
| `C:_newPacenotesDrivelineHost()` | Crée la table « hôte » (état d'édition) passée à DrivelineEditSurface. | 412 |
| `C:applyLiveDrivelineReproject(force)` | Applique la reprojection si elle est demandée et le délai écoulé (ou si force). Régénère la driveline depuis la spline, remplace la snaproad et rafraîchit. | 547 |
| `C:attemptToFixMapEdgeIssue()` | Remet le gizmo à l'origine (contournement d'un problème en bord de carte). | 789 |
| `C:autofillDistanceCalls()` | Demande au carnet de remplir automatiquement les appels de distance, puis marque la validation à refaire. | 2385 |
| `C:beginCustomAudioAnchorPick(basename)` | Démarre le mode « choisir un pacenote ancre » pour un clip audio personnalisé (le prochain clic dans la vue 3D choisit le pacenote). | 333 |
| `C:beginDrag()` | Début de manipulation au gizmo : mémorise l'état du waypoint (données, rotation, rayon). | 823 |
| `C:cameraPathIsPlaying()` | Indique si la caméra active est la caméra « path ». | 2553 |
| `C:cameraPathPlay()` | Démarre ou arrête la lecture de la caméra le long de la route pour le pacenote sélectionné ; au démarrage mémorise la caméra et lance l'audio de prévisualisation, à l'arrêt restaure la caméra. | 2516 |
| `C:cancelCustomAudioAnchorPick()` | Annule le choix d'ancre en cours. | 347 |
| `C:captureDrivelineEditSnapshot()` | Enregistre, pour chaque pacenote, les positions, normales et emplacements le long de la route de ses waypoints corner start/end avant une édition de driveline. | 459 |
| `C:cleanupPacenoteNames(recordHistory)` | Renumérote proprement les noms de pacenotes ; par défaut avec une entrée d'historique annulable. | 2361 |
| `C:clearState()` | Réinitialise tout l'état (arrête l'audio, vide la sélection, la validation, l'édition de driveline, le formulaire). | 135 |
| `C:createMouseDragPacenote()` | Mode Ctrl : affiche « Click to Create New Pacenote » sur la route et, au clic, crée un pacenote (corner start au clic, corner end 10 m plus loin) à sa place dans l'ordre, en respectant l'espace entre pacenotes voisins. | 1450 |
| `C:debugDrawNewPacenote(pos_cs, pos_ce)` | Aperçu de debug d'un nouveau pacenote entre deux positions (variante 1). | 1406 |
| `C:debugDrawNewPacenote2(pos_cs, pos_ce)` | Aperçu de debug d'un nouveau pacenote entre deux positions (variante 2). | 1428 |
| `C:deleteAllPacenotes()` | Supprime tous les pacenotes du carnet et désélectionne. | 2021 |
| `C:deleteSelected()` | Supprime le pacenote sélectionné s'il y en a un. | 1767 |
| `C:deleteSelectedPacenote(shouldSelect)` | Supprime le pacenote sélectionné puis sélectionne le précédent (ou le suivant) ; voir la note sur le calcul de shouldSelect. | 1773 |
| `C:deselect()` | Désélectionne le waypoint, ou à défaut le pacenote (sans effet pendant la lecture caméra). | 777 |
| `C:detectCustomAudioAnchorPickHover()` | Cherche le waypoint corner start survolé (rayon de la souris contre la sphère du waypoint) pendant le choix d'ancre audio. | 1553 |
| `C:detectMouseHoverWaypoint()` | Détermine quel waypoint est survolé par le rayon de la souris, selon la sélection et les préférences d'affichage des pacenotes précédent/suivant. Garde le plus proche de la caméra. | 1613 |
| `C:dragging()` | Pendant la manipulation au gizmo : applique translation, rotation ou échelle (rayon) au waypoint. | 837 |
| `C:draw(mouseInfo, dtReal, dtSim, dtRaw)` | Dessine l'onglet imgui : mémorise mouseInfo, met à jour l'audio de prévisualisation, traite la souris puis dessine la liste de pacenotes. | 1392 |
| `C:drawCustomAudioAnchorPickOverlay(globalOpacity)` | Dessine les sphères de départ de virage colorées selon la possibilité d'ancrer le clip, avec texte au survol. | 937 |
| `C:drawDebugCameraPlaying()` | Dessine l'état de la snaproad pendant la lecture caméra. | 1117 |
| `C:drawDebugEntrypoint(globalOpacity, dt)` | Rendu 3D principal appelé à chaque image : aperçu sans sélection, carnet, snaproad, carnet fantôme, partitions, ancres audio, position de caméra et surface d'édition de driveline. | 985 |
| `C:drawDrivelineEditToggle()` | Dessine le bouton « Edit Driveline » (orange quand actif). | 2031 |
| `C:drawPacenotesDrivelineEditSurface()` | En mode édition de driveline : gère l'interaction avec la spline, la mise à jour de géométrie, le rendu et la reprojection anti-rebond. | 1082 |
| `C:drawPacenotesList()` | Dessine les onglets « Pacenote » (formulaire) et « Audio » (liste de clips si le carnet est en mode audio custom). | 2105 |
| `C:endDragging()` | Fin de manipulation au gizmo : enregistre une action annulable dans l'historique. | 874 |
| `C:ensureDrivelineEditSnapshot()` | Prend l'instantané s'il n'existe pas encore. | 505 |
| `C:ensurePacenotesDrivelineHost()` | Crée l'hôte d'édition de driveline et charge la driveline depuis le fichier si besoin. | 429 |
| `C:ensurePreviewAudioManager()` | Crée (ou recrée si le carnet a changé) le gestionnaire audio de prévisualisation. | 256 |
| `C:ensureValidationFresh()` | Relance validate() si la validation est marquée à refaire. | 1979 |
| `C:generateElevationProfile()` | Construit un RallyManager pour la mission et appelle drivelineRoute:buildElevationProfile(). | 2627 |
| `C:getCustomAudioAnchorPickBasename()` | Renvoie le clip pour lequel on choisit une ancre. | 358 |
| `C:getRacePath()` | Renvoie le chemin de course courant de l'éditeur de course (editor_raceEditor.getCurrentPath()). | 212 |
| `C:getSnaproad()` | Renvoie la snaproad courante. | 366 |
| `C:handleCustomAudioAnchorPickMouseInput()` | Gère la souris pendant le choix d'ancre : clic sur un pacenote valide pose l'ancre, sinon affiche la raison du refus ; clic dans le vide annule. | 1576 |
| `C:handleMouseDown(hoveredWp)` | Gère le clic : sélection de pacenote/waypoint survolé, début de glisser ; Maj recentre la caméra ; clic dans le vide désélectionne. | 1123 |
| `C:handleMouseHold()` | Pendant le maintien : déplace le waypoint sélectionné (non verrouillé) vers la position de la souris accrochée à la route et oriente sa normale. | 1218 |
| `C:handleMouseInput()` | Point d'entrée de la souris : gizmo, choix d'ancre audio, édition de driveline, création Ctrl-clic ou interaction normale. | 1328 |
| `C:handleMouseUp()` | Au relâchement : enregistre le déplacement dans l'historique (annuler/rétablir) et remet à zéro l'état de glisser. | 1247 |
| `C:handleUnmodifiedMouseInteraction(hoveredWp)` | Aiguille l'entrée souris (down, hold, up, survol) sans modificateur. | 1316 |
| `C:init(rallyEditor)` | Constructeur interne : crée l'état des outils, le formulaire pacenote et le rendu du carnet fantôme. | 107 |
| `C:insertMode()` | Active le mode insertion (sans effet pendant la lecture caméra). | 1970 |
| `C:insertNewPacenoteAfter(note)` | Crée un pacenote après le pacenote donné, avec un numéro intermédiaire (ou +1 à la fin), puis retrie par nom. | 2413 |
| `C:invalidateNoSelectionPreview()` | Invalide l'aperçu affiché quand aucun pacenote n'est sélectionné. | 180 |
| `C:isCustomAudioAnchorPickActive()` | Indique si un choix d'ancre est en cours. | 354 |
| `C:isPacenotesDrivelineEditActive()` | Indique si l'édition de driveline dans l'onglet Pacenotes est active. | 408 |
| `C:isPickingCustomAudioAnchorFor(basename)` | Indique si le choix d'ancre en cours concerne ce clip. | 362 |
| `C:isValid()` | Rafraîchit la validation si besoin puis indique si le carnet est valide. | 175 |
| `C:loadSnaproad(snapshot)` | Charge la driveline sauvegardée, construit la Snaproad, la donne au carnet (setSnaproad) et reprojette les waypoints si une snaproad précédente ou un instantané existe. | 370 |
| `C:markLiveDrivelineReprojectDirty()` | Demande une reprojection en direct après le délai anti-rebond. | 542 |
| `C:markPacenoteGeometryDirty()` | Marque la géométrie des pacenotes comme à recalculer (invalide l'aperçu sans sélection). | 186 |
| `C:markValidationDirty()` | Marque la validation comme à refaire. | 1975 |
| `C:measureSelectedPacenote(applyMeasurements)` | Mesure la géométrie du virage du pacenote sélectionné via la snaproad (measurePartition) et applique optionnellement les mesures au pacenote. | 1796 |
| `C:mergeSelectedWithNextPacenote()` | Concatène le texte libre du pacenote sélectionné au début de celui du suivant, supprime le sélectionné et sélectionne le suivant. | 2608 |
| `C:mergeSelectedWithPrevPacenote()` | Concatène le texte libre du pacenote sélectionné à la fin de celui du précédent, supprime le sélectionné et sélectionne le précédent. | 2589 |
| `C:moveSelectedWaypointBackward(steps)` | Recule le waypoint sélectionné le long de la route. | 2510 |
| `C:moveSelectedWaypointForward(steps)` | Avance le waypoint sélectionné le long de la route. | 2504 |
| `C:onEditModeActivate()` | Appelée à l'activation du mode d'édition du carnet : resélectionne le pacenote courant. | 203 |
| `C:onEditModeDeactivate()` | Appelée à la désactivation du mode d'édition : arrête l'audio et remet la caméra libre. | 207 |
| `C:onPacenoteDrag(pn_sel)` | Après un déplacement de waypoint : met à jour voisins, demi-point, distances, mesure et textes structurés des notes précédente/courante/suivante. | 1191 |
| `C:onPacenotesDrivelineEditCommitted(host)` | Callback de fin d'édition de spline : régénère la driveline, la sauvegarde, puis force la reprojection. | 569 |
| `C:pacenoteSearchMatches(pacenote)` | Teste le pacenote contre le texte de recherche courant (vrai si la recherche est vide). | 2322 |
| `C:placeVehicleAtPacenote()` | Téléporte le véhicule du joueur à la position de départ associée au pacenote sélectionné. | 2402 |
| `C:refreshAfterDrivelineReproject()` | Après reprojection : remesure tous les pacenotes, remplit les appels de distance, rafraîchit le carnet et la sélection. | 530 |
| `C:refreshPacenotes(opts)` | Nettoie les noms puis rafraîchit les pacenotes du carnet sans remesure. | 2392 |
| `C:refreshPacenotesTab(snapshot, opts)` | Recharge la snaproad, invalide la correspondance audio custom, remesure tous les pacenotes et rafraîchit les notes. | 1959 |
| `C:remeasureAllPacenotes()` | Remesure tous les pacenotes (partition de la snaproad par pacenote) puis restaure la partition du pacenote sélectionné. | 1812 |
| `C:replaceSnaproadFromDrivelineV3(drivelineV3, snapshot)` | Remplace la snaproad par une nouvelle construite depuis la driveline éditée et reprojette les waypoints d'après l'instantané. | 512 |
| `C:resetGizmoTransformToOrigin()` | Place le gizmo d'axes très bas (z = -1000) pour le cacher. | 793 |
| `C:searchPacenoteMatchFn(pacenote)` | Prédicat de recherche : pacenote non manquant et correspondant au texte de recherche. | 2318 |
| `C:selectNextPacenote()` | Sélectionne le pacenote suivant qui correspond à la recherche (ou le premier si rien n'est sélectionné). Sans effet pendant la lecture caméra. | 1909 |
| `C:selectNextWaypoint()` | Alterne la sélection entre corner start et corner end du pacenote courant (corner start si aucun waypoint n'est sélectionné). | 2450 |
| `C:selectPacenote(id)` | Sélectionne un pacenote par id (nil pour désélectionner) : met à jour le formulaire, la partition de snaproad, la mesure et la caméra. Ignoré pendant l'édition de driveline si id est donné. | 685 |
| `C:selectPrevPacenote()` | Sélectionne le pacenote précédent qui correspond à la recherche (ou le dernier si rien n'est sélectionné). Sans effet pendant la lecture caméra. | 1859 |
| `C:selectRecentPacenote()` | Si rien n'est sélectionné, resélectionne le dernier pacenote sélectionné. | 1842 |
| `C:selectWaypoint(id)` | Sélectionne un waypoint par id (sélectionne aussi son pacenote) et règle le filtre de la snaproad. nil désélectionne le waypoint. | 736 |
| `C:selected()` | Appelée par l'éditeur quand l'onglet est sélectionné : prépare le mode d'édition, recharge snaproad et pacenotes, ajoute les raccourcis (Ctrl : créer, Delete : supprimer) et émet onEditorEditModeChanged(nil, nil). | 640 |
| `C:selectedPacenote()` | Renvoie le pacenote sélectionné. | 234 |
| `C:selectedWaypoint()` | Renvoie le waypoint sélectionné du pacenote sélectionné. | 243 |
| `C:setHover(wp)` | Mémorise le waypoint survolé (hover_wp_id) et l'état de la touche Maj. | 1290 |
| `C:setModeEditAll()` | Passe en mode 'edit_all' et déverrouille les waypoints. | 2570 |
| `C:setModeEditCorners()` | Passe en mode 'edit_corners' et déverrouille les waypoints. | 2575 |
| `C:setOrbitCameraToSelectedPacenote()` | Oriente la caméra (orbite pacenoteOrbit ou caméra V2) sur le pacenote sélectionné. | 671 |
| `C:setPacenotesDrivelineEditActive(active)` | Active ou désactive le mode d'édition de driveline (désélectionne tout et prend un instantané à l'activation). | 583 |
| `C:setPath(path)` | Définit le carnet courant ; s'il change, arrête l'audio et abandonne l'édition de driveline en cours. Marque la validation à refaire. | 190 |
| `C:setupEditMode()` | Désélectionne le waypoint, passe en mode edit_corners et règle la partition de snaproad sur le pacenote sélectionné. | 2580 |
| `C:startPreviewAudio(pacenote)` | Met en file les clips audio du pacenote pour les jouer pendant la lecture de la caméra. | 270 |
| `C:stopPreviewAudio()` | Vide la file audio de prévisualisation et la désactive. | 304 |
| `C:toggleCornerCalls()` | Stub : journalise seulement que la fonction sera implémentée. | 2557 |
| `C:unselect()` | Appelée quand l'onglet est quitté : arrête l'audio, remet la caméra libre, retire les raccourcis et émet onEditorEditModeChanged(nil, nil). | 659 |
| `C:updateGizmoTransform(index)` | Place le gizmo sur un waypoint si le gizmo est autorisé. | 803 |
| `C:updatePreviewAudio(dtReal, dtSim, dtRaw)` | Appelée à chaque image : fait avancer le gestionnaire audio tant que la caméra path joue, et s'arrête sinon ou quand la file est vide. | 311 |
| `C:validate()` | Valide chaque pacenote, compte les TODO et les notes invalides, remplit validation_issues et notes_valid. | 1985 |
| `C:wpPosForSimpleDrag(wp, mousePos, mouseOffset)` | Calcule la nouvelle position d'un waypoint glissé (accrochage en z puis à la snaproad) et une position servant à orienter sa normale perpendiculairement. | 1696 |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onEditorEditModeChanged` — écouté par 1 module(s)

## Appels vers le moteur (C++)

- `debugDrawer:` `drawSphere`, `drawSquarePrism`, `drawTextAdvanced`
- `worldEditorCppApi.` `getAxisGizmoScale`, `setAxisGizmoSelectedElement`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/rallyEditor/pacenotes.lua`.*
