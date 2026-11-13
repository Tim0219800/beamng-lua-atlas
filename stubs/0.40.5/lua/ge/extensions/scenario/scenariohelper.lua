---@meta
-- tim19Atlas stub generated from lua/ge/extensions/scenario/scenariohelper.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Boîte à outils des scénarios (extension GE scenario_scenariohelper). Elle enveloppe l'envoi de commandes Lua à un véhicule par son nom dans le scenetree, le pilotage de l'IA (mode, agressivité, route, cible, évitement), la casse de groupes de poutres, et deux messages d'interface. C'est l'API utilisée par les scénarios de moddeurs. Chaque fonction IA envoie une commande textuelle ai.xxx(...) au VM du véhicule, puis, si scenario_scenarios est chargé, mémorise l'état via scenario_scenarios.updateVehicleAiState pour pouvoir le rejouer après un reset.
--- Accès : extension `scenario_scenariohelper` : `extensions.load("scenario_scenariohelper")`, puis la globale `scenario_scenariohelper`
---@class scenario_scenariohelper
scenario_scenariohelper = {}

--- Casse un groupe de rupture (breakGroup) du véhicule en exécutant beamstate.breakBreakGroup(group) dans son VM.
---Source : lua/ge/extensions/scenario/scenariohelper.lua:29
---@param vehicleName string Nom du véhicule. Doit exister, sinon erreur.
---@param group string Nom du breakGroup défini dans le jbeam.
function scenario_scenariohelper.breakBreakGroup(vehicleName, group) end

--- Affiche un message flash à l'écran via guihooks.trigger('ScenarioFlashMessage', {{msg, duration, 0, useBiggerText}}).
---Source : lua/ge/extensions/scenario/scenariohelper.lua:178
---@param msg string Texte à afficher.
---@param duration number Durée d'affichage (secondes, déduit du code).
---@param useBiggerText boolean|nil true pour un texte plus gros ; toute autre valeur est traitée comme false.
function scenario_scenariohelper.flashUiMessage(msg, duration, useBiggerText) end

--- Calcule la distance entre les positions de deux objets du scenetree.
---Source : lua/ge/extensions/scenario/scenariohelper.lua:189
---@param sceneObjectName1 string Nom du premier objet.
---@param sceneObjectName2 string Nom du second objet.
---@return number  Distance en mètres, ou -1 si l'un des objets est introuvable.
function scenario_scenariohelper.getDistanceBetweenSceneObjects(sceneObjectName1, sceneObjectName2) end

--- Renvoie l'objet du scenetree portant ce nom (scenetree.findObject), typiquement un véhicule.
---Source : lua/ge/extensions/scenario/scenariohelper.lua:14
---@param name string Nom de l'objet dans le scenetree.
---@return table|nil  L'objet, ou nil s'il n'existe pas.
function scenario_scenariohelper.getVehicleByName(name) end

--- Envoie une chaîne de code Lua à exécuter dans le VM du véhicule donné (appelle vehicle:queueLuaCommand). Aucun test sur vehicle.
---Source : lua/ge/extensions/scenario/scenariohelper.lua:9
---@param vehicle table Objet véhicule (BeamObject) déjà résolu, par exemple renvoyé par getVehicleByName.
---@param command string Code Lua à exécuter côté véhicule.
function scenario_scenariohelper.queueLuaCommand(vehicle, command) end

--- Envoie une commande Lua à un véhicule retrouvé par son nom. Si le véhicule n'existe pas, écrit une erreur dans le log (tag scenarioHelper) et ne fait rien d'autre.
---Source : lua/ge/extensions/scenario/scenariohelper.lua:19
---@param vehicleName string Nom du véhicule dans le scenetree.
---@param command string Code Lua à exécuter côté véhicule.
function scenario_scenariohelper.queueLuaCommandByName(vehicleName, command) end

--- Met à jour l'affichage temps réel du scénario via guihooks.trigger('ScenarioRealtimeDisplay', {msg = msg}).
---Source : lua/ge/extensions/scenario/scenariohelper.lua:185
---@param msg any Contenu transmis à l'UI dans le champ msg.
function scenario_scenariohelper.realTimeUiDisplay(msg) end

--- Règle l'agressivité de l'IA (ai.setAggression) et la mémorise dans l'état scénario.
---Source : lua/ge/extensions/scenario/scenariohelper.lua:58
---@param vehicleName string Nom du véhicule.
---@param aggression number Agressivité, insérée telle quelle dans la commande (le commentaire de setAiPath indique un maximum de 2).
function scenario_scenariohelper.setAiAggression(vehicleName, aggression) end

--- Choisit le mode d'agressivité dynamique de l'IA en mode manual (ai.setAggressionMode). Avec 'rubberBand', l'agressivité varie avec la distance à l'adversaire : plus l'IA est proche, moins elle est agressive.
---Source : lua/ge/extensions/scenario/scenariohelper.lua:67
---@param vehicleName string Nom du véhicule.
---@param aggrMode string Actuellement 'rubberBand' (seule valeur citée dans le code).
function scenario_scenariohelper.setAiAggressionMode(vehicleName, aggrMode) end

--- Active ou désactive l'évitement des autres voitures par l'IA (ai.setAvoidCars).
---Source : lua/ge/extensions/scenario/scenariohelper.lua:81
---@param vehicleName string Nom du véhicule.
---@param value string 'on' ou 'off'.
function scenario_scenariohelper.setAiAvoidCars(vehicleName, value) end

--- Fixe le mode de l'IA du véhicule via ai.setState({mode=...}). Si targetVehicleName est fourni, l'ID de ce véhicule est transmis comme targetObjectID (utile pour les modes qui visent un autre véhicule, par exemple chase ou flee). Mémorise le mode dans l'état scénario.
---Source : lua/ge/extensions/scenario/scenariohelper.lua:44
---@param vehicleName string Nom du véhicule piloté par l'IA.
---@param mode string Mode IA (valeurs du ai.lua du véhicule, par exemple 'manual', 'chase', 'flee', 'stop', 'disabled' : déduit du code, non vérifié ici).
---@param targetVehicleName string|nil Nom du véhicule cible, facultatif. Doit exister s'il est fourni.
function scenario_scenariohelper.setAiMode(vehicleName, mode, targetVehicleName) end

--- Fait suivre à un véhicule IA une route entre waypoints (ai.driveUsingPath) avec de nombreuses options. L'IA calcule le plus court chemin entre waypoints consécutifs. Le tableau arg est aussi sauvegardé (core_checkpoints.saveAIPath et scenario_scenarios.updateVehicleAiState) pour être réappliqué au reset.
---Source : lua/ge/extensions/scenario/scenariohelper.lua:104
---@param arg table Table d'options. Seuls vehicleName et waypoints sont obligatoires.
function scenario_scenariohelper.setAiPath(arg) end

--- Active la progression automatique de l'IA le long d'une liste de waypoints (ai.driveUsingPath avec wpTargetList). Le mode IA doit être manual ou flee. Version simple de setAiPath, sans options de vitesse ou de tours.
---Source : lua/ge/extensions/scenario/scenariohelper.lua:90
---@param vehicleName string Nom du véhicule.
---@param waypoints string[] Liste de noms de waypoints, sérialisée avec serialize().
function scenario_scenariohelper.setAiRoute(vehicleName, waypoints) end

--- Définit la cible de l'IA (ai.setTarget) et la mémorise dans l'état scénario.
---Source : lua/ge/extensions/scenario/scenariohelper.lua:74
---@param vehicleName string Nom du véhicule piloté par l'IA.
---@param target string Cible transmise à ai.setTarget (nom, entre guillemets dans la commande).
function scenario_scenariohelper.setAiTarget(vehicleName, target) end

--- Règle le seuil de drivabilité de coupure de l'IA (ai.setCutOffDrivability), qui sert à écarter les routes de trop faible drivabilité.
---Source : lua/ge/extensions/scenario/scenariohelper.lua:97
---@param vehicleName string Nom du véhicule.
---@param drivability number Valeur de drivabilité, insérée telle quelle dans la commande.
function scenario_scenariohelper.setCutOffDrivability(vehicleName, drivability) end

--- Active le suivi cartographique du véhicule (mapmgr.enableTracking) sous un nom de suivi personnalisé.
---Source : lua/ge/extensions/scenario/scenariohelper.lua:39
---@param vehicleName string Nom du véhicule dans le scenetree.
---@param trackingName string Nom de suivi à utiliser.
function scenario_scenariohelper.trackVehicle(vehicleName, trackingName) end

--- Déclenche un groupe de déformation (beamstate.triggerDeformGroup) : bascule vers un matériau cassé, par exemple pour briser une vitre.
---Source : lua/ge/extensions/scenario/scenariohelper.lua:34
---@param vehicleName string Nom du véhicule. Doit exister, sinon erreur.
---@param group string Nom du deformGroup défini dans le jbeam.
function scenario_scenariohelper.triggerDeformGroup(vehicleName, group) end

