---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/playerAbstract.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Écran « résumé du conducteur » (driver abstract) accessible depuis l'ordinateur du garage en carrière. Il ajoute une entrée au menu de l'ordinateur et fournit à l'UI les données calculées par le module d'assurance (career_modules_insurance_insurance.getPlayerAbstractData).
--- Accès : extension `career_modules_playerAbstract` : `extensions.load("career_modules_playerAbstract")`, puis la globale `career_modules_playerAbstract`
---@class career_modules_playerAbstract
career_modules_playerAbstract = {}

--- Revient au menu de l'ordinateur d'origine, ou ferme tous les menus carrière s'il n'y en a pas.
---Source : lua/ge/extensions/career/modules/playerAbstract.lua:31
function career_modules_playerAbstract.closePlayerAbstractMenu() end

--- Renvoie les données du résumé du conducteur fournies par le module d'assurance.
---Source : lua/ge/extensions/career/modules/playerAbstract.lua:40
---@return table  Données du résumé.
function career_modules_playerAbstract.getPlayerAbstractData() end

--- Hook de l'ordinateur : ajoute la fonction playerAbstract (ordre 15, catégorie general) si l'installation l'autorise.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/playerAbstract.lua:14
---@param menuData table Données du menu (computerFacility, hasBoughtStarterVehicle).
---@param computerFunctions table Tables de fonctions à compléter.
function career_modules_playerAbstract.onComputerAddFunctions(menuData, computerFunctions) end

--- Cycle de vie du routeur UI : oublie l'ordinateur d'origine en quittant l'écran.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/playerAbstract.lua:51
---@param context any Contexte du routeur.
---@param toRoute any Route cible.
---@param fromRoute any Route quittée.
---@param data table routeData.
function career_modules_playerAbstract.onRouteLeave(context, toRoute, fromRoute, data) end

--- Cycle de vie du routeur UI : place les données du résumé dans data.playerAbstract.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/playerAbstract.lua:46
---@param context any Contexte du routeur.
---@param toRoute any Route cible.
---@param fromRoute any Route précédente.
---@param data table routeData à remplir.
function career_modules_playerAbstract.onRouteMount(context, toRoute, fromRoute, data) end

--- Mémorise l'ordinateur d'origine et, s'il existe, navigue vers career.computer.playerAbstract puis déclenche le hook onComputerPlayerAbstract.
---Source : lua/ge/extensions/career/modules/playerAbstract.lua:6
---@param _originComputerId string|nil Id de l'ordinateur du garage.
function career_modules_playerAbstract.openPlayerAbstractMenu(_originComputerId) end

--- Pousse des données fraîches vers un écran déjà ouvert (guihooks playerAbstractData), par ex. après une remise à zéro du score.
---Source : lua/ge/extensions/career/modules/playerAbstract.lua:56
function career_modules_playerAbstract.sendPlayerAbstractDataToUI() end

