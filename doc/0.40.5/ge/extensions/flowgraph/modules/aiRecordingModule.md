# `flowgraph_modules_aiRecordingModule`

*Fichier : `lua/ge/extensions/flowgraph/modules/aiRecordingModule.lua` · VM : Game Engine (GE) · 122 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/modules/aiRecordingModule")` (fichier sous extensions/ mais pas une extension classique)

Module flowgraph (moduleOrder 1, après missionReplayModule) qui enregistre ou rejoue le parcours IA (script AI) du véhicule joueur pour les missions. Il n'est actif que si l'argument de ligne de commande enableAiRecordingForMissions vaut true, ou si la mission a startingOptions.aiPath. À l'arrêt de l'enregistrement, le véhicule renvoie son tracé via le hook onVehicleSubmitRecordingForMission et le module écrit un fichier recording_<date>.missionTestData.json dans <dossier de mission>/tests/.

## Remarques

- Le flag 'enabled' et les tables d'état sont des variables locales au fichier (partagées entre toutes les instances du module).
- Le fichier de test contient aiPath, userSettings, vehicle (model, config, isConfigFile, licensePlate), attemptData, attemptStars et aiDuration.
- Incohérence : la clé attemptStars est définie deux fois dans la table testData (la seconde, lastAttempt.unlockedStars, écrase la première, lastTotalChange.unlockedStarsAttempt).
- onVehicleSubmitRecordingForMission suppose que lastAttempt et lastTotalChange ne sont pas nil (erreur si stopAiRecording a été appelé sans arguments, ce que fait executionStopped).
- startAiReplay met aussi vehicleStates[...] = 'recording' : le replay est lui aussi ré-enregistré.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `flowgraph_modules_aiRecordingModule.executionStarted()` | Appelé au démarrage du projet : active le module si parseArgs.args.enableAiRecordingForMissions est true ou si la mission a startingOptions.aiPath. (assignée dynamiquement) *(interne)* | dyn |
| `flowgraph_modules_aiRecordingModule.executionStopped()` | Appelé à l'arrêt du projet : appelle stopAiRecording() sans arguments. (assignée dynamiquement) *(interne)* | dyn |
| `flowgraph_modules_aiRecordingModule.getVehicleStates()` | Renvoie la table des états par id de véhicule (valeur 'recording' ou nil). (assignée dynamiquement) | dyn |
| `flowgraph_modules_aiRecordingModule.init()` | Appelé à la création du module (vide). (assignée dynamiquement) *(interne)* | dyn |
| `flowgraph_modules_aiRecordingModule.isRecordingScriptAi()` | Indique si le module est actif. (assignée dynamiquement) | dyn |
| `flowgraph_modules_aiRecordingModule.onVehicleSubmitRecordingForMission(vehId, aiPath)` | Hook appelé via extensions.hook depuis le véhicule quand l'enregistrement IA est terminé. Écrit le fichier missionTestData.json dans le dossier tests de la mission. (assignée dynamiquement) *(hook)* | dyn |
| `flowgraph_modules_aiRecordingModule.setenabled(newEnabled)` | Force l'activation ou la désactivation du module. (assignée dynamiquement) | dyn |
| `flowgraph_modules_aiRecordingModule.startAiRecording()` | Si actif, marque le véhicule joueur comme 'recording' et lui envoie ai.startRecording(). (assignée dynamiquement) | dyn |
| `flowgraph_modules_aiRecordingModule.startAiReplay()` | Si actif et que la mission a startingOptions.aiPath, lance ai.startFollowing avec ce tracé (mode 'noReset') sur le véhicule joueur. (assignée dynamiquement) | dyn |
| `flowgraph_modules_aiRecordingModule.stopAiRecording(attempt, totalChange)` | Mémorise attempt et totalChange puis, si le module est actif et que le véhicule joueur est en état 'recording', demande au véhicule d'arrêter l'enregistrement (ai.stopRecording()) et de renvoyer le résultat via le hook onVehicleSubmitRecordingForMission. (assignée dynamiquement) | dyn |
| `flowgraph_modules_aiRecordingModule.stopAiReplay()` | Si actif et que la mission a un aiPath, envoie 'ai:scriptStop(false, false)' au véhicule joueur. (assignée dynamiquement) | dyn |

### Détail des paramètres

#### `flowgraph_modules_aiRecordingModule.getVehicleStates()`

Renvoie la table des états par id de véhicule (valeur 'recording' ou nil). (assignée dynamiquement)

- **renvoie** : table<integer, string> états des véhicules

#### `flowgraph_modules_aiRecordingModule.isRecordingScriptAi()`

Indique si le module est actif. (assignée dynamiquement)

- **renvoie** : boolean valeur du flag enabled

#### `flowgraph_modules_aiRecordingModule.onVehicleSubmitRecordingForMission(vehId, aiPath)`

Hook appelé via extensions.hook depuis le véhicule quand l'enregistrement IA est terminé. Écrit le fichier missionTestData.json dans le dossier tests de la mission. (assignée dynamiquement)

- `vehId` (*integer*) : id du véhicule
- `aiPath` (*table*) : tracé IA (champ path = liste de points avec t)

#### `flowgraph_modules_aiRecordingModule.setenabled(newEnabled)`

Force l'activation ou la désactivation du module. (assignée dynamiquement)

- `newEnabled` (*boolean*) : nouvel état

#### `flowgraph_modules_aiRecordingModule.stopAiRecording(attempt, totalChange)`

Mémorise attempt et totalChange puis, si le module est actif et que le véhicule joueur est en état 'recording', demande au véhicule d'arrêter l'enregistrement (ai.stopRecording()) et de renvoyer le résultat via le hook onVehicleSubmitRecordingForMission. (assignée dynamiquement)

- `attempt` (*table|nil*) : tentative de mission (champs data, unlockedStars) (déduit du code)
- `totalChange` (*table|nil*) : changements totaux de progression (champ unlockedStarsAttempt) (déduit du code)

## Classe `C`

| Méthode | Description | Ligne |
|---|---|---|
| `C:executionStarted()` |  | 18 |
| `C:executionStopped()` |  | 14 |
| `C:getVehicleStates()` |  | 117 |
| `C:init()` |  | 11 |
| `C:isRecordingScriptAi()` |  | 113 |
| `C:onVehicleSubmitRecordingForMission(vehId, aiPath)` |  | 57 |
| `C:setenabled(newEnabled)` |  | 109 |
| `C:startAiRecording()` |  | 87 |
| `C:startAiReplay()` |  | 97 |
| `C:stopAiRecording(attempt, totalChange)` |  | 30 |
| `C:stopAiReplay()` |  | 45 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/modules/aiRecordingModule.lua`.*
