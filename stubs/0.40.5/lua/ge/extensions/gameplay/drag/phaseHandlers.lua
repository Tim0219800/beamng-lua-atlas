---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/drag/phaseHandlers.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Logique de phases d'une course de drag : stage (placement sur la ligne de stage), countdown (arbre de départ), race (course jusqu'au dernier timer de distance), stop (arrêt du véhicule) et emergencyStop. Il met à jour la position/vitesse/roues des racers (updateRacer), détecte pré-stage et stage par distance des roues avant, applique les règles de disqualification (faux départ, hors couloir, immobile trop longtemps, crash), pilote les véhicules IA par queueLuaCommand (ai.setSpeed, transbrake, nitro, throttleOverride), gère les transitions de phase et le re-staging après DQ en freeroam. Les fonctions de phase sont appelées par les extensions dragTypes_* (headsUpRace/bracketRace) à chaque frame pour chaque racer.
--- Accès : extension `gameplay_drag_phaseHandlers` : `extensions.load("gameplay_drag_phaseHandlers")`, puis la globale `gameplay_drag_phaseHandlers`
---@class gameplay_drag_phaseHandlers
---@field dependencies string[] gameplay_drag_core, gameplay_drag_times, gameplay_drag_saveSystem.
---@field redLightReason string Clé de raison de DQ pour le faux départ : 'missions.dragRace.gameplay.disqualified.jumping'. display.setDisqualifiedLights l'utilise pour allumer le feu rouge.
gameplay_drag_phaseHandlers = {}

--- Indique si tous les racers sont en staging (phase 1 terminée, dans leur couloir, ou déjà finis) et si leur nombre atteint le minimum attendu (core.getExpectedStagingRacerCount).
---Source : lua/ge/extensions/gameplay/drag/phaseHandlers.lua:433
---@param dragData table|nil Données de course ; défaut core.getData().
---@return boolean  true si tous en staging.
---@return integer  Nombre de racers en staging.
---@return integer  Nombre total de racers.
function gameplay_drag_phaseHandlers.areAllRacersStaged(dragData) end

--- Calcule, pour chaque groupe de roues du racer, le vecteur centre de roues moins la position du point de stage de son couloir (racer._wheelDistances).
---Source : lua/ge/extensions/gameplay/drag/phaseHandlers.lua:58
---@param racer table Racer.
function gameplay_drag_phaseHandlers.calculateDistanceOfAllWheelsFromStagePos(racer) end

--- Fait passer à la phase suivante tous les racers dont la phase courante est complétée.
---Source : lua/ge/extensions/gameplay/drag/phaseHandlers.lua:381
function gameplay_drag_phaseHandlers.changeAllPhases() end

--- Fait avancer un racer d'une phase (ou le marque fini après la dernière). Refuse si une transition est déjà en cours, si la phase attendue diffère, si le racer est hors couloir pour entrer en phase 2 ou 3, ou si un hook onPhaseTransition appelle setPhaseTransitionAbort. Émet onPhaseTransition (avant) et onRacerPhaseTransition (après, newPhase nil et nom 'finished' si fini).
---Source : lua/ge/extensions/gameplay/drag/phaseHandlers.lua:313
---@param racer table Racer.
---@param expectedCurrentPhase integer|nil Phase attendue (validation).
---@return boolean  true si fait ou sans objet (racer retiré, fini), false si refusé.
function gameplay_drag_phaseHandlers.changeRacerPhase(racer, expectedCurrentPhase) end

--- En freeroam solo/multiseat (hors gamemode drag MP), gère le re-staging après DQ : 6 s après la DQ, si le joueur est à plus de 6 m derrière la ligne, relance la course (reset puis startDragRaceActivity) ; entre -6 et +6 m, affiche une fois le message ui.drag.flash.reverseToRestage. Renvoie 'leftArea' si le seul racer recule à plus de 15 m.
---Source : lua/ge/extensions/gameplay/drag/phaseHandlers.lua:637
---@param dtSim number Delta temps simulé (s).
---@return string|nil  'leftArea' ou nil.
function gameplay_drag_phaseHandlers.checkFreeroamDqReStage(dtSim) end

--- Vide l'état de re-staging après DQ.
---Source : lua/ge/extensions/gameplay/drag/phaseHandlers.lua:629
function gameplay_drag_phaseHandlers.clearDqRestageState() end

--- Supprime le verrou de transition (et le drapeau d'abandon) d'un racer, ou de tous si vehId est nil.
---Source : lua/ge/extensions/gameplay/drag/phaseHandlers.lua:299
---@param vehId integer|nil ID du véhicule ; nil = tous.
function gameplay_drag_phaseHandlers.clearRacerTransitionLock(vehId) end

--- Vide les minuteries de maintien du staging distant (MP).
---Source : lua/ge/extensions/gameplay/drag/phaseHandlers.lua:625
function gameplay_drag_phaseHandlers.clearRemoteStagingHoldTimers() end

--- Phase 2 (arbre) pour un racer. Démarre le décompte (émet startDragCountdown avec le dial), prépare l'IA (agressivité 2, two-step, transbrake ou freeze, throttleOverride = 1), et disqualifie pour faux départ ou sortie de couloir (met reactionTimeInvalid et appelle startRaceFromTree avant disqualifyRacer).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drag/phaseHandlers.lua:715
---@param phase table Phase courante du racer.
---@param racer table Racer.
---@param dtSim number Delta temps simulé (s).
function gameplay_drag_phaseHandlers.countdown(phase, racer, dtSim) end

--- Disqualifie un racer (jamais en phase 1, ni hors freeroam tant que la course n'est pas démarrée). Pour une IA, remet throttleOverride à nil. Émet setDisqualifiedLights.
---Source : lua/ge/extensions/gameplay/drag/phaseHandlers.lua:236
---@param racer table Racer.
---@param reason string Clé de traduction de la raison.
function gameplay_drag_phaseHandlers.disqualifyRacer(racer, reason) end

--- Phase d'arrêt d'urgence : pour une IA, coupe nitro/jato et throttleOverride, impose ai.setSpeed(0) ; la phase est complétée quand la vitesse <= 0.01 m/s.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drag/phaseHandlers.lua:1052
---@param phase table Phase.
---@param racer table Racer.
---@param dtSim number Delta temps simulé (s).
function gameplay_drag_phaseHandlers.emergencyStop(phase, racer, dtSim) end

--- Demande à l'extension de type de course (ext.generateWinData) la liste triée des résultats et émet onWinnerLightOn pour le couloir du premier.
---Source : lua/ge/extensions/gameplay/drag/phaseHandlers.lua:280
---@return table[]  Liste des résultats (vide si pas de données).
function gameplay_drag_phaseHandlers.generateWinData() end

--- Distance signée (m) des roues avant à la ligne de stage, projetée sur l'axe stage-arrivée du couloir (négatif avant la ligne).
---Source : lua/ge/extensions/gameplay/drag/phaseHandlers.lua:50
---@param racer table Racer.
---@return number|nil  Distance ou nil si les données de roues manquent.
function gameplay_drag_phaseHandlers.getFrontWheelDistanceFromStagePos(racer) end

--- Valeur du timer important pour le classement (délègue à gameplay_drag_times).
---Source : lua/ge/extensions/gameplay/drag/phaseHandlers.lua:174
---@param racer table Racer.
---@param data table Données de course.
---@return number  Valeur, 0 si indisponible.
function gameplay_drag_phaseHandlers.getImportantTimerValueForWin(racer, data) end

--- Vrai si toutes les roues du racer (centres par groupe, sinon la position du véhicule) sont dans la zone de son couloir et, s'il y a plusieurs racers, pas dans la zone d'un autre couloir occupé.
---Source : lua/ge/extensions/gameplay/drag/phaseHandlers.lua:93
---@param racer table Racer.
---@return boolean  true si dans le couloir.
function gameplay_drag_phaseHandlers.isRacerInsideBoundary(racer) end

--- Hook de clear : vide les minuteries de staging distant et l'état de re-staging.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drag/phaseHandlers.lua:1227
function gameplay_drag_phaseHandlers.onDragClear() end

--- Hook de chargement : logue une erreur si gameplay_drag_core est absent.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drag/phaseHandlers.lua:43
function gameplay_drag_phaseHandlers.onExtensionLoaded() end

--- Phase 3 (course). Lance l'IA (jato, transbrake relâché, throttleOverride = 1, vitesse et cible de l'endLine), détecte crash/immobilité/sortie de couloir, régule le cabrage des IA, et termine quand le timer de fin de course est défini : émet dragRaceEndLineReached, en MP envoie le temps brut à l'hôte, sinon génère les résultats et le ticket quand tous ont fini.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drag/phaseHandlers.lua:838
---@param phase table Phase.
---@param racer table Racer.
---@param dtSim number Delta temps simulé (s).
function gameplay_drag_phaseHandlers.race(phase, racer, dtSim) end

--- Calcule les délais de départ (dialsData) par véhicule : 1 racer = 0 ; 2 racers = l'écart de dial est ajouté au racer au dial le plus bas ; plus de 2 = le dial de chacun.
---Source : lua/ge/extensions/gameplay/drag/phaseHandlers.lua:1178
---@param data table[] Liste d'entrées {vehId, dial}.
function gameplay_drag_phaseHandlers.setDialsData(data) end

--- À appeler depuis un hook onPhaseTransition pour annuler la transition en cours d'un racer.
---Source : lua/ge/extensions/gameplay/drag/phaseHandlers.lua:309
---@param vehId integer ID du véhicule.
function gameplay_drag_phaseHandlers.setPhaseTransitionAbort(vehId) end

--- MP : applique l'état de staging d'un couloir reçu du réseau. À staged = true, démarre une minuterie (1 s de maintien avant de valider la phase 1) ; à false, annule et rouvre la phase 1 des racers du couloir.
---Source : lua/ge/extensions/gameplay/drag/phaseHandlers.lua:592
---@param data table dragData.
---@param lane integer Couloir.
---@param staged boolean Staging actif ou non.
function gameplay_drag_phaseHandlers.setRemoteStagingState(data, lane, staged) end

--- Phase 1 (staging). Met à jour la géométrie des roues, envoie la distance à l'UI (updateStageApp) pour le joueur local, valide la phase après 1 s sur la ligne (joueur) ou conduit l'IA à la ligne (approche, freinage, rampement) puis l'arrête.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drag/phaseHandlers.lua:471
---@param phase table Phase.
---@param racer table Racer.
---@param dtSim number Delta temps simulé (s).
function gameplay_drag_phaseHandlers.stage(phase, racer, dtSim) end

--- Termine la phase de décompte d'un racer (phase 'countdown'), démarre ses timers si local et, pour une IA, tire un délai aléatoire de 0 à 0,5 s avant son départ.
---Source : lua/ge/extensions/gameplay/drag/phaseHandlers.lua:393
---@param vehId integer ID du véhicule.
function gameplay_drag_phaseHandlers.startRaceFromTree(vehId) end

--- Phase d'arrêt après l'arrivée : pour une IA, coupe nitro/jato et lui ordonne de s'arrêter vers la cible d'arrêt. Terminée quand la vitesse <= 15 m/s ou 300 m parcourus ; émet stoppingVehicleDrag et dragRaceVehicleStopped.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drag/phaseHandlers.lua:992
---@param phase table Phase.
---@param racer table Racer.
---@param dtSim number Delta temps simulé (s).
function gameplay_drag_phaseHandlers.stop(phase, racer, dtSim) end

--- Met à jour les données d'un racer depuis le véhicule : position, direction, vitesse, centres de roues, distances au stage, inLane, états pré-stage/stage (émet les hooks de feux) et currentDistanceFromOrigin.
---Source : lua/ge/extensions/gameplay/drag/phaseHandlers.lua:1099
---@param racer table Racer.
function gameplay_drag_phaseHandlers.updateRacer(racer) end

--- Valide la phase 1 des racers d'un couloir dont le staging distant est maintenu depuis au moins 1 s. Appelée par core.onUpdate.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drag/phaseHandlers.lua:608
function gameplay_drag_phaseHandlers.updateRemoteStagingHoldTimers() end

