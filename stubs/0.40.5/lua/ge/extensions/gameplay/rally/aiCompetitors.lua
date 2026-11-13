---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/aiCompetitors.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Simule des concurrents IA pour le classement (leaderboard) d'une spéciale ou d'une boucle de rallye. Les paramètres des concurrents (skill, consistency, risk, name) et les coefficients du modèle sont lus dans gameplay/rally/aiCompetitorsConfig.json au chargement du module. Pour chaque concurrent, un résultat (safe, push, minor_incident, major_incident, dnf) est tiré au hasard, puis un temps est échantillonné selon une loi normale ancrée sur un temps de référence (par défaut la médaille 'silverTime'). Le module formate aussi les temps et construit les lignes du tableau affiché à l'UI.
--- Accès : extension `gameplay_rally_aiCompetitors` : `extensions.load("gameplay_rally_aiCompetitors")`, puis la globale `gameplay_rally_aiCompetitors`
---@class gameplay_rally_aiCompetitors
---@field referenceStarKey string Clé du temps de médaille utilisée comme référence de rythme des concurrents simulés. Vaut 'silverTime' par défaut ; getReferenceTime la lit dans missionTypeData.
gameplay_rally_aiCompetitors = {}

--- Écrase le temps total de la ligne du joueur avec le total officiel du journal d'évènements du rallye (temps de toutes les spéciales + pénalités). En multi-spéciales met à jour finalTime/finalDnf, en spéciale seule time/dnf ; les écarts (deltas) ne sont pas recalculés.
---Source : lua/ge/extensions/gameplay/rally/aiCompetitors.lua:521
---@param leaderboard table Résultat de computeLeaderboard (doit avoir rows et playerRowIndex).
---@param totalSecs number Total officiel en secondes (> 0).
function gameplay_rally_aiCompetitors.applyOfficialPlayerTotalSeconds(leaderboard, totalSecs) end

--- Construit le classement joueur + concurrents IA. Avec deux nombres : une spéciale seule. Avec deux tableaux de même longueur (>= 1) : plusieurs spéciales (boucle). Renvoie {rows = {}} si les entrées sont invalides.
---Source : lua/ge/extensions/gameplay/rally/aiCompetitors.lua:548
---@param playerTimeOrTimes number|number[] Temps du joueur (ou liste de temps par spéciale).
---@param silverTimeOrTimes number|number[] Temps de référence (silver) de la spéciale, ou liste par spéciale ; doivent être > 0.
---@param playerName string|nil Nom affiché ; nil = 'Player' avec clé de traduction missions.aiCompetitorsLeaderboard.player.
---@param playerFinalSortSecs number|nil Total officiel (spéciales + pénalités) utilisé pour classer le joueur.
---@return table  {rows, playerRowIndex} ; en multi : aussi multiStage=true et stageCount, lignes avec stageCells/finalTime/finalDnf ; en simple : lignes avec time/delta/deltaVsLeader/deltaVsAhead/dnf.
function gameplay_rally_aiCompetitors.computeLeaderboard(playerTimeOrTimes, silverTimeOrTimes, playerName, playerFinalSortSecs) end

--- Calcule les poids normalisés des 5 résultats possibles (safe, push, minor_incident, major_incident, dnf) pour un niveau de compétence et de risque donnés. Utilise une consistance fixe de 0,5 (sans effet sur les poids).
---Source : lua/ge/extensions/gameplay/rally/aiCompetitors.lua:212
---@param paramTable table|nil Coefficients du modèle (safe_weight_base, push_weight_floor, etc.) ; nil = ceux du fichier de config.
---@param skill number Compétence du concurrent (0 à 1 attendu, déduit du code).
---@param risk number Propension au risque (0 à 1 attendu, déduit du code).
---@return number[]  5 poids dont la somme vaut 1, dans l'ordre safe, push, minor_incident, major_incident, dnf.
function gameplay_rally_aiCompetitors.computeMixtureWeights(paramTable, skill, risk) end

--- Renvoie le temps de référence (médaille désignée par referenceStarKey) d'une mission, ou nil s'il est absent ou non strictement positif.
---Source : lua/ge/extensions/gameplay/rally/aiCompetitors.lua:14
---@param missionTypeData table|nil Données de type de mission contenant par exemple silverTime.
---@return number|nil  Temps de référence en secondes.
function gameplay_rally_aiCompetitors.getReferenceTime(missionTypeData) end

--- Calcule la densité du mélange de gaussiennes des temps d'arrivée (aperçu pour l'éditeur). Utilise les mêmes poids et moyennes/écarts-types que l'échantillonnage ; le DNF n'a pas de densité.
---Source : lua/ge/extensions/gameplay/rally/aiCompetitors.lua:177
---@param paramTable table|nil Coefficients du modèle ; nil = config du fichier.
---@param referenceSec number Temps de référence en secondes.
---@param skill number Compétence.
---@param consistency number Régularité (1 = très régulier : écart-type réduit).
---@param risk number Propension au risque.
---@param timeLo number Borne basse de l'axe des temps.
---@param timeHi number Borne haute de l'axe des temps.
---@param sampleCount integer|nil Nombre de points (minimum 2, 500 par défaut).
---@param precomputedWeights number[]|nil Poids déjà calculés, pour éviter de les recalculer.
---@return table  {times, mixture, weights, components (5 tableaux de densités par résultat), sampleCount}.
function gameplay_rally_aiCompetitors.mixtureDensityTimes(paramTable, referenceSec, skill, consistency, risk, timeLo, timeHi, sampleCount, precomputedWeights) end

