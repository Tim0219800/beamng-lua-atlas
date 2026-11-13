---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/drift/stallingSystem.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Système anti-répétition du mode défi « Gymkhana » : il garde l'historique des figures (drifts normaux et zones de cascade) et calcule un multiplicateur (stallingValue, entre 0.5 et 1) qui réduit le score quand le joueur répète la même figure. Chargé par gameplay_drift_general quand le mode de défi est "Gymkhana". Contient aussi une fenêtre imgui de debug.
--- Accès : extension `gameplay_drift_stallingSystem` : `extensions.load("gameplay_drift_stallingSystem")`, puis la globale `gameplay_drift_stallingSystem`
---@class gameplay_drift_stallingSystem
---@field dependencies string[] gameplay_drift_general, chargé avant.
gameplay_drift_stallingSystem = {}

--- Applique le multiplicateur de stalling à un score.
---Source : lua/ge/extensions/gameplay/drift/stallingSystem.lua:118
---@param score number Score brut.
---@return number  score * stallingValue.
function gameplay_drift_stallingSystem.calculateScore(score) end

--- Renvoie {default=true, canBeChanged=true} pour la fenêtre de debug drift.
---Source : lua/ge/extensions/gameplay/drift/stallingSystem.lua:173
---@return table  {default = true, canBeChanged = true}
function gameplay_drift_stallingSystem.getDriftDebugInfo() end

--- Hook : quand le joueur commence à drifter, ajoute un drift (stuntId 0) à l'historique et recalcule le multiplicateur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drift/stallingSystem.lua:132
---@param isDrifting boolean true au début d'un drift.
function gameplay_drift_stallingSystem.onDriftStatusChanged(isDrifting) end

--- Appelé à chaque frame : affiche la fenêtre de debug « Drift stalling system » si activée.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drift/stallingSystem.lua:169
function gameplay_drift_stallingSystem.onUpdate() end

--- Ajoute une zone de cascade à l'historique (type "stuntZone") et recalcule le multiplicateur.
---Source : lua/ge/extensions/gameplay/drift/stallingSystem.lua:122
---@param stuntZoneId integer Identifiant de la zone ; une valeur différente de 0 la distingue des drifts normaux.
function gameplay_drift_stallingSystem.processStuntZone(stuntZoneId) end

--- Vide l'historique et remet le multiplicateur à 1.
---Source : lua/ge/extensions/gameplay/drift/stallingSystem.lua:40
function gameplay_drift_stallingSystem.reset() end

