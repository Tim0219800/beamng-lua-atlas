---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/debug/vehOfferDebug.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Onglet de debug carrière « Delivery > Veh Offers ». Fenêtre 'Vehicle Offer Debug' listant, par facilité de livraison, les offres de véhicules/remorques non expirées (career_modules_delivery_vehicleOfferManager). L'entrée '> Available vehicle/trailer per facility' imprime le nombre d'offres par niveau de déblocage (1 à 5) via isVehicleTagUnlocked.
--- Accès : extension `career_modules_debug_vehOfferDebug` : `extensions.load("career_modules_debug_vehOfferDebug")`, puis la globale `career_modules_debug_vehOfferDebug`
---@class career_modules_debug_vehOfferDebug
---@field debugName string 'Delivery > Veh Offers'.
---@field debugOrder number Ordre de tri (11).
career_modules_debug_vehOfferDebug = {}

--- Entrées '> Available vehicle per facility' et '> Available trailer per facility' : comptent les offres non expirées par niveau et impriment le résultat trié.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/debug/vehOfferDebug.lua:35
function career_modules_debug_vehOfferDebug.drawDebugFunctions() end

--- Dessine la fenêtre 'Vehicle Offer Debug' : temps de livraison, choix de facilité (all, auto ou id) et tableaux d'offres.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/debug/vehOfferDebug.lua:117
function career_modules_debug_vehOfferDebug.drawDebugMenu() end

--- Hook : mémorise les modules delivery et parcelDebug.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/debug/vehOfferDebug.lua:13
function career_modules_debug_vehOfferDebug.onCareerActivated() end

