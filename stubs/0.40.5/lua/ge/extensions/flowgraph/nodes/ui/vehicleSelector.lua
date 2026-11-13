---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/ui/vehicleSelector.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud flowgraph ; chaque instance représente un nœud dans un graphe.
---@class flowgraph_nodes_ui_vehicleSelector_C
local flowgraph_nodes_ui_vehicleSelector_C = {}

--- Remet les pins de sortie à false et réinitialise l'état.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/vehicleSelector.lua:129
function flowgraph_nodes_ui_vehicleSelector_C:_executionStarted() end

--- Ferme le dialogue et réinitialise l'état.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/vehicleSelector.lua:140
function flowgraph_nodes_ui_vehicleSelector_C:_executionStopped() end

--- Marque exited=true et ferme le dialogue.
---Source : lua/ge/extensions/flowgraph/nodes/ui/vehicleSelector.lua:257
function flowgraph_nodes_ui_vehicleSelector_C:abandonFromUi() end

--- Construit l'écran de démarrage via le module ui (en-tête, bouton Start, panneaux, boutons Change Opponent / Abandon) puis finishUIBuilding. Logue une erreur si le module ui est absent.
---Source : lua/ge/extensions/flowgraph/nodes/ui/vehicleSelector.lua:185
function flowgraph_nodes_ui_vehicleSelector_C:buildScreen() end

--- Si l'écran est construit, navigue vers « play » et efface modules.ui.uiLayout.
---Source : lua/ge/extensions/flowgraph/nodes/ui/vehicleSelector.lua:163
function flowgraph_nodes_ui_vehicleSelector_C:closeDialogue() end

--- Renvoie {model, config} du véhicule actuel du joueur (core_vehicles.getCurrentVehicleDetails) ou nil.
---Source : lua/ge/extensions/flowgraph/nodes/ui/vehicleSelector.lua:177
function flowgraph_nodes_ui_vehicleSelector_C:getDefaultVehicle() end

--- Renvoie la sélection mémorisée sur le gestionnaire flowgraph (mgr._vehicleSelectorSavedVeh), partagée entre tous les Vehicle Selector du projet.
---Source : lua/ge/extensions/flowgraph/nodes/ui/vehicleSelector.lua:119
function flowgraph_nodes_ui_vehicleSelector_C:getSavedVehData() end

--- Renvoie les données d'affichage (nom, miniature, stats) du véhicule sélectionné, ou nil.
---Source : lua/ge/extensions/flowgraph/nodes/ui/vehicleSelector.lua:172
function flowgraph_nodes_ui_vehicleSelector_C:getSelectedVehicleDisplayData() end

--- Initialise built/done/exited/_needsRebuild et la sélection.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/vehicleSelector.lua:109
function flowgraph_nodes_ui_vehicleSelector_C:init() end

--- Hook de fin de mission côté client ; ferme le dialogue.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/vehicleSelector.lua:149
function flowgraph_nodes_ui_vehicleSelector_C:onClientEndMission() end

--- Ouvre le sélecteur de véhicules du jeu (ui_vehicleSelector_general.openVehicleSelectorForChallenge, chargé au besoin). Au retour, mémorise le choix et demande une reconstruction de l'écran.
---Source : lua/ge/extensions/flowgraph/nodes/ui/vehicleSelector.lua:234
function flowgraph_nodes_ui_vehicleSelector_C:requestChangeOpponent() end

--- Réinitialise built/done/exited et remet les pins de sortie à false (appelée via le pin reset).
---Source : lua/ge/extensions/flowgraph/nodes/ui/vehicleSelector.lua:153
function flowgraph_nodes_ui_vehicleSelector_C:reset() end

--- Mémorise la sélection sur le gestionnaire flowgraph.
---Source : lua/ge/extensions/flowgraph/nodes/ui/vehicleSelector.lua:123
---@param vehData table {model, config, additionalData}.
function flowgraph_nodes_ui_vehicleSelector_C:setSavedVehData(vehData) end

--- Marque le choix comme validé (done=true) et ferme le dialogue.
---Source : lua/ge/extensions/flowgraph/nodes/ui/vehicleSelector.lua:252
function flowgraph_nodes_ui_vehicleSelector_C:startFromUi() end

--- Gère reset ; à la première frame choisit le véhicule (sauvegardé si saveSelection, sinon défaut) et construit l'écran ; reconstruit si demandé ; publie model, config, color, dial, flow (done) et exit.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/vehicleSelector.lua:262
function flowgraph_nodes_ui_vehicleSelector_C:work() end

