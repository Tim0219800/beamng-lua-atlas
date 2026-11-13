---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/debug/vehicleDebug.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Onglet de debug carrière « Vehicles ». Permet d'ajouter le véhicule joueur à l'inventaire, de le réapparaître (career_modules_inventory.debugRespawnCurrentVehicle), de basculer sur un véhicule possédé (enterVehicle) ou de le vendre (sellVehicleFromInventory).
--- Accès : extension `career_modules_debug_vehicleDebug` : `extensions.load("career_modules_debug_vehicleDebug")`, puis la globale `career_modules_debug_vehicleDebug`
---@class career_modules_debug_vehicleDebug
---@field debugName string 'Vehicles'.
---@field debugOrder number Ordre de tri (2).
career_modules_debug_vehicleDebug = {}

--- Dessine les boutons d'ajout/réapparition du véhicule courant, le véhicule actuel de l'inventaire et la liste des véhicules possédés avec boutons d'entrée et de vente.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/debug/vehicleDebug.lua:9
function career_modules_debug_vehicleDebug.drawDebugMenu() end

