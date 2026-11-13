---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/crashTest/crashTestScoring.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Calcul des scores du scénario de crash test. Pour chaque étape réussie, calcule des sous-scores (temps avant impact, vitesse d'impact, dégâts, zone d'impact, redirection de la cible dans la zone) et les range par étape. Les barèmes sont dans scoreParameters (1000 points max par critère, temps mini 500, tolérance de vitesse 3 km/h). Utilise gameplay_util_damageAssessment pour la gravité des dégâts.
--- Accès : extension `gameplay_crashTest_crashTestScoring` : `extensions.load("gameplay_crashTest_crashTestScoring")`, puis la globale `gameplay_crashTest_crashTestScoring`
---@class gameplay_crashTest_crashTestScoring
---@field dependencies table<integer, string> Extensions chargées avant : {"gameplay_util_damageAssessment"}.
gameplay_crashTest_crashTestScoring = {}

--- Score de précision de la zone d'impact : part des dégâts totaux située dans la zone visée, ramenée à 1000. Retourne aussi la zone réellement la plus touchée et la précision en pourcentage.
---Source : lua/ge/extensions/gameplay/crashTest/crashTestScoring.lua:55
---@param damageLocationGoal string Zone d'impact requise (clé de damagedLocations).
---@param damageLocationData table Données d'impact : totalDamage, damageStateDiff (damagedLocations, mostDamagedLocation), mostDamagedLocation.
---@return table  {score, scoreName, maxScore, requiredImpactLocation, actualImpactLocation}.
function gameplay_crashTest_crashTestScoring.calculateDamageLocationScore(damageLocationGoal, damageLocationData) end

--- Compare la gravité de dégâts d'un véhicule (getDamageAssessment(vehId).damageSeverity) à l'objectif et renvoie 1000, 500, 200 ou 0 selon l'écart de paliers.
---Source : lua/ge/extensions/gameplay/crashTest/crashTestScoring.lua:64
---@param damageGoal string 'Minor', 'Moderate' ou 'A lot'.
---@param damageCondition string 'At least' ou 'No more than'.
---@param vehId integer Identifiant du véhicule évalué.
---@return integer|nil  Score ; nil si la condition est inconnue.
function gameplay_crashTest_crashTestScoring.calculateIndividualDamageScore(damageGoal, damageCondition, vehId) end

--- Calcule tous les sous-scores d'une étape réussie et ajoute le résultat à la liste des scores par étape. Sauf pour l'objectif 'Crash target vehicle into target area', calcule scores de temps (si timeToImpact existe) et de vitesse ; ajoute selon les cas les scores de dégâts, de zone d'impact ou de zone cible (1000).
---Source : lua/ge/extensions/gameplay/crashTest/crashTestScoring.lua:117
---@param stepData table Définition de l'étape (objective, timeToImpact, impactSpeed, plVehId, jbeamTargets, damageAmount, impactLocation…).
---@param stepCrashData table<integer, table> Données de crash par id de véhicule (stepElapsedTime, crashStartData, crashEndData).
function gameplay_crashTest_crashTestScoring.calculateStepScore(stepData, stepCrashData) end

--- Retourne les données de score d'une étape.
---Source : lua/ge/extensions/gameplay/crashTest/crashTestScoring.lua:148
---@param stepIndex integer Indice de l'étape (à partir de 1).
---@return table|nil  Sous-scores de l'étape.
function gameplay_crashTest_crashTestScoring.getStepScoreData(stepIndex) end

--- Additionne tous les scores de toutes les étapes et stocke le total dans la clé 'totalScore' de la table retournée.
---Source : lua/ge/extensions/gameplay/crashTest/crashTestScoring.lua:137
---@return table  Liste des scores par étape, avec la clé totalScore.
function gameplay_crashTest_crashTestScoring.getTotalScoreData() end

--- Efface tous les scores enregistrés.
---Source : lua/ge/extensions/gameplay/crashTest/crashTestScoring.lua:152
function gameplay_crashTest_crashTestScoring.reset() end

