# `career_career`

*Fichier : `lua/ge/extensions/career/career.lua` · VM : Game Engine (GE) · 790 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `career_career` : `extensions.load("career_career")`, puis la globale `career_career`

**Dépendances (chargées avant) :** `career_saveSystem`, `core_recoveryPrompt`, `gameplay_traffic`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `career_career.activateCareer(removeVehicles)` |  | 257 |
| `career_career.closeAllMenus()` |  | 715 |
| `career_career.createOrLoadCareerAndStart(name, specificAutosave, startingOptions)` |  | 342 |
| `career_career.deactivateCareer(saveCareer)` |  | 317 |
| `career_career.deactivateCareerAndReloadLevel(saveCareer)` |  | 332 |
| `career_career.getAdditionalMenuButtons()` |  | 728 |
| `career_career.getAutosavesForProfile(profile)` |  | 599 |
| `career_career.getBeamXPLevel(xp)` |  | 451 |
| `career_career.getCurrentStartingModeData()` |  | 398 |
| `career_career.getSaveFoldersForProfile(profile)` | Returns the list of save folders (autosaves) for a profile with enough info<br> for the UI to display and let the player pick one to load. | 614 |
| `career_career.getStartingModeOptions()` |  | 359 |
| `career_career.hasBoughtStarterVehicle()` |  | 688 |
| `career_career.hasInteractedWithOrganization(id)` |  | 692 |
| `career_career.interactWithOrganization(id)` |  | 696 |
| `career_career.isActive()` |  | 338 |
| `career_career.isAutosaveEnabled()` |  | 720 |
| `career_career.onAnyMissionChanged(state, mission)` | *(hook)* | 677 |
| `career_career.onBeforeSetProfile(currentSavePath)` | *(hook)* | 438 |
| `career_career.onCameraModeChanged(modeName)` | *(hook)* | 69 |
| `career_career.onCareerActive(active)` | *(hook)* | 158 |
| `career_career.onClientEndMission(levelPath)` | *(hook)* | 654 |
| `career_career.onClientPostStartMission()` | *(hook)* | 240 |
| `career_career.onDeserialized(v)` | *(hook)* | 671 |
| `career_career.onGlobalCameraSet(modeName)` | *(hook)* | 74 |
| `career_career.onLoadingScreenFadeout()` | Navigate to "play" exactly once, when the loading screen fades out after this activation.<br> The router keeps resending the route change until the UI reports navigation started, so we<br> only gate on the loading screen fade-out here. *(hook)* | 250 |
| `career_career.onSaveCurrentProfile(currentSavePath)` | *(hook)* | 417 |
| `career_career.onSerialize()` | *(hook)* | 662 |
| `career_career.onVehicleAddedToInventory(data)` | *(hook)* | 701 |
| `career_career.sendAllCareerProfilesData()` |  | 569 |
| `career_career.sendCurrentProfileData()` |  | 591 |
| `career_career.setAutosaveEnabled(enabled)` |  | 724 |
| `career_career.setDebugMenuEnabled(enabled)` |  | 749 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table |  |
| `startingOptions` | table |  |
| `tutorialEnabled` | boolean |  |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onBeforeCareerActivate` — écouté par 1 module(s)
- `onCareerActive` — écouté par 27 module(s)

**Évènements UI (guihooks.trigger) :** `ClearTasklist`, `HideCareerTasklist`, `allCareerProfiles`

## Appels vers le moteur (C++)

- `FS:` `findFiles`
- `be:` `getObject`, `getObjectCount`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/career/career.lua`.*
