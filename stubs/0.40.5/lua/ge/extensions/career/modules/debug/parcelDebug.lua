---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/debug/parcelDebug.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Onglet de debug carrière « Delivery > Parcels ». Fenêtre ImGui 'Parcel Debug' montrant, pour chaque facilité de livraison (toutes, la plus proche dans un rayon de 50 m, ou une choisie), l'en-tête, les colis sortants (outCargo) et entrants (inCargo). L'entrée '> Available parcel per facility' imprime dans la console le nombre de colis disponibles par niveau (L1 à L5) et par facilité.
--- Accès : extension `career_modules_debug_parcelDebug` : `extensions.load("career_modules_debug_parcelDebug")`, puis la globale `career_modules_debug_parcelDebug`
---@class career_modules_debug_parcelDebug
---@field debugName string 'Delivery > Parcels'.
---@field debugOrder number Ordre de tri (10).
career_modules_debug_parcelDebug = {}

--- Entrée '> Available parcel per facility' : compte les colis non expirés/non livrés par palier minimal (selon career_modules_delivery_parcelMods.lockedBecauseOfMods) et imprime le tableau trié.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/debug/parcelDebug.lua:33
function career_modules_debug_parcelDebug.drawDebugFunctions() end

--- Dessine la fenêtre 'Parcel Debug' : temps de livraison, choix de facilité (all, auto, ou id) puis les tables des facilités retenues.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/debug/parcelDebug.lua:85
function career_modules_debug_parcelDebug.drawDebugMenu() end

--- Dessine l'en-tête (tableau) d'une facilité de livraison : nom, stockages et informations de génération.
---Source : lua/ge/extensions/career/modules/debug/parcelDebug.lua:136
---@param facility table Facilité de livraison.
---@param outCargo table Colis sortants de la facilité.
---@param inCargo table Colis entrants de la facilité.
---@param ignoreGenerators boolean|nil Masque les informations de générateurs si vrai.
function career_modules_debug_parcelDebug.drawFacilityHeader(facility, outCargo, inCargo, ignoreGenerators) end

--- Dessine le tableau des colis entrants d'une facilité (Id, Name, Slots…).
---Source : lua/ge/extensions/career/modules/debug/parcelDebug.lua:272
---@param facility table Facilité de livraison.
---@param inCargo table Colis entrants.
function career_modules_debug_parcelDebug.drawFacilityInCargo(facility, inCargo) end

--- Dessine le tableau des colis sortants d'une facilité (Id, Name…).
---Source : lua/ge/extensions/career/modules/debug/parcelDebug.lua:200
---@param facility table Facilité de livraison.
---@param outCargo table Colis sortants.
function career_modules_debug_parcelDebug.drawFacilityOutCargo(facility, outCargo) end

--- Hook : mémorise les modules delivery (parcelManager, cargoScreen, general, generator, progress, vehicleOfferManager).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/debug/parcelDebug.lua:12
function career_modules_debug_parcelDebug.onCareerActivated() end

