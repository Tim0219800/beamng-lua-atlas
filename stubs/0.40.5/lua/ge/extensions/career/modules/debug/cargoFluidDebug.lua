---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/debug/cargoFluidDebug.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Onglet de debug carrière « Delivery > Fluid Cargo ». Fenêtre ImGui 'Fluid CargoDebug' qui affiche, par facilité de livraison (toutes, la plus proche ou une choisie), les stockages de matériaux (fluides) : fournisseurs, débits et connexions, en s'appuyant sur career_modules_delivery_* et career_modules_debug_parcelDebug.
--- Accès : extension `career_modules_debug_cargoFluidDebug` : `extensions.load("career_modules_debug_cargoFluidDebug")`, puis la globale `career_modules_debug_cargoFluidDebug`
---@class career_modules_debug_cargoFluidDebug
---@field debugName string 'Delivery > Fluid Cargo'.
---@field debugOrder number Ordre de tri dans la fenêtre de debug (11).
career_modules_debug_cargoFluidDebug = {}

--- Sous-menu de fonctions de debug ; vide dans ce module.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/debug/cargoFluidDebug.lua:35
function career_modules_debug_cargoFluidDebug.drawDebugFunctions() end

--- Dessine la fenêtre 'Fluid CargoDebug' : temps de livraison, choix de facilité (all, auto, ou une facilité ayant des materialStorages) et tableau Fluid / Rate / Connections par facilité.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/debug/cargoFluidDebug.lua:111
function career_modules_debug_cargoFluidDebug.drawDebugMenu() end

--- Hook de carrière : mémorise les modules delivery (parcelManager, cargoScreen, general, generator, progress, vehicleOfferManager) et career_modules_debug_parcelDebug.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/debug/cargoFluidDebug.lua:13
function career_modules_debug_cargoFluidDebug.onCareerActivated() end

