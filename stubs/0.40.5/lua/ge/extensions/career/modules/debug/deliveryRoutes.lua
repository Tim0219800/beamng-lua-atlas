---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/debug/deliveryRoutes.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Onglet de debug carrière « Delivery > Routes ». Fenêtre ImGui 'Delivery Access Points' listant les facilités de livraison et leurs points d'accès (accessPointsByName), avec sélection d'un point. Contient aussi un lancer de rayon souris (updateMouseInfo) et un helper de tracé d'arc, en grande partie inachevés.
--- Accès : extension `career_modules_debug_deliveryRoutes` : `extensions.load("career_modules_debug_deliveryRoutes")`, puis la globale `career_modules_debug_deliveryRoutes`
---@class career_modules_debug_deliveryRoutes
---@field debugName string 'Delivery > Routes'.
---@field debugOrder number Ordre de tri dans la fenêtre de debug (10).
career_modules_debug_deliveryRoutes = {}

--- Sous-menu de fonctions de debug ; vide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/debug/deliveryRoutes.lua:29
function career_modules_debug_deliveryRoutes.drawDebugFunctions() end

--- Dessine la fenêtre 'Delivery Access Points' : arbre des facilités (career_modules_delivery_generator.getFacilities) avec leurs points d'accès sélectionnables.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/debug/deliveryRoutes.lua:63
---@param dt number Delta de temps (non utilisé).
function career_modules_debug_deliveryRoutes.drawDebugMenu(dt) end

--- Hook de carrière : mémorise les modules delivery (parcelManager, cargoScreen, general, generator, progress, vehicleOfferManager).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/debug/deliveryRoutes.lua:12
function career_modules_debug_deliveryRoutes.onCareerActivated() end

--- Met à jour la table locale mouseInfo : position caméra, rayon souris, résultat de cameraMouseRayCast, états down/hold/up du bouton gauche (hors captation ImGui) et positions/normales de clic, maintien et relâchement.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/debug/deliveryRoutes.lua:172
function career_modules_debug_deliveryRoutes.updateMouseInfo() end

