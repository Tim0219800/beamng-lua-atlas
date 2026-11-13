---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyStageSuperCountdown.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud.
---@class flowgraph_nodes_gameplay_rally_rallyStageSuperCountdown_C
local flowgraph_nodes_gameplay_rally_rallyStageSuperCountdown_C = {}

--- Charge le pont de boucle rally, remet à zéro le compte à rebours et le cache de position de départ.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyStageSuperCountdown.lua:114
function flowgraph_nodes_gameplay_rally_rallyStageSuperCountdown_C:_executionStarted() end

--- Remet le compte à rebours à zéro.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyStageSuperCountdown.lua:124
function flowgraph_nodes_gameplay_rally_rallyStageSuperCountdown_C:_executionStopped() end

--- Calcule l'horloge et l'heure de lancement d'un compte à rebours immédiat (StagedCountdownUtils.calculateImmediateMinuteCountdown).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyStageSuperCountdown.lua:279
function flowgraph_nodes_gameplay_rally_rallyStageSuperCountdown_C:calculateScheduledEventTime() end

--- Charge durée, nombre d'annonces et options visuel/son/voix depuis StagedCountdownUtils.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyStageSuperCountdown.lua:270
function flowgraph_nodes_gameplay_rally_rallyStageSuperCountdown_C:configureCountdownSettings() end

--- Dessine plan, ligne véhicule-plan et point véhicule si le debug est actif.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyStageSuperCountdown.lua:260
function flowgraph_nodes_gameplay_rally_rallyStageSuperCountdown_C:drawDebugVisualization() end

--- Barre de progression et état dans le nœud.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyStageSuperCountdown.lua:572
---@param builder table Constructeur de nœud.
---@param style table Style.
function flowgraph_nodes_gameplay_rally_rallyStageSuperCountdown_C:drawMiddle(builder, style) end

--- Réactive le traitement des pacenotes du rally manager.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyStageSuperCountdown.lua:389
function flowgraph_nodes_gameplay_rally_rallyStageSuperCountdown_C:enableRallyManagerPacenoteProcessing() end

--- Met en file une pacenote système aléatoire dans le rally manager.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyStageSuperCountdown.lua:379
---@param pacenoteName string Nom (countdown3, countdowngo, falseStart…).
function flowgraph_nodes_gameplay_rally_rallyStageSuperCountdown_C:enqueueSystemPacenote(pacenoteName) end

--- Termine le compte à rebours : « Go! », son, dégel, pacenotes, état launched, flow = true.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyStageSuperCountdown.lua:415
function flowgraph_nodes_gameplay_rally_rallyStageSuperCountdown_C:finishCountdown() end

--- Calcule la phase du compte à rebours (temps restant, valeur entière, valeur annoncée, progression).
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyStageSuperCountdown.lua:292
---@param showingGo boolean Vrai pendant l'affichage de « Go! ».
---@return table  {timeUntilLaunch, countdownValue, announcedCountdown, countdownElapsed, progress}.
function flowgraph_nodes_gameplay_rally_rallyStageSuperCountdown_C:getCountdownPhase(showingGo) end

--- Construit les données d'horloge rally pour l'UI.
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyStageSuperCountdown.lua:331
---@return table  Données d'horloge.
function flowgraph_nodes_gameplay_rally_rallyStageSuperCountdown_C:getRallyClockData() end

--- Temps restant avant le lancement.
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyStageSuperCountdown.lua:288
---@return number  Secondes (>= 0).
function flowgraph_nodes_gameplay_rally_rallyStageSuperCountdown_C:getTimeUntilLaunch() end

--- Heure murale simulée (secondes) via StagedCountdownUtils.
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyStageSuperCountdown.lua:327
---@return number  Secondes.
function flowgraph_nodes_gameplay_rally_rallyStageSuperCountdown_C:getWallClockTime() end

--- Prévu pour détecter un faux départ ; renvoie toujours false.
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyStageSuperCountdown.lua:249
---@return boolean  Toujours false.
function flowgraph_nodes_gameplay_rally_rallyStageSuperCountdown_C:hasCrossedStartLine() end

--- Initialise toutes les variables d'état et options data.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyStageSuperCountdown.lua:67
---@param mgr table Gestionnaire flowgraph.
---@param ... any
function flowgraph_nodes_gameplay_rally_rallyStageSuperCountdown_C:init(mgr, ...) end

--- Arrête le chrono et met toutes les sorties à false.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyStageSuperCountdown.lua:128
function flowgraph_nodes_gameplay_rally_rallyStageSuperCountdown_C:reset() end

--- Diffuse l'état de proximité et du compte à rebours via le hook onRallyDataUpdated.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyStageSuperCountdown.lua:530
function flowgraph_nodes_gameplay_rally_rallyStageSuperCountdown_C:sendRallyDataUpdate() end

--- Renvoie data.drawDebug.
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyStageSuperCountdown.lua:256
---@return boolean  Dessiner le debug.
function flowgraph_nodes_gameplay_rally_rallyStageSuperCountdown_C:shouldDrawDebug() end

--- Renvoie le réglage d'effets sonores.
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyStageSuperCountdown.lua:375
---@return boolean|nil  Sons.
function flowgraph_nodes_gameplay_rally_rallyStageSuperCountdown_C:shouldPlaySoundEffects() end

--- Renvoie le réglage de compte à rebours vocal.
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyStageSuperCountdown.lua:371
---@return boolean|nil  Voix.
function flowgraph_nodes_gameplay_rally_rallyStageSuperCountdown_C:shouldPlayVoiceCountdown() end

--- Renvoie le réglage d'affichage visuel du compte à rebours.
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyStageSuperCountdown.lua:367
---@return boolean|nil  Afficher.
function flowgraph_nodes_gameplay_rally_rallyStageSuperCountdown_C:shouldShowVisualCountdown() end

--- Affiche un message flash (ScenarioFlashMessage) et éventuellement un Message UI.
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyStageSuperCountdown.lua:399
---@param msg string Texte.
---@param big boolean Grand format.
---@param duration number|nil Durée en s.
---@param luaCall string|nil Code Lua exécuté par l'UI (son).
function flowgraph_nodes_gameplay_rally_rallyStageSuperCountdown_C:show(msg, big, duration, luaCall) end

--- Démarre le compte à rebours : réglages, calcul de l'heure de lancement, état countdown_running.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyStageSuperCountdown.lua:352
function flowgraph_nodes_gameplay_rally_rallyStageSuperCountdown_C:startTimer() end

--- Réinitialise état, chronos, horloge rally et drapeaux.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyStageSuperCountdown.lua:137
function flowgraph_nodes_gameplay_rally_rallyStageSuperCountdown_C:stopTimer() end

--- Déclare un faux départ (log, pacenote, état false_start, flow = true).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyStageSuperCountdown.lua:442
function flowgraph_nodes_gameplay_rally_rallyStageSuperCountdown_C:triggerFalseStart() end

--- Dégèle le véhicule (setFreeze false) via core_vehicleBridge.
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyStageSuperCountdown.lua:335
---@return boolean  Vrai si un véhicule a été dégelé.
function flowgraph_nodes_gameplay_rally_rallyStageSuperCountdown_C:unfreezeVehicle() end

--- Avance l'horloge du compte à rebours de dtSim tant qu'il est en cours.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyStageSuperCountdown.lua:319
function flowgraph_nodes_gameplay_rally_rallyStageSuperCountdown_C:updateClock() end

--- Machine à états du compte à rebours : annonces 3-2-1 et fin.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyStageSuperCountdown.lua:459
function flowgraph_nodes_gameplay_rally_rallyStageSuperCountdown_C:updateCountdown() end

--- Décompte l'affichage de « Go! » puis passe à l'état finished.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyStageSuperCountdown.lua:519
function flowgraph_nodes_gameplay_rally_rallyStageSuperCountdown_C:updateGoDisplay() end

--- Calcule distance signée, distance latérale, proximité, arrêt, « staged » et distance d'affichage.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyStageSuperCountdown.lua:204
function flowgraph_nodes_gameplay_rally_rallyStageSuperCountdown_C:updateProximityState() end

--- Cherche la position de départ nommée dans pathData (avec cache) et mémorise pos/rot.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyStageSuperCountdown.lua:156
---@return boolean  Vrai si la position est valide.
function flowgraph_nodes_gameplay_rally_rallyStageSuperCountdown_C:updateStartPosition() end

--- Met à jour position avant et vitesse du véhicule suivi.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyStageSuperCountdown.lua:184
---@return boolean  Vrai si valide.
function flowgraph_nodes_gameplay_rally_rallyStageSuperCountdown_C:updateVehicleData() end

--- Chaque frame : gère reset, position de départ, véhicule, démarrage, compte à rebours, UI et sorties.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyStageSuperCountdown.lua:579
---@param args table Arguments du moteur flowgraph (non utilisés).
function flowgraph_nodes_gameplay_rally_rallyStageSuperCountdown_C:work(args) end

