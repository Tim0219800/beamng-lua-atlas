---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/career/onVehicleShoppingEvent.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud.
---@class flowgraph_nodes_career_onVehicleShoppingEvent_C
local flowgraph_nodes_career_onVehicleShoppingEvent_C = {}

--- Crée la table de drapeaux.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/career/onVehicleShoppingEvent.lua:26
function flowgraph_nodes_career_onVehicleShoppingEvent_C:init() end

--- Hook : lève closedMenu quand le joueur revient en jeu.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/career/onVehicleShoppingEvent.lua:64
---@param enteredPlay boolean vrai si on entre dans l'état de jeu
function flowgraph_nodes_career_onVehicleShoppingEvent_C:onUIPlayStateChanged(enteredPlay) end

--- Hook : lève vehicleBought et convertit data.inventoryId en id de véhicule (vehId).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/career/onVehicleShoppingEvent.lua:55
---@param data table contient inventoryId
function flowgraph_nodes_career_onVehicleShoppingEvent_C:onVehicleAddedToInventory(data) end

--- Hook : lève closedMenu.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/career/onVehicleShoppingEvent.lua:60
function flowgraph_nodes_career_onVehicleShoppingEvent_C:onVehicleShoppingMenuClosed() end

--- Hook : lève openedMenu.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/career/onVehicleShoppingEvent.lua:43
---@param data any non utilisé
function flowgraph_nodes_career_onVehicleShoppingEvent_C:onVehicleShoppingMenuOpened(data) end

--- Hook : lève openedDetail.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/career/onVehicleShoppingEvent.lua:51
---@param data any non utilisé
function flowgraph_nodes_career_onVehicleShoppingEvent_C:onVehicleShoppingPurchaseMenuOpened(data) end

--- Hook : lève vehicleSpawned.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/career/onVehicleShoppingEvent.lua:47
---@param data any non utilisé
function flowgraph_nodes_career_onVehicleShoppingEvent_C:onVehicleShoppingVehicleShown(data) end

--- Chaque frame : remet à faux cinq sorties flow, applique et efface les drapeaux, met à jour testDriveActive.
---Source : lua/ge/extensions/flowgraph/nodes/career/onVehicleShoppingEvent.lua:30
---@param args any non utilisé
function flowgraph_nodes_career_onVehicleShoppingEvent_C:work(args) end

