# `gameplay_rally_util`

*Fichier : `lua/ge/extensions/gameplay/rally/util.lua` · VM : Game Engine (GE) · 733 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_rally_util` : `extensions.load("gameplay_rally_util")`, puis la globale `gameplay_rally_util`

Boîte à outils commune du mode rallye (GE) : constantes (noms de dossiers, états actifs, couleurs flowgraph, valeurs par défaut du copilote), chemins des fichiers d'une mission (notebooks, reconnaissance, driveline, cuts, transcriptions), chargement de carnets de notes (notebook) et de tracés de course, détection de l'id de mission courant, nommage des fichiers audio de notes d'allure, calcul d'appel de virage depuis l'angle de braquage, aides de dessin de debug du véhicule et formatage d'heure. Presque tous les autres fichiers de gameplay/rally l'utilisent via require.

## Exemple

```lua
local rallyUtil = require('/lua/ge/extensions/gameplay/rally/util')
local missionId, missionDir, err = rallyUtil.detectMissionIdHelper()
local nb = rallyUtil.loadNotebookForMissionDir(missionDir, rallyUtil.defaultNotebookFname)
```

## Remarques

- Arborescence d'une mission : <missionDir>/rally/notebooks/*.notebook.json ; <missionDir>/rally/recce/primary/{driveline,cuts,transcripts}.json ; <missionDir>/rally/finalDriveline.json et drivelineSpline.json.
- formatTimeFromSeconds est cassé : formatTime24Hour et formatTime12Hour renvoient des tables {time=...}, or la fonction les concatène avec `..` ; l'appel provoque une erreur dès que timeSecs n'est pas nil.
- determineCornerCall renvoie nil (aucune valeur) si la valeur absolue du braquage ne tombe dans aucune plage [fromAngleDegrees, toAngleDegrees[.
- detectRallyEditorMissionId est locale et n'est pas exportée, mais detectMissionIdHelper l'utilise (ordre : missionManager, rallyEditor, missionEditor).
- detectMissionEditorMissionId appelle editor_missionEditor.getSelectedMissionId() puis lit `.id` sur le résultat : le nom de la fonction suggère que c'est déjà un id, ce qui pourrait donner nil (déduit du code).
- missionRecceDir est locale et non exportée ; le commentaire du drawVehBB parle de vert mais la couleur est bleue (0.2, 0.2, 1.0).
- getAppropriateTextColor teste clr[1] < 0.1 et clr[2] < 0.5 et clr[3] > 0.7 (fonds bleus) : blanc dans ce cas, noir sinon.
- Le noms audio : `pacenote_<hash>.ogg`, variantes `pacenote_<hash>_<n>.ogg`, système `pacenote_system_<clé>_<n>.ogg`.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_rally_util.arePointsEqualWithinThreshold(point1, point2, threshold)` | Teste si deux points sont à une distance inférieure ou égale au seuil. | 494 |
| `gameplay_rally_util.calculateForwardNormal(snap_pos, next_pos)` | Vecteur unitaire allant de snap_pos vers next_pos. Lève une erreur si les deux positions sont identiques. | 315 |
| `gameplay_rally_util.compareCustomPacenoteAudioBasenames(a, b)` | Comparateur de tri : par nombre, lettre puis variante ; les noms reconnus passent avant les autres, qui sont triés alphabétiquement. | 432 |
| `gameplay_rally_util.createNotebook(fname)` | Crée un notebook vide (rally/notebook/path) à ce chemin et le sauvegarde. | 204 |
| `gameplay_rally_util.customPacenoteAudioBasenameParts(basename)` | Décompose un nom de la forme 'pacenote_<nombre><lettre>_<variante>.ogg'. | 420 |
| `gameplay_rally_util.customRound(dist, round_to)` | Arrondit une valeur au multiple le plus proche. | 400 |
| `gameplay_rally_util.cutsFile(missionDir)` | Chemin de cuts.json de la reconnaissance. | 306 |
| `gameplay_rally_util.detectMissionEditorMissionId()` | Id de la mission sélectionnée dans l'éditeur de missions (voir notes). | 107 |
| `gameplay_rally_util.detectMissionIdHelper()` | Détecte l'id de mission courant dans l'ordre : missionManager, rallyEditor, missionEditor, et calcule son dossier. | 140 |
| `gameplay_rally_util.detectMissionManagerMissionId()` | Id de la mission au premier plan d'après gameplay_missions_missionManager. | 99 |
| `gameplay_rally_util.determineCornerCall(angles, steering)` | Trouve la plage d'angle correspondant à la valeur absolue du braquage et construit l'appel de virage en majuscules avec direction (L si braquage >= 0, R sinon) ; une plage '_deadzone' donne 'C'. | 347 |
| `gameplay_rally_util.drawVehBB(vehId)` | Dessine en bleu les 12 arêtes de l'OOBB du véhicule avec debugDrawer:drawLineInstance. | 537 |
| `gameplay_rally_util.drawVehLeadingPoint(vehId, inside)` | Dessine une petite sphère (rayon 0,1) au centre de la face avant du véhicule : verte si inside, rouge sinon. | 529 |
| `gameplay_rally_util.drivelineFile(missionDir)` | Chemin de driveline.json de la reconnaissance. | 294 |
| `gameplay_rally_util.drivelineSplineFile(missionDir)` | Chemin de <missionDir>/rally/drivelineSpline.json. | 302 |
| `gameplay_rally_util.finalDrivelineFile(missionDir)` | Chemin de <missionDir>/rally/finalDriveline.json. | 298 |
| `gameplay_rally_util.formatTime12Hour(timeSecs, includeSeconds, includeTenths)` | Idem au format 12 h. | 600 |
| `gameplay_rally_util.formatTime24Hour(timeSecs, includeSeconds, includeTenths)` | Formate un nombre de secondes depuis minuit en HH:MM[:SS[.d]] (modulo 24 h). | 576 |
| `gameplay_rally_util.formatTimeFromSeconds(timeSecs, includeSeconds, includeTenths)` | Censée renvoyer « 24h / 12h » ; bogue : concatène deux tables (voir notes). | 628 |
| `gameplay_rally_util.getAppropriateTextColor(clr)` | Choisit la couleur de texte lisible sur un fond : blanc pour un fond bleu foncé, noir sinon. | 490 |
| `gameplay_rally_util.getMissionName(missionId)` | Nom (clé de traduction) d'une mission ; renvoie l'id si la mission est introuvable. | 450 |
| `gameplay_rally_util.getNotebookFullPath(missionDir, basename)` | Chemin complet d'un notebook : <missionDir>/rally/notebooks/<basename>. | 186 |
| `gameplay_rally_util.getTime()` | Temps haute précision (os.clockhp). Le commentaire d'origine dit « secondes depuis epoch » mais c'est une horloge de processus. | 64 |
| `gameplay_rally_util.getVehFrontBottom(vehId)` | Milieu du bord avant bas de l'OOBB du véhicule (points 0 et 3). | 516 |
| `gameplay_rally_util.getVehFrontCenter(vehId)` | Centre de la face avant de la boîte englobante orientée (OOBB) du véhicule au spawn (moyenne des points 0 à 3). | 500 |
| `gameplay_rally_util.hasPunctuation(last_char)` | Teste si un caractère est un de `?`, `.`, `!`. | 89 |
| `gameplay_rally_util.listNotebooks(missionDir)` | Liste, triés, les noms de fichiers *.notebook.json du dossier notebooks de la mission. | 191 |
| `gameplay_rally_util.loadCornerAnglesFile()` | Lit lua/ge/extensions/gameplay/rally/corner_angles.json (styles d'angles de virage). | 335 |
| `gameplay_rally_util.loadNotebook(notebookFname)` | Charge un notebook depuis un fichier. Si le fichier est vide ou blanc, l'initialise et le sauvegarde. Calcule ensuite les notes adjacentes (setAllAdjacentNotes). | 220 |
| `gameplay_rally_util.loadNotebookForMissionDir(missionDir, basename)` | Charge un notebook d'une mission d'après son nom de fichier. | 259 |
| `gameplay_rally_util.loadRacePath(missionDir)` | Charge <missionDir>/race.race.json dans un objet gameplay/race/path. | 264 |
| `gameplay_rally_util.makePacenoteAudioFilename(pacenoteHash)` | Nom de fichier audio d'une note : 'pacenote_<hash>.ogg'. | 404 |
| `gameplay_rally_util.makePacenoteVariantAudioFilename(pacenoteHash, variant)` | Nom de fichier audio d'une variante : 'pacenote_<hash>_<n>.ogg' (n entier >= 1). | 408 |
| `gameplay_rally_util.makeSystemPacenoteAudioFilename(systemKey, variantIndex)` | Nom de fichier audio d'une note système : 'pacenote_system_<clé>_<n>.ogg'. | 445 |
| `gameplay_rally_util.matchSearchPattern(searchPattern, stringToMatch)` | Teste une chaîne avec un motif simple : les caractères spéciaux Lua sont échappés et `*` devient `.*`. La correspondance n'est pas ancrée. | 384 |
| `gameplay_rally_util.missionDirHelper(missionId)` | Dossier d'une mission : '/gameplay/missions/<id>'. | 131 |
| `gameplay_rally_util.missionReccePath(missionDir, basename)` | Chemin d'un fichier du dossier d'enregistrement de reconnaissance. | 288 |
| `gameplay_rally_util.missionRecceRecordDir(missionDir)` | Dossier d'enregistrement de reconnaissance : <missionDir>/rally/recce/primary. | 283 |
| `gameplay_rally_util.normalizeName(name)` | Remplace tout caractère non alphanumérique par `_` puis réduit les `_` répétés. | 77 |
| `gameplay_rally_util.pacenoteAudioBasenameVariantIndex(basename)` | Extrait le numéro de variante d'un nom de fichier audio (suffixe _<n>.ogg), 1 par défaut. | 414 |
| `gameplay_rally_util.pacenoteHashSha1(s)` | Hash SHA-1 tronqué aux 16 premiers caractères d'un texte. | 58 |
| `gameplay_rally_util.randomId()` | Identifiant aléatoire de 8 caractères (SHA-1 d'un entier aléatoire). Faible entropie : 1 million de valeurs possibles. | 484 |
| `gameplay_rally_util.stripBasename(thepath)` | Renvoie le dossier d'un chemin (retire le nom de fichier ou le dernier dossier, et le `/` final). | 370 |
| `gameplay_rally_util.transcriptsFile(missionDir)` | Chemin de transcripts.json de la reconnaissance. | 310 |
| `gameplay_rally_util.translatedMissionName(missionName)` | Traduit un nom de mission avec _tr. | 461 |
| `gameplay_rally_util.translatedMissionNameFromId(missionId)` | Nom traduit d'une mission à partir de son id. | 472 |
| `gameplay_rally_util.trimString(txt)` | Supprime les espaces au début et à la fin. | 364 |
| `gameplay_rally_util.useNote(text)` | Indique si un texte de note doit être utilisé : non vide, différent de '#' et de '<none>'. | 393 |

### Détail des paramètres

#### `gameplay_rally_util.arePointsEqualWithinThreshold(point1, point2, threshold)`

Teste si deux points sont à une distance inférieure ou égale au seuil.

- `point1` (*vec3*) : Premier point.
- `point2` (*vec3*) : Second point.
- `threshold` (*number*) : Distance maximale en mètres.
- **renvoie** : boolean true si proches.

#### `gameplay_rally_util.calculateForwardNormal(snap_pos, next_pos)`

Vecteur unitaire allant de snap_pos vers next_pos. Lève une erreur si les deux positions sont identiques.

- `snap_pos` (*vec3*) : Position de départ.
- `next_pos` (*vec3*) : Position suivante.
- **renvoie** : vec3 Direction normalisée.

#### `gameplay_rally_util.compareCustomPacenoteAudioBasenames(a, b)`

Comparateur de tri : par nombre, lettre puis variante ; les noms reconnus passent avant les autres, qui sont triés alphabétiquement.

- `a` (*string*) : Premier nom.
- `b` (*string*) : Second nom.
- **renvoie** : boolean true si a doit précéder b.

#### `gameplay_rally_util.createNotebook(fname)`

Crée un notebook vide (rally/notebook/path) à ce chemin et le sauvegarde.

- `fname` (*string*) : Chemin du fichier.
- **renvoie** : table|nil Objet notebook, nil si la sauvegarde échoue.

#### `gameplay_rally_util.customPacenoteAudioBasenameParts(basename)`

Décompose un nom de la forme 'pacenote_<nombre><lettre>_<variante>.ogg'.

- `basename` (*string*) : Nom de fichier.
- **renvoie** : table|nil {number, letter, variant, basename} ou nil si le format ne correspond pas.

#### `gameplay_rally_util.customRound(dist, round_to)`

Arrondit une valeur au multiple le plus proche.

- `dist` (*number*) : Valeur.
- `round_to` (*number*) : Pas d'arrondi.
- **renvoie** : number Valeur arrondie.

#### `gameplay_rally_util.cutsFile(missionDir)`

Chemin de cuts.json de la reconnaissance.

- `missionDir` (*string*) : Dossier de la mission.
- **renvoie** : string Chemin.

#### `gameplay_rally_util.detectMissionEditorMissionId()`

Id de la mission sélectionnée dans l'éditeur de missions (voir notes).

- **renvoie** : string|nil Id de mission.

#### `gameplay_rally_util.detectMissionIdHelper()`

Détecte l'id de mission courant dans l'ordre : missionManager, rallyEditor, missionEditor, et calcule son dossier.

- **renvoie** : string|nil Id de mission.
- **renvoie** : string|nil Dossier de la mission.
- **renvoie** : string|nil Message d'erreur 'missionId could not be detected' en cas d'échec.

#### `gameplay_rally_util.detectMissionManagerMissionId()`

Id de la mission au premier plan d'après gameplay_missions_missionManager.

- **renvoie** : string|nil Id de mission.

#### `gameplay_rally_util.determineCornerCall(angles, steering)`

Trouve la plage d'angle correspondant à la valeur absolue du braquage et construit l'appel de virage en majuscules avec direction (L si braquage >= 0, R sinon) ; une plage '_deadzone' donne 'C'.

- `angles` (*table[]*) : Liste de {fromAngleDegrees, toAngleDegrees, cornerCall}.
- `steering` (*number*) : Braquage en degrés (signé).
- **renvoie** : table|nil Plage trouvée.
- **renvoie** : string Appel de virage (ex. '3L').
- **renvoie** : number Position dans la plage entre 0 et 1.

#### `gameplay_rally_util.drawVehBB(vehId)`

Dessine en bleu les 12 arêtes de l'OOBB du véhicule avec debugDrawer:drawLineInstance.

- `vehId` (*integer*) : Id d'objet du véhicule.

#### `gameplay_rally_util.drawVehLeadingPoint(vehId, inside)`

Dessine une petite sphère (rayon 0,1) au centre de la face avant du véhicule : verte si inside, rouge sinon.

- `vehId` (*integer*) : Id d'objet du véhicule.
- `inside` (*boolean*) : Choix de la couleur.

#### `gameplay_rally_util.drivelineFile(missionDir)`

Chemin de driveline.json de la reconnaissance.

- `missionDir` (*string*) : Dossier de la mission.
- **renvoie** : string Chemin.

#### `gameplay_rally_util.drivelineSplineFile(missionDir)`

Chemin de <missionDir>/rally/drivelineSpline.json.

- `missionDir` (*string*) : Dossier de la mission.
- **renvoie** : string Chemin.

#### `gameplay_rally_util.finalDrivelineFile(missionDir)`

Chemin de <missionDir>/rally/finalDriveline.json.

- `missionDir` (*string*) : Dossier de la mission.
- **renvoie** : string Chemin.

#### `gameplay_rally_util.formatTime12Hour(timeSecs, includeSeconds, includeTenths)`

Idem au format 12 h.

- `timeSecs` (*number|nil*) : Secondes.
- `includeSeconds` (*boolean|nil*) : Ajoute les secondes.
- `includeTenths` (*boolean|nil*) : Ajoute les dixièmes.
- **renvoie** : table {time = string, ampm = 'AM'|'PM'}.

#### `gameplay_rally_util.formatTime24Hour(timeSecs, includeSeconds, includeTenths)`

Formate un nombre de secondes depuis minuit en HH:MM[:SS[.d]] (modulo 24 h).

- `timeSecs` (*number|nil*) : Secondes.
- `includeSeconds` (*boolean|nil*) : Ajoute les secondes.
- `includeTenths` (*boolean|nil*) : Ajoute les dixièmes (avec includeSeconds).
- **renvoie** : table {time = string} ; 'N/A' si timeSecs est nil.

#### `gameplay_rally_util.formatTimeFromSeconds(timeSecs, includeSeconds, includeTenths)`

Censée renvoyer « 24h / 12h » ; bogue : concatène deux tables (voir notes).

- `timeSecs` (*number|nil*) : Secondes.
- `includeSeconds` (*boolean|nil*) : Ajoute les secondes.
- `includeTenths` (*boolean|nil*) : Ajoute les dixièmes.
- **renvoie** : string 'N/A' si timeSecs est nil ; sinon erreur.

#### `gameplay_rally_util.getAppropriateTextColor(clr)`

Choisit la couleur de texte lisible sur un fond : blanc pour un fond bleu foncé, noir sinon.

- `clr` (*number[]*) : Couleur de fond {r, g, b} entre 0 et 1.
- **renvoie** : ColorF Blanc ou noir opaque.

#### `gameplay_rally_util.getMissionName(missionId)`

Nom (clé de traduction) d'une mission ; renvoie l'id si la mission est introuvable.

- `missionId` (*string*) : Id de mission.
- **renvoie** : string Nom ou id.

#### `gameplay_rally_util.getNotebookFullPath(missionDir, basename)`

Chemin complet d'un notebook : <missionDir>/rally/notebooks/<basename>.

- `missionDir` (*string*) : Dossier de la mission.
- `basename` (*string*) : Nom du fichier notebook.
- **renvoie** : string Chemin.

#### `gameplay_rally_util.getTime()`

Temps haute précision (os.clockhp). Le commentaire d'origine dit « secondes depuis epoch » mais c'est une horloge de processus.

- **renvoie** : number Secondes.

#### `gameplay_rally_util.getVehFrontBottom(vehId)`

Milieu du bord avant bas de l'OOBB du véhicule (points 0 et 3).

- `vehId` (*integer*) : Id d'objet du véhicule.
- **renvoie** : vec3|nil Position monde.

#### `gameplay_rally_util.getVehFrontCenter(vehId)`

Centre de la face avant de la boîte englobante orientée (OOBB) du véhicule au spawn (moyenne des points 0 à 3).

- `vehId` (*integer*) : Id d'objet du véhicule.
- **renvoie** : vec3|nil Position monde, nil si le véhicule est introuvable.

#### `gameplay_rally_util.hasPunctuation(last_char)`

Teste si un caractère est un de `?`, `.`, `!`.

- `last_char` (*string*) : Caractère.
- **renvoie** : boolean true si ponctuation de fin de phrase.

#### `gameplay_rally_util.listNotebooks(missionDir)`

Liste, triés, les noms de fichiers *.notebook.json du dossier notebooks de la mission.

- `missionDir` (*string|nil*) : Dossier de la mission.
- **renvoie** : string[] Noms de fichiers ; vide si missionDir est nil.

#### `gameplay_rally_util.loadCornerAnglesFile()`

Lit lua/ge/extensions/gameplay/rally/corner_angles.json (styles d'angles de virage).

- **renvoie** : table|nil Contenu JSON.
- **renvoie** : string|nil Message d'erreur.

#### `gameplay_rally_util.loadNotebook(notebookFname)`

Charge un notebook depuis un fichier. Si le fichier est vide ou blanc, l'initialise et le sauvegarde. Calcule ensuite les notes adjacentes (setAllAdjacentNotes).

- `notebookFname` (*string*) : Chemin du fichier.
- **renvoie** : table|nil Notebook, nil en cas d'erreur (journalisée).

#### `gameplay_rally_util.loadNotebookForMissionDir(missionDir, basename)`

Charge un notebook d'une mission d'après son nom de fichier.

- `missionDir` (*string*) : Dossier de la mission.
- `basename` (*string*) : Nom de fichier notebook.
- **renvoie** : table|nil Notebook.

#### `gameplay_rally_util.loadRacePath(missionDir)`

Charge <missionDir>/race.race.json dans un objet gameplay/race/path.

- `missionDir` (*string*) : Dossier de la mission.
- **renvoie** : table|nil Chemin de course.
- **renvoie** : string|nil Message d'erreur si le fichier est absent.

#### `gameplay_rally_util.makePacenoteAudioFilename(pacenoteHash)`

Nom de fichier audio d'une note : 'pacenote_<hash>.ogg'.

- `pacenoteHash` (*string*) : Hash de la note.
- **renvoie** : string Nom de fichier.

#### `gameplay_rally_util.makePacenoteVariantAudioFilename(pacenoteHash, variant)`

Nom de fichier audio d'une variante : 'pacenote_<hash>_<n>.ogg' (n entier >= 1).

- `pacenoteHash` (*string*) : Hash de la note.
- `variant` (*number|string*) : Numéro de variante ; défaut 1, minimum 1.
- **renvoie** : string Nom de fichier.

#### `gameplay_rally_util.makeSystemPacenoteAudioFilename(systemKey, variantIndex)`

Nom de fichier audio d'une note système : 'pacenote_system_<clé>_<n>.ogg'.

- `systemKey` (*string*) : Clé de la note système.
- `variantIndex` (*number|nil*) : Variante ; défaut 1.
- **renvoie** : string Nom de fichier.

#### `gameplay_rally_util.matchSearchPattern(searchPattern, stringToMatch)`

Teste une chaîne avec un motif simple : les caractères spéciaux Lua sont échappés et `*` devient `.*`. La correspondance n'est pas ancrée.

- `searchPattern` (*string*) : Motif avec jokers *.
- `stringToMatch` (*string*) : Chaîne testée.
- **renvoie** : boolean true si trouvé.

#### `gameplay_rally_util.missionDirHelper(missionId)`

Dossier d'une mission : '/gameplay/missions/<id>'.

- `missionId` (*string|nil*) : Id de mission.
- **renvoie** : string|nil Chemin, nil si id nil.

#### `gameplay_rally_util.missionReccePath(missionDir, basename)`

Chemin d'un fichier du dossier d'enregistrement de reconnaissance.

- `missionDir` (*string*) : Dossier de la mission.
- `basename` (*string*) : Nom de fichier.
- **renvoie** : string Chemin.

#### `gameplay_rally_util.missionRecceRecordDir(missionDir)`

Dossier d'enregistrement de reconnaissance : <missionDir>/rally/recce/primary.

- `missionDir` (*string*) : Dossier de la mission.
- **renvoie** : string Chemin.

#### `gameplay_rally_util.normalizeName(name)`

Remplace tout caractère non alphanumérique par `_` puis réduit les `_` répétés.

- `name` (*string|nil*) : Nom.
- **renvoie** : string|nil Nom normalisé, nil si nil.

#### `gameplay_rally_util.pacenoteAudioBasenameVariantIndex(basename)`

Extrait le numéro de variante d'un nom de fichier audio (suffixe _<n>.ogg), 1 par défaut.

- `basename` (*string*) : Nom de fichier.
- **renvoie** : integer|nil Variante, nil si basename n'est pas une chaîne.

#### `gameplay_rally_util.pacenoteHashSha1(s)`

Hash SHA-1 tronqué aux 16 premiers caractères d'un texte.

- `s` (*string*) : Texte.
- **renvoie** : string 16 caractères hexadécimaux.

#### `gameplay_rally_util.randomId()`

Identifiant aléatoire de 8 caractères (SHA-1 d'un entier aléatoire). Faible entropie : 1 million de valeurs possibles.

- **renvoie** : string 8 caractères hexadécimaux.

#### `gameplay_rally_util.stripBasename(thepath)`

Renvoie le dossier d'un chemin (retire le nom de fichier ou le dernier dossier, et le `/` final).

- `thepath` (*string|nil*) : Chemin.
- **renvoie** : string|nil Dossier parent.

#### `gameplay_rally_util.transcriptsFile(missionDir)`

Chemin de transcripts.json de la reconnaissance.

- `missionDir` (*string*) : Dossier de la mission.
- **renvoie** : string Chemin.

#### `gameplay_rally_util.translatedMissionName(missionName)`

Traduit un nom de mission avec _tr.

- `missionName` (*string|nil*) : Nom ou clé.
- **renvoie** : string|nil Texte traduit.

#### `gameplay_rally_util.translatedMissionNameFromId(missionId)`

Nom traduit d'une mission à partir de son id.

- `missionId` (*string*) : Id de mission.
- **renvoie** : string Nom traduit, ou id.

#### `gameplay_rally_util.trimString(txt)`

Supprime les espaces au début et à la fin.

- `txt` (*string|nil*) : Texte.
- **renvoie** : string|nil Texte nettoyé.

#### `gameplay_rally_util.useNote(text)`

Indique si un texte de note doit être utilisé : non vide, différent de '#' et de '<none>'.

- `text` (*string|nil*) : Texte de note.
- **renvoie** : boolean|nil Truthy si utilisable.

## Champs

| Champ | Type | Description |
|---|---|---|
| `activeState_countdown` | string | 'countdown'. |
| `activeState_inactive` | string | 'inactive'. |
| `activeState_stageActive` | string | 'stageActive'. |
| `activeState_vehicleProximity` | string | 'vehicleProximity'. |
| `autodist_internal_level1` | string | '<none>' : valeur interne de distance automatique niveau 1. |
| `autofill_blocker` | string | '#' : texte de note qui bloque le remplissage automatique. |
| `defaultCodriverName` | string | 'Sophia'. |
| `defaultNotebookFname` | string | 'primary.notebook.json'. |
| `default_codriver_language` | string | 'english'. |
| `default_codriver_voice` | string | 'british_female'. |
| `default_waypoint_intersect_radius` | number | 40 (rayon d'intersection par défaut d'un waypoint, en mètres, unité déduite du nom). |
| `extRally` | string | 'gameplay_rally' : nom de l'extension rallye. |
| `extRallyLoop` | string | 'gameplay_rallyLoop' : nom de l'extension boucle de rallye. |
| `freeformDir` | string | 'freeform'. |
| `generatedPacenotesDir` | string | 'gen'. |
| `missionRallyDir` | string | 'rally' : sous-dossier rallye d'une mission. |
| `notebooksDir` | string | 'notebooks'. |
| `notebooksPath` | string | 'rally/notebooks' (relatif au dossier de la mission). |
| `pacenotesMetadataBasename` | string | 'metadata.json'. |
| `pacenotesTranscriptionsBasename` | string | 'transcriptions.json'. |
| `rallyLoop_flowgraph_color` | ImVec4 | Couleur de nœuds flowgraph de la boucle de rallye (0, 0.97, 1, 0.75). |
| `rallySettingsRoot` | string | '/settings/rally'. |
| `rally_flowgraph_color` | ImVec4 | Couleur de nœuds flowgraph du rallye (0, 1, 0.87, 0.75). |
| `recceDir` | string | 'recce'. |
| `recceRecordSubdir` | string | 'primary' : sous-dossier de l'enregistrement de reconnaissance principal. |
| `structuredDir` | string | 'structured'. |
| `systemDir` | string | 'system'. |
| `transcriptsExt` | string | 'transcripts.json'. |
| `unknown_transcript_str` | string | '[unknown]'. |
| `validPunctuation` | string[] | {'?', '.', '!'}. |
| `var_da` | string | '{da}' : variable de gabarit de note. |
| `var_db` | string | '{db}' : variable de gabarit de note. |

## Appels vers le moteur (C++)

- `FS:` `fileExists`, `findFiles`
- `debugDrawer:` `drawLineInstance`, `drawSphere`
- `scenetree.` `findObjectById`
- `ui_imgui.` `ImVec4`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/rally/util.lua`.*
