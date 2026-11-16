# `core_modmanager`

*Fichier : `lua/ge/extensions/core/modmanager.lua` · VM : Game Engine (GE) · 1609 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `core_modmanager` : `extensions.load("core_modmanager")`, puis la globale `core_modmanager`

Extension GE `core_modmanager` : gestionnaire de mods. Au démarrage de l'interface (onUiReady), il lit la base mods/db.json, scanne /mods/*.zip et /mods/unpacked/*, détecte le type de chaque mod (vehicle, terrain, app, scenario, sound, unknown), les monte dans le système de fichiers virtuel, puis exécute les scripts modScript.lua (/scripts/**/modScript.lua et /mods_data/*/modScript.lua). Il permet d'activer, désactiver, supprimer, dépaqueter (unpack) et reconditionner (pack) un mod, détecte les doublons et les conflits de fichiers, et vérifie les mises à jour via le serveur. Un moddeur s'en sert pour savoir à quel mod appartient un fichier, lister les mods actifs, ou réagir aux hooks onModActivated / onModDeactivated / onModManagerReady.

## Exemple

```lua
-- à quel mod appartient ce fichier ?
local mod = core_modmanager.getModFromPath('/vehicles/monAuto/info.json')
if mod then log('I','', mod.modname .. ' actif=' .. tostring(mod.active)) end
-- réagir à l'activation d'un mod
function M.onModActivated(modData) log('I','','mod activé : ' .. tostring(modData.modname)) end
```

## Remarques

- Base de données `mods` : table modname -> { modname, fullpath, dirname, filename, modType, mountPoint, active, dateAdded, stat, unpackedPath, orgZipFilename, modID, modInfoPath, modData (contenu de mod_info/<ID>/info.json : title, tagid, hashes, attachments, icon...), valid, conflict }. modname = chemin en minuscules sans '/mods/', 'repo/', 'unpacked/', '/' ni '.zip'. Sauvegardée dans mods/db.json (version d'en-tête 1.1, non écrite en safe mode) à chaque changement d'état.
- Hooks émis : onBeforeMountEntry(filename, mountPoint), onModActivated(copie de la fiche du mod), onModDeactivated(copie), onModManagerReady (une fois), onModManagerStateChanged (à chaque stateChanged), onModManagerModsMounted (après les modScripts). Évènements UI : ModManagerModsChanged, ModManagerVehiclesChanged, ModManagerReady, modmanagerError, toastrMsg, checkUpdateCheckedMod, checkingUpdatesEnd.
- Les modScript.lua sont lancés par dofile pendant l'initialisation (et à l'activation d'un mod). Pendant cette phase, extensions.load est enveloppé : un modScript qui charge une extension doit appeler setExtensionUnloadMode(ext, 'manual') sinon un avertissement est loggé ; l'extension est de toute façon mise en mode 'manual'.
- Si le réglage disableModsAfterUpdate est vrai (activé automatiquement après une mise à jour du jeu quand des mods existent), initDB ne monte rien et signale simplement ready. enableModsAfterUpdate() le désactive et relance onUiReady.
- getModFromPath est signalée 'très lente' par le code (FS:getOriginArchivePathRelative) ; core_levels l'appelle avec un 2e argument (true) qui est ignoré. getModFromPath renvoie nil pour un fichier du jeu de base.
- Les champs M.initDB et M.checkUpdate existent bien (jobs enveloppés par core_jobsystem.wrap) ; l'analyse statique les signalait à tort comme nil. Les appeler lance un job asynchrone.
- Bug probable dans unpackMod : `zipOldCopy = deepcopy(mods[filename])` est indexé par chemin au lieu de modname (donc nil), et le message d'erreur d'extraction utilise `v` hors de portée (nil). La restauration `mods[modname] = zipOldCopy` efface alors le mod en cas d'échec.
- Bug probable dans packMod : les messages d'erreur utilisent la variable `filename`, jamais définie dans cette fonction (nil).
- Bug dans updateZipMod : la boucle de recherche utilise `m.filename` alors que la variable de boucle est `md` (m est nil, erreur à l'exécution si l'ancien mod n'est pas trouvé par nom) ; le message de log utilise aussi `oldFileNamex` (faute de frappe, nil).
- deleteMod / safeDelete n'agissent que sur des chemins commençant par '/mods/' et sans '..'. deleteAllMods ne supprime que les mods de /mods/repo/ puis appelle core_online.apiCall('s2/v4/modUnsubscribeAll').
- Dans deleteMod, la liste de notifications `rmMountedFilesChange` est calculée mais jamais envoyée (onFileChanged non appelé) ; contrairement à deactivateMod.
- Le type d'un mod est déduit des fichiers : 'vehicle' (*.jbeam ou vehicles/), 'terrain' (*.mis ou main.level.json), 'app' (ui/), 'scenario' (scenarios/ sans .mis), 'sound' (*.sbeam sans jbeam/mis), sinon 'unknown'. Si les fichiers ne sont pas déjà sous vehicles/ ou levels/, mountPoint est fixé à 'vehicles/' ou 'levels/' (ancien format).

**Dépendances (chargées avant) :** `core_versionUpdate`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `core_modmanager.activateAllMods()` | Monte et active tous les mods connus, exécute leurs modScripts, notifie les fichiers et met à jour l'état. | 1070 |
| `core_modmanager.activateMod(modname)` | Active un mod : le monte s'il ne l'est pas, exécute ses modScript.lua, le marque active, émet onModActivated, notifie les fichiers ajoutés, charge les extensions en déchargement manuel et met à jour l'état. | 1023 |
| `core_modmanager.activateModId(modID)` | Comme activateMod mais avec l'ID repository du mod (tagid) ou le modname. | 1061 |
| `core_modmanager.check4Update()` | Demande une vérification des mises à jour au prochain démarrage de initDB (si le réglage modAutoUpdates est actif et le réseau autorisé). | 1486 |
| `core_modmanager.checkMod(modname)` | Vérifie un mod : compare les hash de tous ses fichiers avec le manifeste (modData.hashes) et cherche dans /vehicles/<nom>/ des fichiers qui n'appartiennent pas au mod (conflits). Renseigne mods[modname].valid et .conflict. | 268 |
| `core_modmanager.deactivateAllMods()` | Démonte tous les mods, les désactive et notifie les changements de fichiers. | 773 |
| `core_modmanager.deactivateMod(modname, preventStateChange, deferFileChanged)` | Démonte le mod, le marque inactif (active = false), émet onModDeactivated et notifie les fichiers supprimés. | 974 |
| `core_modmanager.deactivateModId(modID)` | Comme deactivateMod, par ID repository (tagid) ou modname. | 1014 |
| `core_modmanager.deleteAllMods()` | Supprime tous les mods installés depuis le repository (/mods/repo/) et demande au serveur de désabonner l'utilisateur de tous les mods. | 1139 |
| `core_modmanager.deleteMod(modname)` | Démonte puis supprime le fichier ou dossier du mod (seulement sous /mods/) et le retire de la base. | 1116 |
| `core_modmanager.disableAutoMount()` | Désactive le montage automatique des zips qui apparaissent dans /mods/. | 1497 |
| `core_modmanager.enableAutoMount()` | Réactive le montage automatique et relance initDB pour rattraper les changements. | 1501 |
| `core_modmanager.enableModsAfterUpdate()` | Désactive le réglage disableModsAfterUpdate et initialise le gestionnaire de mods. | 808 |
| `core_modmanager.getConflict(modname)` | Renvoie la liste des conflits calculée par checkMod. | 1437 |
| `core_modmanager.getModDB(modname)` | Renvoie la fiche d'un mod dans la base. | 1442 |
| `core_modmanager.getModForFilename(filename_virtual)` | Cherche, à partir du chemin réel d'un fichier virtuel, le mod zip du dossier utilisateur qui le contient. Ne gère pas les mods dépaquetés. | 1461 |
| `core_modmanager.getModFromOriginArchivePath(originArchivePath)` | Retrouve la fiche d'un mod à partir du chemin de son archive d'origine (converti en modname). | 196 |
| `core_modmanager.getModFromPath(vfsPath)` | Trouve le mod qui fournit un fichier virtuel, via l'archive d'origine du fichier. Lent : à utiliser avec précaution. | 202 |
| `core_modmanager.getModFromPathSUPERSLOW(vfsPath)` | Ancien nom de getModFromPath, conservé pour compatibilité. | 202 |
| `core_modmanager.getModNameFromID(modID)` | Cherche le modname dont le tagid (ID repository) vaut modID, ou dont le nom est modID. | 1004 |
| `core_modmanager.getMods()` | Renvoie la table interne de tous les mods (pas une copie). | 1521 |
| `core_modmanager.getStats()` | Compte les mods : disabled (non actifs), zip (actifs en fichier), unpacked (actifs en dossier). | 1506 |
| `core_modmanager.isReady()` | Indique si la base de mods a été initialisée et les mods montés. | 1337 |
| `core_modmanager.modIsUnpacked(modname)` | Indique si le mod est dépaqueté (dossier dans /mods/unpacked/). | 1450 |
| `core_modmanager.onFileChanged(filename, type)` | Hook de changement de fichier : si un .zip apparaît ou change dans /mods/ (hors /mods/unpacked et mods/db.json) et que le montage auto est actif, appelle workOffChangedMod. *(interne)* *(hook)* | 1330 |
| `core_modmanager.onUiReady()` | Hook appelé quand l'interface est prête : charge mods/db.json puis lance initDB (sauf si les mods sont désactivés après mise à jour ou si déjà prêt). *(interne)* *(hook)* | 792 |
| `core_modmanager.openEntryInExplorer(filename)` | Ouvre le dossier dépaqueté du mod dans l'explorateur de fichiers du système. | 163 |
| `core_modmanager.openModFolderInExplorer()` | Ouvre le dossier /mods/ dans l'explorateur de fichiers. | 1446 |
| `core_modmanager.packMod(dirPath)` | Recrée le zip d'un mod dépaqueté à partir de son dossier, supprime le dossier et remet la fiche en mode zip. | 1227 |
| `core_modmanager.requestState()` | Envoie à l'interface l'état courant : liste des mods (ModManagerModsChanged), liste des véhicules (ModManagerVehiclesChanged) et la liste des niveaux (core_levels.requestData). | 40 |
| `core_modmanager.unpackMod(modname)` | Extrait un mod zip vers /mods/unpacked/<nom>, supprime le zip, monte le dossier et met à jour la fiche (unpackedPath, orgZipFilename, fullpath). Affiche une progression dans la barre des tâches. | 1149 |
| `core_modmanager.updateZipMod(oldFileName, newFileName)` | Remplace un zip de mod par un nouveau fichier : supprime l'ancien (et sa fiche) puis renomme le nouveau avec l'ancien nom, dans /mods/. Contient un bug (voir notes). | 1525 |
| `core_modmanager.workOffChangedMod(filename, type)` | Traite un zip ajouté ou modifié dans /mods/ : met à jour la base, active le mod s'il n'est pas désactivé et prévient le moteur des fichiers changés. Refuse (et supprime le zip) si une version dépaquetée du même mod existe. | 1307 |

### Détail des paramètres

#### `core_modmanager.activateMod(modname)`

Active un mod : le monte s'il ne l'est pas, exécute ses modScript.lua, le marque active, émet onModActivated, notifie les fichiers ajoutés, charge les extensions en déchargement manuel et met à jour l'état.

- `modname` (*string*) : Clé de mod (voir getMods). Inconnu : message dans le log, rien d'autre.

#### `core_modmanager.activateModId(modID)`

Comme activateMod mais avec l'ID repository du mod (tagid) ou le modname.

- `modID` (*string*) : tagid ou modname.

#### `core_modmanager.checkMod(modname)`

Vérifie un mod : compare les hash de tous ses fichiers avec le manifeste (modData.hashes) et cherche dans /vehicles/<nom>/ des fichiers qui n'appartiennent pas au mod (conflits). Renseigne mods[modname].valid et .conflict.

- `modname` (*string*) : Clé de mod.
- **renvoie** : boolean|nil true si valide et sans conflit ; nil si le mod est inconnu.

#### `core_modmanager.deactivateMod(modname, preventStateChange, deferFileChanged)`

Démonte le mod, le marque inactif (active = false), émet onModDeactivated et notifie les fichiers supprimés.

- `modname` (*string*) : Clé de mod.
- `preventStateChange` (*boolean|nil*) : Si vrai, ne met pas à jour l'état (stateChanged).
- `deferFileChanged` (*boolean|nil*) : Si vrai, ne notifie pas tout de suite : la liste est seulement renvoyée.
- **renvoie** : table[]|nil Liste { filename, type = 'deleted' }, ou nil si le mod n'existe pas.

#### `core_modmanager.deactivateModId(modID)`

Comme deactivateMod, par ID repository (tagid) ou modname.

- `modID` (*string*) : tagid ou modname.

#### `core_modmanager.deleteMod(modname)`

Démonte puis supprime le fichier ou dossier du mod (seulement sous /mods/) et le retire de la base.

- `modname` (*string*) : Clé de mod.
- **renvoie** : boolean|nil true si supprimé, false si la suppression échoue, nil si le mod n'existe pas.

#### `core_modmanager.getConflict(modname)`

Renvoie la liste des conflits calculée par checkMod.

- `modname` (*string*) : Clé de mod.
- **renvoie** : table[]|nil Éléments { file, path } ou nil.

#### `core_modmanager.getModDB(modname)`

Renvoie la fiche d'un mod dans la base.

- `modname` (*string*) : Clé de mod.
- **renvoie** : table|nil Fiche du mod.

#### `core_modmanager.getModForFilename(filename_virtual)`

Cherche, à partir du chemin réel d'un fichier virtuel, le mod zip du dossier utilisateur qui le contient. Ne gère pas les mods dépaquetés.

- `filename_virtual` (*string*) : Chemin virtuel.
- **renvoie** : string|nil modname.
- **renvoie** : table|nil fiche du mod.

#### `core_modmanager.getModFromOriginArchivePath(originArchivePath)`

Retrouve la fiche d'un mod à partir du chemin de son archive d'origine (converti en modname).

- `originArchivePath` (*string|nil*) : Chemin de l'archive.
- **renvoie** : table|nil Fiche du mod.

#### `core_modmanager.getModFromPath(vfsPath)`

Trouve le mod qui fournit un fichier virtuel, via l'archive d'origine du fichier. Lent : à utiliser avec précaution.

- `vfsPath` (*string*) : Chemin virtuel (ex. '/levels/x/info.json').
- **renvoie** : table|nil Fiche du mod, nil si le fichier vient du jeu de base.

#### `core_modmanager.getModFromPathSUPERSLOW(vfsPath)`

Ancien nom de getModFromPath, conservé pour compatibilité.

- `vfsPath` (*string*) : Chemin virtuel.
- **renvoie** : table|nil Fiche du mod.

#### `core_modmanager.getModNameFromID(modID)`

Cherche le modname dont le tagid (ID repository) vaut modID, ou dont le nom est modID.

- `modID` (*string*) : ID repository ou modname.
- **renvoie** : string|nil modname trouvé.

#### `core_modmanager.getMods()`

Renvoie la table interne de tous les mods (pas une copie).

- **renvoie** : table<string, table> modname -> fiche.

#### `core_modmanager.getStats()`

Compte les mods : disabled (non actifs), zip (actifs en fichier), unpacked (actifs en dossier).

- **renvoie** : table { zip, unpacked, disabled }

#### `core_modmanager.isReady()`

Indique si la base de mods a été initialisée et les mods montés.

- **renvoie** : boolean|nil true quand prêt, nil avant.

#### `core_modmanager.modIsUnpacked(modname)`

Indique si le mod est dépaqueté (dossier dans /mods/unpacked/).

- `modname` (*string*) : Nom ou chemin du mod.
- **renvoie** : boolean true si dépaqueté.

#### `core_modmanager.onFileChanged(filename, type)`

Hook de changement de fichier : si un .zip apparaît ou change dans /mods/ (hors /mods/unpacked et mods/db.json) et que le montage auto est actif, appelle workOffChangedMod.

- `filename` (*string*) : Chemin virtuel du fichier.
- `type` (*string*) : 'added', 'modified' ou 'deleted'.

#### `core_modmanager.openEntryInExplorer(filename)`

Ouvre le dossier dépaqueté du mod dans l'explorateur de fichiers du système.

- `filename` (*string*) : Clé de mod (modname).

#### `core_modmanager.packMod(dirPath)`

Recrée le zip d'un mod dépaqueté à partir de son dossier, supprime le dossier et remet la fiche en mode zip.

- `dirPath` (*string*) : Chemin du dossier dépaqueté (ex. '/mods/unpacked/monMod').
- **renvoie** : boolean|nil false en cas d'erreur ; nil en cas de succès (pas de return explicite).

#### `core_modmanager.unpackMod(modname)`

Extrait un mod zip vers /mods/unpacked/<nom>, supprime le zip, monte le dossier et met à jour la fiche (unpackedPath, orgZipFilename, fullpath). Affiche une progression dans la barre des tâches.

- `modname` (*string*) : Clé de mod.

#### `core_modmanager.updateZipMod(oldFileName, newFileName)`

Remplace un zip de mod par un nouveau fichier : supprime l'ancien (et sa fiche) puis renomme le nouveau avec l'ancien nom, dans /mods/. Contient un bug (voir notes).

- `oldFileName` (*string*) : Nom de l'ancien zip (relatif à /mods/).
- `newFileName` (*string*) : Nom du nouveau zip (relatif à /mods/).

#### `core_modmanager.workOffChangedMod(filename, type)`

Traite un zip ajouté ou modifié dans /mods/ : met à jour la base, active le mod s'il n'est pas désactivé et prévient le moteur des fichiers changés. Refuse (et supprime le zip) si une version dépaquetée du même mod existe.

- `filename` (*string*) : Chemin du zip.
- `type` (*string*) : 'added' ou 'modified' pour agir.

## Champs

| Champ | Type | Description |
|---|---|---|
| `checkUpdate` | function | Job (core_jobsystem.wrap, délai 500) qui envoie la liste des mods au serveur (s2/v4/modSync) et applique les actions renvoyées : deactivate, update, missing, 404OLD. |
| `dependencies` | string[] | { 'core_versionUpdate' }. |
| `initDB` | function | Job (core_jobsystem.wrap) qui scanne /mods/, monte les mods, notifie onFileChanged, charge core_repository, lance onModManagerReady et exécute les modScripts. Appelé par onUiReady et enableAutoMount. |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onBeforeMountEntry`
- `onModActivated` — écouté par 4 module(s)
- `onModDeactivated` — écouté par 4 module(s)
- `onModManagerModsMounted`
- `onModManagerReady` — écouté par 10 module(s)
- `onModManagerStateChanged` — écouté par 3 module(s)

**Évènements UI (guihooks.trigger) :** `ModManagerModsChanged`, `ModManagerReady`, `ModManagerVehiclesChanged`, `checkUpdateCheckedMod`, `checkingUpdatesEnd`, `modmanagerError`, `toastrMsg`

## Appels vers le moteur (C++)

- `FS:` `directoryCreate`, `directoryExists`, `fileExists`, `fileSize`, `findFiles`, `getFileRealPath`, `getGamePath`, `getOriginArchivePathRelative`, `getUserPath`, `hashFile`, `hashFileSHA1`, `isMounted`, `mount`, `mountList`, `remove`, `removeFile`, `renameFile`, `stat`, `triggerFilesChanged`, `unmount`, `unmountList`

**Charge les extensions :** `core_repository`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/core/modmanager.lua`.*
