---@meta
-- tim19Atlas stub generated from lua/ge/extensions/scenario/busdriver.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Scénario de conduite de bus (itinéraire de ligne avec arrêts). À partir de la configuration scenario.busdriver (routeID, variance, strictStop, simulatePassengers, traffic), il récupère la ligne via core_busRouteManager.setLine, trace le chemin au sol (core_groundMarkers), suit les déclencheurs d'arrêts de bus (BeamNGTrigger de type 'busstop' et 'buswp'), gère le temps d'attente de 5 s à l'arrêt, les portes et la position agenouillée, déplace 4 marqueurs de cadre d'arrêt et termine le scénario en réussite au dernier arrêt ou en échec si un arrêt est sauté. Le joueur est le véhicule 'scenario_player0'.
--- Accès : extension `scenario_busdriver` : `extensions.load("scenario_busdriver")`, puis la globale `scenario_busdriver`
---@class scenario_busdriver
---@field dependencies string[] Extensions chargées avant : scenario_scenarios, core_groundMarkers.
---@field enabledLineDebug boolean Si true, onPreRender dessine tout l'itinéraire (renderDebugLine) avec des textes debug. Faux par défaut.
scenario_busdriver = {}

--- Termine le scénario en échec (scenario_scenarios.finish({failed = reason})) puis réinitialise l'état du module.
---Source : lua/ge/extensions/scenario/busdriver.lua:80
---@param reason string|table Message ou clé de traduction d'échec.
function scenario_busdriver.fail(reason) end

--- Hook appelé quand un BeamNGTrigger est franchi. Gère l'entrée et la sortie des arrêts de bus de la ligne (type 'busstop') et l'enregistrement des points de passage (type 'buswp').
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/scenario/busdriver.lua:347
---@param data table {type, event ('enter'|'exit'), subjectName, triggerName}.
function scenario_busdriver.onBeamNGTrigger(data) end

--- Hook envoyé par le contrôleur du bus (véhicule) avec des évènements : 'onTriggerTick' (progression de l'arrêt : vitesse, portes, agenouillement), 'onApproachStop' (affiche les marqueurs d'arrêt, alpha cible 1) et 'onDepartedStop' (restaure la boîte englobante d'origine).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/scenario/busdriver.lua:668
---@param state table {event, triggerName, speed, bus_dooropen, bus_kneel}.
function scenario_busdriver.onBusUpdate(state) end

--- Hook de fin de mission : vide la liste des marqueurs.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/scenario/busdriver.lua:838
function scenario_busdriver.onClientEndMission() end

--- Hook de déchargement : vide les marqueurs, efface le chemin de groundMarkers et dégèle le véhicule joueur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/scenario/busdriver.lua:801
function scenario_busdriver.onExtensionUnloaded() end

--- Hook : la physique est en pause ; le chronomètre d'arrêt ne progresse plus.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/scenario/busdriver.lua:812
function scenario_busdriver.onPhysicsPaused() end

--- Hook : la physique reprend.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/scenario/busdriver.lua:816
function scenario_busdriver.onPhysicsUnpaused() end

--- Hook appelé avant chaque image. Anime l'alpha des marqueurs, calcule les statistiques de conduite (accélération, à-coups, dégâts, distance et angle d'arrêt), met à jour le chemin au sol vers le prochain arrêt (core_groundMarkers.setPath) et colore les marqueurs selon que le bus est dans la zone d'arrêt.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/scenario/busdriver.lua:501
---@param dt number Durée réelle de l'image (s).
---@param dtSim number Durée simulée (s).
function scenario_busdriver.onPreRender(dt, dtSim) end

--- Hook de fin de course : si playerWon est vrai, enregistre le temps final dans les highscores (core_highscores.setScenarioHighscoresCustom, clé 'busRoute').
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/scenario/busdriver.lua:421
---@param final table Résultat, final.finalTime en secondes.
function scenario_busdriver.onRaceResult(final) end

--- Hook de début de course : réinitialise, charge la ligne, dégèle le joueur, crée les 4 marqueurs TSStatic (busMarkerTL, TR, BL, BR, modèle position_marker.dae) dans ScenarioObjectsGroup, vérifie les points navhelp de la carte routière et trace le chemin vers le premier arrêt (couleur routeColor de la ligne). Met running à true.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/scenario/busdriver.lua:229
function scenario_busdriver.onRaceStart() end

--- Hook appelé quand le scénario est chargé. Si busdriver.simulatePassengers, ajoute la pièce 'citybus_seats_ballast' à la configuration du véhicule joueur ; si busdriver.traffic et que le trafic est éteint, démarre le trafic avec trafficAmount (ou le maximum pour 12 véhicules si 0).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/scenario/busdriver.lua:781
---@param scenario table Scénario chargé (scenario.busdriver).
function scenario_busdriver.onScenarioLoaded(scenario) end

--- Hook appelé au redémarrage du scénario : réinitialise l'état et recharge la ligne.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/scenario/busdriver.lua:188
---@param scenario table Scénario redémarré.
function scenario_busdriver.onScenarioRestarted(scenario) end

--- Hook appelé au changement de véhicule. Pour le joueur 0, réinitialise, gèle le nouveau véhicule et recharge la ligne ; échoue si la ligne est introuvable.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/scenario/busdriver.lua:448
---@param oldId integer Ancien identifiant de véhicule.
---@param newId integer Nouvel identifiant.
---@param player integer Indice du joueur.
function scenario_busdriver.onVehicleSwitched(oldId, newId, player) end

--- Demandé par l'UI : envoie à l'évènement BusDisplayUpdate la ligne courante réduite aux arrêts restants (à partir du prochain). Journalise une erreur et sort si aucune ligne n'est chargée.
---Source : lua/ge/extensions/scenario/busdriver.lua:820
function scenario_busdriver.requestState() end

