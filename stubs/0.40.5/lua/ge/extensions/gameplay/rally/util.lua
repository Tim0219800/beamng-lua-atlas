---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/util.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Boîte à outils commune du mode rallye (GE) : constantes (noms de dossiers, états actifs, couleurs flowgraph, valeurs par défaut du copilote), chemins des fichiers d'une mission (notebooks, reconnaissance, driveline, cuts, transcriptions), chargement de carnets de notes (notebook) et de tracés de course, détection de l'id de mission courant, nommage des fichiers audio de notes d'allure, calcul d'appel de virage depuis l'angle de braquage, aides de dessin de debug du véhicule et formatage d'heure. Presque tous les autres fichiers de gameplay/rally l'utilisent via require.
--- Accès : extension `gameplay_rally_util` : `extensions.load("gameplay_rally_util")`, puis la globale `gameplay_rally_util`
---@class gameplay_rally_util
---@field activeState_countdown string 'countdown'.
---@field activeState_inactive string 'inactive'.
---@field activeState_stageActive string 'stageActive'.
---@field activeState_vehicleProximity string 'vehicleProximity'.
---@field autodist_internal_level1 string '<none>' : valeur interne de distance automatique niveau 1.
---@field autofill_blocker string '#' : texte de note qui bloque le remplissage automatique.
---@field defaultCodriverName string 'Sophia'.
---@field defaultNotebookFname string 'primary.notebook.json'.
---@field default_codriver_language string 'english'.
---@field default_codriver_voice string 'british_female'.
---@field default_waypoint_intersect_radius number 40 (rayon d'intersection par défaut d'un waypoint, en mètres, unité déduite du nom).
---@field extRally string 'gameplay_rally' : nom de l'extension rallye.
---@field extRallyLoop string 'gameplay_rallyLoop' : nom de l'extension boucle de rallye.
---@field freeformDir string 'freeform'.
---@field generatedPacenotesDir string 'gen'.
---@field missionRallyDir string 'rally' : sous-dossier rallye d'une mission.
---@field notebooksDir string 'notebooks'.
---@field notebooksPath string 'rally/notebooks' (relatif au dossier de la mission).
---@field pacenotesMetadataBasename string 'metadata.json'.
---@field pacenotesTranscriptionsBasename string 'transcriptions.json'.
---@field rallyLoop_flowgraph_color ImVec4 Couleur de nœuds flowgraph de la boucle de rallye (0, 0.97, 1, 0.75).
---@field rallySettingsRoot string '/settings/rally'.
---@field rally_flowgraph_color ImVec4 Couleur de nœuds flowgraph du rallye (0, 1, 0.87, 0.75).
---@field recceDir string 'recce'.
---@field recceRecordSubdir string 'primary' : sous-dossier de l'enregistrement de reconnaissance principal.
---@field structuredDir string 'structured'.
---@field systemDir string 'system'.
---@field transcriptsExt string 'transcripts.json'.
---@field unknown_transcript_str string '[unknown]'.
---@field validPunctuation string[] {'?', '.', '!'}.
---@field var_da string '{da}' : variable de gabarit de note.
---@field var_db string '{db}' : variable de gabarit de note.
gameplay_rally_util = {}

--- Teste si deux points sont à une distance inférieure ou égale au seuil.
---Source : lua/ge/extensions/gameplay/rally/util.lua:494
---@param point1 vec3 Premier point.
---@param point2 vec3 Second point.
---@param threshold number Distance maximale en mètres.
---@return boolean  true si proches.
function gameplay_rally_util.arePointsEqualWithinThreshold(point1, point2, threshold) end

--- Vecteur unitaire allant de snap_pos vers next_pos. Lève une erreur si les deux positions sont identiques.
---Source : lua/ge/extensions/gameplay/rally/util.lua:315
---@param snap_pos vec3 Position de départ.
---@param next_pos vec3 Position suivante.
---@return vec3  Direction normalisée.
function gameplay_rally_util.calculateForwardNormal(snap_pos, next_pos) end

--- Comparateur de tri : par nombre, lettre puis variante ; les noms reconnus passent avant les autres, qui sont triés alphabétiquement.
---Source : lua/ge/extensions/gameplay/rally/util.lua:432
---@param a string Premier nom.
---@param b string Second nom.
---@return boolean  true si a doit précéder b.
function gameplay_rally_util.compareCustomPacenoteAudioBasenames(a, b) end

--- Crée un notebook vide (rally/notebook/path) à ce chemin et le sauvegarde.
---Source : lua/ge/extensions/gameplay/rally/util.lua:204
---@param fname string Chemin du fichier.
---@return table|nil  Objet notebook, nil si la sauvegarde échoue.
function gameplay_rally_util.createNotebook(fname) end

--- Décompose un nom de la forme 'pacenote_<nombre><lettre>_<variante>.ogg'.
---Source : lua/ge/extensions/gameplay/rally/util.lua:420
---@param basename string Nom de fichier.
---@return table|nil  {number, letter, variant, basename} ou nil si le format ne correspond pas.
function gameplay_rally_util.customPacenoteAudioBasenameParts(basename) end

--- Arrondit une valeur au multiple le plus proche.
---Source : lua/ge/extensions/gameplay/rally/util.lua:400
---@param dist number Valeur.
---@param round_to number Pas d'arrondi.
---@return number  Valeur arrondie.
function gameplay_rally_util.customRound(dist, round_to) end

--- Chemin de cuts.json de la reconnaissance.
---Source : lua/ge/extensions/gameplay/rally/util.lua:306
---@param missionDir string Dossier de la mission.
---@return string  Chemin.
function gameplay_rally_util.cutsFile(missionDir) end

--- Id de la mission sélectionnée dans l'éditeur de missions (voir notes).
---Source : lua/ge/extensions/gameplay/rally/util.lua:107
---@return string|nil  Id de mission.
function gameplay_rally_util.detectMissionEditorMissionId() end

--- Détecte l'id de mission courant dans l'ordre : missionManager, rallyEditor, missionEditor, et calcule son dossier.
---Source : lua/ge/extensions/gameplay/rally/util.lua:140
---@return string|nil  Id de mission.
---@return string|nil  Dossier de la mission.
---@return string|nil  Message d'erreur 'missionId could not be detected' en cas d'échec.
function gameplay_rally_util.detectMissionIdHelper() end

--- Id de la mission au premier plan d'après gameplay_missions_missionManager.
---Source : lua/ge/extensions/gameplay/rally/util.lua:99
---@return string|nil  Id de mission.
function gameplay_rally_util.detectMissionManagerMissionId() end

--- Trouve la plage d'angle correspondant à la valeur absolue du braquage et construit l'appel de virage en majuscules avec direction (L si braquage >= 0, R sinon) ; une plage '_deadzone' donne 'C'.
---Source : lua/ge/extensions/gameplay/rally/util.lua:347
---@param angles table[] Liste de {fromAngleDegrees, toAngleDegrees, cornerCall}.
---@param steering number Braquage en degrés (signé).
---@return table|nil  Plage trouvée.
---@return string  Appel de virage (ex. '3L').
---@return number  Position dans la plage entre 0 et 1.
function gameplay_rally_util.determineCornerCall(angles, steering) end

--- Dessine en bleu les 12 arêtes de l'OOBB du véhicule avec debugDrawer:drawLineInstance.
---Source : lua/ge/extensions/gameplay/rally/util.lua:537
---@param vehId integer Id d'objet du véhicule.
function gameplay_rally_util.drawVehBB(vehId) end

--- Dessine une petite sphère (rayon 0,1) au centre de la face avant du véhicule : verte si inside, rouge sinon.
---Source : lua/ge/extensions/gameplay/rally/util.lua:529
---@param vehId integer Id d'objet du véhicule.
---@param inside boolean Choix de la couleur.
function gameplay_rally_util.drawVehLeadingPoint(vehId, inside) end

--- Chemin de driveline.json de la reconnaissance.
---Source : lua/ge/extensions/gameplay/rally/util.lua:294
---@param missionDir string Dossier de la mission.
---@return string  Chemin.
function gameplay_rally_util.drivelineFile(missionDir) end

--- Chemin de <missionDir>/rally/drivelineSpline.json.
---Source : lua/ge/extensions/gameplay/rally/util.lua:302
---@param missionDir string Dossier de la mission.
---@return string  Chemin.
function gameplay_rally_util.drivelineSplineFile(missionDir) end

--- Chemin de <missionDir>/rally/finalDriveline.json.
---Source : lua/ge/extensions/gameplay/rally/util.lua:298
---@param missionDir string Dossier de la mission.
---@return string  Chemin.
function gameplay_rally_util.finalDrivelineFile(missionDir) end

--- Idem au format 12 h.
---Source : lua/ge/extensions/gameplay/rally/util.lua:600
---@param timeSecs number|nil Secondes.
---@param includeSeconds boolean|nil Ajoute les secondes.
---@param includeTenths boolean|nil Ajoute les dixièmes.
---@return table  {time = string, ampm = 'AM'|'PM'}.
function gameplay_rally_util.formatTime12Hour(timeSecs, includeSeconds, includeTenths) end

--- Formate un nombre de secondes depuis minuit en HH:MM[:SS[.d]] (modulo 24 h).
---Source : lua/ge/extensions/gameplay/rally/util.lua:576
---@param timeSecs number|nil Secondes.
---@param includeSeconds boolean|nil Ajoute les secondes.
---@param includeTenths boolean|nil Ajoute les dixièmes (avec includeSeconds).
---@return table  {time = string} ; 'N/A' si timeSecs est nil.
function gameplay_rally_util.formatTime24Hour(timeSecs, includeSeconds, includeTenths) end

--- Censée renvoyer « 24h / 12h » ; bogue : concatène deux tables (voir notes).
---Source : lua/ge/extensions/gameplay/rally/util.lua:628
---@param timeSecs number|nil Secondes.
---@param includeSeconds boolean|nil Ajoute les secondes.
---@param includeTenths boolean|nil Ajoute les dixièmes.
---@return string  'N/A' si timeSecs est nil ; sinon erreur.
function gameplay_rally_util.formatTimeFromSeconds(timeSecs, includeSeconds, includeTenths) end

--- Choisit la couleur de texte lisible sur un fond : blanc pour un fond bleu foncé, noir sinon.
---Source : lua/ge/extensions/gameplay/rally/util.lua:490
---@param clr number[] Couleur de fond {r, g, b} entre 0 et 1.
---@return ColorF  Blanc ou noir opaque.
function gameplay_rally_util.getAppropriateTextColor(clr) end

--- Nom (clé de traduction) d'une mission ; renvoie l'id si la mission est introuvable.
---Source : lua/ge/extensions/gameplay/rally/util.lua:450
---@param missionId string Id de mission.
---@return string  Nom ou id.
function gameplay_rally_util.getMissionName(missionId) end

--- Chemin complet d'un notebook : <missionDir>/rally/notebooks/<basename>.
---Source : lua/ge/extensions/gameplay/rally/util.lua:186
---@param missionDir string Dossier de la mission.
---@param basename string Nom du fichier notebook.
---@return string  Chemin.
function gameplay_rally_util.getNotebookFullPath(missionDir, basename) end

--- Temps haute précision (os.clockhp). Le commentaire d'origine dit « secondes depuis epoch » mais c'est une horloge de processus.
---Source : lua/ge/extensions/gameplay/rally/util.lua:64
---@return number  Secondes.
function gameplay_rally_util.getTime() end

--- Milieu du bord avant bas de l'OOBB du véhicule (points 0 et 3).
---Source : lua/ge/extensions/gameplay/rally/util.lua:516
---@param vehId integer Id d'objet du véhicule.
---@return vec3|nil  Position monde.
function gameplay_rally_util.getVehFrontBottom(vehId) end

--- Centre de la face avant de la boîte englobante orientée (OOBB) du véhicule au spawn (moyenne des points 0 à 3).
---Source : lua/ge/extensions/gameplay/rally/util.lua:500
---@param vehId integer Id d'objet du véhicule.
---@return vec3|nil  Position monde, nil si le véhicule est introuvable.
function gameplay_rally_util.getVehFrontCenter(vehId) end

--- Teste si un caractère est un de `?`, `.`, `!`.
---Source : lua/ge/extensions/gameplay/rally/util.lua:89
---@param last_char string Caractère.
---@return boolean  true si ponctuation de fin de phrase.
function gameplay_rally_util.hasPunctuation(last_char) end

--- Liste, triés, les noms de fichiers *.notebook.json du dossier notebooks de la mission.
---Source : lua/ge/extensions/gameplay/rally/util.lua:191
---@param missionDir string|nil Dossier de la mission.
---@return string[]  Noms de fichiers ; vide si missionDir est nil.
function gameplay_rally_util.listNotebooks(missionDir) end

--- Lit lua/ge/extensions/gameplay/rally/corner_angles.json (styles d'angles de virage).
---Source : lua/ge/extensions/gameplay/rally/util.lua:335
---@return table|nil  Contenu JSON.
---@return string|nil  Message d'erreur.
function gameplay_rally_util.loadCornerAnglesFile() end

--- Charge un notebook depuis un fichier. Si le fichier est vide ou blanc, l'initialise et le sauvegarde. Calcule ensuite les notes adjacentes (setAllAdjacentNotes).
---Source : lua/ge/extensions/gameplay/rally/util.lua:220
---@param notebookFname string Chemin du fichier.
---@return table|nil  Notebook, nil en cas d'erreur (journalisée).
function gameplay_rally_util.loadNotebook(notebookFname) end

--- Charge un notebook d'une mission d'après son nom de fichier.
---Source : lua/ge/extensions/gameplay/rally/util.lua:259
---@param missionDir string Dossier de la mission.
---@param basename string Nom de fichier notebook.
---@return table|nil  Notebook.
function gameplay_rally_util.loadNotebookForMissionDir(missionDir, basename) end

--- Charge <missionDir>/race.race.json dans un objet gameplay/race/path.
---Source : lua/ge/extensions/gameplay/rally/util.lua:264
---@param missionDir string Dossier de la mission.
---@return table|nil  Chemin de course.
---@return string|nil  Message d'erreur si le fichier est absent.
function gameplay_rally_util.loadRacePath(missionDir) end

--- Nom de fichier audio d'une note : 'pacenote_<hash>.ogg'.
---Source : lua/ge/extensions/gameplay/rally/util.lua:404
---@param pacenoteHash string Hash de la note.
---@return string  Nom de fichier.
function gameplay_rally_util.makePacenoteAudioFilename(pacenoteHash) end

--- Nom de fichier audio d'une variante : 'pacenote_<hash>_<n>.ogg' (n entier >= 1).
---Source : lua/ge/extensions/gameplay/rally/util.lua:408
---@param pacenoteHash string Hash de la note.
---@param variant number|string Numéro de variante ; défaut 1, minimum 1.
---@return string  Nom de fichier.
function gameplay_rally_util.makePacenoteVariantAudioFilename(pacenoteHash, variant) end

--- Nom de fichier audio d'une note système : 'pacenote_system_<clé>_<n>.ogg'.
---Source : lua/ge/extensions/gameplay/rally/util.lua:445
---@param systemKey string Clé de la note système.
---@param variantIndex number|nil Variante ; défaut 1.
---@return string  Nom de fichier.
function gameplay_rally_util.makeSystemPacenoteAudioFilename(systemKey, variantIndex) end

--- Teste une chaîne avec un motif simple : les caractères spéciaux Lua sont échappés et `*` devient `.*`. La correspondance n'est pas ancrée.
---Source : lua/ge/extensions/gameplay/rally/util.lua:384
---@param searchPattern string Motif avec jokers *.
---@param stringToMatch string Chaîne testée.
---@return boolean  true si trouvé.
function gameplay_rally_util.matchSearchPattern(searchPattern, stringToMatch) end

--- Dossier d'une mission : '/gameplay/missions/<id>'.
---Source : lua/ge/extensions/gameplay/rally/util.lua:131
---@param missionId string|nil Id de mission.
---@return string|nil  Chemin, nil si id nil.
function gameplay_rally_util.missionDirHelper(missionId) end

--- Chemin d'un fichier du dossier d'enregistrement de reconnaissance.
---Source : lua/ge/extensions/gameplay/rally/util.lua:288
---@param missionDir string Dossier de la mission.
---@param basename string Nom de fichier.
---@return string  Chemin.
function gameplay_rally_util.missionReccePath(missionDir, basename) end

--- Dossier d'enregistrement de reconnaissance : <missionDir>/rally/recce/primary.
---Source : lua/ge/extensions/gameplay/rally/util.lua:283
---@param missionDir string Dossier de la mission.
---@return string  Chemin.
function gameplay_rally_util.missionRecceRecordDir(missionDir) end

--- Remplace tout caractère non alphanumérique par `_` puis réduit les `_` répétés.
---Source : lua/ge/extensions/gameplay/rally/util.lua:77
---@param name string|nil Nom.
---@return string|nil  Nom normalisé, nil si nil.
function gameplay_rally_util.normalizeName(name) end

--- Extrait le numéro de variante d'un nom de fichier audio (suffixe _<n>.ogg), 1 par défaut.
---Source : lua/ge/extensions/gameplay/rally/util.lua:414
---@param basename string Nom de fichier.
---@return integer|nil  Variante, nil si basename n'est pas une chaîne.
function gameplay_rally_util.pacenoteAudioBasenameVariantIndex(basename) end

--- Hash SHA-1 tronqué aux 16 premiers caractères d'un texte.
---Source : lua/ge/extensions/gameplay/rally/util.lua:58
---@param s string Texte.
---@return string  16 caractères hexadécimaux.
function gameplay_rally_util.pacenoteHashSha1(s) end

--- Identifiant aléatoire de 8 caractères (SHA-1 d'un entier aléatoire). Faible entropie : 1 million de valeurs possibles.
---Source : lua/ge/extensions/gameplay/rally/util.lua:484
---@return string  8 caractères hexadécimaux.
function gameplay_rally_util.randomId() end

--- Renvoie le dossier d'un chemin (retire le nom de fichier ou le dernier dossier, et le `/` final).
---Source : lua/ge/extensions/gameplay/rally/util.lua:370
---@param thepath string|nil Chemin.
---@return string|nil  Dossier parent.
function gameplay_rally_util.stripBasename(thepath) end

--- Chemin de transcripts.json de la reconnaissance.
---Source : lua/ge/extensions/gameplay/rally/util.lua:310
---@param missionDir string Dossier de la mission.
---@return string  Chemin.
function gameplay_rally_util.transcriptsFile(missionDir) end

--- Traduit un nom de mission avec _tr.
---Source : lua/ge/extensions/gameplay/rally/util.lua:461
---@param missionName string|nil Nom ou clé.
---@return string|nil  Texte traduit.
function gameplay_rally_util.translatedMissionName(missionName) end

--- Nom traduit d'une mission à partir de son id.
---Source : lua/ge/extensions/gameplay/rally/util.lua:472
---@param missionId string Id de mission.
---@return string  Nom traduit, ou id.
function gameplay_rally_util.translatedMissionNameFromId(missionId) end

--- Supprime les espaces au début et à la fin.
---Source : lua/ge/extensions/gameplay/rally/util.lua:364
---@param txt string|nil Texte.
---@return string|nil  Texte nettoyé.
function gameplay_rally_util.trimString(txt) end

--- Indique si un texte de note doit être utilisé : non vide, différent de '#' et de '<none>'.
---Source : lua/ge/extensions/gameplay/rally/util.lua:393
---@param text string|nil Texte de note.
---@return boolean|nil  Truthy si utilisable.
function gameplay_rally_util.useNote(text) end

