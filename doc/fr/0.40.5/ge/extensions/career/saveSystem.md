# `career_saveSystem`

*Fichier : `lua/ge/extensions/career/saveSystem.lua` · VM : Game Engine (GE) · 388 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `career_saveSystem` : `extensions.load("career_saveSystem")`, puis la globale `career_saveSystem`

Système de sauvegarde de la carrière. Les profils sont des dossiers de settings/cloud/saves/<profil>/ ; chaque sauvegarde est un sous-dossier (autosave1 à autosave4 en rotation, ou un nom choisi) contenant info.json (version, date UTC, creationDate, displayName, corrupted). saveCurrent écrit d'abord info.json en « corrupted », déclenche les hooks onSaveCurrentProfileAsyncStart puis onSaveCurrentProfile(chemin, miniatures) pour que chaque extension écrive ses fichiers, attend les extensions asynchrones, puis finalise info.json et émet onSaveFinished.

## Exemple

```lua
-- dans une extension de carrière
function M.onSaveCurrentProfile(currentSavePath)
  career_saveSystem.jsonWriteFileSafe(currentSavePath .. "/career/monModule.json", data, true)
end
```

## Remarques

- Version du format : saveSystemVersion = 64 ; les sauvegardes dont la version est inférieure à backwardsCompVersion (36) sont refusées par setProfile (retourne false).
- Quatre autosaves : getOldestAutosave choisit la première manquante, sinon la plus ancienne par date.
- Pour une extension asynchrone : registerAsyncSaveExtension(nom) pendant onSaveCurrentProfile, puis asyncSaveExtensionFinished(nom) quand terminé ; la sauvegarde se finalise quand toutes sont terminées.
- jsonWriteFileSafe écrit dans un fichier .tmp puis renomme ; en cas d'échec, il appelle saveFailed() (qui vide infoData, donc la sauvegarde sera signalée comme échouée) et retourne false.
- Les noms de profil créés sans info.json existant sont assainis (minuscules alphanumériques, suffixe numérique si déjà pris) ; le nom d'affichage garde le nom d'origine.
- removeProfile et renameProfile ne font rien (retour nil) pour le profil courant quand la carrière est active ; renameProfile retourne nil si le renommage de dossier échoue.
- onSerialize / onDeserialized conservent le profil courant lors d'un rechargement Lua.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `career_saveSystem.asyncSaveExtensionFinished(extName)` | Signale qu'une extension asynchrone a fini ; finalise la sauvegarde quand toutes sont terminées. | 284 |
| `career_saveSystem.getAllProfiles()` | Liste les noms de profils (dossiers de settings/cloud/saves/). | 325 |
| `career_saveSystem.getAllSaveFolders(profile)` | Liste les sauvegardes d'un profil (contenu d'info.json + champ name = nom du dossier), triées par date croissante. | 16 |
| `career_saveSystem.getBackwardsCompVersion()` | Version minimale de sauvegarde acceptée (36). | 362 |
| `career_saveSystem.getCurrentDisplayName()` | Nom d'affichage du profil courant. | 228 |
| `career_saveSystem.getCurrentProfile()` | Retourne le profil courant et le chemin de sa sauvegarde courante. | 224 |
| `career_saveSystem.getNewestSave(path)` | Trouve le dossier de sauvegarde le plus récent (non corrompu) d'un chemin de profil. | 84 |
| `career_saveSystem.getSaveRootDirectory()` | Racine des sauvegardes : 'settings/cloud/saves/'. | 338 |
| `career_saveSystem.getSaveSystemVersion()` | Version du format de sauvegarde (64). | 358 |
| `career_saveSystem.jsonWriteFileSafe(filename, obj, pretty, numberPrecision, tempFileName)` | Écrit un JSON via un fichier temporaire puis renomme (écriture atomique). | 243 |
| `career_saveSystem.onDeserialized(v)` | Hook de rechargement Lua : restaure l'état retourné par onSerialize. *(interne)* *(hook)* | 351 |
| `career_saveSystem.onExtensionLoaded()` | Hook de chargement ; ne fait rien. *(interne)* *(hook)* | 335 |
| `career_saveSystem.onSerialize()` | Hook de rechargement Lua : retourne le profil, le chemin, le nom d'affichage et la date de création courants. *(interne)* *(hook)* | 342 |
| `career_saveSystem.registerAsyncSaveExtension(extName)` | Déclare qu'une extension finira sa sauvegarde plus tard (la finalisation est retardée). | 280 |
| `career_saveSystem.removeProfile(profile)` | Supprime le dossier d'un profil (refusé pour le profil courant si la carrière est active). | 153 |
| `career_saveSystem.removeSaveFolder(profile, saveFolderName)` | Supprime un dossier de sauvegarde d'un profil, sauf la sauvegarde courante ou un nom illégal. | 164 |
| `career_saveSystem.renameProfile(profile, newName)` | Renomme le dossier d'un profil (refusé si le nouveau nom existe, ou pour le profil courant en carrière active). | 208 |
| `career_saveSystem.saveCurrent(vehiclesThumbnailUpdate, playSuccessSound, saveName)` | Sauvegarde la carrière dans une sauvegarde automatique (la plus ancienne) ou dans saveName. Sans profil courant, ne fait rien. | 291 |
| `career_saveSystem.saveFailed()` | Marque la sauvegarde en cours comme échouée (vide infoData). | 239 |
| `career_saveSystem.setProfile(profile, specificSaveFolder)` | Sélectionne le profil courant (et sa sauvegarde la plus récente ou une précise). Émet onBeforeSetProfile puis onSetProfile(savePath, profile). Avec profile = nil, désélectionne. | 120 |

### Détail des paramètres

#### `career_saveSystem.asyncSaveExtensionFinished(extName)`

Signale qu'une extension asynchrone a fini ; finalise la sauvegarde quand toutes sont terminées.

- `extName` (*string*) : Nom de l'extension.

#### `career_saveSystem.getAllProfiles()`

Liste les noms de profils (dossiers de settings/cloud/saves/).

- **renvoie** : string[] Noms de profils.

#### `career_saveSystem.getAllSaveFolders(profile)`

Liste les sauvegardes d'un profil (contenu d'info.json + champ name = nom du dossier), triées par date croissante.

- `profile` (*string*) : Nom du profil.
- **renvoie** : table[] Liste de tables info.json.

#### `career_saveSystem.getBackwardsCompVersion()`

Version minimale de sauvegarde acceptée (36).

- **renvoie** : integer Version.

#### `career_saveSystem.getCurrentDisplayName()`

Nom d'affichage du profil courant.

- **renvoie** : string|nil Nom affiché.

#### `career_saveSystem.getCurrentProfile()`

Retourne le profil courant et le chemin de sa sauvegarde courante.

- **renvoie** : string|nil Nom du profil.
- **renvoie** : string|nil Chemin du dossier de sauvegarde courant (à utiliser comme racine des fichiers de la carrière).

#### `career_saveSystem.getNewestSave(path)`

Trouve le dossier de sauvegarde le plus récent (non corrompu) d'un chemin de profil.

- `path` (*string*) : Dossier du profil.
- **renvoie** : string Chemin du dossier, ou chaîne vide si aucun.

#### `career_saveSystem.getSaveRootDirectory()`

Racine des sauvegardes : 'settings/cloud/saves/'.

- **renvoie** : string Chemin.

#### `career_saveSystem.getSaveSystemVersion()`

Version du format de sauvegarde (64).

- **renvoie** : integer Version.

#### `career_saveSystem.jsonWriteFileSafe(filename, obj, pretty, numberPrecision, tempFileName)`

Écrit un JSON via un fichier temporaire puis renomme (écriture atomique).

- `filename` (*string*) : Fichier cible.
- `obj` (*table*) : Données.
- `pretty` (*boolean|nil*) : Mise en forme lisible.
- `numberPrecision` (*integer|nil*) : Précision des nombres.
- `tempFileName` (*string|nil*) : Fichier temporaire, défaut filename..".tmp".
- **renvoie** : boolean true si écrit.

#### `career_saveSystem.onDeserialized(v)`

Hook de rechargement Lua : restaure l'état retourné par onSerialize.

- `v` (*table*) : État sauvegardé.

#### `career_saveSystem.onSerialize()`

Hook de rechargement Lua : retourne le profil, le chemin, le nom d'affichage et la date de création courants.

- **renvoie** : table État à conserver.

#### `career_saveSystem.registerAsyncSaveExtension(extName)`

Déclare qu'une extension finira sa sauvegarde plus tard (la finalisation est retardée).

- `extName` (*string*) : Nom de l'extension.

#### `career_saveSystem.removeProfile(profile)`

Supprime le dossier d'un profil (refusé pour le profil courant si la carrière est active).

- `profile` (*string*) : Nom du profil.

#### `career_saveSystem.removeSaveFolder(profile, saveFolderName)`

Supprime un dossier de sauvegarde d'un profil, sauf la sauvegarde courante ou un nom illégal.

- `profile` (*string*) : Nom du profil.
- `saveFolderName` (*string*) : Nom du dossier de sauvegarde.
- **renvoie** : boolean true si supprimé.

#### `career_saveSystem.renameProfile(profile, newName)`

Renomme le dossier d'un profil (refusé si le nouveau nom existe, ou pour le profil courant en carrière active).

- `profile` (*string*) : Ancien nom.
- `newName` (*string*) : Nouveau nom.
- **renvoie** : boolean|nil true si renommé, false si refusé, nil dans les autres cas d'échec.

#### `career_saveSystem.saveCurrent(vehiclesThumbnailUpdate, playSuccessSound, saveName)`

Sauvegarde la carrière dans une sauvegarde automatique (la plus ancienne) ou dans saveName. Sans profil courant, ne fait rien.

- `vehiclesThumbnailUpdate` (*any*) : Transmis aux extensions via onSaveCurrentProfile (ex. liste d'inventoryId dont la miniature doit être mise à jour).
- `playSuccessSound` (*boolean|nil*) : Joue un son à la réussite.
- `saveName` (*string|nil*) : Nom d'une sauvegarde dédiée au lieu d'une autosave.

#### `career_saveSystem.setProfile(profile, specificSaveFolder)`

Sélectionne le profil courant (et sa sauvegarde la plus récente ou une précise). Émet onBeforeSetProfile puis onSetProfile(savePath, profile). Avec profile = nil, désélectionne.

- `profile` (*string|nil*) : Nom du profil.
- `specificSaveFolder` (*string|nil*) : Nom d'un sous-dossier de sauvegarde précis.
- **renvoie** : boolean false si profil nil ou sauvegarde trop ancienne, true sinon.

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onBeforeSetProfile` — écouté par 1 module(s)
- `onSaveCurrentProfile` — écouté par 23 module(s)
- `onSaveCurrentProfileAsyncStart` — écouté par 1 module(s)
- `onSaveFinished` — écouté par 2 module(s)
- `onSetProfile`

**Évènements UI (guihooks.trigger) :** `toastrMsg`

## Appels vers le moteur (C++)

- `FS:` `directoryExists`, `directoryList`, `directoryRemove`, `renameFile`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/career/saveSystem.lua`.*
