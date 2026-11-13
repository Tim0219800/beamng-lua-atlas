---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/drift/statistics.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Enregistre les statistiques de drift dans gameplay_statistic (clés drift/...) et débloque les succès de drift. Écoute les hooks de fin de drift, de score, de spinout et de crash ; ne contient aucune logique de détection.
--- Accès : extension `gameplay_drift_statistics` : `extensions.load("gameplay_drift_statistics")`, puis la globale `gameplay_drift_statistics`
---@class gameplay_drift_statistics
gameplay_drift_statistics = {}

--- Hook : à la fin d'une chaîne de drifts, ajoute les drifts droite/gauche et met à jour les records de distance, durée et nombre de drifts chaînés. Ne fait rien sans data.chainDriftData.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drift/statistics.lua:15
---@param data table Contient chainDriftData {rightDrifts, leftDrifts, totalDriftDistance, totalDriftTime, chainedDrifts}.
function gameplay_drift_statistics.onDriftCompleted(data) end

--- Hook : ajoute le score gagné au total, met à jour le record de score et déclenche les succès DRIFT_SINGLE et DRIFT_TOTAL.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drift/statistics.lua:26
---@param data table Contient addedScore (number, points ajoutés par ce drift).
function gameplay_drift_statistics.onDriftCompletedScored(data) end

--- Hook : incrémente drift/crashes.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drift/statistics.lua:42
function gameplay_drift_statistics.onDriftCrash() end

--- Hook : incrémente drift/spinOuts.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drift/statistics.lua:38
function gameplay_drift_statistics.onDriftSpinout() end

