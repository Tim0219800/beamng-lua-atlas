---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/rallyEditor.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Fenêtre principale « Rally Editor » de l'éditeur de monde (menu Gameplay > Rally Editor, mode d'édition « Rally Editor » / notebookEditMode, action map « rallyEditor »). Elle édite un carnet de notes de rallye (notebook : *.notebook.json dans le dossier d'une mission, sous rallyUtil.notebooksPath) à travers des onglets : notebookInfo, missionTab, voicepacksTab, pacenotes, drivelineTab, systemPacenotesTab, measurementsTab, aiCompetitorsTab, et testTab uniquement si un fichier dev.txt existe à la racine. Elle gère la mission courante (currentMissionDir/Name/Id), le choix de voicepack (pick), un « ghost notebook » de comparaison, des fenêtres annexes (DevTools, RallyToolbox, calibration, chargeur de spéciale) et les préférences rallyEditor.* (editing, view, waypoints, ui). Les autres modules (onglets) appellent ses getters (getPref*, getCurrentPath…).
--- Accès : extension `editor_rallyEditor` : `extensions.load("editor_rallyEditor")`, puis la globale `editor_rallyEditor`
---@class editor_rallyEditor
---@field dependencies table<integer, string> Extensions requises : {'gameplay_missions_missions'}.
---@field devToolsWindowOpen ImBoolPtr Indicateur d'ouverture de la fenêtre DevTools (remplacé à la désérialisation).
---@field notebookBasenamesForPick function Alias de voicepack.notebookBasenamesForPick (liste des noms de carnets candidats pour un pick de voicepack).
---@field picksMatch function Alias de voicepack.picksMatch (compatibilité avec les appelants externes).
---@field rallyToolboxWindowOpen ImBoolPtr Indicateur d'ouverture de la fenêtre RallyToolbox (remplacé à la désérialisation).
editor_rallyEditor = {}

--- Indique si le gizmo est autorisé : vrai quand le mode d'édition courant est « Rally Editor ».
---Source : lua/ge/extensions/editor/rallyEditor.lua:1439
---@return boolean  true en mode Rally Editor.
function editor_rallyEditor.allowGizmo() end

--- Construit la liste des voicepacks proposés pour une mission (voicepack.buildPickerEntries avec suffixe « (mission) » pour les voicepacks de mission).
---Source : lua/ge/extensions/editor/rallyEditor.lua:1450
---@param missionDir string Dossier de la mission.
---@return table<integer, table>  Entrées contenant notamment un champ pick.
function editor_rallyEditor.buildVoicepackPickerEntries(missionDir) end

--- Lance/arrête la lecture du chemin de caméra de l'onglet Pacenotes ; sans effet si un autre onglet est actif.
---Source : lua/ge/extensions/editor/rallyEditor.lua:302
function editor_rallyEditor.cameraPathPlay() end

--- Change l'opacité du dessin de debug par pas de 0.2, bornée entre 0.1 et 1.0 : val = 0 diminue, val = 1.0 augmente.
---Source : lua/ge/extensions/editor/rallyEditor.lua:1377
---@param val number 0 pour diminuer, 1.0 pour augmenter.
function editor_rallyEditor.changeDebugDrawOpacity(val) end

--- Efface le carnet « fantôme » de comparaison s'il existe.
---Source : lua/ge/extensions/editor/rallyEditor.lua:1295
function editor_rallyEditor.clearGhostNotebook() end

--- Désélectionne dans l'onglet Pacenotes (ignoré hors de cet onglet).
---Source : lua/ge/extensions/editor/rallyEditor.lua:247
function editor_rallyEditor.deselect() end

--- Choisit le carnet à charger pour une mission : résolution par voicepack, sinon premier carnet existant, sinon « structured.notebook.json » à créer.
---Source : lua/ge/extensions/editor/rallyEditor.lua:1323
---@param missionDir string Dossier de la mission.
---@return string  Chemin complet du fichier de carnet.
function editor_rallyEditor.detectNotebookToLoad(missionDir) end

--- Dessine la fenêtre modale de chargement de spéciale (StageLoaderModal).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/rallyEditor.lua:612
function editor_rallyEditor.drawStageLoaderModal() end

--- Dessine dans la barre d'outils le texte « mission | carnet | voicepack » (en cyan) avec une infobulle ; ne fait rien si aucune mission courante.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/rallyEditor.lua:616
---@param pathObj table|nil Carnet courant (basenameNoExt() pour le nom).
function editor_rallyEditor.drawToolbarMissionContext(pathObj) end

--- Renvoie le chemin du fichier du carnet courant.
---Source : lua/ge/extensions/editor/rallyEditor.lua:1369
---@return string|nil  currentPath.fname ou nil si aucun carnet.
function editor_rallyEditor.getCurrentFilename() end

--- Renvoie le dossier de la mission courante.
---Source : lua/ge/extensions/editor/rallyEditor.lua:1443
---@return string|nil  Chemin absolu.
function editor_rallyEditor.getCurrentMissionDir() end

--- Renvoie l'identifiant de la mission courante (ex. « italy/rallyStage/001-ss-fastello-norte », extrait après « /missions/ »).
---Source : lua/ge/extensions/editor/rallyEditor.lua:1445
---@return string|nil  Identifiant ou nil.
function editor_rallyEditor.getCurrentMissionId() end

--- Renvoie le nom lisible de la mission (info.json name traduit, sinon dernier segment du chemin).
---Source : lua/ge/extensions/editor/rallyEditor.lua:1444
---@return string|nil  Nom.
function editor_rallyEditor.getCurrentMissionName() end

--- Renvoie le carnet (notebook) en cours d'édition.
---Source : lua/ge/extensions/editor/rallyEditor.lua:1442
---@return table|nil  Objet carnet ou nil.
function editor_rallyEditor.getCurrentPath() end

--- Renvoie le choix de voicepack courant : {type='voicepack', scope='global'|'mission', dirname=...}.
---Source : lua/ge/extensions/editor/rallyEditor.lua:1446
---@return table|nil  Pick courant.
function editor_rallyEditor.getCurrentVoicepackPick() end

--- Renvoie l'erreur du dernier chargement du carnet fantôme.
---Source : lua/ge/extensions/editor/rallyEditor.lua:1313
---@return string|nil  Message d'erreur.
function editor_rallyEditor.getGhostNotebookError() end

--- Renvoie l'étiquette du carnet fantôme correspondant à une pacenote.
---Source : lua/ge/extensions/editor/rallyEditor.lua:1317
---@param pacenote table Pacenote du carnet courant.
---@return string|nil  Étiquette.
function editor_rallyEditor.getGhostNotebookLabelForPacenote(pacenote) end

--- Renvoie le carnet fantôme chargé.
---Source : lua/ge/extensions/editor/rallyEditor.lua:1301
---@return table|nil  Carnet fantôme.
function editor_rallyEditor.getGhostNotebookPath() end

--- Renvoie le nom de fichier du carnet fantôme sélectionné.
---Source : lua/ge/extensions/editor/rallyEditor.lua:1305
---@return string|nil  Chemin du fichier.
function editor_rallyEditor.getGhostNotebookSelectedFname() end

--- Renvoie l'étiquette du carnet fantôme sélectionné.
---Source : lua/ge/extensions/editor/rallyEditor.lua:1309
---@return string  Étiquette, ou « (none) ».
function editor_rallyEditor.getGhostNotebookSelectedLabel() end

--- Renvoie le dossier de mission du carnet courant (currentPath:getMissionDir()).
---Source : lua/ge/extensions/editor/rallyEditor.lua:1517
---@return string|nil  Dossier ou nil.
function editor_rallyEditor.getMissionDir() end

--- Renvoie l'identifiant de mission du carnet courant (currentPath:getMissionId()).
---Source : lua/ge/extensions/editor/rallyEditor.lua:1518
---@return string|nil  Identifiant ou nil.
function editor_rallyEditor.getMissionId() end

--- Renvoie l'onglet Pacenotes.
---Source : lua/ge/extensions/editor/rallyEditor.lua:1516
---@return table|nil  Instance de l'onglet.
function editor_rallyEditor.getPacenotesWindow() end

--- Préférence rallyEditor.waypoints.defaultRadius : rayon d'affichage des waypoints.
---Source : lua/ge/extensions/editor/rallyEditor.lua:1246
---@return integer  Rayon (8 par défaut).
function editor_rallyEditor.getPrefDefaultRadius() end

--- Largeur du prisme (largeur de véhicule) servant à dessiner la spline de driveline.
---Source : lua/ge/extensions/editor/rallyEditor.lua:1242
---@return number  Largeur en mètres, bornée à 0.5-5 (1.945 par défaut).
function editor_rallyEditor.getPrefDrivelineSplinePrismWidth() end

--- Préférence rallyEditor.editing.lockWaypoints : verrouille la position des waypoints.
---Source : lua/ge/extensions/editor/rallyEditor.lua:1254
---@return boolean  false par défaut.
function editor_rallyEditor.getPrefLockWaypoints() end

--- Distance caméra à partir de laquelle l'aperçu sans sélection passe en vue d'ensemble arc-en-ciel.
---Source : lua/ge/extensions/editor/rallyEditor.lua:1226
---@return number  Distance en mètres, bornée à 100-1500 (650 par défaut).
function editor_rallyEditor.getPrefPacenoteLabelDistance() end

--- Mode d'affichage des étiquettes d'aperçu de pacenotes.
---Source : lua/ge/extensions/editor/rallyEditor.lua:1222
---@return string  « all » ou « distance » (par défaut).
function editor_rallyEditor.getPrefPacenoteLabelMode() end

--- Nombre de pacenotes avant et après le pivot de la caméra qui affichent leur étiquette.
---Source : lua/ge/extensions/editor/rallyEditor.lua:1230
---@return integer  0 à 10 (3 par défaut).
function editor_rallyEditor.getPrefPacenoteLabelNearCameraCount() end

--- Indique si les textes d'aperçu des pacenotes précédente et suivante sont affichés.
---Source : lua/ge/extensions/editor/rallyEditor.lua:1234
---@return boolean  true par défaut.
function editor_rallyEditor.getPrefShowAdjacentPacenoteText() end

--- Vrai si le mode d'étiquettes est « all ».
---Source : lua/ge/extensions/editor/rallyEditor.lua:1218
---@return boolean  true si toutes les étiquettes sont affichées.
function editor_rallyEditor.getPrefShowAllPacenoteLabels() end

--- Affiche aussi la pacenote suivante quand une pacenote est sélectionnée.
---Source : lua/ge/extensions/editor/rallyEditor.lua:1214
---@return boolean  true par défaut.
function editor_rallyEditor.getPrefShowNextPacenote() end

--- Affiche aussi la pacenote précédente quand une pacenote est sélectionnée.
---Source : lua/ge/extensions/editor/rallyEditor.lua:1210
---@return boolean  true par défaut.
function editor_rallyEditor.getPrefShowPreviousPacenote() end

--- Indique si la fenêtre flottante d'utilitaire de la pacenote sélectionnée est affichée.
---Source : lua/ge/extensions/editor/rallyEditor.lua:1238
---@return boolean  false par défaut.
function editor_rallyEditor.getPrefShowSelectedPacenoteUtility() end

--- Largeur du champ notes.note.freeform d'une pacenote.
---Source : lua/ge/extensions/editor/rallyEditor.lua:1250
---@return integer  Largeur (300 par défaut, de 1 à 1000).
function editor_rallyEditor.getPrefUiPacenoteNoteFieldWidth() end

--- Méthode de recalage en Z lors du glisser d'un waypoint, avant de chercher le point de snaproad le plus proche.
---Source : lua/ge/extensions/editor/rallyEditor.lua:1258
---@return string  Valeur valide de zSnap (zSnap.defaultMethod sinon).
function editor_rallyEditor.getPrefWaypointSnapMethod() end

--- Indique si le chemin du snaproad est dessiné au premier plan (option de vue éphémère, remise à false à la désactivation du mode).
---Source : lua/ge/extensions/editor/rallyEditor.lua:1459
---@return boolean  Valeur courante.
function editor_rallyEditor.getViewSnaproadPathOnTop() end

--- Censée renvoyer les préférences volatiles ; renvoie la variable non définie volatilePreferences, donc nil (voir notes).
---Source : lua/ge/extensions/editor/rallyEditor.lua:1514
---@return nil  Toujours nil.
function editor_rallyEditor.getVolatilePreferences() end

--- Active le mode d'insertion de l'onglet Pacenotes (ignoré hors de cet onglet).
---Source : lua/ge/extensions/editor/rallyEditor.lua:233
function editor_rallyEditor.insertMode() end

--- Indique si la fenêtre de calibration est ouverte.
---Source : lua/ge/extensions/editor/rallyEditor.lua:1510
---@return boolean  État de la fenêtre.
function editor_rallyEditor.isCalibrationWindowOpen() end

--- Vrai si DevTools est ouvert et que sa section d'outils de pacenotes est dépliée.
---Source : lua/ge/extensions/editor/rallyEditor.lua:1520
---@return boolean  État de la section.
function editor_rallyEditor.isPacenotesToolsSectionExpanded() end

--- Vrai si la fenêtre RallyToolbox ou DevTools est ouverte.
---Source : lua/ge/extensions/editor/rallyEditor.lua:1425
---@return boolean  true si l'une des deux est ouverte.
function editor_rallyEditor.isToolboxOpen() end

--- Indique si la fenêtre « rallyEditor » est affichée.
---Source : lua/ge/extensions/editor/rallyEditor.lua:1452
---@return boolean  Visibilité.
function editor_rallyEditor.isVisible() end

--- Liste les carnets proposés comme carnet fantôme.
---Source : lua/ge/extensions/editor/rallyEditor.lua:1285
---@return table  Choix (liste vide si le module fantôme n'est pas prêt).
function editor_rallyEditor.listGhostNotebookChoices() end

--- Liste, triés, les fichiers *.notebook.json (recherche récursive) sous le dossier des carnets d'une mission.
---Source : lua/ge/extensions/editor/rallyEditor.lua:1267
---@param folder string|nil Dossier de la mission ; par défaut celui du carnet courant (erreur si aucun carnet chargé).
---@return table<integer, string>  Chemins complets triés.
function editor_rallyEditor.listNotebooks(folder) end

--- Définit la mission courante, construit la liste des voicepacks et applique le premier (ce qui charge son premier carnet) ; sinon efface le carnet.
---Source : lua/ge/extensions/editor/rallyEditor.lua:1345
---@param missionDir string Dossier de la mission.
function editor_rallyEditor.loadForMissionEditor(missionDir) end

--- Charge un carnet existant (rallyUtil.loadNotebook), le définit comme courant, met à jour tous les onglets et recalcule les notes structurées. Journalise une erreur si le chargement échoue.
---Source : lua/ge/extensions/editor/rallyEditor.lua:416
---@param fullFilename string Chemin complet du fichier .notebook.json.
function editor_rallyEditor.loadNotebook(fullFilename) end

--- Définit la mission courante, retire le pick de voicepack, détecte le carnet (detectNotebookToLoad) et le charge ou le crée.
---Source : lua/ge/extensions/editor/rallyEditor.lua:1357
---@param missionDir string Dossier de la mission.
function editor_rallyEditor.loadOrCreateForMissionEditor(missionDir) end

--- Charge le carnet ou, s'il est introuvable, en crée un nouveau (rallyUtil.createNotebook), puis met à jour les onglets et recalcule les notes structurées.
---Source : lua/ge/extensions/editor/rallyEditor.lua:400
---@param fullFilename string Chemin complet du fichier .notebook.json.
function editor_rallyEditor.loadOrCreateNotebook(fullFilename) end

--- Zoom de la caméra « pacenoteOrbit » à la molette : val = 0 zoome de 0.4, val = 1.0 dézoome de 0.4. Sans effet avec une autre caméra.
---Source : lua/ge/extensions/editor/rallyEditor.lua:1389
---@param val number 0 ou 1.0.
function editor_rallyEditor.mouseWheelZoom(val) end

--- Appelé directement par l'action d'entrée : demande le déplacement du waypoint sélectionné vers l'arrière (répété avec anti-rebond de 0.25 s). Seulement dans l'onglet Pacenotes.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/rallyEditor.lua:292
---@param v number 0 relâché, 1 appuyé.
function editor_rallyEditor.moveSelectedWaypointBackward(v) end

--- Appelé directement par l'action d'entrée : demande le déplacement du waypoint sélectionné vers l'avant (anti-rebond de 0.25 s). Seulement dans l'onglet Pacenotes.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/rallyEditor.lua:282
---@param v number 0 relâché, 1 appuyé.
function editor_rallyEditor.moveSelectedWaypointForward(v) end

--- Appelé après un rechargement Lua avec l'état sauvegardé : restaure la mission, le pick de voicepack (les picks « custom » hérités sont ignorés), le carnet (ou le premier carnet du pick si le fichier n'existe plus) et l'état des fenêtres Toolbox/DevTools.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/rallyEditor.lua:1133
---@param data table|nil Table de onSerialize.
function editor_rallyEditor.onDeserialized(data) end

--- Appelé à chaque frame par l'éditeur : dessine la fenêtre (menus File, View, Tools, onglets, entrées clavier et souris, fenêtres annexes).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/rallyEditor.lua:979
---@param dtReal number Delta temps réel.
---@param dtSim number Delta temps de simulation.
---@param dtRaw number Delta temps brut.
function editor_rallyEditor.onEditorGui(dtReal, dtSim, dtRaw) end

--- Appelé à l'initialisation de l'éditeur, y compris après un rechargement Lua (Ctrl+L) : réinitialise les références, crée le ghost notebook, déclare le mode d'édition notebookEditMode, enregistre la fenêtre et le menu Gameplay > Rally Editor, instancie les onglets et sélectionne Pacenotes (ou le premier onglet utile s'il n'y a pas de carnet).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/rallyEditor.lua:1037
function editor_rallyEditor.onEditorInitialized() end

--- Déclare la catégorie de préférences rallyEditor (editing, view, waypoints, ui).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/rallyEditor.lua:1167
---@param prefsRegistry table Registre de préférences de l'éditeur.
function editor_rallyEditor.onEditorRegisterPreferences(prefsRegistry) end

--- Si la fenêtre masquée est rallyEditor, repasse en mode objectSelect.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/rallyEditor.lua:1110
---@param windowName string Nom de la fenêtre.
function editor_rallyEditor.onEditorToolWindowHide(windowName) end

--- Appelé avant un rechargement Lua ; sauvegarde mission, pick de voicepack, fichier du carnet courant et état d'ouverture de RallyToolbox et DevTools.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/rallyEditor.lua:1122
---@return table  {currentMissionDir, currentVoicepackPick, currentNotebookFname, rallyToolboxWindowOpen, devToolsWindowOpen}.
function editor_rallyEditor.onSerialize() end

--- Hook appelé à la réinitialisation d'un véhicule : transmis à DevTools s'il est ouvert.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/rallyEditor.lua:1429
function editor_rallyEditor.onVehicleResetted() end

--- Si la fenêtre qui prend le focus est rallyEditor, active le mode d'édition notebookEditMode.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/rallyEditor.lua:1116
---@param windowName string Nom de la fenêtre.
function editor_rallyEditor.onWindowGotFocus(windowName) end

--- Ouvre la fenêtre modale « Open Rally Stage... ».
---Source : lua/ge/extensions/editor/rallyEditor.lua:608
function editor_rallyEditor.openStageLoaderModal() end

--- Enregistre le carnet courant (currentPath:save()). Journalise un avertissement s'il n'y a aucun carnet chargé.
---Source : lua/ge/extensions/editor/rallyEditor.lua:212
function editor_rallyEditor.saveNotebook() end

--- Sélectionne un carnet fantôme de comparaison par nom de fichier.
---Source : lua/ge/extensions/editor/rallyEditor.lua:1290
---@param fname string Chemin du carnet.
---@return boolean  Résultat de la sélection ; false si le module fantôme n'est pas prêt.
function editor_rallyEditor.selectGhostNotebook(fname) end

--- Sélectionne la pacenote suivante dans l'onglet Pacenotes (ignoré ailleurs).
---Source : lua/ge/extensions/editor/rallyEditor.lua:228
function editor_rallyEditor.selectNextPacenote() end

--- Sélectionne le waypoint suivant dans l'onglet Pacenotes (ignoré ailleurs).
---Source : lua/ge/extensions/editor/rallyEditor.lua:252
function editor_rallyEditor.selectNextWaypoint() end

--- Sélectionne la pacenote précédente dans l'onglet Pacenotes (ignoré ailleurs).
---Source : lua/ge/extensions/editor/rallyEditor.lua:223
function editor_rallyEditor.selectPrevPacenote() end

--- Passe à la caméra libre de l'éditeur en conservant la position et la rotation de la caméra actuelle.
---Source : lua/ge/extensions/editor/rallyEditor.lua:238
function editor_rallyEditor.setFreeCam() end

--- Écrit la préférence rallyEditor.editing.lockWaypoints.
---Source : lua/ge/extensions/editor/rallyEditor.lua:1263
---@param val boolean true pour verrouiller.
function editor_rallyEditor.setPrefLockWaypoints(val) end

--- Définit le pick de voicepack actif et charge automatiquement le premier carnet candidat ; si le pick n'a aucun carnet résolvable, efface le carnet chargé.
---Source : lua/ge/extensions/editor/rallyEditor.lua:445
---@param pick table {type='voicepack', scope='global'|'mission', dirname=<dossier du voicepack>}.
function editor_rallyEditor.setVoicepackPick(pick) end

--- Vide la sélection, affiche la fenêtre Rally Editor et active le mode d'édition notebookEditMode.
---Source : lua/ge/extensions/editor/rallyEditor.lua:1000
function editor_rallyEditor.show() end

--- Sélectionne l'onglet Pacenotes (sélection programmatique).
---Source : lua/ge/extensions/editor/rallyEditor.lua:983
function editor_rallyEditor.showPacenotesTab() end

--- Affiche la fenêtre (ou lui donne le focus), ouvre l'onglet Pacenotes et active le mode d'édition notebookEditMode.
---Source : lua/ge/extensions/editor/rallyEditor.lua:988
function editor_rallyEditor.showRallyTool() end

--- Ouvre ou ferme la fenêtre de calibration.
---Source : lua/ge/extensions/editor/rallyEditor.lua:1511
function editor_rallyEditor.toggleCalibrationWindow() end

--- Active/désactive les annonces de virages dans l'onglet Pacenotes (ignoré ailleurs).
---Source : lua/ge/extensions/editor/rallyEditor.lua:307
function editor_rallyEditor.toggleCornerCalls() end

--- Appelé directement par l'action d'entrée : zoom avant continu (anti-rebond 0.05 s) de la caméra « pacenoteOrbit ». Sans effet avec une autre caméra.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/rallyEditor.lua:1400
---@param val number 0 relâché, 1 appuyé.
function editor_rallyEditor.zoomIn(val) end

--- Appelé directement par l'action d'entrée : zoom arrière continu (anti-rebond 0.05 s) de la caméra « pacenoteOrbit ». Sans effet avec une autre caméra.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/rallyEditor.lua:1413
---@param val number 0 relâché, 1 appuyé.
function editor_rallyEditor.zoomOut(val) end

