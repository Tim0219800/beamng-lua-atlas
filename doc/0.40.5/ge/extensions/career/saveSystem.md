# `career_saveSystem`

*Fichier : `lua/ge/extensions/career/saveSystem.lua` · VM : Game Engine (GE) · 388 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `career_saveSystem` : `extensions.load("career_saveSystem")`, puis la globale `career_saveSystem`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `career_saveSystem.asyncSaveExtensionFinished(extName)` |  | 284 |
| `career_saveSystem.getAllProfiles()` |  | 325 |
| `career_saveSystem.getAllSaveFolders(profile)` |  | 16 |
| `career_saveSystem.getBackwardsCompVersion()` |  | 362 |
| `career_saveSystem.getCurrentDisplayName()` |  | 228 |
| `career_saveSystem.getCurrentProfile()` |  | 224 |
| `career_saveSystem.getNewestSave(path)` | Finds the newest save folder for a profile | 84 |
| `career_saveSystem.getSaveRootDirectory()` |  | 338 |
| `career_saveSystem.getSaveSystemVersion()` |  | 358 |
| `career_saveSystem.jsonWriteFileSafe(filename, obj, pretty, numberPrecision, tempFileName)` |  | 243 |
| `career_saveSystem.onDeserialized(v)` | *(hook)* | 351 |
| `career_saveSystem.onExtensionLoaded()` | *(hook)* | 335 |
| `career_saveSystem.onSerialize()` | *(hook)* | 342 |
| `career_saveSystem.registerAsyncSaveExtension(extName)` |  | 280 |
| `career_saveSystem.removeProfile(profile)` |  | 153 |
| `career_saveSystem.removeSaveFolder(profile, saveFolderName)` |  | 164 |
| `career_saveSystem.renameProfile(profile, newName)` |  | 208 |
| `career_saveSystem.saveCurrent(vehiclesThumbnailUpdate, playSuccessSound, saveName)` |  | 291 |
| `career_saveSystem.saveFailed()` |  | 239 |
| `career_saveSystem.setProfile(profile, specificSaveFolder)` |  | 120 |

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
