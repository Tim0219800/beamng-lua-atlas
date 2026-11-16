# `statistics_statistics`

*Fichier : `lua/ge/extensions/statistics/statistics.lua` · VM : Game Engine (GE) · 949 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `statistics_statistics` : `extensions.load("statistics_statistics")`, puis la globale `statistics_statistics`

Extension GE qui suit les statistiques d'un scénario (distance parcourue, altitude, vitesse max, dégâts, temps, objectifs) pour chaque véhicule, calcule les points obtenus et attribue la médaille finale (wood/bronze/silver/gold). Les paramètres viennent de scenario.statistics (maxValue, maxPoints, best/worst, target, source, required, alias, overall avec goldCutoff/silverCutoff/bronzeCutoff). Un moddeur s'en sert pour lire les résultats d'un scénario (getVehicleStat, getScenarioOverallStat) ou pour y ajouter ses propres statistiques (initialiseArbitraryStat, setStatProgress).

## Exemple

```lua
local stats = statistics_statistics.getVehicleStat(be:getPlayerVehicleID(0))
for _, s in ipairs(stats or {}) do print(s.label, s.value, s.points, s.maxPoints) end
```

## Remarques

- Les tables internes sont indexées par id de véhicule puis par clé 'stat_<nom>' ou 'goal_<nom>' ; chaque entrée contient des 'instances' (une par source/véhicule suivi).
- Unités : distance et altitude en mètres ; si le total est < 1609.34 m (1 mile) l'unité affichée est 'm', sinon l'unité utilisateur 'distance'. La vitesse (max) est la norme de map.objects[id].vel en m/s.
- Points d'une stat : (value / maxValue) * maxPoints, ou, pour le temps, interpolation linéaire entre best (points max) et worst (0). Les points sont bornés à ±maxPoints puis arrondis par math.floor.
- Médaille : wood si le scénario est échoué ; gold si score >= goldCutoff (défaut 90 %) ou maxPoints == 0 ; silver >= silverCutoff (70) ; bronze >= bronzeCutoff (0).
- Bug probable : dans initialiseTimeStat, quand scenario.statistics.time est un tableau, maxPoints/best/worst sont lus sur le tableau (timeProperties) et non sur l'entrée courante (entry), donc ils valent nil.
- Bug probable : getSummaryStats additionne data.points / data.maxPoints sans test de nil (erreur si le nom n'existe pas dans scenarioStats).
- DEBUG_generateScoreForMedal fait clamp(percent, 0, 100) alors que percent est déjà une fraction 0..1 ; le jeu logge des erreurs en build shipping car la fonction devrait être retirée.
- enableStatisticTracking appelle vehicle:getPosition() sans tester vehicle nil et écrit initialZPos/initialPos sur statEntry (et non sur l'instance) alors que onUpdate lit instance.initialPos/initialZPos.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `statistics_statistics.DEBUG_generateScoreForMedal(medalString)` | Fonction de debug : force le score du joueur à un pourcentage juste au-dessus du seuil de la médaille demandée et remplit le résumé du scénario courant. | 884 |
| `statistics_statistics.disableStatisticTracking(vehicleID, statisticName)` | Désactive le suivi d'une statistique pour un véhicule (enabled = false). Les valeurs déjà mesurées sont conservées. | 65 |
| `statistics_statistics.enableStatisticTracking(vehicleID, statisticName)` | Active le suivi d'une statistique pour un véhicule (enabled = true) et mémorise la position de départ pour 'altitude' (initialZPos) ou 'distance' (initialPos). Ne fait rien si la statistique n'existe pas pour ce véhicule. | 33 |
| `statistics_statistics.getMedalRanking(medalString)` | Convertit un nom de médaille en rang : wood 0, bronze 1, silver 2, gold 3 ; -1 si inconnu. | 590 |
| `statistics_statistics.getScenarioOverallStat(scenario)` | Renvoie le résumé global d'un scénario (label, points, maxPoints, failed, medal…), ou une table vide s'il n'y en a pas. | 105 |
| `statistics_statistics.getSummaryStats(statsOrder)` | Renvoie, dans l'ordre donné, les résumés de plusieurs scénarios (avec relativePoints en %) ainsi que le total des points obtenus et le total des points max. Utilisé pour un récapitulatif de campagne. | 191 |
| `statistics_statistics.getVehicleStat(vehicleID)` | Construit la liste des statistiques d'un véhicule pour l'interface de fin de scénario : une entrée par stat/objectif avec label, decimals, unit, predefinedUnit, required, failed, value, points, maxPoints et relativePoints (en %). Agrège les instances (somme des valeurs et des points). Pour une unité '%', la valeur est ramenée à value/maxValue*100. | 114 |
| `statistics_statistics.initialiseArbitraryStat(statName, statLabel, vehicle, vehicleName, maxPoints, maxValue)` | Ajoute une statistique personnalisée (value = 0, decimals = 2, enabled) à un véhicule ; la source est vehicleName. | 400 |
| `statistics_statistics.onDeserialized(data)` | Hook de rechargement : restaure statsTable (noms reconvertis en ids) et scenarioStats. *(interne)* *(hook)* | 862 |
| `statistics_statistics.onRaceGoalsInitilised(scenario)` | Hook : appelé quand les objectifs de course sont initialisés. Recrée les tables de stats (initialiseTables). Le nom contient la faute 'Initilised'. *(interne)* *(hook)* | 692 |
| `statistics_statistics.onRaceInit()` | Hook : appelé à l'initialisation de la course ; relève la position de départ (initialPos, initialZPos) des stats distance et altitude. *(interne)* *(hook)* | 797 |
| `statistics_statistics.onRaceResult(status)` | Hook : appelé à la fin de la course ; enregistre status.finalTime dans la stat 'time'. *(interne)* *(hook)* | 848 |
| `statistics_statistics.onRaceTick(raceTickTime, timer)` | Hook : appelé à chaque tick de course ; enregistre le chrono courant dans la stat 'time'. *(interne)* *(hook)* | 844 |
| `statistics_statistics.onResumeCampaign(campaignInProgress, data)` | Hook de reprise de campagne : restaure statsTable et scenarioStats depuis data. *(interne)* *(hook)* | 878 |
| `statistics_statistics.onSaveCampaign(saveCallback)` | Hook de sauvegarde de campagne : passe les mêmes données que onSerialize à saveCallback. *(interne)* *(hook)* | 871 |
| `statistics_statistics.onScenarioChange(scenario)` | Hook : appelé à chaque changement d'état du scénario. À l'état 'post', capture les dégâts finaux de chaque véhicule (map.objects[id].damage). *(interne)* *(hook)* | 714 |
| `statistics_statistics.onScenarioRestarted(scenario)` | Hook : appelé au redémarrage du scénario ; recrée les tables de stats. *(interne)* *(hook)* | 687 |
| `statistics_statistics.onSerialize()` | Hook de sauvegarde de l'extension : renvoie statsTable (clés id converties en noms de véhicule) et scenarioStats. *(interne)* *(hook)* | 852 |
| `statistics_statistics.onUpdate()` | Hook appelé à chaque frame. Tant que scenario.raceState == 'racing' (et état ≠ 'post'), met à jour distance (norme du déplacement depuis initialPos), altitude (écart absolu en Z) et vitesse maximale pour chaque véhicule suivi. *(interne)* *(hook)* | 732 |
| `statistics_statistics.reset()` | Vide scenarioStats (résumés par scénario). Ne touche pas à statsTable. | 15 |
| `statistics_statistics.setGoalProgress(vehicleID, goalName, instanceId, goalData)` | Crée ou met à jour la progression d'un objectif (clé 'goal_<nom>', required = true) pour un véhicule : enregistre points et maxPoints de l'instance et failed si goalData.status == 'failed'. Ne fait rien si le véhicule n'a pas encore de table de stats. | 210 |
| `statistics_statistics.setStatProgress(vehicleID, statName, instanceId, statData)` | Crée ou met à jour une statistique pour un véhicule. Les champs decimals, enabled, label, predefinedUnit, unit et isGoal sont stockés au niveau de la stat ; tous les autres champs de statData (value, maxValue, maxPoints, source…) sont copiés dans l'instance instanceId. Ignoré si instanceId ou statData manque ou n'est pas une table. | 238 |
| `statistics_statistics.stopStatsGathering(scenario)` | Fin de collecte : choisit l'unité de distance/altitude (m si < 1609.34 m, sinon unité 'distance'), calcule les points du véhicule joueur et remplit le résumé du scénario (points, maxPoints, failed, medal). | 648 |

### Détail des paramètres

#### `statistics_statistics.DEBUG_generateScoreForMedal(medalString)`

Fonction de debug : force le score du joueur à un pourcentage juste au-dessus du seuil de la médaille demandée et remplit le résumé du scénario courant.

- `medalString` (*string*) : 'bronze', 'silver' ou 'gold'.

#### `statistics_statistics.disableStatisticTracking(vehicleID, statisticName)`

Désactive le suivi d'une statistique pour un véhicule (enabled = false). Les valeurs déjà mesurées sont conservées.

- `vehicleID` (*integer*) : Id du véhicule.
- `statisticName` (*string*) : Nom de la stat sans préfixe.

#### `statistics_statistics.enableStatisticTracking(vehicleID, statisticName)`

Active le suivi d'une statistique pour un véhicule (enabled = true) et mémorise la position de départ pour 'altitude' (initialZPos) ou 'distance' (initialPos). Ne fait rien si la statistique n'existe pas pour ce véhicule.

- `vehicleID` (*integer*) : Id du véhicule.
- `statisticName` (*string*) : Nom de la stat sans préfixe : 'distance', 'altitude', 'speed', 'damage', 'time'…

#### `statistics_statistics.getMedalRanking(medalString)`

Convertit un nom de médaille en rang : wood 0, bronze 1, silver 2, gold 3 ; -1 si inconnu.

- `medalString` (*string*) : 'wood', 'bronze', 'silver' ou 'gold'.
- **renvoie** : integer Rang de 0 à 3, ou -1.

#### `statistics_statistics.getScenarioOverallStat(scenario)`

Renvoie le résumé global d'un scénario (label, points, maxPoints, failed, medal…), ou une table vide s'il n'y en a pas.

- `scenario` (*table*) : Table du scénario (seul scenario.name est utilisé).
- **renvoie** : table Entrée de scenarioStats[scenario.name] ou {}.

#### `statistics_statistics.getSummaryStats(statsOrder)`

Renvoie, dans l'ordre donné, les résumés de plusieurs scénarios (avec relativePoints en %) ainsi que le total des points obtenus et le total des points max. Utilisé pour un récapitulatif de campagne.

- `statsOrder` (*string[]*) : Noms de scénarios (clés de scenarioStats).
- **renvoie** : table[] Résumés par scénario.
- **renvoie** : number Somme des points du joueur.
- **renvoie** : number Somme des points max.

#### `statistics_statistics.getVehicleStat(vehicleID)`

Construit la liste des statistiques d'un véhicule pour l'interface de fin de scénario : une entrée par stat/objectif avec label, decimals, unit, predefinedUnit, required, failed, value, points, maxPoints et relativePoints (en %). Agrège les instances (somme des valeurs et des points). Pour une unité '%', la valeur est ramenée à value/maxValue*100.

- `vehicleID` (*integer*) : Id du véhicule.
- **renvoie** : table[]|nil Liste d'entrées, ou nil si le véhicule n'a pas de stats.

#### `statistics_statistics.initialiseArbitraryStat(statName, statLabel, vehicle, vehicleName, maxPoints, maxValue)`

Ajoute une statistique personnalisée (value = 0, decimals = 2, enabled) à un véhicule ; la source est vehicleName.

- `statName` (*string*) : Nom de la stat.
- `statLabel` (*string*) : Libellé (clé de traduction ou texte).
- `vehicle` (*userdata*) : Objet véhicule (getID() est appelé).
- `vehicleName` (*string*) : Nom du véhicule, utilisé comme source et id d'instance.
- `maxPoints` (*number|nil*) : Points maximum de la stat.
- `maxValue` (*number|nil*) : Valeur donnant les points max.

#### `statistics_statistics.onDeserialized(data)`

Hook de rechargement : restaure statsTable (noms reconvertis en ids) et scenarioStats.

- `data` (*table*) : Données produites par onSerialize.

#### `statistics_statistics.onRaceGoalsInitilised(scenario)`

Hook : appelé quand les objectifs de course sont initialisés. Recrée les tables de stats (initialiseTables). Le nom contient la faute 'Initilised'.

- `scenario` (*table*) : Scénario courant.

#### `statistics_statistics.onRaceResult(status)`

Hook : appelé à la fin de la course ; enregistre status.finalTime dans la stat 'time'.

- `status` (*table*) : Résultat de course (finalTime).

#### `statistics_statistics.onRaceTick(raceTickTime, timer)`

Hook : appelé à chaque tick de course ; enregistre le chrono courant dans la stat 'time'.

- `raceTickTime` (*number*) : Non utilisé.
- `timer` (*number*) : Temps de course en secondes.

#### `statistics_statistics.onResumeCampaign(campaignInProgress, data)`

Hook de reprise de campagne : restaure statsTable et scenarioStats depuis data.

- `campaignInProgress` (*any*) : Non utilisé.
- `data` (*table*) : Données sauvegardées par onSaveCampaign.

#### `statistics_statistics.onSaveCampaign(saveCallback)`

Hook de sauvegarde de campagne : passe les mêmes données que onSerialize à saveCallback.

- `saveCallback` (*function*) : Appelée avec (alias global du module, données).

#### `statistics_statistics.onScenarioChange(scenario)`

Hook : appelé à chaque changement d'état du scénario. À l'état 'post', capture les dégâts finaux de chaque véhicule (map.objects[id].damage).

- `scenario` (*table|nil*) : Scénario courant.

#### `statistics_statistics.onScenarioRestarted(scenario)`

Hook : appelé au redémarrage du scénario ; recrée les tables de stats.

- `scenario` (*table*) : Scénario courant.

#### `statistics_statistics.onSerialize()`

Hook de sauvegarde de l'extension : renvoie statsTable (clés id converties en noms de véhicule) et scenarioStats.

- **renvoie** : table {statsTable, scenarioStats}

#### `statistics_statistics.setGoalProgress(vehicleID, goalName, instanceId, goalData)`

Crée ou met à jour la progression d'un objectif (clé 'goal_<nom>', required = true) pour un véhicule : enregistre points et maxPoints de l'instance et failed si goalData.status == 'failed'. Ne fait rien si le véhicule n'a pas encore de table de stats.

- `vehicleID` (*integer*) : Id du véhicule.
- `goalName` (*string*) : Identifiant de l'objectif (nomove, timeLimit, speed…).
- `instanceId` (*any*) : Identifiant de l'instance (souvent l'id du véhicule cible de l'objectif).
- `goalData` (*table*) : Champs points, maxPoints, status ('init', 'failed'…).

#### `statistics_statistics.setStatProgress(vehicleID, statName, instanceId, statData)`

Crée ou met à jour une statistique pour un véhicule. Les champs decimals, enabled, label, predefinedUnit, unit et isGoal sont stockés au niveau de la stat ; tous les autres champs de statData (value, maxValue, maxPoints, source…) sont copiés dans l'instance instanceId. Ignoré si instanceId ou statData manque ou n'est pas une table.

- `vehicleID` (*integer*) : Id du véhicule.
- `statName` (*string*) : Nom de la stat (clé interne 'stat_<nom>').
- `instanceId` (*any*) : Identifiant de l'instance (souvent le nom de la source).
- `statData` (*table*) : Données de la stat.

#### `statistics_statistics.stopStatsGathering(scenario)`

Fin de collecte : choisit l'unité de distance/altitude (m si < 1609.34 m, sinon unité 'distance'), calcule les points du véhicule joueur et remplit le résumé du scénario (points, maxPoints, failed, medal).

- `scenario` (*table*) : Scénario terminé (scenario.name, scenario.result.failed).

## Appels vers le moteur (C++)

- `be:` `getPlayerVehicleID`
- `scenetree.` `findClassObjects`, `findObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/statistics/statistics.lua`.*
