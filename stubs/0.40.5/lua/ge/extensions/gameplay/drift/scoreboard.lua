---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/drift/scoreboard.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accumule les statistiques d'un défi de drift pour l'écran de fin : score et nombre de drifts par palier (tier), messages rapides obtenus (quick messages) et statistiques de performance (vitesse, angle, facteur de performance moyens, distance, durée, combo max). Les stats se remettent à zéro au premier onUpdate et via reset(). Fournit aussi une petite fenêtre imgui de debug.
--- Accès : extension `gameplay_drift_scoreboard` : `extensions.load("gameplay_drift_scoreboard")`, puis la globale `gameplay_drift_scoreboard`
---@class gameplay_drift_scoreboard
gameplay_drift_scoreboard = {}

--- Renvoie {default=false, canBeChanged=true} pour la fenêtre de debug drift.
---Source : lua/ge/extensions/gameplay/drift/scoreboard.lua:119
---@return table  {default = false, canBeChanged = true}
function gameplay_drift_scoreboard.getDriftDebugInfo() end

--- Renvoie les stats par quick message.
---Source : lua/ge/extensions/gameplay/drift/scoreboard.lua:198
---@return table<string, {count:integer, totalScoreEarned:number, msg:string}>  Indexé par id de quick message.
function gameplay_drift_scoreboard.getDriftEventStats() end

--- Compile à la demande les statistiques de performance (moyennes calculées à l'appel, pas à chaque frame), formatées pour l'UI et traduites (missions.drift.stats.<nom>).
---Source : lua/ge/extensions/gameplay/drift/scoreboard.lua:148
---@return table<string, {order:integer, value:string|number, name:string}>  Clés : avrgDriftPerformanceFactor, avrgDriftSpeed, avrgDriftAngle, maxDriftAngle, maxDriftCombo, totalDriftDist, totalIndividualDrifts, totalDriftDuration.
function gameplay_drift_scoreboard.getPerformanceStats() end

--- Renvoie les stats par palier.
---Source : lua/ge/extensions/gameplay/drift/scoreboard.lua:194
---@return table<string, {totalScore:number, count:integer, name:string, order:integer}>  Indexé par id de palier.
function gameplay_drift_scoreboard.getTiersStats() end

--- Hook : à la fin d'un drift individuel, cumule vitesses, facteurs de performance, angles, durée et distance dans les stats brutes.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drift/scoreboard.lua:87
---@param data table {totalSpeeds, totalSteps, totalPerformanceFactors, totalAngles, totalDriftTime, driftDistance}.
function gameplay_drift_scoreboard.onDriftActiveDataFinished(data) end

--- Hook : valide les quick messages en attente, met à jour le combo max et ajoute le score (hors quick messages) et le compte au palier du drift.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drift/scoreboard.lua:68
---@param data table {combo, tier = {id}, addedScore}.
function gameplay_drift_scoreboard.onDriftCompletedScored(data) end

--- Hook : un crash annule les quick messages en attente.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drift/scoreboard.lua:206
function gameplay_drift_scoreboard.onDriftCrash() end

--- Hook : met en attente un quick message atteint (compteur et récompense) ; il n'est validé qu'à la fin du drift scoré.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drift/scoreboard.lua:53
---@param data table {quickMessageId, reward}.
function gameplay_drift_scoreboard.onDriftQuickMessageReached(data) end

--- Hook : un spinout annule les quick messages en attente.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drift/scoreboard.lua:210
function gameplay_drift_scoreboard.onDriftSpinout() end

--- Appelé à chaque frame : au premier appel fait reset(), puis affiche la fenêtre de debug imgui si activée.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drift/scoreboard.lua:44
function gameplay_drift_scoreboard.onUpdate() end

--- Remet à zéro les stats de performance, recrée les entrées de paliers (depuis gameplay_drift_scoring.getDriftTiers) et de quick messages (depuis gameplay_drift_quickMessages.getQuickMessages).
---Source : lua/ge/extensions/gameplay/drift/scoreboard.lua:104
function gameplay_drift_scoreboard.reset() end

