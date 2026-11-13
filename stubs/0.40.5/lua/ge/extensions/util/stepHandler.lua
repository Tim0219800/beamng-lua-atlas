---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/stepHandler.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Exécuteur de séquences d'étapes (« steps ») asynchrones pour scénarios et scripts de test. On construit une liste d'étapes avec les fonctions makeStepXxx (fondu au noir, attente, apparition de véhicule ou de trafic, chargement de niveau, fonction personnalisée) puis on la lance avec startStepSequence. À chaque onUpdate, l'étape courante est traitée jusqu'à ce qu'elle soit terminée (step.complete) ; on passe alors à la suivante dans la même frame. Une étape qui dépasse son délai (timeout, 120 s par défaut) est journalisée comme erreur et forcée à « terminée ».
--- Accès : extension `util_stepHandler` : `extensions.load("util_stepHandler")`, puis la globale `util_stepHandler`
---@class util_stepHandler
util_stepHandler = {}

--- Étape : charge un niveau par son nom (core_levels.startLevel) et attend onClientStartMission (timeout 600 s).
---Source : lua/ge/extensions/util/stepHandler.lua:246
---@param level string Nom du niveau (insensible à la casse).
---@return table  Étape.
function util_stepHandler.makeLoadLevelStep(level) end

--- Étape : lance le retour de fondu (ui_fadeScreen.stop) et attend l'état 3 de onScreenFadeState (timeout 10 s).
---Source : lua/ge/extensions/util/stepHandler.lua:59
---@param duration number|nil Durée du fondu en secondes.
---@return table  Étape.
function util_stepHandler.makeStepFadeFromBlack(duration) end

--- Étape : lance le fondu vers le noir (ui_fadeScreen.start) et attend l'évènement d'écran noir (état 1, timeout 10 s).
---Source : lua/ge/extensions/util/stepHandler.lua:49
---@param duration number|nil Durée du fondu en secondes.
---@return table  Étape.
function util_stepHandler.makeStepFadeToBlack(duration) end

--- Étape : appelle fun(step, dtTable) à chaque frame jusqu'à ce qu'elle renvoie une valeur vraie.
---Source : lua/ge/extensions/util/stepHandler.lua:124
---@param fun function Fonction (step, dtTable) -> boolean.
---@return table  Étape.
function util_stepHandler.makeStepReturnTrueFunction(fun) end

--- Étape : crée un groupe de véhicules de trafic (core_multiSpawn), attend son apparition, règle le nombre actif, active le trafic et le disperse (gameplay_traffic).
---Source : lua/ge/extensions/util/stepHandler.lua:204
---@param amount integer Nombre de véhicules à faire apparaître.
---@param active integer Nombre de véhicules actifs (activeAmount).
---@param generator any Générateur transmis à core_multiSpawn.createGroup (déduit du code).
---@return table  Étape.
function util_stepHandler.makeStepSpawnTrafficSimple(amount, active, generator) end

--- Étape : fait apparaître un véhicule (core_vehicles.spawnNewVehicle) puis attend qu'il soit prêt (isReady) ; le callback reçoit alors (step, vehId).
---Source : lua/ge/extensions/util/stepHandler.lua:160
---@param spawningOptions table Options d'apparition avec au moins model (et config, pos, rot…).
---@param callback function|nil Appelée avec (step, vehId) quand le véhicule est prêt.
---@return table  Étape.
function util_stepHandler.makeStepSpawnVehicle(spawningOptions, callback) end

--- Version simple de makeStepSpawnVehicle : options construites par sanitizeVehicleSpawnOptions(model, {config = config}).
---Source : lua/ge/extensions/util/stepHandler.lua:169
---@param model string Nom du modèle.
---@param config string Chemin ou nom de la configuration (.pc).
---@param callback function|nil Appelée avec (step, vehId).
---@return table  Étape.
function util_stepHandler.makeStepSpawnVehicleSimple(model, config, callback) end

--- Étape : attend un nombre de secondes réelles (os.clockhp).
---Source : lua/ge/extensions/util/stepHandler.lua:78
---@param seconds number Durée d'attente en secondes.
---@return table  Étape (timeout = seconds + 1).
function util_stepHandler.makeStepWait(seconds) end

--- Étape : attend un nombre de frames d'onUpdate, quelle que soit leur durée.
---Source : lua/ge/extensions/util/stepHandler.lua:97
---@param frames integer Nombre de frames.
---@return table  Étape.
function util_stepHandler.makeStepWaitFrames(frames) end

--- Étape : affiche un message à l'écran (ui_message) et dans le journal (tag « test »), puis se termine immédiatement.
---Source : lua/ge/extensions/util/stepHandler.lua:132
---@param message string Texte du message.
---@return table  Étape.
function util_stepHandler.makeUiMessageStep(message) end

--- Hook appelé au démarrage d'un niveau : marque l'étape courante comme terminée.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/stepHandler.lua:239
---@param state any Argument du hook (non utilisé).
function util_stepHandler.onClientStartMission(state) end

--- Hook appelé par ui_fadeScreen à chaque état du fondu : mémorise fadeState<état> sur l'étape courante si elle attend un fondu.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/stepHandler.lua:43
---@param state integer État du fondu (1 = noir atteint, 3 = fondu retiré).
function util_stepHandler.onScreenFadeState(state) end

--- Hook appelé à chaque frame : traite l'étape courante, gère les délais d'expiration, enchaîne les étapes terminées et désactive la séquence à la fin.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/stepHandler.lua:282
---@param dtReal number Durée réelle de la frame (s).
---@param dtSim number Durée simulée (s).
---@param dtRaw number Durée brute (s).
function util_stepHandler.onUpdate(dtReal, dtSim, dtRaw) end

--- Hook appelé quand un groupe de véhicules est apparu : si c'est le groupe attendu par l'étape de trafic courante, passe son état à 2 et mémorise les identifiants.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/stepHandler.lua:176
---@param vehIds integer[] Identifiants des véhicules du groupe.
---@param groupId any Identifiant du groupe.
function util_stepHandler.onVehicleGroupSpawned(vehIds, groupId) end

--- Termine l'étape courante et saute directement à la dernière étape (typiquement le callback de fin).
---Source : lua/ge/extensions/util/stepHandler.lua:275
function util_stepHandler.skipToLastStepOrCallback() end

--- Démarre une séquence d'étapes (remplace l'éventuelle séquence en cours). Si un callback est donné, il est exécuté en dernière étape.
---Source : lua/ge/extensions/util/stepHandler.lua:262
---@param steps table[] Liste d'étapes créées avec les makeStepXxx.
---@param callbackWhenFinished function|nil Appelée sans argument une fois toutes les étapes terminées.
function util_stepHandler.startStepSequence(steps, callbackWhenFinished) end

--- Fonction processTask de l'étape de chargement de niveau : lance le chargement au premier appel, journalise une erreur si le niveau est introuvable. Renvoie step.levelLoaded (jamais renseigné).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/stepHandler.lua:218
---@param step table Étape de chargement.
---@return boolean  Toujours false en pratique.
function util_stepHandler.taskLoadLevelStep(step) end

--- Fonction processTask de l'étape de trafic : machine à états 0 (créer le groupe) → 1 (attente de onVehicleGroupSpawned) → 2 (activer le trafic).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/stepHandler.lua:188
---@param step table Étape de trafic.
function util_stepHandler.taskSpawnTrafficStep(step) end

