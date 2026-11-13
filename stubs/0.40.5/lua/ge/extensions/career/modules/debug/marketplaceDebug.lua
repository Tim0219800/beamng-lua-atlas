---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/debug/marketplaceDebug.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Onglet de debug carrière « Marketplace ». Affiche les véhicules de l'inventaire (et s'ils sont en vente via career_modules_marketplace.findVehicleListing), les annonces en cours avec leurs offres (valeur, écart, durée restante) et boutons Accept/Decline, plus un bouton 'Generate Random Offer'.
--- Accès : extension `career_modules_debug_marketplaceDebug` : `extensions.load("career_modules_debug_marketplaceDebug")`, puis la globale `career_modules_debug_marketplaceDebug`
---@class career_modules_debug_marketplaceDebug
---@field debugName string 'Marketplace'.
---@field debugOrder number Ordre de tri (0).
career_modules_debug_marketplaceDebug = {}

--- Dessine les sections 'Vehicle Inventory', 'Current Listings' (offres avec Accept/Decline via career_modules_marketplace.acceptOffer/declineOffer) et le bouton 'Generate Random Offer' (generateOffer).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/debug/marketplaceDebug.lua:42
function career_modules_debug_marketplaceDebug.drawDebugMenu() end

--- Hook de carrière ; corps vide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/debug/marketplaceDebug.lua:111
function career_modules_debug_marketplaceDebug.onCareerActivated() end

