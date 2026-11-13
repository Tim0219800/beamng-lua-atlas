# `gameplay_crashTest_crashTestScoring`

*Fichier : `lua/ge/extensions/gameplay/crashTest/crashTestScoring.lua` · VM : Game Engine (GE) · 165 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_crashTest_crashTestScoring` : `extensions.load("gameplay_crashTest_crashTestScoring")`, puis la globale `gameplay_crashTest_crashTestScoring`

Calcul des scores du scénario de crash test. Pour chaque étape réussie, calcule des sous-scores (temps avant impact, vitesse d'impact, dégâts, zone d'impact, redirection de la cible dans la zone) et les range par étape. Les barèmes sont dans scoreParameters (1000 points max par critère, temps mini 500, tolérance de vitesse 3 km/h). Utilise gameplay_util_damageAssessment pour la gravité des dégâts.

## Remarques

- Score de temps : max si temps <= objectif ; décroît linéairement jusqu'à 500 à +30 % de l'objectif ; 500 au-delà.
- Score de vitesse : les vitesses (km/h) sont converties en m/s puis par translateVelocity (unité du joueur), l'écart est mis à l'échelle de 1000 à 0 sur 3 km/h.
- Gravité des dégâts : Minor = 1, Moderate = 2, A lot = 3. Conditions : 'At least' ou 'No more than' ; écart de 0 -> 1000, 1 palier -> 500, 2 paliers -> 200, sinon 0.
- Bug probable : calculateIndividualDamageScore retourne nil si damageCondition n'est ni 'At least' ni 'No more than' (l'addition dans calculateDamageScore planterait).
- calculateDamageScore divise par #vehIds : division par zéro (nan) si damageTargets ne correspond à aucune valeur connue.
- getTotalScoreData ajoute la clé 'totalScore' directement dans le tableau scoringDataPerStep, qui mélange alors indices et clé ; un second appel ignore la clé (ipairs) mais la table renvoyée est partagée.
- calculateStepScore insère les données dans la liste mais ne retourne rien, malgré son commentaire (« appelé seulement si l'étape est réussie »).
- Les fonctions calculateTimeScore, calculateSpeedScore et calculateDamageScore sont locales (non exportées).

**Dépendances (chargées avant) :** `gameplay_util_damageAssessment`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_crashTest_crashTestScoring.calculateDamageLocationScore(damageLocationGoal, damageLocationData)` | Score de précision de la zone d'impact : part des dégâts totaux située dans la zone visée, ramenée à 1000. Retourne aussi la zone réellement la plus touchée et la précision en pourcentage. | 55 |
| `gameplay_crashTest_crashTestScoring.calculateIndividualDamageScore(damageGoal, damageCondition, vehId)` | Compare la gravité de dégâts d'un véhicule (getDamageAssessment(vehId).damageSeverity) à l'objectif et renvoie 1000, 500, 200 ou 0 selon l'écart de paliers. | 64 |
| `gameplay_crashTest_crashTestScoring.calculateStepScore(stepData, stepCrashData)` | Calcule tous les sous-scores d'une étape réussie et ajoute le résultat à la liste des scores par étape. Sauf pour l'objectif 'Crash target vehicle into target area', calcule scores de temps (si timeToImpact existe) et de vitesse ; ajoute selon les cas les scores de dégâts, de zone d'impact ou de zone cible (1000). | 117 |
| `gameplay_crashTest_crashTestScoring.getStepScoreData(stepIndex)` | Retourne les données de score d'une étape. | 148 |
| `gameplay_crashTest_crashTestScoring.getTotalScoreData()` | Additionne tous les scores de toutes les étapes et stocke le total dans la clé 'totalScore' de la table retournée. | 137 |
| `gameplay_crashTest_crashTestScoring.reset()` | Efface tous les scores enregistrés. | 152 |

### Détail des paramètres

#### `gameplay_crashTest_crashTestScoring.calculateDamageLocationScore(damageLocationGoal, damageLocationData)`

Score de précision de la zone d'impact : part des dégâts totaux située dans la zone visée, ramenée à 1000. Retourne aussi la zone réellement la plus touchée et la précision en pourcentage.

- `damageLocationGoal` (*string*) : Zone d'impact requise (clé de damagedLocations).
- `damageLocationData` (*table*) : Données d'impact : totalDamage, damageStateDiff (damagedLocations, mostDamagedLocation), mostDamagedLocation.
- **renvoie** : table {score, scoreName, maxScore, requiredImpactLocation, actualImpactLocation}.

#### `gameplay_crashTest_crashTestScoring.calculateIndividualDamageScore(damageGoal, damageCondition, vehId)`

Compare la gravité de dégâts d'un véhicule (getDamageAssessment(vehId).damageSeverity) à l'objectif et renvoie 1000, 500, 200 ou 0 selon l'écart de paliers.

- `damageGoal` (*string*) : 'Minor', 'Moderate' ou 'A lot'.
- `damageCondition` (*string*) : 'At least' ou 'No more than'.
- `vehId` (*integer*) : Identifiant du véhicule évalué.
- **renvoie** : integer|nil Score ; nil si la condition est inconnue.

#### `gameplay_crashTest_crashTestScoring.calculateStepScore(stepData, stepCrashData)`

Calcule tous les sous-scores d'une étape réussie et ajoute le résultat à la liste des scores par étape. Sauf pour l'objectif 'Crash target vehicle into target area', calcule scores de temps (si timeToImpact existe) et de vitesse ; ajoute selon les cas les scores de dégâts, de zone d'impact ou de zone cible (1000).

- `stepData` (*table*) : Définition de l'étape (objective, timeToImpact, impactSpeed, plVehId, jbeamTargets, damageAmount, impactLocation…).
- `stepCrashData` (*table<integer, table>*) : Données de crash par id de véhicule (stepElapsedTime, crashStartData, crashEndData).

#### `gameplay_crashTest_crashTestScoring.getStepScoreData(stepIndex)`

Retourne les données de score d'une étape.

- `stepIndex` (*integer*) : Indice de l'étape (à partir de 1).
- **renvoie** : table|nil Sous-scores de l'étape.

#### `gameplay_crashTest_crashTestScoring.getTotalScoreData()`

Additionne tous les scores de toutes les étapes et stocke le total dans la clé 'totalScore' de la table retournée.

- **renvoie** : table Liste des scores par étape, avec la clé totalScore.

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table<integer, string> | Extensions chargées avant : {"gameplay_util_damageAssessment"}. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/crashTest/crashTestScoring.lua`.*
