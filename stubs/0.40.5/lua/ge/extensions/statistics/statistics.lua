---@meta
-- tim19Atlas stub generated from lua/ge/extensions/statistics/statistics.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Extension GE qui suit les statistiques d'un scénario (distance parcourue, altitude, vitesse max, dégâts, temps, objectifs) pour chaque véhicule, calcule les points obtenus et attribue la médaille finale (wood/bronze/silver/gold). Les paramètres viennent de scenario.statistics (maxValue, maxPoints, best/worst, target, source, required, alias, overall avec goldCutoff/silverCutoff/bronzeCutoff). Un moddeur s'en sert pour lire les résultats d'un scénario (getVehicleStat, getScenarioOverallStat) ou pour y ajouter ses propres statistiques (initialiseArbitraryStat, setStatProgress).
--- Accès : extension `statistics_statistics` : `extensions.load("statistics_statistics")`, puis la globale `statistics_statistics`
---@class statistics_statistics
statistics_statistics = {}

--- Fonction de debug : force le score du joueur à un pourcentage juste au-dessus du seuil de la médaille demandée et remplit le résumé du scénario courant.
---Source : lua/ge/extensions/statistics/statistics.lua:884
---@param medalString string 'bronze', 'silver' ou 'gold'.
function statistics_statistics.DEBUG_generateScoreForMedal(medalString) end

--- Désactive le suivi d'une statistique pour un véhicule (enabled = false). Les valeurs déjà mesurées sont conservées.
---Source : lua/ge/extensions/statistics/statistics.lua:65
---@param vehicleID integer Id du véhicule.
---@param statisticName string Nom de la stat sans préfixe.
function statistics_statistics.disableStatisticTracking(vehicleID, statisticName) end

--- Active le suivi d'une statistique pour un véhicule (enabled = true) et mémorise la position de départ pour 'altitude' (initialZPos) ou 'distance' (initialPos). Ne fait rien si la statistique n'existe pas pour ce véhicule.
---Source : lua/ge/extensions/statistics/statistics.lua:33
---@param vehicleID integer Id du véhicule.
---@param statisticName string Nom de la stat sans préfixe : 'distance', 'altitude', 'speed', 'damage', 'time'…
function statistics_statistics.enableStatisticTracking(vehicleID, statisticName) end

--- Convertit un nom de médaille en rang : wood 0, bronze 1, silver 2, gold 3 ; -1 si inconnu.
---Source : lua/ge/extensions/statistics/statistics.lua:590
---@param medalString string 'wood', 'bronze', 'silver' ou 'gold'.
---@return integer  Rang de 0 à 3, ou -1.
function statistics_statistics.getMedalRanking(medalString) end

--- Renvoie le résumé global d'un scénario (label, points, maxPoints, failed, medal…), ou une table vide s'il n'y en a pas.
---Source : lua/ge/extensions/statistics/statistics.lua:105
---@param scenario table Table du scénario (seul scenario.name est utilisé).
---@return table  Entrée de scenarioStats[scenario.name] ou {}.
function statistics_statistics.getScenarioOverallStat(scenario) end

--- Renvoie, dans l'ordre donné, les résumés de plusieurs scénarios (avec relativePoints en %) ainsi que le total des points obtenus et le total des points max. Utilisé pour un récapitulatif de campagne.
---Source : lua/ge/extensions/statistics/statistics.lua:191
---@param statsOrder string[] Noms de scénarios (clés de scenarioStats).
---@return table[]  Résumés par scénario.
---@return number  Somme des points du joueur.
---@return number  Somme des points max.
function statistics_statistics.getSummaryStats(statsOrder) end

--- Construit la liste des statistiques d'un véhicule pour l'interface de fin de scénario : une entrée par stat/objectif avec label, decimals, unit, predefinedUnit, required, failed, value, points, maxPoints et relativePoints (en %). Agrège les instances (somme des valeurs et des points). Pour une unité '%', la valeur est ramenée à value/maxValue*100.
---Source : lua/ge/extensions/statistics/statistics.lua:114
---@param vehicleID integer Id du véhicule.
---@return table[]|nil  Liste d'entrées, ou nil si le véhicule n'a pas de stats.
function statistics_statistics.getVehicleStat(vehicleID) end

--- Ajoute une statistique personnalisée (value = 0, decimals = 2, enabled) à un véhicule ; la source est vehicleName.
---Source : lua/ge/extensions/statistics/statistics.lua:400
---@param statName string Nom de la stat.
---@param statLabel string Libellé (clé de traduction ou texte).
---@param vehicle userdata Objet véhicule (getID() est appelé).
---@param vehicleName string Nom du véhicule, utilisé comme source et id d'instance.
---@param maxPoints number|nil Points maximum de la stat.
---@param maxValue number|nil Valeur donnant les points max.
function statistics_statistics.initialiseArbitraryStat(statName, statLabel, vehicle, vehicleName, maxPoints, maxValue) end

--- Hook de rechargement : restaure statsTable (noms reconvertis en ids) et scenarioStats.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/statistics/statistics.lua:862
---@param data table Données produites par onSerialize.
function statistics_statistics.onDeserialized(data) end

--- Hook : appelé quand les objectifs de course sont initialisés. Recrée les tables de stats (initialiseTables). Le nom contient la faute 'Initilised'.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/statistics/statistics.lua:692
---@param scenario table Scénario courant.
function statistics_statistics.onRaceGoalsInitilised(scenario) end

--- Hook : appelé à l'initialisation de la course ; relève la position de départ (initialPos, initialZPos) des stats distance et altitude.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/statistics/statistics.lua:797
function statistics_statistics.onRaceInit() end

--- Hook : appelé à la fin de la course ; enregistre status.finalTime dans la stat 'time'.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/statistics/statistics.lua:848
---@param status table Résultat de course (finalTime).
function statistics_statistics.onRaceResult(status) end

--- Hook : appelé à chaque tick de course ; enregistre le chrono courant dans la stat 'time'.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/statistics/statistics.lua:844
---@param raceTickTime number Non utilisé.
---@param timer number Temps de course en secondes.
function statistics_statistics.onRaceTick(raceTickTime, timer) end

--- Hook de reprise de campagne : restaure statsTable et scenarioStats depuis data.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/statistics/statistics.lua:878
---@param campaignInProgress any Non utilisé.
---@param data table Données sauvegardées par onSaveCampaign.
function statistics_statistics.onResumeCampaign(campaignInProgress, data) end

--- Hook de sauvegarde de campagne : passe les mêmes données que onSerialize à saveCallback.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/statistics/statistics.lua:871
---@param saveCallback function Appelée avec (alias global du module, données).
function statistics_statistics.onSaveCampaign(saveCallback) end

--- Hook : appelé à chaque changement d'état du scénario. À l'état 'post', capture les dégâts finaux de chaque véhicule (map.objects[id].damage).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/statistics/statistics.lua:714
---@param scenario table|nil Scénario courant.
function statistics_statistics.onScenarioChange(scenario) end

--- Hook : appelé au redémarrage du scénario ; recrée les tables de stats.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/statistics/statistics.lua:687
---@param scenario table Scénario courant.
function statistics_statistics.onScenarioRestarted(scenario) end

--- Hook de sauvegarde de l'extension : renvoie statsTable (clés id converties en noms de véhicule) et scenarioStats.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/statistics/statistics.lua:852
---@return table  {statsTable, scenarioStats}
function statistics_statistics.onSerialize() end

--- Hook appelé à chaque frame. Tant que scenario.raceState == 'racing' (et état ≠ 'post'), met à jour distance (norme du déplacement depuis initialPos), altitude (écart absolu en Z) et vitesse maximale pour chaque véhicule suivi.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/statistics/statistics.lua:732
function statistics_statistics.onUpdate() end

--- Vide scenarioStats (résumés par scénario). Ne touche pas à statsTable.
---Source : lua/ge/extensions/statistics/statistics.lua:15
function statistics_statistics.reset() end

--- Crée ou met à jour la progression d'un objectif (clé 'goal_<nom>', required = true) pour un véhicule : enregistre points et maxPoints de l'instance et failed si goalData.status == 'failed'. Ne fait rien si le véhicule n'a pas encore de table de stats.
---Source : lua/ge/extensions/statistics/statistics.lua:210
---@param vehicleID integer Id du véhicule.
---@param goalName string Identifiant de l'objectif (nomove, timeLimit, speed…).
---@param instanceId any Identifiant de l'instance (souvent l'id du véhicule cible de l'objectif).
---@param goalData table Champs points, maxPoints, status ('init', 'failed'…).
function statistics_statistics.setGoalProgress(vehicleID, goalName, instanceId, goalData) end

--- Crée ou met à jour une statistique pour un véhicule. Les champs decimals, enabled, label, predefinedUnit, unit et isGoal sont stockés au niveau de la stat ; tous les autres champs de statData (value, maxValue, maxPoints, source…) sont copiés dans l'instance instanceId. Ignoré si instanceId ou statData manque ou n'est pas une table.
---Source : lua/ge/extensions/statistics/statistics.lua:238
---@param vehicleID integer Id du véhicule.
---@param statName string Nom de la stat (clé interne 'stat_<nom>').
---@param instanceId any Identifiant de l'instance (souvent le nom de la source).
---@param statData table Données de la stat.
function statistics_statistics.setStatProgress(vehicleID, statName, instanceId, statData) end

--- Fin de collecte : choisit l'unité de distance/altitude (m si < 1609.34 m, sinon unité 'distance'), calcule les points du véhicule joueur et remplit le résumé du scénario (points, maxPoints, failed, medal).
---Source : lua/ge/extensions/statistics/statistics.lua:648
---@param scenario table Scénario terminé (scenario.name, scenario.result.failed).
function statistics_statistics.stopStatsGathering(scenario) end

