---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/pursuit/pursuit.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Gestionnaire de mode poursuite : événement de gameplay où plusieurs véhicules « chase » (police) poursuivent plusieurs véhicules « flee » (fuyards), joueurs ou IA. Une seule instance à la fois. Il insère les véhicules (rôles police/suspect), gère les objectifs (mode free, timed, score, destination), le démarrage (manuel ou à une vitesse donnée), les arrestations, la récupération des fuyards libérés et la détection de blocage. Les états du gestionnaire sont 'off', 'ready', 'active', 'inactive' et 'complete'.
--- Accès : extension `gameplay_pursuit_pursuit` : `extensions.load("gameplay_pursuit_pursuit")`, puis la globale `gameplay_pursuit_pursuit`
---@class gameplay_pursuit_pursuit
gameplay_pursuit_pursuit = {}

--- Copie la liste de points de parking et, si les deux quantités sont données, la réarrange en n points tagués 'chase' puis n points tagués 'flee' (sans tag inverse). Garde la liste d'origine si les deux listes ne sont pas assez remplies.
---Source : lua/ge/extensions/gameplay/pursuit/pursuit.lua:280
---@param parkingSpots table[] Points de parking avec customFields.tags.
---@param chaseAmount integer|nil Nombre de points chase voulus.
---@param fleeAmount integer|nil Nombre de points flee voulus.
---@return table[]  Liste filtrée (copie superficielle).
function gameplay_pursuit_pursuit.filterParkingSpots(parkingSpots, chaseAmount, fleeAmount) end

--- Renvoie l'objet gestionnaire (vehData, vehIds, chaseVehs, fleeVehs, options, goals, state, running, data{duration, arrests, totalScore, tempScore, locations, roadblocks}).
---Source : lua/ge/extensions/gameplay/pursuit/pursuit.lua:507
---@return table  Gestionnaire (référence directe).
function gameplay_pursuit_pursuit.getManager() end

--- Valide et insère un véhicule dans le gestionnaire. Réutilise les données de trafic s'il y en a (isShared), sinon crée un objet véhicule de trafic. Lui donne le rôle police ou suspect, désactive respawn et pooling, et met l'IA en mode 'stop' (ou 'disabled' pour un joueur).
---Source : lua/ge/extensions/gameplay/pursuit/pursuit.lua:106
---@param vehId integer Id du véhicule.
---@param isChase boolean true = poursuivant, false = fuyard.
---@param isAiControlled boolean true si piloté par l'IA (non utilisable par le joueur).
---@param options table|nil Options (non utilisées dans la fonction).
---@return boolean|nil  true si inséré, false si les données n'ont pu être créées, nil si id absent ou déjà inséré.
function gameplay_pursuit_pursuit.insertVeh(vehId, isChase, isAiControlled, options) end

--- Hook après rechargement Lua : réinitialise puis restaure le gestionnaire et réinsère les véhicules.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/pursuit/pursuit.lua:746
---@param data table Résultat de onSerialize.
function gameplay_pursuit_pursuit.onDeserialized(data) end

--- Hook émis par gameplay_police pour une action de poursuite. Actif seulement si l'état est 'active' et pour un fuyard : 'arrest' compte l'arrestation, 'evade' retire le fuyard du ciblage, 'release' applique le recoveryMode.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/pursuit/pursuit.lua:511
---@param vehId integer Fuyard concerné.
---@param action string 'start', 'arrest', 'evade', 'release', 'roadblockAlert', 'roadblock'.
---@param pursuit table Données de poursuite du véhicule.
function gameplay_pursuit_pursuit.onPursuitAction(vehId, action, pursuit) end

--- Hook avant rechargement Lua : renvoie l'état du gestionnaire (options, objectifs, données, état) et les données sérialisées des véhicules.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/pursuit/pursuit.lua:719
---@return table  {manager, vehicles}
function gameplay_pursuit_pursuit.onSerialize() end

--- Hook de changement du nombre de véhicules de trafic ; ne fait rien.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/pursuit/pursuit.lua:716
function gameplay_pursuit_pursuit.onTrafficAmountChanged() end

--- Hook au démarrage du trafic : remplace les entrées de trafic par les données du gestionnaire pour les véhicules qui en font partie.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/pursuit/pursuit.lua:704
function gameplay_pursuit_pursuit.onTrafficStarted() end

--- Hook à l'arrêt du trafic ; ne fait rien.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/pursuit/pursuit.lua:713
function gameplay_pursuit_pursuit.onTrafficStopped() end

--- Appelé à chaque image. Met à jour les véhicules non partagés, déclenche le démarrage automatique (options.startSpeed), et en jeu actif : durée, ciblage chaque seconde, détection de blocage, récupération, fondus, score total et conditions de victoire.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/pursuit/pursuit.lua:560
---@param dt number Delta temps réel (s).
---@param dtSim number Delta temps simulé (s).
function gameplay_pursuit_pursuit.onUpdate(dt, dtSim) end

--- Hook de core_multiSpawn : quand les groupes 'autoPursuitChase' puis 'autoPursuitFlee' sont apparus, appelle setupPursuitMulti avec les données mémorisées ; échoue (reset) si l'un des groupes est vide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/pursuit/pursuit.lua:682
---@param vehList integer[] Ids des véhicules apparus.
---@param groupId any Id du groupe (inutilisé).
---@param groupName string Nom du groupe.
function gameplay_pursuit_pursuit.onVehicleGroupSpawned(vehList, groupId, groupName) end

--- Retire un véhicule du gestionnaire et lui rend son rôle automatique de trafic s'il en fait partie.
---Source : lua/ge/extensions/gameplay/pursuit/pursuit.lua:159
---@param vehId integer Id du véhicule.
function gameplay_pursuit_pursuit.removeVeh(vehId) end

--- Réinitialise complètement le gestionnaire (arrête le gameplay s'il tourne, vide les véhicules, remet l'état à 'off', réinitialise les véhicules et les variables de gameplay_police).
---Source : lua/ge/extensions/gameplay/pursuit/pursuit.lua:221
function gameplay_pursuit_pursuit.reset() end

--- Remet le gameplay à l'état 'ready' sans vider le gestionnaire : réinitialise les données, les poursuites et renvoie les véhicules à leur position d'origine (interactRecovery loadHome). Ne démarre pas.
---Source : lua/ge/extensions/gameplay/pursuit/pursuit.lua:241
function gameplay_pursuit_pursuit.restart() end

--- Calcule les objectifs (mode, temps, score, arrestations, lieux) à partir des options ; applique des minimums selon le mode.
---Source : lua/ge/extensions/gameplay/pursuit/pursuit.lua:70
---@param options table|nil gameMode, timeLimit, scoreGoal, arrestGoal, locationGoal ; défaut manager.options.
function gameplay_pursuit_pursuit.setupGoals(options) end

--- Crée une poursuite avec un poursuivant et un fuyard existants (réinitialise d'abord le gestionnaire s'il n'est pas 'off'). Passe en état 'ready'.
---Source : lua/ge/extensions/gameplay/pursuit/pursuit.lua:310
---@param chaseVehId integer Id du poursuivant.
---@param fleeVehId integer Id du fuyard.
---@param options table|nil Options de gameplay.
---@param pursuitVars table|nil Variables passées à gameplay_police.setPursuitVars.
---@return boolean  false si l'un des véhicules est introuvable.
function gameplay_pursuit_pursuit.setupPursuit(chaseVehId, fleeVehId, options, pursuitVars) end

--- Crée une poursuite avec plusieurs poursuivants et fuyards. Échoue (reset) s'il n'y a aucun poursuivant ou aucun fuyard inséré ; avertit si certains ont échoué.
---Source : lua/ge/extensions/gameplay/pursuit/pursuit.lua:342
---@param chaseVehIds integer[] Ids des poursuivants.
---@param fleeVehIds integer[] Ids des fuyards.
---@param options table|nil Options de gameplay.
---@param pursuitVars table|nil Variables de poursuite.
---@return boolean  true si la configuration est prête.
function gameplay_pursuit_pursuit.setupPursuitMulti(chaseVehIds, fleeVehIds, options, pursuitVars) end

--- Fait apparaître les groupes de véhicules (core_multiSpawn.spawnGroup, noms 'autoPursuitChase' et 'autoPursuitFlee') puis, via onVehicleGroupSpawned, appelle setupPursuitMulti. Utilise les points de parking fournis, sinon place les véhicules sur la route devant (écart 15 m).
---Source : lua/ge/extensions/gameplay/pursuit/pursuit.lua:420
---@param chaseAmount integer|nil Nombre de poursuivants (défaut 1).
---@param fleeAmount integer|nil Nombre de fuyards (défaut 1).
---@param chaseVehGroup table|nil Groupe de véhicules {model, config…} des poursuivants.
---@param fleeVehGroup table|nil Groupe des fuyards.
---@param parkingSpots table[]|nil Points {pos, rot}, les premiers pour les poursuivants.
---@param options table|nil Options (shuffleVehGroups…).
---@param pursuitVars table|nil Variables de poursuite.
---@return boolean  false si une quantité est inférieure à 1.
function gameplay_pursuit_pursuit.setupVehicles(chaseAmount, fleeAmount, chaseVehGroup, fleeVehGroup, parkingSpots, options, pursuitVars) end

--- Comme setupVehicles mais lit les groupes de véhicules (champ data) dans des fichiers JSON, et éventuellement les points de parking d'un fichier de sites (zone optionnelle options.zoneName, mélange options.shuffleSpots, filtre par tags chase/flee).
---Source : lua/ge/extensions/gameplay/pursuit/pursuit.lua:448
---@param chaseAmount integer Nombre de poursuivants (>= 1).
---@param fleeAmount integer Nombre de fuyards (>= 1).
---@param chaseVehGroupFile string Chemin du JSON du groupe de poursuivants.
---@param fleeVehGroupFile string Chemin du JSON du groupe de fuyards.
---@param sitesFile string|nil Chemin du fichier de sites.
---@param options table|nil Options (zoneName, shuffleSpots, shuffleVehGroups…).
---@param pursuitVars table|nil Variables de poursuite.
---@return boolean  false si les quantités sont invalides ou un fichier de groupe est illisible.
function gameplay_pursuit_pursuit.setupVehiclesFromFiles(chaseAmount, fleeAmount, chaseVehGroupFile, fleeVehGroupFile, sitesFile, options, pursuitVars) end

--- Démarre le gameplay (états 'ready' ou 'inactive' seulement) : active les véhicules (poursuivants en action pursuitStart niveau 3, fuyards en fleePolice) et émet onPursuitGameplayStarted.
---Source : lua/ge/extensions/gameplay/pursuit/pursuit.lua:250
function gameplay_pursuit_pursuit.start() end

--- Arrête le gameplay actif. Avec un gagnant, l'état devient 'complete', les poursuites des fuyards sont réinitialisées et onPursuitGameplayFinished est émis ; sans gagnant, l'état devient 'inactive'.
---Source : lua/ge/extensions/gameplay/pursuit/pursuit.lua:258
---@param winner string|nil 'flee', 'chase' ou autre valeur non nil pour terminer ; nil pour simplement mettre en pause.
function gameplay_pursuit_pursuit.stop(winner) end

