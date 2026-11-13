---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/freeformDelivery/freeformDelivery.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Module principal du mode de livraison libre (freeform delivery). Il orchestre le cycle de vie d'une livraison décrite par un fichier delivery.delivery.json : load (chargement via le loader, installation des véhicules, routes, odomètre, filtre d'actions), start (objectifs, marqueurs, tasklist, hints, chronomètre), finish (arrêt de l'UI, gel des véhicules, état « terminé »), reset (retour à l'état chargé) et teardown (suppression des véhicules et déchargement). À chaque frame il met à jour tous les sous-modules (goals, markers, tasklist, hints, routes, odometer, vehicleSleep), affiche le chrono et enregistre un menu radial (quickAccess) pour terminer la livraison ou choisir un itinéraire.
--- Accès : extension `gameplay_freeformDelivery_freeformDelivery` : `extensions.load("gameplay_freeformDelivery_freeformDelivery")`, puis la globale `gameplay_freeformDelivery_freeformDelivery`
---@class gameplay_freeformDelivery_freeformDelivery
---@field debug table Configuration de debug lue par les sous-modules : {enabled = false, targetAreas = {location, zone, parkingSpot = true}, p = nil (LuaProfiler)}.
---@field dependencies string[] Extensions chargées avant : core_vehicles, core_gamestate, gameplay_sites_sitesManager, core_flowgraphManager, core_quickAccess, gameplay_freeformDelivery_{utils, loader, setup, goals, tasklist, markers, endScreen, hints, routes, debug, odometer, vehicleSleep}, core_groundMarkers, core_input_actionFilter, ui_apps_genericMissionData.
gameplay_freeformDelivery_freeformDelivery = {}

--- Ancienne fonction de nettoyage, conservée pour compatibilité : appelle teardown() sans argument.
---Source : lua/ge/extensions/gameplay/freeformDelivery/freeformDelivery.lua:666
function gameplay_freeformDelivery_freeformDelivery.cleanup() end

--- Termine la livraison active (réussie ou échouée) : enregistre le temps écoulé dans currentDelivery.elapsedTime, masque marqueurs, tasklist, hints, routes et odomètre, gèle les véhicules, efface le chrono et passe à l'état terminé (isFinished). Les objectifs restent évaluables.
---Source : lua/ge/extensions/gameplay/freeformDelivery/freeformDelivery.lua:235
---@param failed boolean|nil true si la livraison est un échec.
---@param reason string|nil Raison de l'échec, conservée dans getFailReason.
---@return boolean  true si terminée, false s'il n'y avait pas de livraison active.
function gameplay_freeformDelivery_freeformDelivery.finish(failed, reason) end

--- Renvoie la table de la livraison courante (données du loader, plus elapsedTime après finish).
---Source : lua/ge/extensions/gameplay/freeformDelivery/freeformDelivery.lua:174
---@return table|nil  Livraison, nil si aucune.
function gameplay_freeformDelivery_freeformDelivery.getCurrentDelivery() end

--- Renvoie la raison de l'échec transmise à finish.
---Source : lua/ge/extensions/gameplay/freeformDelivery/freeformDelivery.lua:112
---@return string|nil  Raison, nil sinon.
function gameplay_freeformDelivery_freeformDelivery.getFailReason() end

--- Renvoie l'avancement des objectifs (gameplay_freeformDelivery_goals.getProgress) quand la livraison est active ou terminée.
---Source : lua/ge/extensions/gameplay/freeformDelivery/freeformDelivery.lua:296
---@return table|nil  {total, completed, required, requiredCompleted, allRequiredComplete}, nil si seulement chargée.
function gameplay_freeformDelivery_freeformDelivery.getProgress() end

--- Renvoie les statistiques de fin (gameplay_freeformDelivery_endScreen.collectStatistics) quand la livraison est active ou terminée et a démarré.
---Source : lua/ge/extensions/gameplay/freeformDelivery/freeformDelivery.lua:305
---@return table|nil  Statistiques (temps, objectifs, dégâts) ou nil.
function gameplay_freeformDelivery_freeformDelivery.getResults() end

--- Indique si le setup asynchrone est encore en cours.
---Source : lua/ge/extensions/gameplay/freeformDelivery/freeformDelivery.lua:183
---@return boolean  true tant que le setup n'est pas terminé.
function gameplay_freeformDelivery_freeformDelivery.getSetupPending() end

--- Renvoie l'instant de démarrage (os.clock()), 0 si pas démarrée.
---Source : lua/ge/extensions/gameplay/freeformDelivery/freeformDelivery.lua:178
---@return number  Instant en secondes.
function gameplay_freeformDelivery_freeformDelivery.getStartTime() end

--- Indique si la livraison est en cours (objectifs et chrono actifs). Utilisé par quickAccess.
---Source : lua/ge/extensions/gameplay/freeformDelivery/freeformDelivery.lua:97
---@return boolean  true si active.
function gameplay_freeformDelivery_freeformDelivery.isActive() end

--- Indique si la livraison s'est terminée par un échec.
---Source : lua/ge/extensions/gameplay/freeformDelivery/freeformDelivery.lua:107
---@return boolean  true si échec.
function gameplay_freeformDelivery_freeformDelivery.isFailed() end

--- Indique si la livraison est terminée (réussie ou échouée) mais pas encore démantelée.
---Source : lua/ge/extensions/gameplay/freeformDelivery/freeformDelivery.lua:102
---@return boolean  true si terminée.
function gameplay_freeformDelivery_freeformDelivery.isFinished() end

--- Indique si le chargement et le setup sont terminés (prêt à démarrer).
---Source : lua/ge/extensions/gameplay/freeformDelivery/freeformDelivery.lua:170
---@return boolean  true si prêt.
function gameplay_freeformDelivery_freeformDelivery.isLoaded() end

--- Charge une livraison : lit le fichier via gameplay_freeformDelivery_loader.load, installe véhicules et joueur (setup), prépare routes, odomètre et vehicleSleep, bloque des actions et appelle le basculement de la fenêtre de debug. Le setup se termine plus tard (voir isLoaded).
---Source : lua/ge/extensions/gameplay/freeformDelivery/freeformDelivery.lua:117
---@param path string Chemin du fichier delivery.delivery.json.
---@return boolean  true si le chargement a démarré, false si une livraison est déjà en place ou si le fichier/setup a échoué.
function gameplay_freeformDelivery_freeformDelivery.load(path) end

--- Hook : à l'ouverture du menu radial, enregistre les entrées quickAccess de la livraison (terminer, itinéraires).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/freeformDelivery/freeformDelivery.lua:505
function gameplay_freeformDelivery_freeformDelivery.onBeforeRadialOpened() end

--- Hook : fin de niveau ; appelle teardown().
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/freeformDelivery/freeformDelivery.lua:674
function gameplay_freeformDelivery_freeformDelivery.onClientEndMission() end

--- Hook : déchargement de l'extension ; appelle teardown().
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/freeformDelivery/freeformDelivery.lua:670
function gameplay_freeformDelivery_freeformDelivery.onExtensionUnloaded() end

--- Hook : quickAccess rechargé ; autorise un nouvel enregistrement des entrées.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/freeformDelivery/freeformDelivery.lua:509
function gameplay_freeformDelivery_freeformDelivery.onQuickAccessLoaded() end

--- Appelé à chaque frame : surveille la fin du setup (et son délai de 20 s), puis si la livraison est active met à jour le cache des véhicules, les objectifs, marqueurs, tasklist, hints, routes, odomètre et vehicleSleep, affiche le chrono via ui_apps_genericMissionData et termine la livraison quand le minuteur d'achèvement des objectifs expire.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/freeformDelivery/freeformDelivery.lua:538
---@param dtReal number Delta temps réel.
---@param dtSim number Delta temps simulé.
---@param dtRaw number Delta temps brut.
function gameplay_freeformDelivery_freeformDelivery.onUpdate(dtReal, dtSim, dtRaw) end

--- Remet une livraison active ou terminée à l'état chargé : nettoie tous les sous-modules, dégèle les véhicules, restaure leurs positions et refait le placement du joueur. Il faut rappeler start() ensuite.
---Source : lua/ge/extensions/gameplay/freeformDelivery/freeformDelivery.lua:315
---@return boolean  true si réinitialisée, false s'il n'y a rien à réinitialiser.
function gameplay_freeformDelivery_freeformDelivery.reset() end

--- Démarre la livraison chargée : reconfigure routes, odomètre et vehicleSleep, puis active objectifs, marqueurs, tasklist et hints, et lance le chronomètre. Exige que isLoaded soit vrai et que la livraison ne soit pas déjà active.
---Source : lua/ge/extensions/gameplay/freeformDelivery/freeformDelivery.lua:187
---@return boolean  true si démarrée.
function gameplay_freeformDelivery_freeformDelivery.start() end

--- Démantèle complètement la livraison : débloque les actions, nettoie les sous-modules, dégèle puis supprime les véhicules et le prefab (sauf keepVehicles), vide les POI bruts, retire le menu quickAccess et remet tous les états à zéro. Sans effet si rien n'est chargé.
---Source : lua/ge/extensions/gameplay/freeformDelivery/freeformDelivery.lua:624
---@param keepVehicles boolean|nil true pour conserver les véhicules spawnés (faux par défaut).
function gameplay_freeformDelivery_freeformDelivery.teardown(keepVehicles) end

