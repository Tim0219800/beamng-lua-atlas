---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/missions/progress.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Gère la progression (sauvegarde) des missions : tentatives (attempts), agrégats (meilleur résultat, nombre d'essais, classements), étoiles débloquées, déblocage du voyage rapide et des réglages, récompenses de carrière et succès Steam. Les données sont écrites dans settings/cloud/missionProgress/<emplacement>/<id de mission>.json. Il formate aussi ces données pour l'interface (écran de mission, grande carte). Un moddeur s'en sert pour enregistrer une tentative (newAttempt puis aggregateAttempt) ou lire la progression d'une mission.
--- Accès : extension `gameplay_missions_progress` : `extensions.load("gameplay_missions_progress")`, puis la globale `gameplay_missions_progress`
---@class gameplay_missions_progress
---@field formatAggregatesForMissionTypeWithProgKey nil Vaut nil : la locale du même nom n'existe pas dans le fichier.
---@field getProgressAggregateCache nil Vaut nil : la locale du même nom n'existe pas dans le fichier.
---@field getSaveSlotVersion nil Vaut nil : la locale du même nom n'existe pas dans le fichier.
---@field setSaveSlotVersion nil Vaut nil : la locale du même nom n'existe pas dans le fichier.
---@field startConditionMet nil Vaut nil : la locale du même nom n'existe pas dans le fichier.
---@field testHelper table Outils de test internes (ex. testHelper.randomAttemptType, utilisé par sanitizeMissionAfterCreation pour getRandomizedAttempt).
gameplay_missions_progress = {}

--- Prépare, pour l'interface de fin de mission en carrière, le détail des récompenses par attribut (total, icône, détail par étoile obtenue, durée et hauteur de son d'animation calculées par une courbe de type sigmoïde). Ne fait rien hors carrière.
---Source : lua/ge/extensions/gameplay/missions/progress.lua:619
---@param starRewards table Table starRewards construite par aggregateAttempt (originalRewardsPerStar, sums...).
---@param mission table Mission.
---@param attempt table Tentative (champ unlockedStars).
---@return table|nil  {list = {...}} ou nil hors carrière.
function gameplay_missions_progress.addCareerRewardInfo(starRewards, mission, attempt) end

--- Enregistre une tentative dans la progression d'une mission : assainit la tentative, l'ajoute à progress.attempts, met à jour l'agrégat (meilleur type, nombre d'essais, DNF, classement « recent »), émet onMissionAttemptAggregated(attempt, mission, progressKey), débloque les étoiles, succès (CHALLENGE_ONE_STAR, CHALLENGE_THREE_STARS et celui du type de mission), applique les agrégats automatiques et mission:aggregateAttempt, distribue les récompenses de carrière et calcule les déblocages (missions, ligues, voyage rapide, réglages).
---Source : lua/ge/extensions/gameplay/missions/progress.lua:380
---@param id string Id de la mission.
---@param attempt table Tentative (newAttempt) ; modifiée en place (type, unlockedStars, attemptNumber, dnfCount).
---@param progressKey string|nil Clé de progression ; par défaut mission.defaultProgressKey ou 'default'.
---@return table|nil  Hors mode batch : {formattedAttempt, aggregateChange, unlockChange, nextMissionsUnlock, unlockedMissions, unlockedStarsAttempt, unlockedStarsChanged, starRewards, formattedRewards, unlockedLeagues?, quickTravelUnlockedChange?, userSettingsUnlockedChange?}. En mode batch : {}. nil si la mission n'existe pas.
function gameplay_missions_progress.aggregateAttempt(id, attempt, progressKey) end

--- Désactive le mode batch.
---Source : lua/ge/extensions/gameplay/missions/progress.lua:1867
function gameplay_missions_progress.endBatchMode() end

--- Crée, si elle manque, la progression d'une clé (agrégat vierge bestType='none', attempts vide, classement « recent » vide).
---Source : lua/ge/extensions/gameplay/missions/progress.lua:1038
---@param missionInstance table Mission construite.
---@param progressKey string Clé de progression.
function gameplay_missions_progress.ensureProgressExistsForKey(missionInstance, progressKey) end

--- Fonction vide (non implémentée).
---Source : lua/ge/extensions/gameplay/missions/progress.lua:1874
function gameplay_missions_progress.exportAllProgressToCSV() end

--- Met en forme une tentative pour l'interface : liste {value, label, mainResult} d'après mission.autoUiAttemptProgress.
---Source : lua/ge/extensions/gameplay/missions/progress.lua:1318
---@param attempt table Tentative.
---@param mission table Mission.
---@return table  {list = {...}}.
function gameplay_missions_progress.formatAttemptSimple(attempt, mission) end

--- Met en forme la progression pour la grande carte (agrégats configurés dans mission.autoUiBigmap, étoiles débloquées).
---Source : lua/ge/extensions/gameplay/missions/progress.lua:1677
---@param id string Id de la mission.
---@return table|nil  Données formatées ; nil si la mission n'existe pas. Contient notamment unlockedStars (formatStars).
function gameplay_missions_progress.formatSaveDataForBigmap(id) end

--- Met en forme toute la progression d'une mission (par clé de progression) pour l'écran de mission, y compris les enregistrements de replay automatiques (core_replay.getMissionReplayFiles).
---Source : lua/ge/extensions/gameplay/missions/progress.lua:1641
---@param id string Id de la mission.
---@param onlyKey string|nil Limite à une clé de progression.
---@param includeMostRecentAttempt boolean|nil Inclure la tentative la plus récente.
---@param fillAttempts boolean|nil Inclure la liste complète des tentatives (déduit du code).
---@return table|nil  Données formatées ; nil si la mission n'existe pas.
function gameplay_missions_progress.formatSaveDataForUi(id, onlyKey, includeMostRecentAttempt, fillAttempts) end

--- Met en forme les étoiles de la mission pour l'interface (liste triée, nombre débloqué par défaut/bonus, total). Renvoie {disabled=true} si la mission n'a pas d'étoiles actives.
---Source : lua/ge/extensions/gameplay/missions/progress.lua:1578
---@param mission table Mission.
---@return table  Étoiles formatées.
function gameplay_missions_progress.formatStars(mission) end

--- Outil de test : crée une tentative aléatoire (mission:getRandomizedAttempt), y ajoute addAttemptData, l'agrège puis sauvegarde (via career_modules_missionWrapper en carrière, sinon saveMissionSaveData). Fait des dump() dans la console.
---Source : lua/ge/extensions/gameplay/missions/progress.lua:1802
---@param id string Id de la mission.
---@param addAttemptData table Champs ajoutés à la tentative (ne doit pas être nil).
---@return table|nil  Résultat d'aggregateAttempt.
function gameplay_missions_progress.generateAttempt(id, addAttemptData) end

--- Outil de test : agrège `amount` tentatives aléatoires pour chaque clé de progression de la mission.
---Source : lua/ge/extensions/gameplay/missions/progress.lua:1833
---@param id string Id de la mission.
---@param amount integer Nombre de tentatives par clé.
---@param dumpChange boolean|nil Afficher le changement agrégé.
function gameplay_missions_progress.generateAttempts(id, amount, dumpChange) end

--- Indique si le mode batch est actif.
---Source : lua/ge/extensions/gameplay/missions/progress.lua:1870
---@return boolean  true si actif.
function gameplay_missions_progress.getBatchMode() end

--- Renvoie la table classement -> clé de nouveau record : 'recent' -> 'newRecentLeaderboardEntryKey', plus celles des agrégats automatiques (leaderboardKey -> newLeaderboardEntryKey).
---Source : lua/ge/extensions/gameplay/missions/progress.lua:1090
---@param missionId string Id de la mission.
---@return table<string, string>  Correspondance (vide si la mission n'existe pas).
function gameplay_missions_progress.getLeaderboardChangeKeys(missionId) end

--- Renvoie le nom de l'emplacement de sauvegarde courant et son dossier.
---Source : lua/ge/extensions/gameplay/missions/progress.lua:292
---@return string  Nom de l'emplacement.
---@return string  Dossier de sauvegarde.
function gameplay_missions_progress.getSaveSlot() end

--- Compte les étoiles débloquées : renvoie le nombre d'étoiles par défaut et le nombre d'étoiles bonus débloquées.
---Source : lua/ge/extensions/gameplay/missions/progress.lua:1717
---@param id string Id de la mission.
---@return integer  Étoiles par défaut débloquées.
---@return integer  Étoiles bonus débloquées (0 si pas d'étoiles ; 0, 0, 0 si la mission est introuvable).
function gameplay_missions_progress.getUnlockedStarCountsForMissionById(id) end

--- Charge les données de progression d'une mission depuis le disque (convertit les anciens booléens d'étoiles en compteurs, prévient la carrière, met à jour si la version est ancienne, appelle mission:loadSaveData). Renvoie des données vierges si le fichier manque ou est illisible.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/missions/progress.lua:924
---@param mission table Mission construite.
---@return table  saveData de la mission.
---@return boolean|nil  true si les données ont été mises à jour vers une version plus récente.
function gameplay_missions_progress.loadMissionSaveData(mission) end

--- Indique si le voyage rapide vers la mission est débloqué. Renvoie toujours true pour une mission existante (la condition de sauvegarde est commentée).
---Source : lua/ge/extensions/gameplay/missions/progress.lua:1058
---@param missionId string Id de la mission.
---@return boolean  true (false si la mission n'existe pas).
function gameplay_missions_progress.missionHasQuickTravelUnlocked(missionId) end

--- Indique si les réglages utilisateur de la mission sont débloqués. Renvoie toujours true pour une mission existante.
---Source : lua/ge/extensions/gameplay/missions/progress.lua:1071
---@param missionId string Id de la mission.
---@return boolean  true (false si la mission n'existe pas).
function gameplay_missions_progress.missionHasUserSettingsUnlocked(missionId) end

--- Crée une table de tentative {type, date (os.time), humanDate (ISO 8601 UTC), data}.
---Source : lua/ge/extensions/gameplay/missions/progress.lua:227
---@param type string Type de résultat : completed, passed, attempted, abandoned, failed ou none (sera recalculé par aggregateAttempt).
---@param data table|nil Données propres au type de mission.
---@return table  Tentative.
function gameplay_missions_progress.newAttempt(type, data) end

--- Charge tous les types de conditions de gameplay/missions/progress/conditions/*.lua dans la table interne conditionTypes.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/missions/progress.lua:1765
function gameplay_missions_progress.onExtensionLoaded() end

--- En carrière, réduit les récompenses de chaque étoile active déjà obtenue (argent à 10 % de la valeur d'origine, bons à 0) puis recalcule les sommes de récompenses. Hors carrière, recalcule seulement les sommes.
---Source : lua/ge/extensions/gameplay/missions/progress.lua:999
---@param mission table Mission construite.
function gameplay_missions_progress.reduceCareerRewardsForDefaultStars(mission) end

--- Écrit mission.saveData dans <dossier>/<id>.json (JSON indenté) après y avoir fixé dirtyDate.
---Source : lua/ge/extensions/gameplay/missions/progress.lua:296
---@param id string Id de la mission.
---@param dirtyDate number|nil Date de modification pour la synchronisation carrière.
---@return boolean|nil  Résultat de jsonWriteFile ; nil si la mission n'existe pas.
function gameplay_missions_progress.saveMissionSaveData(id, dirtyDate) end

--- Pour chaque étoile, demande à mission:getDynamicStarReward(key, userSettings) une récompense dépendant des réglages et la substitue si elle existe, puis recalcule les sommes.
---Source : lua/ge/extensions/gameplay/missions/progress.lua:1025
---@param mission table Mission construite.
---@param userSettings table|nil Réglages ; par défaut mission.lastUserSettings.
function gameplay_missions_progress.setDynamicStarRewards(mission, userSettings) end

--- Définit directement le dossier de sauvegarde ; sans argument, revient à l'emplacement par défaut.
---Source : lua/ge/extensions/gameplay/missions/progress.lua:288
---@param path string|nil Dossier se terminant par « / ».
function gameplay_missions_progress.setSavePath(path) end

--- Change l'emplacement de sauvegarde : le chemin devient settings/cloud/missionProgress/<slotName>/.
---Source : lua/ge/extensions/gameplay/missions/progress.lua:282
---@param slotName string Nom de l'emplacement (« default » par défaut).
function gameplay_missions_progress.setSaveSlot(slotName) end

--- Active le mode batch : aggregateAttempt saute les calculs de déblocages et le journal permanent.
---Source : lua/ge/extensions/gameplay/missions/progress.lua:1864
function gameplay_missions_progress.startBatchMode() end

--- Construit une table de contexte de traduction à partir de `data` en ne gardant que les valeurs chaîne ou nombre (converties en chaîne). Renvoie {} si label est nil.
---Source : lua/ge/extensions/gameplay/missions/progress.lua:1566
---@param label any Libellé ; s'il est nil, le contexte est vide.
---@param data table Données source.
---@return table<string, string>  Contexte.
function gameplay_missions_progress.tryBuildContext(label, data) end

