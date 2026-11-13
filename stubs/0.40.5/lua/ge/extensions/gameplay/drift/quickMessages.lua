---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/drift/quickMessages.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Détecte les « quick messages » de drift (petits bonus affichés pendant le drift : grand angle, drift inversé, long drift, frôlement, chaîne longue, drift de précision) et leur attribue une récompense qui s'ajoute au score en cache. Chaque message est décrit par des conditions primaires (toutes à remplir en même temps), éventuellement des conditions de confirmation (ex. pas de crash ensuite) et des conditions de remise à zéro. Émet onDriftQuickMessageDisplay pour l'interface et onDriftQuickMessageReached pour le scoreboard.
--- Accès : extension `gameplay_drift_quickMessages` : `extensions.load("gameplay_drift_quickMessages")`, puis la globale `gameplay_drift_quickMessages`
---@class gameplay_drift_quickMessages
---@field dependencies string[] gameplay_drift_general, gameplay_drift_drift, gameplay_drift_scoring.
gameplay_drift_quickMessages = {}

--- Renvoie {default=false, canBeChanged=true} pour la fenêtre de debug drift.
---Source : lua/ge/extensions/gameplay/drift/quickMessages.lua:422
---@return table  {default = false, canBeChanged = true}
function gameplay_drift_quickMessages.getDriftDebugInfo() end

--- Renvoie la quantité de garbage mesurée par le profileur à la dernière frame (0 hors debug).
---Source : lua/ge/extensions/gameplay/drift/quickMessages.lua:426
---@return number  Garbage de la section « Drift quick messages ».
function gameplay_drift_quickMessages.getGC() end

--- Retraduit puis renvoie la table des quick messages (utilisée par le scoreboard et l'écran de fin).
---Source : lua/ge/extensions/gameplay/drift/quickMessages.lua:416
---@return table<string, {msg:string, reward:number, primaryConditions:table}>  Quick messages indexés par id (precisionDrifting, bigAngle, reverseDrift, longDrift, closeCall, longDriftChain).
function gameplay_drift_quickMessages.getQuickMessages() end

--- Hook : un drift individuel vient de se terminer (déclenche les remises à zéro de type onDriftEnd).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drift/quickMessages.lua:402
function gameplay_drift_quickMessages.onDriftActiveDataFinished() end

--- Hook : une chaîne de drifts est terminée (déclenche les remises à zéro de type onChainEnd).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drift/quickMessages.lua:412
function gameplay_drift_quickMessages.onDriftCompleted() end

--- Hook : crash, appelle reset().
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drift/quickMessages.lua:434
function gameplay_drift_quickMessages.onDriftCrash() end

--- Hook : le véhicule de drift du joueur a été remis en place ; appelle reset().
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drift/quickMessages.lua:407
function gameplay_drift_quickMessages.onDriftPlVehReset() end

--- Hook : spinout, appelle reset().
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drift/quickMessages.lua:438
function gameplay_drift_quickMessages.onDriftSpinout() end

--- Appelé à chaque frame : lit l'état de drift du véhicule suivi, vérifie conditions primaires, confirmations et remises à zéro, gère le mode idle.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drift/quickMessages.lua:345
---@param dt number Delta temps (premier argument de onUpdate, dtReal).
function gameplay_drift_quickMessages.onUpdate(dt) end

--- Vide les messages en attente de confirmation et déjà déclenchés, remet le compteur de frôlements et le mode idle à zéro.
---Source : lua/ge/extensions/gameplay/drift/quickMessages.lua:393
function gameplay_drift_quickMessages.reset() end

