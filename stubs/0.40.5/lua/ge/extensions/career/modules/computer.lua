---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/computer.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Menu « ordinateur » du garage en mode carrière. openMenu construit la liste des véhicules du garage le plus proche, laisse les autres modules ajouter leurs boutons via le hook onComputerAddFunctions, démarre un tether (le menu se ferme si le joueur s'éloigne) puis navigue vers l'écran UI 'career.computer'. Un moddeur ajoute un bouton en implémentant onComputerAddFunctions(menuData, computerFunctions) dans son extension.
--- Accès : extension `career_modules_computer` : `extensions.load("career_modules_computer")`, puis la globale `career_modules_computer`
---@class career_modules_computer
---@field dependencies string[] {"career_career"} : extensions chargées avant ce module.
---@field reasons table<string, table> Raisons standard de désactivation d'un bouton : tutorialActive, hasBoughtStarterVehicle (type 'text') et needsRepair (type 'needsRepair'), chacune avec un label de traduction.
career_modules_computer = {}

--- Ferme tous les menus carrière (career_career.closeAllMenus). Sert aussi de callback de tether quand le joueur s'éloigne.
---Source : lua/ge/extensions/career/modules/computer.lua:111
function career_modules_computer.closeMenu() end

--- Appelée par l'UI lors d'un clic : retrouve le bouton (vehicleSpecific[inventoryId] si inventoryId est donné, sinon general) et exécute son callback(computerId).
---Source : lua/ge/extensions/career/modules/computer.lua:57
---@param buttonId string Clé du bouton dans computerFunctions.
---@param inventoryId integer|nil Id d'inventaire du véhicule pour un bouton spécifique à un véhicule.
function career_modules_computer.computerButtonCallback(buttonId, inventoryId) end

--- Renvoie à l'UI une copie des données du menu : computerFunctions (labels de raisons traduits, clés inventoryId converties en chaînes), vehicles (avec thumbnail et inventoryId en chaîne), facilityName, resetActiveVehicleIndex, computerId. Table vide si le menu n'a pas été ouvert.
---Source : lua/ge/extensions/career/modules/computer.lua:68
---@return table  Données pour l'écran career.computer.
function career_modules_computer.getComputerUIData() end

--- Hook appelé à la fermeture du menu ; supprime le tether (tether.remove = true).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/computer.lua:107
function career_modules_computer.onMenuClosed() end

--- Récupère la facilité 'computer' par son id via freeroam_facilities.getFacility puis appelle openMenu.
---Source : lua/ge/extensions/career/modules/computer.lua:115
---@param computerId string Identifiant de la facilité ordinateur.
function career_modules_computer.openComputerMenuById(computerId) end

--- Ouvre le menu ordinateur pour une facilité : liste les véhicules du garage le plus proche (nom, besoin de réparation, date de saleté), déclenche onComputerAddFunctions, démarre le tether, navigue vers 'career.computer' puis déclenche onComputerMenuOpened.
---Source : lua/ge/extensions/career/modules/computer.lua:18
---@param computerFacility table Facilité 'computer' (champs id, name, doors).
---@param resetActiveVehicleIndex boolean|nil Transmis à l'UI dans menuData.resetActiveVehicleIndex.
---@param activityElement any Non utilisé dans la fonction.
function career_modules_computer.openMenu(computerFacility, resetActiveVehicleIndex, activityElement) end

