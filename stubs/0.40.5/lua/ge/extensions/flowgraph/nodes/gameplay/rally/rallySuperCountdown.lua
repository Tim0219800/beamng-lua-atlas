---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallySuperCountdown.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud.
---@class flowgraph_nodes_gameplay_rally_rallySuperCountdown_C
local flowgraph_nodes_gameplay_rally_rallySuperCountdown_C = {}

--- Réinitialise l'état du nœud au démarrage du graphe.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallySuperCountdown.lua:145
function flowgraph_nodes_gameplay_rally_rallySuperCountdown_C:_executionStarted() end

--- Arrête le chrono et dégèle le véhicule.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallySuperCountdown.lua:169
function flowgraph_nodes_gameplay_rally_rallySuperCountdown_C:_executionStopped() end

--- Indique si le saut du compte à rebours est possible (attente, véhicule placé avec hystérésis, pas de debounce).
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallySuperCountdown.lua:1030
---@return boolean  Saut possible.
function flowgraph_nodes_gameplay_rally_rallySuperCountdown_C:canSkipCountdown() end

--- Contrôle de placement : armé si placé, sinon report ou fin si plus de reports.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallySuperCountdown.lua:649
---@return boolean  Vrai si placé.
function flowgraph_nodes_gameplay_rally_rallySuperCountdown_C:checkStagingAt10s() end

--- Règle durée (6 s/5 annonces avec voix, 3 s/3 sans), voix, visuel et gel selon les réglages rallyAudioPacenotes/rallyVisualPacenotes et les faux départs.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallySuperCountdown.lua:572
function flowgraph_nodes_gameplay_rally_rallySuperCountdown_C:configureCountdownSettings() end

--- Dessine le plan de départ et les repères de debug.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallySuperCountdown.lua:980
function flowgraph_nodes_gameplay_rally_rallySuperCountdown_C:drawDebugVisualization() end

--- Dessine l'état du compte à rebours dans le nœud.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallySuperCountdown.lua:995
---@param builder table Constructeur de nœud.
---@param style table Style.
function flowgraph_nodes_gameplay_rally_rallySuperCountdown_C:drawMiddle(builder, style) end

--- Réactive le traitement des pacenotes du rally manager.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallySuperCountdown.lua:513
function flowgraph_nodes_gameplay_rally_rallySuperCountdown_C:enableRallyManagerPacenoteProcessing() end

--- Met en file une pause audio.
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallySuperCountdown.lua:532
---@param secs number Durée en s.
function flowgraph_nodes_gameplay_rally_rallySuperCountdown_C:enqueuePauseSecs(secs) end

--- Met en file une pacenote système aléatoire.
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallySuperCountdown.lua:522
---@param pacenote_name string Nom de la pacenote.
---@param audioLenOffset number|nil Décalage de durée audio.
function flowgraph_nodes_gameplay_rally_rallySuperCountdown_C:enqueueSystemPacenote(pacenote_name, audioLenOffset) end

--- Termine immédiatement (skipCountdowns) : pacenotes, dégel, état finished, flow = true.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallySuperCountdown.lua:755
function flowgraph_nodes_gameplay_rally_rallySuperCountdown_C:finishCountdownImmediately() end

--- Gèle le véhicule via StagedCountdownUtils.freezeVehicle (une seule fois).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallySuperCountdown.lua:217
function flowgraph_nodes_gameplay_rally_rallySuperCountdown_C:freezeVehicle() end

--- Heure d'époque rally courante (mode test : horloge de test).
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallySuperCountdown.lua:396
---@return number|nil  Secondes.
function flowgraph_nodes_gameplay_rally_rallySuperCountdown_C:getCurrentEpochTime() end

--- Renvoie le gestionnaire de boucle rally (nil en mode test ou extension non chargée).
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallySuperCountdown.lua:385
---@return table|nil  Gestionnaire.
function flowgraph_nodes_gameplay_rally_rallySuperCountdown_C:getRallyLoopManager() end

--- Heure planifiée de l'évènement eventName (mise en cache par évènement et mission).
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallySuperCountdown.lua:408
---@return number|nil  Secondes d'époque.
function flowgraph_nodes_gameplay_rally_rallySuperCountdown_C:getScheduledEventTime() end

--- Heure murale simulée (environment start + époque, modulo 86400).
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallySuperCountdown.lua:942
---@return number|nil  Secondes.
function flowgraph_nodes_gameplay_rally_rallySuperCountdown_C:getWallClockTime() end

--- Vrai si la distance signée est négative (ligne franchie).
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallySuperCountdown.lua:380
---@return boolean  Ligne franchie.
function flowgraph_nodes_gameplay_rally_rallySuperCountdown_C:hasCrossedStartLine() end

--- Initialise états, caches, drapeaux audio et options data.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallySuperCountdown.lua:81
---@param mgr table Gestionnaire flowgraph.
---@param ... any
function flowgraph_nodes_gameplay_rally_rallySuperCountdown_C:init(mgr, ...) end

--- Vrai si l'état est finished ou false_start.
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallySuperCountdown.lua:767
---@return boolean  Flux passé.
function flowgraph_nodes_gameplay_rally_rallySuperCountdown_C:isFlowActive() end

--- Vrai si près du plan (arrêt non requis).
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallySuperCountdown.lua:375
---@return boolean  Dans la zone.
function flowgraph_nodes_gameplay_rally_rallySuperCountdown_C:isInLaunchZone() end

--- État de proximité mis en cache.
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallySuperCountdown.lua:365
---@return boolean  Près du plan.
function flowgraph_nodes_gameplay_rally_rallySuperCountdown_C:isNearPlane() end

--- Vrai si le compte à rebours tourne.
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallySuperCountdown.lua:771
---@return boolean  En cours.
function flowgraph_nodes_gameplay_rally_rallySuperCountdown_C:isOngoing() end

--- Vrai si aucun report n'a eu lieu.
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallySuperCountdown.lua:763
---@return boolean  Planning d'origine.
function flowgraph_nodes_gameplay_rally_rallySuperCountdown_C:isOriginalSchedule() end

--- Vrai si près du plan et à l'arrêt.
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallySuperCountdown.lua:370
---@return boolean  Placé.
function flowgraph_nodes_gameplay_rally_rallySuperCountdown_C:isStaged() end

--- État « à l'arrêt » mis en cache.
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallySuperCountdown.lua:360
---@return boolean  À l'arrêt.
function flowgraph_nodes_gameplay_rally_rallySuperCountdown_C:isStopped() end

--- Vrai dans les états d'attente (staging check, armé, waiting_for_staged).
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallySuperCountdown.lua:775
---@return boolean  En attente.
function flowgraph_nodes_gameplay_rally_rallySuperCountdown_C:isWaiting() end

--- Surveille faux départ et sortie de zone pendant le compte à rebours.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallySuperCountdown.lua:689
function flowgraph_nodes_gameplay_rally_rallySuperCountdown_C:monitorCountdown() end

--- Hook d'interaction joueur : demande un saut du compte à rebours si possible.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallySuperCountdown.lua:1100
function flowgraph_nodes_gameplay_rally_rallySuperCountdown_C:onGameplayInteract() end

--- Déclenche les avertissements 60/30/15/10 s (message et pacenotes).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallySuperCountdown.lua:781
function flowgraph_nodes_gameplay_rally_rallySuperCountdown_C:processWarnings() end

--- Pause audio de durée entière aléatoire entre min et max.
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallySuperCountdown.lua:542
---@param min integer Minimum (s).
---@param max integer Maximum (s).
function flowgraph_nodes_gameplay_rally_rallySuperCountdown_C:randomPauseSecs(min, max) end

--- Demande le report du départ au prochain créneau ; met à jour rescheduleCount et les avertissements.
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallySuperCountdown.lua:441
---@return boolean  Vrai si reporté ; false si la limite maxReschedules est atteinte (drapeau maxReschedulesReached).
function flowgraph_nodes_gameplay_rally_rallySuperCountdown_C:requestReschedule() end

--- Arrête le chrono, dégèle le véhicule et met les sorties à false.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallySuperCountdown.lua:174
function flowgraph_nodes_gameplay_rally_rallySuperCountdown_C:reset() end

--- Vrai si data.drawDebug ou le drapeau stopZones de la boucle est actif.
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallySuperCountdown.lua:975
---@return boolean  Dessiner.
function flowgraph_nodes_gameplay_rally_rallySuperCountdown_C:shouldDrawDebug() end

--- Réglage de compte à rebours vocal.
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallySuperCountdown.lua:505
---@return boolean|nil  Voix.
function flowgraph_nodes_gameplay_rally_rallySuperCountdown_C:shouldPlayVoiceCountdown() end

--- Réglage d'affichage visuel.
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallySuperCountdown.lua:509
---@return boolean|nil  Affichage.
function flowgraph_nodes_gameplay_rally_rallySuperCountdown_C:shouldShowVisualCountdown() end

--- Vrai si flow est actif, l'état est waiting_for_staging_check et aucun départ n'est encore planifié.
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallySuperCountdown.lua:565
---@return boolean  Démarrer.
function flowgraph_nodes_gameplay_rally_rallySuperCountdown_C:shouldStartTimer() end

--- Affiche un message via le canal Message si useMessages est actif (le flash message est commenté).
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallySuperCountdown.lua:547
---@param msg string Texte.
---@param big boolean Grand format.
---@param duration number|nil Durée en s.
function flowgraph_nodes_gameplay_rally_rallySuperCountdown_C:show(msg, big, duration) end

--- Avance l'horloge de la boucle jusqu'à 6 s avant le départ.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallySuperCountdown.lua:1070
function flowgraph_nodes_gameplay_rally_rallySuperCountdown_C:skipToCountdown() end

--- Lit l'heure planifiée et calcule targetStartTime et stagingCheckTime.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallySuperCountdown.lua:606
function flowgraph_nodes_gameplay_rally_rallySuperCountdown_C:startTimer() end

--- Réinitialise états, planification, compteurs, avertissements, drapeaux et audio.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallySuperCountdown.lua:191
function flowgraph_nodes_gameplay_rally_rallySuperCountdown_C:stopTimer() end

--- Dégèle le véhicule s'il a été gelé par ce nœud.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallySuperCountdown.lua:225
function flowgraph_nodes_gameplay_rally_rallySuperCountdown_C:unfreezeVehicle() end

--- Machine à états principale du départ.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallySuperCountdown.lua:827
function flowgraph_nodes_gameplay_rally_rallySuperCountdown_C:updateCountdownStateMachine() end

--- Calcule distance signée, arrêt (avec hystérésis), proximité et état « staged ».
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallySuperCountdown.lua:307
function flowgraph_nodes_gameplay_rally_rallySuperCountdown_C:updateProximityState() end

--- Cherche la position de départ nommée dans pathData (avec cache) et mémorise la raison en cas d'échec.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallySuperCountdown.lua:256
---@return boolean  Vrai si valide.
function flowgraph_nodes_gameplay_rally_rallySuperCountdown_C:updateStartPosition() end

--- Recalcule targetStartTime et stagingCheckTime après un report.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallySuperCountdown.lua:643
function flowgraph_nodes_gameplay_rally_rallySuperCountdown_C:updateTimesAfterReschedule() end

--- Met à jour position avant et vitesse du véhicule suivi.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallySuperCountdown.lua:233
---@return boolean  Vrai si valide.
function flowgraph_nodes_gameplay_rally_rallySuperCountdown_C:updateVehicleData() end

--- Chaque frame : position, véhicule, proximité, démarrage, machine à états, saut, mise à jour UI (hooks de proximité/compte à rebours) et sorties.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallySuperCountdown.lua:1106
---@param args table Arguments du moteur flowgraph (non utilisés).
function flowgraph_nodes_gameplay_rally_rallySuperCountdown_C:work(args) end

