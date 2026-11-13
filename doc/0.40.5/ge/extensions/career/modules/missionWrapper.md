# `career_modules_missionWrapper`

*Fichier : `lua/ge/extensions/career/modules/missionWrapper.lua` · VM : Game Engine (GE) · 98 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `career_modules_missionWrapper` : `extensions.load("career_modules_missionWrapper")`, puis la globale `career_modules_missionWrapper`

Fait le lien entre le système de missions (gameplay_missions_*) et la sauvegarde de carrière. Les données de progression des missions sont stockées dans <save>/career/missions/ ; le module suit les missions « sales » (modifiées) et les écrit à chaque sauvegarde du profil. Il déclenche aussi une sauvegarde avant et après une mission si l'autosauvegarde est active.

## Remarques

- À la décharge de l'extension, le chemin de sauvegarde des missions est remis à nil et tout le système de missions est rechargé.
- Si une sauvegarde de mission échoue (saveMissionSaveData renvoie false), career_saveSystem.saveFailed() est appelé.
- À la fin d'une mission (état stopped), l'état du joueur est réinitialisé (career_modules_playerDriving.resetPlayerState).
- init, setMissionInfo et le paramètre task de preMissionHandling ne servent à rien ; `dirtyDate` est une date ISO UTC (os.date("!%Y-%m-%dT%H:%M:%SZ")) par défaut.

**Dépendances (chargées avant) :** `career_career`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `career_modules_missionWrapper.cacheMissionData(id, dirtyDate)` | Marque la mission comme modifiée (à sauvegarder) avec la date donnée ou la date UTC courante. | 46 |
| `career_modules_missionWrapper.onAnyMissionChanged(state, mission)` | Hook : à l'état "stopped", réinitialise l'état du joueur et, si l'autosauvegarde est active, sauvegarde la mission. *(interne)* *(hook)* | 59 |
| `career_modules_missionWrapper.onExtensionLoaded()` | Hook : si la carrière est active, fixe le chemin de sauvegarde des missions et recharge le système de missions (renvoie false sinon). *(interne)* *(hook)* | 20 |
| `career_modules_missionWrapper.onExtensionUnloaded()` | Hook : retire le chemin de sauvegarde des missions et recharge le système de missions. *(interne)* *(hook)* | 27 |
| `career_modules_missionWrapper.onMissionLoaded(id, dirtyDate)` | Hook appelé quand les données d'une mission sont chargées : les enregistre comme suivies. *(interne)* *(hook)* | 50 |
| `career_modules_missionWrapper.onSaveCurrentProfile(currentSavePath)` | Hook de sauvegarde : écrit les données de chaque mission modifiée dans career/missions/. *(interne)* *(hook)* | 33 |
| `career_modules_missionWrapper.onVehicleSaveFinished()` | Hook appelé quand la sauvegarde du véhicule est finie : débloque l'étape de démarrage de mission en attente. *(interne)* *(hook)* | 69 |
| `career_modules_missionWrapper.preMissionHandling(step, task)` | Étape appelée avant le démarrage d'une mission : si l'autosauvegarde est active, sauvegarde et attend onVehicleSaveFinished pour mettre step.handlingComplete = true ; sinon marque directement l'étape comme terminée. | 76 |
| `career_modules_missionWrapper.saveMission(id)` | Marque la mission comme modifiée et lance une sauvegarde de carrière complète (career_saveSystem.saveCurrent). | 54 |

### Détail des paramètres

#### `career_modules_missionWrapper.cacheMissionData(id, dirtyDate)`

Marque la mission comme modifiée (à sauvegarder) avec la date donnée ou la date UTC courante.

- `id` (*string*) : Identifiant de la mission.
- `dirtyDate` (*string|nil*) : Date ISO 8601, maintenant par défaut.

#### `career_modules_missionWrapper.onAnyMissionChanged(state, mission)`

Hook : à l'état "stopped", réinitialise l'état du joueur et, si l'autosauvegarde est active, sauvegarde la mission.

- `state` (*string*) : État de la mission.
- `mission` (*table|nil*) : Mission concernée.

#### `career_modules_missionWrapper.onMissionLoaded(id, dirtyDate)`

Hook appelé quand les données d'une mission sont chargées : les enregistre comme suivies.

- `id` (*string*) : Identifiant de la mission.
- `dirtyDate` (*string|nil*) : Date associée.

#### `career_modules_missionWrapper.onSaveCurrentProfile(currentSavePath)`

Hook de sauvegarde : écrit les données de chaque mission modifiée dans career/missions/.

- `currentSavePath` (*string*) : Dossier de sauvegarde.

#### `career_modules_missionWrapper.preMissionHandling(step, task)`

Étape appelée avant le démarrage d'une mission : si l'autosauvegarde est active, sauvegarde et attend onVehicleSaveFinished pour mettre step.handlingComplete = true ; sinon marque directement l'étape comme terminée.

- `step` (*table*) : Étape de démarrage de mission (champ handlingComplete).
- `task` (*any*) : Non utilisé.

#### `career_modules_missionWrapper.saveMission(id)`

Marque la mission comme modifiée et lance une sauvegarde de carrière complète (career_saveSystem.saveCurrent).

- `id` (*string*) : Identifiant de la mission.

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table<integer, string> | Extensions chargées avant : career_career. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/career/modules/missionWrapper.lua`.*
