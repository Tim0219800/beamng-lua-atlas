---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/tutorial/damageTracker.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Suit les dégâts du véhicule pendant le tutoriel de carrière (et le time trial). Il s'appuie sur gameplay_util_crashDetection pour détecter la fin d'un crash, attend que le véhicule ralentisse (ou un délai maximum), puis affiche une fenêtre d'information (career_modules_tutorialPopups) et une tâche « réparer » ou « redémarrer » dans la liste de tâches. La tâche disparaît quand le véhicule est réparé ou réinitialisé.
--- Accès : extension `gameplay_tutorial_damageTracker` : `extensions.load("gameplay_tutorial_damageTracker")`, puis la globale `gameplay_tutorial_damageTracker`
---@class gameplay_tutorial_damageTracker
---@field dependencies string[] Extensions chargées avant celle-ci : { 'gameplay_util_crashDetection' }.
gameplay_tutorial_damageTracker = {}

--- Marque un crash comme déjà pris en charge par l'appelant : la prochaine fenêtre de dégâts sera sautée, mais la tâche de réparation restera due.
---Source : lua/ge/extensions/gameplay/tutorial/damageTracker.lua:162
function gameplay_tutorial_damageTracker.claimNextDamagePopup() end

--- Désactive le suivi et remet à zéro tout l'état du module (véhicule configuré, tâche, handler, drapeaux de fenêtres déjà affichées).
---Source : lua/ge/extensions/gameplay/tutorial/damageTracker.lua:202
function gameplay_tutorial_damageTracker.cleanup() end

--- Simule un crash (debug) : marque hadCrash et déclenche l'attente de la fenêtre de dégâts.
---Source : lua/ge/extensions/gameplay/tutorial/damageTracker.lua:195
function gameplay_tutorial_damageTracker.debugTriggerCrash() end

--- Indique si un crash a été détecté depuis la dernière remise à zéro.
---Source : lua/ge/extensions/gameplay/tutorial/damageTracker.lua:388
---@return boolean  true si un crash a eu lieu.
function gameplay_tutorial_damageTracker.getHadCrash() end

--- Hook appelé au retour dans les limites : hors time trial, si le véhicule suivi a des dégâts, réaffiche la tâche de réparation.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/tutorial/damageTracker.lua:315
function gameplay_tutorial_damageTracker.onCareerTutorialOutOfBoundsEnded() end

--- Hook appelé quand le joueur sort des limites : ignore les dégâts pendant 8 s, annule crash en attente et tâche de réparation.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/tutorial/damageTracker.lua:307
function gameplay_tutorial_damageTracker.onCareerTutorialOutOfBoundsStarted() end

--- Hook de début de mission : assure que le véhicule suivi est à jour si le suivi est actif.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/tutorial/damageTracker.lua:347
---@param levelPath string Chemin du niveau (non utilisé).
function gameplay_tutorial_damageTracker.onClientStartMission(levelPath) end

--- Hook de la fenêtre de récupération : si le bouton 'restartMission' est pressé en time trial après un crash, marque comme réparé et retire les tâches.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/tutorial/damageTracker.lua:368
---@param buttonId string Identifiant du bouton pressé.
function gameplay_tutorial_damageTracker.onRecoveryPromptButtonPressed(buttonId) end

--- Hook appelé quand le joueur choisit de réparer sur place : marque le véhicule comme réparé et retire les tâches.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/tutorial/damageTracker.lua:353
---@param invVehId integer Id du véhicule d'inventaire (non utilisé).
function gameplay_tutorial_damageTracker.onRecoveryPromptRepairHereUsed(invVehId) end

--- Hook de mise à jour : s'assure que le bon véhicule est suivi, puis, si une fenêtre de dégâts est en attente, l'affiche quand le véhicule est quasi arrêté ou après le délai maximum.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/tutorial/damageTracker.lua:278
---@param dtReal number Delta temps réel.
---@param dtSim number Delta temps de simulation.
---@param dtRaw number Delta temps brut (utilisé pour le délai d'attente).
function gameplay_tutorial_damageTracker.onUpdate(dtReal, dtSim, dtRaw) end

--- Hook de crashDetection appelé à la fin d'un crash. Si le véhicule suivi est concerné (et que les dégâts ne sont pas supprimés), programme l'affichage de la fenêtre de dégâts.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/tutorial/damageTracker.lua:294
---@param crashData table Données du crash ; crashData.vehId = véhicule concerné.
function gameplay_tutorial_damageTracker.onVehicleCrashEnded(crashData) end

--- Hook appelé après réparation d'un véhicule : si un crash avait eu lieu, retire les tâches de réparation.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/tutorial/damageTracker.lua:360
---@param invVehId integer Id du véhicule d'inventaire (non utilisé).
function gameplay_tutorial_damageTracker.onVehicleRepaired(invVehId) end

--- Hook appelé quand un véhicule est réinitialisé : si c'est le véhicule suivi et que le suivi est actif, marque comme réparé et retire les tâches. (Définition effective : la seconde du fichier, qui écrase la première.)
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/tutorial/damageTracker.lua:379
---@param vehicleId integer Id du véhicule réinitialisé.
function gameplay_tutorial_damageTracker.onVehicleResetted(vehicleId) end

--- Remplace l'ouverture de la fenêtre de dégâts de carrière par un handler personnalisé, appelé avec l'id de la fenêtre. Une valeur non fonctionnelle retire le handler.
---Source : lua/ge/extensions/gameplay/tutorial/damageTracker.lua:86
---@param handler function|nil function(popupId) appelée à la place de career_modules_tutorialPopups.introPopup.
function gameplay_tutorial_damageTracker.setDamagePopupHandler(handler) end

--- Restaure la tâche de réparation par défaut (id 'tutorial_repairVehicleGoal', action toggleRadialMenuMulti).
---Source : lua/ge/extensions/gameplay/tutorial/damageTracker.lua:85
function gameplay_tutorial_damageTracker.setDefaultRepairGoal() end

--- Active ou désactive le suivi des dégâts. À la désactivation : arrête le suivi du véhicule et retire toutes les tâches ; à l'activation : suit le véhicule et affiche la tâche si nécessaire.
---Source : lua/ge/extensions/gameplay/tutorial/damageTracker.lua:181
---@param value boolean true pour activer.
function gameplay_tutorial_damageTracker.setEnabled(value) end

--- Définit la tâche « réparer » affichée après un crash (table de tâche pour la liste de tâches). nil restaure la tâche par défaut.
---Source : lua/ge/extensions/gameplay/tutorial/damageTracker.lua:84
---@param goal table|nil Table de tâche ({id, type, label, subtext, actionItems, done}).
function gameplay_tutorial_damageTracker.setRepairGoal(goal) end

--- Fixe l'id du véhicule à suivre (pris en compte au prochain ensureTrackedVehicle, par exemple dans onUpdate).
---Source : lua/ge/extensions/gameplay/tutorial/damageTracker.lua:158
---@param vehicleId integer|nil Id du véhicule, nil pour ne rien suivre.
function gameplay_tutorial_damageTracker.setTrackedVehicleId(vehicleId) end

--- Affiche la tâche de réparation (ou de redémarrage en time trial) si le suivi est actif, qu'un crash a eu lieu et que le véhicule n'a pas encore été réparé.
---Source : lua/ge/extensions/gameplay/tutorial/damageTracker.lua:169
function gameplay_tutorial_damageTracker.showRepairTask() end

