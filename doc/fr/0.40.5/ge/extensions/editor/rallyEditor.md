# `editor_rallyEditor`

*Fichier : `lua/ge/extensions/editor/rallyEditor.lua` · VM : Game Engine (GE) · 1523 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_rallyEditor` : `extensions.load("editor_rallyEditor")`, puis la globale `editor_rallyEditor`

Fenêtre principale « Rally Editor » de l'éditeur de monde (menu Gameplay > Rally Editor, mode d'édition « Rally Editor » / notebookEditMode, action map « rallyEditor »). Elle édite un carnet de notes de rallye (notebook : *.notebook.json dans le dossier d'une mission, sous rallyUtil.notebooksPath) à travers des onglets : notebookInfo, missionTab, voicepacksTab, pacenotes, drivelineTab, systemPacenotesTab, measurementsTab, aiCompetitorsTab, et testTab uniquement si un fichier dev.txt existe à la racine. Elle gère la mission courante (currentMissionDir/Name/Id), le choix de voicepack (pick), un « ghost notebook » de comparaison, des fenêtres annexes (DevTools, RallyToolbox, calibration, chargeur de spéciale) et les préférences rallyEditor.* (editing, view, waypoints, ui). Les autres modules (onglets) appellent ses getters (getPref*, getCurrentPath…).

## Exemple

```lua
local nb = editor_rallyEditor.getCurrentPath()  -- carnet en cours ou nil
editor_rallyEditor.loadOrCreateForMissionEditor('/gameplay/missions/italy/rallyStage/001-...')
editor_rallyEditor.saveNotebook()
```

## Remarques

- Préférences enregistrées : rallyEditor.editing (lockWaypoints [cachée], showPreviousPacenote, showNextPacenote, waypointSnapMethod), rallyEditor.view (pacenoteLabelMode « all »|« distance », pacenoteLabelDistance 100-1500 [650 par défaut], pacenoteLabelNearCameraCount 0-10 [3], showAdjacentPacenoteText, showSelectedPacenoteUtility, drivelineSplinePrismWidth 0.5-5 [1.945], showAllPacenoteLabels [héritée, cachée]), rallyEditor.waypoints.defaultRadius (8, de 1 à 50), rallyEditor.ui.pacenoteNoteFieldWidth (300).
- Bug : M.getVolatilePreferences renvoie la variable « volatilePreferences » qui n'est jamais définie dans ce fichier ; elle renvoie donc toujours nil.
- La préférence héritée showAllPacenoteLabels = true force le mode d'étiquettes « all ».
- moveSelectedWaypointForward/Backward, zoomIn et zoomOut sont appelés directement par des actions d'entrée avec une valeur (0 = relâché, 1 = appuyé) ; la répétition est limitée par un anti-rebond (0.25 s pour les waypoints, 0.05 s pour le zoom). zoomIn/zoomOut/mouseWheelZoom n'agissent que si la caméra active est « pacenoteOrbit ».
- Les raccourcis de navigation (selectPrevPacenote, selectNextPacenote, insertMode, deselect, selectNextWaypoint, cameraPathPlay, toggleCornerCalls) ne font rien si l'onglet actif n'est pas Pacenotes.
- Dépendance déclarée : gameplay_missions_missions. L'extension gameplay_rallyLoop est chargée/déchargée par la case « RallyLoop Extension » du menu Tools.
- À l'activation puis désactivation du mode d'édition, resetEphemeralViewOptions remet à zéro l'option de masquage de la forêt (theForest) et l'affichage du snaproad au premier plan.

**Dépendances (chargées avant) :** `gameplay_missions_missions`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_rallyEditor.allowGizmo()` | Indique si le gizmo est autorisé : vrai quand le mode d'édition courant est « Rally Editor ». | 1439 |
| `editor_rallyEditor.buildVoicepackPickerEntries(missionDir)` | Construit la liste des voicepacks proposés pour une mission (voicepack.buildPickerEntries avec suffixe « (mission) » pour les voicepacks de mission). | 1450 |
| `editor_rallyEditor.cameraPathPlay()` | Lance/arrête la lecture du chemin de caméra de l'onglet Pacenotes ; sans effet si un autre onglet est actif. | 302 |
| `editor_rallyEditor.changeDebugDrawOpacity(val)` | Change l'opacité du dessin de debug par pas de 0.2, bornée entre 0.1 et 1.0 : val = 0 diminue, val = 1.0 augmente. | 1377 |
| `editor_rallyEditor.clearGhostNotebook()` | Efface le carnet « fantôme » de comparaison s'il existe. | 1295 |
| `editor_rallyEditor.deselect()` | Désélectionne dans l'onglet Pacenotes (ignoré hors de cet onglet). | 247 |
| `editor_rallyEditor.detectNotebookToLoad(missionDir)` | Choisit le carnet à charger pour une mission : résolution par voicepack, sinon premier carnet existant, sinon « structured.notebook.json » à créer. | 1323 |
| `editor_rallyEditor.drawStageLoaderModal()` | Dessine la fenêtre modale de chargement de spéciale (StageLoaderModal). *(interne)* | 612 |
| `editor_rallyEditor.drawToolbarMissionContext(pathObj)` | Dessine dans la barre d'outils le texte « mission \| carnet \| voicepack » (en cyan) avec une infobulle ; ne fait rien si aucune mission courante. *(interne)* | 616 |
| `editor_rallyEditor.getCurrentFilename()` | Renvoie le chemin du fichier du carnet courant. | 1369 |
| `editor_rallyEditor.getCurrentMissionDir()` | Renvoie le dossier de la mission courante. | 1443 |
| `editor_rallyEditor.getCurrentMissionId()` | Renvoie l'identifiant de la mission courante (ex. « italy/rallyStage/001-ss-fastello-norte », extrait après « /missions/ »). | 1445 |
| `editor_rallyEditor.getCurrentMissionName()` | Renvoie le nom lisible de la mission (info.json name traduit, sinon dernier segment du chemin). | 1444 |
| `editor_rallyEditor.getCurrentPath()` | Renvoie le carnet (notebook) en cours d'édition. | 1442 |
| `editor_rallyEditor.getCurrentVoicepackPick()` | Renvoie le choix de voicepack courant : {type='voicepack', scope='global'\|'mission', dirname=...}. | 1446 |
| `editor_rallyEditor.getGhostNotebookError()` | Renvoie l'erreur du dernier chargement du carnet fantôme. | 1313 |
| `editor_rallyEditor.getGhostNotebookLabelForPacenote(pacenote)` | Renvoie l'étiquette du carnet fantôme correspondant à une pacenote. | 1317 |
| `editor_rallyEditor.getGhostNotebookPath()` | Renvoie le carnet fantôme chargé. | 1301 |
| `editor_rallyEditor.getGhostNotebookSelectedFname()` | Renvoie le nom de fichier du carnet fantôme sélectionné. | 1305 |
| `editor_rallyEditor.getGhostNotebookSelectedLabel()` | Renvoie l'étiquette du carnet fantôme sélectionné. | 1309 |
| `editor_rallyEditor.getMissionDir()` | Renvoie le dossier de mission du carnet courant (currentPath:getMissionDir()). | 1517 |
| `editor_rallyEditor.getMissionId()` | Renvoie l'identifiant de mission du carnet courant (currentPath:getMissionId()). | 1518 |
| `editor_rallyEditor.getPacenotesWindow()` | Renvoie l'onglet Pacenotes. | 1516 |
| `editor_rallyEditor.getPrefDefaultRadius()` | Préférence rallyEditor.waypoints.defaultRadius : rayon d'affichage des waypoints. | 1246 |
| `editor_rallyEditor.getPrefDrivelineSplinePrismWidth()` | Largeur du prisme (largeur de véhicule) servant à dessiner la spline de driveline. | 1242 |
| `editor_rallyEditor.getPrefLockWaypoints()` | Préférence rallyEditor.editing.lockWaypoints : verrouille la position des waypoints. | 1254 |
| `editor_rallyEditor.getPrefPacenoteLabelDistance()` | Distance caméra à partir de laquelle l'aperçu sans sélection passe en vue d'ensemble arc-en-ciel. | 1226 |
| `editor_rallyEditor.getPrefPacenoteLabelMode()` | Mode d'affichage des étiquettes d'aperçu de pacenotes. | 1222 |
| `editor_rallyEditor.getPrefPacenoteLabelNearCameraCount()` | Nombre de pacenotes avant et après le pivot de la caméra qui affichent leur étiquette. | 1230 |
| `editor_rallyEditor.getPrefShowAdjacentPacenoteText()` | Indique si les textes d'aperçu des pacenotes précédente et suivante sont affichés. | 1234 |
| `editor_rallyEditor.getPrefShowAllPacenoteLabels()` | Vrai si le mode d'étiquettes est « all ». | 1218 |
| `editor_rallyEditor.getPrefShowNextPacenote()` | Affiche aussi la pacenote suivante quand une pacenote est sélectionnée. | 1214 |
| `editor_rallyEditor.getPrefShowPreviousPacenote()` | Affiche aussi la pacenote précédente quand une pacenote est sélectionnée. | 1210 |
| `editor_rallyEditor.getPrefShowSelectedPacenoteUtility()` | Indique si la fenêtre flottante d'utilitaire de la pacenote sélectionnée est affichée. | 1238 |
| `editor_rallyEditor.getPrefUiPacenoteNoteFieldWidth()` | Largeur du champ notes.note.freeform d'une pacenote. | 1250 |
| `editor_rallyEditor.getPrefWaypointSnapMethod()` | Méthode de recalage en Z lors du glisser d'un waypoint, avant de chercher le point de snaproad le plus proche. | 1258 |
| `editor_rallyEditor.getViewSnaproadPathOnTop()` | Indique si le chemin du snaproad est dessiné au premier plan (option de vue éphémère, remise à false à la désactivation du mode). | 1459 |
| `editor_rallyEditor.getVolatilePreferences()` | Censée renvoyer les préférences volatiles ; renvoie la variable non définie volatilePreferences, donc nil (voir notes). | 1514 |
| `editor_rallyEditor.insertMode()` | Active le mode d'insertion de l'onglet Pacenotes (ignoré hors de cet onglet). | 233 |
| `editor_rallyEditor.isCalibrationWindowOpen()` | Indique si la fenêtre de calibration est ouverte. | 1510 |
| `editor_rallyEditor.isPacenotesToolsSectionExpanded()` | Vrai si DevTools est ouvert et que sa section d'outils de pacenotes est dépliée. | 1520 |
| `editor_rallyEditor.isToolboxOpen()` | Vrai si la fenêtre RallyToolbox ou DevTools est ouverte. | 1425 |
| `editor_rallyEditor.isVisible()` | Indique si la fenêtre « rallyEditor » est affichée. | 1452 |
| `editor_rallyEditor.listGhostNotebookChoices()` | Liste les carnets proposés comme carnet fantôme. | 1285 |
| `editor_rallyEditor.listNotebooks(folder)` | Liste, triés, les fichiers *.notebook.json (recherche récursive) sous le dossier des carnets d'une mission. | 1267 |
| `editor_rallyEditor.loadForMissionEditor(missionDir)` | Définit la mission courante, construit la liste des voicepacks et applique le premier (ce qui charge son premier carnet) ; sinon efface le carnet. | 1345 |
| `editor_rallyEditor.loadNotebook(fullFilename)` | Charge un carnet existant (rallyUtil.loadNotebook), le définit comme courant, met à jour tous les onglets et recalcule les notes structurées. Journalise une erreur si le chargement échoue. | 416 |
| `editor_rallyEditor.loadOrCreateForMissionEditor(missionDir)` | Définit la mission courante, retire le pick de voicepack, détecte le carnet (detectNotebookToLoad) et le charge ou le crée. | 1357 |
| `editor_rallyEditor.loadOrCreateNotebook(fullFilename)` | Charge le carnet ou, s'il est introuvable, en crée un nouveau (rallyUtil.createNotebook), puis met à jour les onglets et recalcule les notes structurées. | 400 |
| `editor_rallyEditor.mouseWheelZoom(val)` | Zoom de la caméra « pacenoteOrbit » à la molette : val = 0 zoome de 0.4, val = 1.0 dézoome de 0.4. Sans effet avec une autre caméra. | 1389 |
| `editor_rallyEditor.moveSelectedWaypointBackward(v)` | Appelé directement par l'action d'entrée : demande le déplacement du waypoint sélectionné vers l'arrière (répété avec anti-rebond de 0.25 s). Seulement dans l'onglet Pacenotes. *(interne)* | 292 |
| `editor_rallyEditor.moveSelectedWaypointForward(v)` | Appelé directement par l'action d'entrée : demande le déplacement du waypoint sélectionné vers l'avant (anti-rebond de 0.25 s). Seulement dans l'onglet Pacenotes. *(interne)* | 282 |
| `editor_rallyEditor.onDeserialized(data)` | Appelé après un rechargement Lua avec l'état sauvegardé : restaure la mission, le pick de voicepack (les picks « custom » hérités sont ignorés), le carnet (ou le premier carnet du pick si le fichier n'existe plus) et l'état des fenêtres Toolbox/DevTools. *(interne)* *(hook)* | 1133 |
| `editor_rallyEditor.onEditorGui(dtReal, dtSim, dtRaw)` | Appelé à chaque frame par l'éditeur : dessine la fenêtre (menus File, View, Tools, onglets, entrées clavier et souris, fenêtres annexes). *(interne)* *(hook)* | 979 |
| `editor_rallyEditor.onEditorInitialized()` | Appelé à l'initialisation de l'éditeur, y compris après un rechargement Lua (Ctrl+L) : réinitialise les références, crée le ghost notebook, déclare le mode d'édition notebookEditMode, enregistre la fenêtre et le menu Gameplay > Rally Editor, instancie les onglets et sélectionne Pacenotes (ou le premier onglet utile s'il n'y a pas de carnet). *(interne)* *(hook)* | 1037 |
| `editor_rallyEditor.onEditorRegisterPreferences(prefsRegistry)` | Déclare la catégorie de préférences rallyEditor (editing, view, waypoints, ui). *(interne)* *(hook)* | 1167 |
| `editor_rallyEditor.onEditorToolWindowHide(windowName)` | Si la fenêtre masquée est rallyEditor, repasse en mode objectSelect. *(interne)* *(hook)* | 1110 |
| `editor_rallyEditor.onSerialize()` | Appelé avant un rechargement Lua ; sauvegarde mission, pick de voicepack, fichier du carnet courant et état d'ouverture de RallyToolbox et DevTools. *(interne)* *(hook)* | 1122 |
| `editor_rallyEditor.onVehicleResetted()` | Hook appelé à la réinitialisation d'un véhicule : transmis à DevTools s'il est ouvert. *(interne)* *(hook)* | 1429 |
| `editor_rallyEditor.onWindowGotFocus(windowName)` | Si la fenêtre qui prend le focus est rallyEditor, active le mode d'édition notebookEditMode. *(interne)* *(hook)* | 1116 |
| `editor_rallyEditor.openStageLoaderModal()` | Ouvre la fenêtre modale « Open Rally Stage... ». | 608 |
| `editor_rallyEditor.saveNotebook()` | Enregistre le carnet courant (currentPath:save()). Journalise un avertissement s'il n'y a aucun carnet chargé. | 212 |
| `editor_rallyEditor.selectGhostNotebook(fname)` | Sélectionne un carnet fantôme de comparaison par nom de fichier. | 1290 |
| `editor_rallyEditor.selectNextPacenote()` | Sélectionne la pacenote suivante dans l'onglet Pacenotes (ignoré ailleurs). | 228 |
| `editor_rallyEditor.selectNextWaypoint()` | Sélectionne le waypoint suivant dans l'onglet Pacenotes (ignoré ailleurs). | 252 |
| `editor_rallyEditor.selectPrevPacenote()` | Sélectionne la pacenote précédente dans l'onglet Pacenotes (ignoré ailleurs). | 223 |
| `editor_rallyEditor.setFreeCam()` | Passe à la caméra libre de l'éditeur en conservant la position et la rotation de la caméra actuelle. | 238 |
| `editor_rallyEditor.setPrefLockWaypoints(val)` | Écrit la préférence rallyEditor.editing.lockWaypoints. | 1263 |
| `editor_rallyEditor.setVoicepackPick(pick)` | Définit le pick de voicepack actif et charge automatiquement le premier carnet candidat ; si le pick n'a aucun carnet résolvable, efface le carnet chargé. | 445 |
| `editor_rallyEditor.show()` | Vide la sélection, affiche la fenêtre Rally Editor et active le mode d'édition notebookEditMode. | 1000 |
| `editor_rallyEditor.showPacenotesTab()` | Sélectionne l'onglet Pacenotes (sélection programmatique). | 983 |
| `editor_rallyEditor.showRallyTool()` | Affiche la fenêtre (ou lui donne le focus), ouvre l'onglet Pacenotes et active le mode d'édition notebookEditMode. | 988 |
| `editor_rallyEditor.toggleCalibrationWindow()` | Ouvre ou ferme la fenêtre de calibration. | 1511 |
| `editor_rallyEditor.toggleCornerCalls()` | Active/désactive les annonces de virages dans l'onglet Pacenotes (ignoré ailleurs). | 307 |
| `editor_rallyEditor.zoomIn(val)` | Appelé directement par l'action d'entrée : zoom avant continu (anti-rebond 0.05 s) de la caméra « pacenoteOrbit ». Sans effet avec une autre caméra. *(interne)* | 1400 |
| `editor_rallyEditor.zoomOut(val)` | Appelé directement par l'action d'entrée : zoom arrière continu (anti-rebond 0.05 s) de la caméra « pacenoteOrbit ». Sans effet avec une autre caméra. *(interne)* | 1413 |

### Détail des paramètres

#### `editor_rallyEditor.allowGizmo()`

Indique si le gizmo est autorisé : vrai quand le mode d'édition courant est « Rally Editor ».

- **renvoie** : boolean true en mode Rally Editor.

#### `editor_rallyEditor.buildVoicepackPickerEntries(missionDir)`

Construit la liste des voicepacks proposés pour une mission (voicepack.buildPickerEntries avec suffixe « (mission) » pour les voicepacks de mission).

- `missionDir` (*string*) : Dossier de la mission.
- **renvoie** : table<integer, table> Entrées contenant notamment un champ pick.

#### `editor_rallyEditor.changeDebugDrawOpacity(val)`

Change l'opacité du dessin de debug par pas de 0.2, bornée entre 0.1 et 1.0 : val = 0 diminue, val = 1.0 augmente.

- `val` (*number*) : 0 pour diminuer, 1.0 pour augmenter.

#### `editor_rallyEditor.detectNotebookToLoad(missionDir)`

Choisit le carnet à charger pour une mission : résolution par voicepack, sinon premier carnet existant, sinon « structured.notebook.json » à créer.

- `missionDir` (*string*) : Dossier de la mission.
- **renvoie** : string Chemin complet du fichier de carnet.

#### `editor_rallyEditor.drawToolbarMissionContext(pathObj)`

Dessine dans la barre d'outils le texte « mission | carnet | voicepack » (en cyan) avec une infobulle ; ne fait rien si aucune mission courante.

- `pathObj` (*table|nil*) : Carnet courant (basenameNoExt() pour le nom).

#### `editor_rallyEditor.getCurrentFilename()`

Renvoie le chemin du fichier du carnet courant.

- **renvoie** : string|nil currentPath.fname ou nil si aucun carnet.

#### `editor_rallyEditor.getCurrentMissionDir()`

Renvoie le dossier de la mission courante.

- **renvoie** : string|nil Chemin absolu.

#### `editor_rallyEditor.getCurrentMissionId()`

Renvoie l'identifiant de la mission courante (ex. « italy/rallyStage/001-ss-fastello-norte », extrait après « /missions/ »).

- **renvoie** : string|nil Identifiant ou nil.

#### `editor_rallyEditor.getCurrentMissionName()`

Renvoie le nom lisible de la mission (info.json name traduit, sinon dernier segment du chemin).

- **renvoie** : string|nil Nom.

#### `editor_rallyEditor.getCurrentPath()`

Renvoie le carnet (notebook) en cours d'édition.

- **renvoie** : table|nil Objet carnet ou nil.

#### `editor_rallyEditor.getCurrentVoicepackPick()`

Renvoie le choix de voicepack courant : {type='voicepack', scope='global'|'mission', dirname=...}.

- **renvoie** : table|nil Pick courant.

#### `editor_rallyEditor.getGhostNotebookError()`

Renvoie l'erreur du dernier chargement du carnet fantôme.

- **renvoie** : string|nil Message d'erreur.

#### `editor_rallyEditor.getGhostNotebookLabelForPacenote(pacenote)`

Renvoie l'étiquette du carnet fantôme correspondant à une pacenote.

- `pacenote` (*table*) : Pacenote du carnet courant.
- **renvoie** : string|nil Étiquette.

#### `editor_rallyEditor.getGhostNotebookPath()`

Renvoie le carnet fantôme chargé.

- **renvoie** : table|nil Carnet fantôme.

#### `editor_rallyEditor.getGhostNotebookSelectedFname()`

Renvoie le nom de fichier du carnet fantôme sélectionné.

- **renvoie** : string|nil Chemin du fichier.

#### `editor_rallyEditor.getGhostNotebookSelectedLabel()`

Renvoie l'étiquette du carnet fantôme sélectionné.

- **renvoie** : string Étiquette, ou « (none) ».

#### `editor_rallyEditor.getMissionDir()`

Renvoie le dossier de mission du carnet courant (currentPath:getMissionDir()).

- **renvoie** : string|nil Dossier ou nil.

#### `editor_rallyEditor.getMissionId()`

Renvoie l'identifiant de mission du carnet courant (currentPath:getMissionId()).

- **renvoie** : string|nil Identifiant ou nil.

#### `editor_rallyEditor.getPacenotesWindow()`

Renvoie l'onglet Pacenotes.

- **renvoie** : table|nil Instance de l'onglet.

#### `editor_rallyEditor.getPrefDefaultRadius()`

Préférence rallyEditor.waypoints.defaultRadius : rayon d'affichage des waypoints.

- **renvoie** : integer Rayon (8 par défaut).

#### `editor_rallyEditor.getPrefDrivelineSplinePrismWidth()`

Largeur du prisme (largeur de véhicule) servant à dessiner la spline de driveline.

- **renvoie** : number Largeur en mètres, bornée à 0.5-5 (1.945 par défaut).

#### `editor_rallyEditor.getPrefLockWaypoints()`

Préférence rallyEditor.editing.lockWaypoints : verrouille la position des waypoints.

- **renvoie** : boolean false par défaut.

#### `editor_rallyEditor.getPrefPacenoteLabelDistance()`

Distance caméra à partir de laquelle l'aperçu sans sélection passe en vue d'ensemble arc-en-ciel.

- **renvoie** : number Distance en mètres, bornée à 100-1500 (650 par défaut).

#### `editor_rallyEditor.getPrefPacenoteLabelMode()`

Mode d'affichage des étiquettes d'aperçu de pacenotes.

- **renvoie** : string « all » ou « distance » (par défaut).

#### `editor_rallyEditor.getPrefPacenoteLabelNearCameraCount()`

Nombre de pacenotes avant et après le pivot de la caméra qui affichent leur étiquette.

- **renvoie** : integer 0 à 10 (3 par défaut).

#### `editor_rallyEditor.getPrefShowAdjacentPacenoteText()`

Indique si les textes d'aperçu des pacenotes précédente et suivante sont affichés.

- **renvoie** : boolean true par défaut.

#### `editor_rallyEditor.getPrefShowAllPacenoteLabels()`

Vrai si le mode d'étiquettes est « all ».

- **renvoie** : boolean true si toutes les étiquettes sont affichées.

#### `editor_rallyEditor.getPrefShowNextPacenote()`

Affiche aussi la pacenote suivante quand une pacenote est sélectionnée.

- **renvoie** : boolean true par défaut.

#### `editor_rallyEditor.getPrefShowPreviousPacenote()`

Affiche aussi la pacenote précédente quand une pacenote est sélectionnée.

- **renvoie** : boolean true par défaut.

#### `editor_rallyEditor.getPrefShowSelectedPacenoteUtility()`

Indique si la fenêtre flottante d'utilitaire de la pacenote sélectionnée est affichée.

- **renvoie** : boolean false par défaut.

#### `editor_rallyEditor.getPrefUiPacenoteNoteFieldWidth()`

Largeur du champ notes.note.freeform d'une pacenote.

- **renvoie** : integer Largeur (300 par défaut, de 1 à 1000).

#### `editor_rallyEditor.getPrefWaypointSnapMethod()`

Méthode de recalage en Z lors du glisser d'un waypoint, avant de chercher le point de snaproad le plus proche.

- **renvoie** : string Valeur valide de zSnap (zSnap.defaultMethod sinon).

#### `editor_rallyEditor.getViewSnaproadPathOnTop()`

Indique si le chemin du snaproad est dessiné au premier plan (option de vue éphémère, remise à false à la désactivation du mode).

- **renvoie** : boolean Valeur courante.

#### `editor_rallyEditor.getVolatilePreferences()`

Censée renvoyer les préférences volatiles ; renvoie la variable non définie volatilePreferences, donc nil (voir notes).

- **renvoie** : nil Toujours nil.

#### `editor_rallyEditor.isCalibrationWindowOpen()`

Indique si la fenêtre de calibration est ouverte.

- **renvoie** : boolean État de la fenêtre.

#### `editor_rallyEditor.isPacenotesToolsSectionExpanded()`

Vrai si DevTools est ouvert et que sa section d'outils de pacenotes est dépliée.

- **renvoie** : boolean État de la section.

#### `editor_rallyEditor.isToolboxOpen()`

Vrai si la fenêtre RallyToolbox ou DevTools est ouverte.

- **renvoie** : boolean true si l'une des deux est ouverte.

#### `editor_rallyEditor.isVisible()`

Indique si la fenêtre « rallyEditor » est affichée.

- **renvoie** : boolean Visibilité.

#### `editor_rallyEditor.listGhostNotebookChoices()`

Liste les carnets proposés comme carnet fantôme.

- **renvoie** : table Choix (liste vide si le module fantôme n'est pas prêt).

#### `editor_rallyEditor.listNotebooks(folder)`

Liste, triés, les fichiers *.notebook.json (recherche récursive) sous le dossier des carnets d'une mission.

- `folder` (*string|nil*) : Dossier de la mission ; par défaut celui du carnet courant (erreur si aucun carnet chargé).
- **renvoie** : table<integer, string> Chemins complets triés.

#### `editor_rallyEditor.loadForMissionEditor(missionDir)`

Définit la mission courante, construit la liste des voicepacks et applique le premier (ce qui charge son premier carnet) ; sinon efface le carnet.

- `missionDir` (*string*) : Dossier de la mission.

#### `editor_rallyEditor.loadNotebook(fullFilename)`

Charge un carnet existant (rallyUtil.loadNotebook), le définit comme courant, met à jour tous les onglets et recalcule les notes structurées. Journalise une erreur si le chargement échoue.

- `fullFilename` (*string*) : Chemin complet du fichier .notebook.json.

#### `editor_rallyEditor.loadOrCreateForMissionEditor(missionDir)`

Définit la mission courante, retire le pick de voicepack, détecte le carnet (detectNotebookToLoad) et le charge ou le crée.

- `missionDir` (*string*) : Dossier de la mission.

#### `editor_rallyEditor.loadOrCreateNotebook(fullFilename)`

Charge le carnet ou, s'il est introuvable, en crée un nouveau (rallyUtil.createNotebook), puis met à jour les onglets et recalcule les notes structurées.

- `fullFilename` (*string*) : Chemin complet du fichier .notebook.json.

#### `editor_rallyEditor.mouseWheelZoom(val)`

Zoom de la caméra « pacenoteOrbit » à la molette : val = 0 zoome de 0.4, val = 1.0 dézoome de 0.4. Sans effet avec une autre caméra.

- `val` (*number*) : 0 ou 1.0.

#### `editor_rallyEditor.moveSelectedWaypointBackward(v)`

Appelé directement par l'action d'entrée : demande le déplacement du waypoint sélectionné vers l'arrière (répété avec anti-rebond de 0.25 s). Seulement dans l'onglet Pacenotes.

- `v` (*number*) : 0 relâché, 1 appuyé.

#### `editor_rallyEditor.moveSelectedWaypointForward(v)`

Appelé directement par l'action d'entrée : demande le déplacement du waypoint sélectionné vers l'avant (anti-rebond de 0.25 s). Seulement dans l'onglet Pacenotes.

- `v` (*number*) : 0 relâché, 1 appuyé.

#### `editor_rallyEditor.onDeserialized(data)`

Appelé après un rechargement Lua avec l'état sauvegardé : restaure la mission, le pick de voicepack (les picks « custom » hérités sont ignorés), le carnet (ou le premier carnet du pick si le fichier n'existe plus) et l'état des fenêtres Toolbox/DevTools.

- `data` (*table|nil*) : Table de onSerialize.

#### `editor_rallyEditor.onEditorGui(dtReal, dtSim, dtRaw)`

Appelé à chaque frame par l'éditeur : dessine la fenêtre (menus File, View, Tools, onglets, entrées clavier et souris, fenêtres annexes).

- `dtReal` (*number*) : Delta temps réel.
- `dtSim` (*number*) : Delta temps de simulation.
- `dtRaw` (*number*) : Delta temps brut.

#### `editor_rallyEditor.onEditorRegisterPreferences(prefsRegistry)`

Déclare la catégorie de préférences rallyEditor (editing, view, waypoints, ui).

- `prefsRegistry` (*table*) : Registre de préférences de l'éditeur.

#### `editor_rallyEditor.onEditorToolWindowHide(windowName)`

Si la fenêtre masquée est rallyEditor, repasse en mode objectSelect.

- `windowName` (*string*) : Nom de la fenêtre.

#### `editor_rallyEditor.onSerialize()`

Appelé avant un rechargement Lua ; sauvegarde mission, pick de voicepack, fichier du carnet courant et état d'ouverture de RallyToolbox et DevTools.

- **renvoie** : table {currentMissionDir, currentVoicepackPick, currentNotebookFname, rallyToolboxWindowOpen, devToolsWindowOpen}.

#### `editor_rallyEditor.onWindowGotFocus(windowName)`

Si la fenêtre qui prend le focus est rallyEditor, active le mode d'édition notebookEditMode.

- `windowName` (*string*) : Nom de la fenêtre.

#### `editor_rallyEditor.selectGhostNotebook(fname)`

Sélectionne un carnet fantôme de comparaison par nom de fichier.

- `fname` (*string*) : Chemin du carnet.
- **renvoie** : boolean Résultat de la sélection ; false si le module fantôme n'est pas prêt.

#### `editor_rallyEditor.setPrefLockWaypoints(val)`

Écrit la préférence rallyEditor.editing.lockWaypoints.

- `val` (*boolean*) : true pour verrouiller.

#### `editor_rallyEditor.setVoicepackPick(pick)`

Définit le pick de voicepack actif et charge automatiquement le premier carnet candidat ; si le pick n'a aucun carnet résolvable, efface le carnet chargé.

- `pick` (*table*) : {type='voicepack', scope='global'|'mission', dirname=<dossier du voicepack>}.

#### `editor_rallyEditor.zoomIn(val)`

Appelé directement par l'action d'entrée : zoom avant continu (anti-rebond 0.05 s) de la caméra « pacenoteOrbit ». Sans effet avec une autre caméra.

- `val` (*number*) : 0 relâché, 1 appuyé.

#### `editor_rallyEditor.zoomOut(val)`

Appelé directement par l'action d'entrée : zoom arrière continu (anti-rebond 0.05 s) de la caméra « pacenoteOrbit ». Sans effet avec une autre caméra.

- `val` (*number*) : 0 relâché, 1 appuyé.

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table<integer, string> | Extensions requises : {'gameplay_missions_missions'}. |
| `devToolsWindowOpen` | ImBoolPtr | Indicateur d'ouverture de la fenêtre DevTools (remplacé à la désérialisation). |
| `notebookBasenamesForPick` | function | Alias de voicepack.notebookBasenamesForPick (liste des noms de carnets candidats pour un pick de voicepack). |
| `picksMatch` | function | Alias de voicepack.picksMatch (compatibilité avec les appelants externes). |
| `rallyToolboxWindowOpen` | ImBoolPtr | Indicateur d'ouverture de la fenêtre RallyToolbox (remplacé à la désérialisation). |

## Appels vers le moteur (C++)

- `FS:` `fileExists`, `findFiles`
- `scenetree.` `findObject`

**Charge les extensions :** `gameplay_rallyLoop`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/rallyEditor.lua`.*
