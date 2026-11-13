# `gameplay_missions_progress`

*Fichier : `lua/ge/extensions/gameplay/missions/progress.lua` · VM : Game Engine (GE) · 1879 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_missions_progress` : `extensions.load("gameplay_missions_progress")`, puis la globale `gameplay_missions_progress`

Gère la progression (sauvegarde) des missions : tentatives (attempts), agrégats (meilleur résultat, nombre d'essais, classements), étoiles débloquées, déblocage du voyage rapide et des réglages, récompenses de carrière et succès Steam. Les données sont écrites dans settings/cloud/missionProgress/<emplacement>/<id de mission>.json. Il formate aussi ces données pour l'interface (écran de mission, grande carte). Un moddeur s'en sert pour enregistrer une tentative (newAttempt puis aggregateAttempt) ou lire la progression d'une mission.

## Exemple

```lua
local attempt = gameplay_missions_progress.newAttempt('completed', {time = 42.3})
attempt.unlockedStars = {justFinish = true}
local change = gameplay_missions_progress.aggregateAttempt('gridmap_v2/timeTrial/x', attempt)
gameplay_missions_progress.saveMissionSaveData('gridmap_v2/timeTrial/x')
```

## Remarques

- Priorité des types de tentative (la plus petite est la meilleure) : completed=0, passed=10, attempted=20, abandoned=50, failed=100, none=1000.
- sanitizeAttempt (appelée par aggregateAttempt) recalcule le type de la tentative à partir des étoiles : 'passed' si au moins une étoile par défaut est obtenue, 'completed' si toutes les étoiles par défaut ET bonus actives sont obtenues, sinon 'none'. Le type passé à newAttempt est donc écrasé. Seules les étoiles actives, visibles et activées pour les réglages courants (mission.lastUserSettings) sont conservées.
- En carrière, les récompenses de chaque étoile sont ajoutées aux attributs du joueur ; l'argent (money) est multiplié par le multiplicateur de niveau de la branche (career_branches.getLevelRewardMultiplier). reduceCareerRewardsForDefaultStars réduit ensuite l'argent à 10 % pour une étoile déjà obtenue, et met les bons (vouchers) à 0.
- En mode batch (startBatchMode), aggregateAttempt n'émet ni calcul de déblocages ni journal permanent et renvoie {} : utile pour injecter beaucoup de tentatives de test. Hors mode batch (et hors version shipping), le résultat est écrit dans permaMissionProgressLog.json (qui grossit à chaque tentative).
- aggregateAttempt n'enregistre PAS sur disque : il faut ensuite appeler saveMissionSaveData (ou career_modules_missionWrapper.saveMission en carrière).
- missionHasQuickTravelUnlocked et missionHasUserSettingsUnlocked renvoient toujours true dans les cas qui comptent : le code utilisant saveData.quickTravelUnlocked / userSettingsUnlocked est commenté (le déblocage existe encore dans aggregateAttempt, mais n'est plus consulté).
- Plusieurs champs exportés valent nil : formatAggregatesForMissionTypeWithProgKey, getProgressAggregateCache, getSaveSlotVersion, setSaveSlotVersion et startConditionMet sont assignés à M.xxx à partir de locales jamais définies dans le fichier (reliquats d'ancien code).
- exportAllProgressToCSV est une fonction vide.
- Dans missionHasQuickTravelUnlocked et missionHasUserSettingsUnlocked, le message d'erreur utilise la variable `id` qui n'existe pas (le paramètre s'appelle missionId) : il affichera nil.
- La constante version vaut 20 (« augmenter la version purge toutes les sauvegardes de dev/test »).
- onExtensionLoaded charge tous les fichiers du dossier gameplay/missions/progress/conditions et enregistre leurs types de conditions.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_missions_progress.addCareerRewardInfo(starRewards, mission, attempt)` | Prépare, pour l'interface de fin de mission en carrière, le détail des récompenses par attribut (total, icône, détail par étoile obtenue, durée et hauteur de son d'animation calculées par une courbe de type sigmoïde). Ne fait rien hors carrière. | 619 |
| `gameplay_missions_progress.aggregateAttempt(id, attempt, progressKey)` | Enregistre une tentative dans la progression d'une mission : assainit la tentative, l'ajoute à progress.attempts, met à jour l'agrégat (meilleur type, nombre d'essais, DNF, classement « recent »), émet onMissionAttemptAggregated(attempt, mission, progressKey), débloque les étoiles, succès (CHALLENGE_ONE_STAR, CHALLENGE_THREE_STARS et celui du type de mission), applique les agrégats automatiques et mission:aggregateAttempt, distribue les récompenses de carrière et calcule les déblocages (missions, ligues, voyage rapide, réglages). | 380 |
| `gameplay_missions_progress.endBatchMode()` | Désactive le mode batch. | 1867 |
| `gameplay_missions_progress.ensureProgressExistsForKey(missionInstance, progressKey)` | Crée, si elle manque, la progression d'une clé (agrégat vierge bestType='none', attempts vide, classement « recent » vide). | 1038 |
| `gameplay_missions_progress.exportAllProgressToCSV()` | Fonction vide (non implémentée). | 1874 |
| `gameplay_missions_progress.formatAttemptSimple(attempt, mission)` | Met en forme une tentative pour l'interface : liste {value, label, mainResult} d'après mission.autoUiAttemptProgress. | 1318 |
| `gameplay_missions_progress.formatSaveDataForBigmap(id)` | Met en forme la progression pour la grande carte (agrégats configurés dans mission.autoUiBigmap, étoiles débloquées). | 1677 |
| `gameplay_missions_progress.formatSaveDataForUi(id, onlyKey, includeMostRecentAttempt, fillAttempts)` | Met en forme toute la progression d'une mission (par clé de progression) pour l'écran de mission, y compris les enregistrements de replay automatiques (core_replay.getMissionReplayFiles). | 1641 |
| `gameplay_missions_progress.formatStars(mission)` | Met en forme les étoiles de la mission pour l'interface (liste triée, nombre débloqué par défaut/bonus, total). Renvoie {disabled=true} si la mission n'a pas d'étoiles actives. | 1578 |
| `gameplay_missions_progress.generateAttempt(id, addAttemptData)` | Outil de test : crée une tentative aléatoire (mission:getRandomizedAttempt), y ajoute addAttemptData, l'agrège puis sauvegarde (via career_modules_missionWrapper en carrière, sinon saveMissionSaveData). Fait des dump() dans la console. | 1802 |
| `gameplay_missions_progress.generateAttempts(id, amount, dumpChange)` | Outil de test : agrège `amount` tentatives aléatoires pour chaque clé de progression de la mission. | 1833 |
| `gameplay_missions_progress.getBatchMode()` | Indique si le mode batch est actif. | 1870 |
| `gameplay_missions_progress.getLeaderboardChangeKeys(missionId)` | Renvoie la table classement -> clé de nouveau record : 'recent' -> 'newRecentLeaderboardEntryKey', plus celles des agrégats automatiques (leaderboardKey -> newLeaderboardEntryKey). | 1090 |
| `gameplay_missions_progress.getSaveSlot()` | Renvoie le nom de l'emplacement de sauvegarde courant et son dossier. | 292 |
| `gameplay_missions_progress.getUnlockedStarCountsForMissionById(id)` | Compte les étoiles débloquées : renvoie le nombre d'étoiles par défaut et le nombre d'étoiles bonus débloquées. | 1717 |
| `gameplay_missions_progress.loadMissionSaveData(mission)` | Charge les données de progression d'une mission depuis le disque (convertit les anciens booléens d'étoiles en compteurs, prévient la carrière, met à jour si la version est ancienne, appelle mission:loadSaveData). Renvoie des données vierges si le fichier manque ou est illisible. *(interne)* | 924 |
| `gameplay_missions_progress.missionHasQuickTravelUnlocked(missionId)` | Indique si le voyage rapide vers la mission est débloqué. Renvoie toujours true pour une mission existante (la condition de sauvegarde est commentée). | 1058 |
| `gameplay_missions_progress.missionHasUserSettingsUnlocked(missionId)` | Indique si les réglages utilisateur de la mission sont débloqués. Renvoie toujours true pour une mission existante. | 1071 |
| `gameplay_missions_progress.newAttempt(type, data)` | Crée une table de tentative {type, date (os.time), humanDate (ISO 8601 UTC), data}. | 227 |
| `gameplay_missions_progress.onExtensionLoaded()` | Charge tous les types de conditions de gameplay/missions/progress/conditions/*.lua dans la table interne conditionTypes. *(interne)* *(hook)* | 1765 |
| `gameplay_missions_progress.reduceCareerRewardsForDefaultStars(mission)` | En carrière, réduit les récompenses de chaque étoile active déjà obtenue (argent à 10 % de la valeur d'origine, bons à 0) puis recalcule les sommes de récompenses. Hors carrière, recalcule seulement les sommes. | 999 |
| `gameplay_missions_progress.saveMissionSaveData(id, dirtyDate)` | Écrit mission.saveData dans <dossier>/<id>.json (JSON indenté) après y avoir fixé dirtyDate. | 296 |
| `gameplay_missions_progress.setDynamicStarRewards(mission, userSettings)` | Pour chaque étoile, demande à mission:getDynamicStarReward(key, userSettings) une récompense dépendant des réglages et la substitue si elle existe, puis recalcule les sommes. | 1025 |
| `gameplay_missions_progress.setSavePath(path)` | Définit directement le dossier de sauvegarde ; sans argument, revient à l'emplacement par défaut. | 288 |
| `gameplay_missions_progress.setSaveSlot(slotName)` | Change l'emplacement de sauvegarde : le chemin devient settings/cloud/missionProgress/<slotName>/. | 282 |
| `gameplay_missions_progress.startBatchMode()` | Active le mode batch : aggregateAttempt saute les calculs de déblocages et le journal permanent. | 1864 |
| `gameplay_missions_progress.tryBuildContext(label, data)` | Construit une table de contexte de traduction à partir de `data` en ne gardant que les valeurs chaîne ou nombre (converties en chaîne). Renvoie {} si label est nil. | 1566 |

### Détail des paramètres

#### `gameplay_missions_progress.addCareerRewardInfo(starRewards, mission, attempt)`

Prépare, pour l'interface de fin de mission en carrière, le détail des récompenses par attribut (total, icône, détail par étoile obtenue, durée et hauteur de son d'animation calculées par une courbe de type sigmoïde). Ne fait rien hors carrière.

- `starRewards` (*table*) : Table starRewards construite par aggregateAttempt (originalRewardsPerStar, sums...).
- `mission` (*table*) : Mission.
- `attempt` (*table*) : Tentative (champ unlockedStars).
- **renvoie** : table|nil {list = {...}} ou nil hors carrière.

#### `gameplay_missions_progress.aggregateAttempt(id, attempt, progressKey)`

Enregistre une tentative dans la progression d'une mission : assainit la tentative, l'ajoute à progress.attempts, met à jour l'agrégat (meilleur type, nombre d'essais, DNF, classement « recent »), émet onMissionAttemptAggregated(attempt, mission, progressKey), débloque les étoiles, succès (CHALLENGE_ONE_STAR, CHALLENGE_THREE_STARS et celui du type de mission), applique les agrégats automatiques et mission:aggregateAttempt, distribue les récompenses de carrière et calcule les déblocages (missions, ligues, voyage rapide, réglages).

- `id` (*string*) : Id de la mission.
- `attempt` (*table*) : Tentative (newAttempt) ; modifiée en place (type, unlockedStars, attemptNumber, dnfCount).
- `progressKey` (*string|nil*) : Clé de progression ; par défaut mission.defaultProgressKey ou 'default'.
- **renvoie** : table|nil Hors mode batch : {formattedAttempt, aggregateChange, unlockChange, nextMissionsUnlock, unlockedMissions, unlockedStarsAttempt, unlockedStarsChanged, starRewards, formattedRewards, unlockedLeagues?, quickTravelUnlockedChange?, userSettingsUnlockedChange?}. En mode batch : {}. nil si la mission n'existe pas.

#### `gameplay_missions_progress.ensureProgressExistsForKey(missionInstance, progressKey)`

Crée, si elle manque, la progression d'une clé (agrégat vierge bestType='none', attempts vide, classement « recent » vide).

- `missionInstance` (*table*) : Mission construite.
- `progressKey` (*string*) : Clé de progression.

#### `gameplay_missions_progress.formatAttemptSimple(attempt, mission)`

Met en forme une tentative pour l'interface : liste {value, label, mainResult} d'après mission.autoUiAttemptProgress.

- `attempt` (*table*) : Tentative.
- `mission` (*table*) : Mission.
- **renvoie** : table {list = {...}}.

#### `gameplay_missions_progress.formatSaveDataForBigmap(id)`

Met en forme la progression pour la grande carte (agrégats configurés dans mission.autoUiBigmap, étoiles débloquées).

- `id` (*string*) : Id de la mission.
- **renvoie** : table|nil Données formatées ; nil si la mission n'existe pas. Contient notamment unlockedStars (formatStars).

#### `gameplay_missions_progress.formatSaveDataForUi(id, onlyKey, includeMostRecentAttempt, fillAttempts)`

Met en forme toute la progression d'une mission (par clé de progression) pour l'écran de mission, y compris les enregistrements de replay automatiques (core_replay.getMissionReplayFiles).

- `id` (*string*) : Id de la mission.
- `onlyKey` (*string|nil*) : Limite à une clé de progression.
- `includeMostRecentAttempt` (*boolean|nil*) : Inclure la tentative la plus récente.
- `fillAttempts` (*boolean|nil*) : Inclure la liste complète des tentatives (déduit du code).
- **renvoie** : table|nil Données formatées ; nil si la mission n'existe pas.

#### `gameplay_missions_progress.formatStars(mission)`

Met en forme les étoiles de la mission pour l'interface (liste triée, nombre débloqué par défaut/bonus, total). Renvoie {disabled=true} si la mission n'a pas d'étoiles actives.

- `mission` (*table*) : Mission.
- **renvoie** : table Étoiles formatées.

#### `gameplay_missions_progress.generateAttempt(id, addAttemptData)`

Outil de test : crée une tentative aléatoire (mission:getRandomizedAttempt), y ajoute addAttemptData, l'agrège puis sauvegarde (via career_modules_missionWrapper en carrière, sinon saveMissionSaveData). Fait des dump() dans la console.

- `id` (*string*) : Id de la mission.
- `addAttemptData` (*table*) : Champs ajoutés à la tentative (ne doit pas être nil).
- **renvoie** : table|nil Résultat d'aggregateAttempt.

#### `gameplay_missions_progress.generateAttempts(id, amount, dumpChange)`

Outil de test : agrège `amount` tentatives aléatoires pour chaque clé de progression de la mission.

- `id` (*string*) : Id de la mission.
- `amount` (*integer*) : Nombre de tentatives par clé.
- `dumpChange` (*boolean|nil*) : Afficher le changement agrégé.

#### `gameplay_missions_progress.getBatchMode()`

Indique si le mode batch est actif.

- **renvoie** : boolean true si actif.

#### `gameplay_missions_progress.getLeaderboardChangeKeys(missionId)`

Renvoie la table classement -> clé de nouveau record : 'recent' -> 'newRecentLeaderboardEntryKey', plus celles des agrégats automatiques (leaderboardKey -> newLeaderboardEntryKey).

- `missionId` (*string*) : Id de la mission.
- **renvoie** : table<string, string> Correspondance (vide si la mission n'existe pas).

#### `gameplay_missions_progress.getSaveSlot()`

Renvoie le nom de l'emplacement de sauvegarde courant et son dossier.

- **renvoie** : string Nom de l'emplacement.
- **renvoie** : string Dossier de sauvegarde.

#### `gameplay_missions_progress.getUnlockedStarCountsForMissionById(id)`

Compte les étoiles débloquées : renvoie le nombre d'étoiles par défaut et le nombre d'étoiles bonus débloquées.

- `id` (*string*) : Id de la mission.
- **renvoie** : integer Étoiles par défaut débloquées.
- **renvoie** : integer Étoiles bonus débloquées (0 si pas d'étoiles ; 0, 0, 0 si la mission est introuvable).

#### `gameplay_missions_progress.loadMissionSaveData(mission)`

Charge les données de progression d'une mission depuis le disque (convertit les anciens booléens d'étoiles en compteurs, prévient la carrière, met à jour si la version est ancienne, appelle mission:loadSaveData). Renvoie des données vierges si le fichier manque ou est illisible.

- `mission` (*table*) : Mission construite.
- **renvoie** : table saveData de la mission.
- **renvoie** : boolean|nil true si les données ont été mises à jour vers une version plus récente.

#### `gameplay_missions_progress.missionHasQuickTravelUnlocked(missionId)`

Indique si le voyage rapide vers la mission est débloqué. Renvoie toujours true pour une mission existante (la condition de sauvegarde est commentée).

- `missionId` (*string*) : Id de la mission.
- **renvoie** : boolean true (false si la mission n'existe pas).

#### `gameplay_missions_progress.missionHasUserSettingsUnlocked(missionId)`

Indique si les réglages utilisateur de la mission sont débloqués. Renvoie toujours true pour une mission existante.

- `missionId` (*string*) : Id de la mission.
- **renvoie** : boolean true (false si la mission n'existe pas).

#### `gameplay_missions_progress.newAttempt(type, data)`

Crée une table de tentative {type, date (os.time), humanDate (ISO 8601 UTC), data}.

- `type` (*string*) : Type de résultat : completed, passed, attempted, abandoned, failed ou none (sera recalculé par aggregateAttempt).
- `data` (*table|nil*) : Données propres au type de mission.
- **renvoie** : table Tentative.

#### `gameplay_missions_progress.reduceCareerRewardsForDefaultStars(mission)`

En carrière, réduit les récompenses de chaque étoile active déjà obtenue (argent à 10 % de la valeur d'origine, bons à 0) puis recalcule les sommes de récompenses. Hors carrière, recalcule seulement les sommes.

- `mission` (*table*) : Mission construite.

#### `gameplay_missions_progress.saveMissionSaveData(id, dirtyDate)`

Écrit mission.saveData dans <dossier>/<id>.json (JSON indenté) après y avoir fixé dirtyDate.

- `id` (*string*) : Id de la mission.
- `dirtyDate` (*number|nil*) : Date de modification pour la synchronisation carrière.
- **renvoie** : boolean|nil Résultat de jsonWriteFile ; nil si la mission n'existe pas.

#### `gameplay_missions_progress.setDynamicStarRewards(mission, userSettings)`

Pour chaque étoile, demande à mission:getDynamicStarReward(key, userSettings) une récompense dépendant des réglages et la substitue si elle existe, puis recalcule les sommes.

- `mission` (*table*) : Mission construite.
- `userSettings` (*table|nil*) : Réglages ; par défaut mission.lastUserSettings.

#### `gameplay_missions_progress.setSavePath(path)`

Définit directement le dossier de sauvegarde ; sans argument, revient à l'emplacement par défaut.

- `path` (*string|nil*) : Dossier se terminant par « / ».

#### `gameplay_missions_progress.setSaveSlot(slotName)`

Change l'emplacement de sauvegarde : le chemin devient settings/cloud/missionProgress/<slotName>/.

- `slotName` (*string*) : Nom de l'emplacement (« default » par défaut).

#### `gameplay_missions_progress.tryBuildContext(label, data)`

Construit une table de contexte de traduction à partir de `data` en ne gardant que les valeurs chaîne ou nombre (converties en chaîne). Renvoie {} si label est nil.

- `label` (*any*) : Libellé ; s'il est nil, le contexte est vide.
- `data` (*table*) : Données source.
- **renvoie** : table<string, string> Contexte.

## Champs

| Champ | Type | Description |
|---|---|---|
| `formatAggregatesForMissionTypeWithProgKey` | nil | Vaut nil : la locale du même nom n'existe pas dans le fichier. ⚠ référence `formatAggregatesForMissionTypeWithProgKey` non définie dans le fichier (vaut probablement nil) |
| `getProgressAggregateCache` | nil | Vaut nil : la locale du même nom n'existe pas dans le fichier. ⚠ référence `getProgressAggregateCache` non définie dans le fichier (vaut probablement nil) |
| `getSaveSlotVersion` | nil | Vaut nil : la locale du même nom n'existe pas dans le fichier. ⚠ référence `getSaveSlotVersion` non définie dans le fichier (vaut probablement nil) |
| `setSaveSlotVersion` | nil | Vaut nil : la locale du même nom n'existe pas dans le fichier. ⚠ référence `setSaveSlotVersion` non définie dans le fichier (vaut probablement nil) |
| `startConditionMet` | nil | Vaut nil : la locale du même nom n'existe pas dans le fichier. ⚠ référence `startConditionMet` non définie dans le fichier (vaut probablement nil) |
| `testHelper` | table | Outils de test internes (ex. testHelper.randomAttemptType, utilisé par sanitizeMissionAfterCreation pour getRandomizedAttempt). |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onMissionAttemptAggregated` — écouté par 2 module(s)
- `onMissionUnlocked`

## Appels vers le moteur (C++)

- `FS:` `copyFile`, `fileExists`, `findFiles`, `removeFile`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/missions/progress.lua`.*
