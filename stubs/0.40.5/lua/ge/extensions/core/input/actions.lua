---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/input/actions.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Extension GE `core_input_actions` : registre des actions d'entrée (ce que les touches/manettes peuvent déclencher). Il lit les fichiers lua/ge/extensions/core/input/actions/*.json (actions communes) et vehicles/<véhicule>/input_actions*.json plus les inputActions des fichiers jbeam (actions spécifiques à un véhicule), les met en cache, crée côté C++ les ActionMap nécessaires et traduit une action en paramètres de commande pour le moteur. Un moddeur s'en sert pour déclencher une action par son nom ou lister les actions disponibles.
--- Accès : extension `core_input_actions` : `extensions.load("core_input_actions")`, puis la globale `core_input_actions`
---@class core_input_actions
---@field dependencies string[] {'core_input_categories', 'core_input_deprecatedActions', 'license'}.
---@field menuActionMapNames table<string, boolean> Ensemble des noms d'ActionMap 'menu indépendants' (poussés/pushés dès leur création). Vidé et reconstruit à chaque lecture des actions actives.
---@field menuIndependentPrefix string 'MenuIndependent_' : préfixe des ActionMap dont l'action déclare actionMap = 'MenuIndependent'.
core_input_actions = {}

--- Convertit une action en paramètres utilisés par le moteur lors d'un déclenchement. Détermine l'ActionMap (Normal, Menu, VehicleCommon, VehicleSpecific, ou celle de l'action), les callbacks onChange/onDown/onUp, le contexte de commande et isCentered. Loggue les catégories invalides et les contextes dépréciés.
---Source : lua/ge/extensions/core/input/actions.lua:203
---@param actionName string Nom unique de l'action.
---@param actionCache table|nil Définition déjà connue de l'action ; nécessaire uniquement quand l'appel vient de getActions (évite une récursion infinie).
---@return boolean  true.
---@return string  Nom de l'actionmap.
---@return boolean  actsOnChange.
---@return string  Code onChange (ou onRelative).
---@return boolean  actsOnDown.
---@return string  Code onDown.
---@return boolean  actsOnUp.
---@return string  Code onUp.
---@return boolean  isRelative (onRelative utilisé).
---@return userdata  ActionMapCommandContext (type VLUA/ELUA/TLUA/BVLUA/TS).
---@return boolean  isCentered.
function core_input_actions.actionToCommands(actionName, actionCache) end

--- Exécute le code d'une action : vlua -> envoyé au véhicule vehicleId ; elua/tlua -> Lua:queueLuaCommand (GE) ; bvlua -> à tous les objets. onDown est utilisé si actionValue == 1, onUp si actionValue == 0, sinon onChange. Les jetons VALUE, VEHICLEID, PLAYER, TRIGGERID… sont remplacés dans le code.
---Source : lua/ge/extensions/core/input/actions.lua:307
---@param evt table Définition d'action avec ctx (nil = vlua), onDown, onUp, onChange.
---@param actionValue number Valeur de l'action (1 = appui, 0 = relâché, ou valeur analogique pour onChange).
---@param vehicleId integer Id du véhicule cible (contexte vlua).
---@param player integer|nil Indice du joueur ; défaut 0.
---@param triggerId any Valeur pour TRIGGERID (chaîne vide si nil).
---@return integer|nil  1 pour GE/bvlua si une commande a été envoyée, 0 sinon ; pour vlua le retour de queueCmd, donc nil (voir notes).
function core_input_actions.executeCommand(evt, actionValue, vehicleId, player, triggerId) end

--- Actions actuellement actives : actions des véhicules existants (marquées cat 'vehicle_specific' si utilisables, sinon 'vehicle_specific_unusable') plus les actions communes. Crée au passage les ActionMap C++ manquantes.
---Source : lua/ge/extensions/core/input/actions.lua:360
---@return table<string, table>  Nom unique de l'action -> définition.
function core_input_actions.getActiveActions() end

--- Actions désactivées (licence ou fichiers _nonshipping en version shipping).
---Source : lua/ge/extensions/core/input/actions.lua:361
---@return table<string, table>  Nom unique -> définition.
function core_input_actions.getInactiveActions() end

--- Préfixe le nom d'action par le nom du véhicule : '<véhicule>__<action>'.
---Source : lua/ge/extensions/core/input/actions.lua:16
---@param actionName string Nom court.
---@param vehicleName string|nil Nom du véhicule ; nil = nom inchangé.
---@return string  Nom unique.
function core_input_actions.nameToUniqueName(actionName, vehicleName) end

--- Hook de modification de fichier : si un JSON sous /lua/ge/extensions/core/input/actions change, vide les caches.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/input/actions.lua:265
---@param filename string Chemin du fichier modifié.
function core_input_actions.onFileChanged(filename) end

--- Hook au premier update : vide le cache des actions.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/input/actions.lua:257
function core_input_actions.onFirstUpdate() end

--- Hook au changement de véhicule joueur : vide le cache des actions (les actions spécifiques changent).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/input/actions.lua:261
---@param oldId integer Ancien véhicule.
---@param newId integer Nouveau véhicule.
---@param player integer Indice du joueur.
function core_input_actions.onVehicleSwitched(oldId, newId, player) end

--- Simule l'appui d'une action nommée (ActionMap.triggerBindingByNameDigital(name, true)).
---Source : lua/ge/extensions/core/input/actions.lua:273
---@param actionName string Nom de l'action.
function core_input_actions.triggerDown(actionName) end

--- Simule un appui puis un relâchement immédiats.
---Source : lua/ge/extensions/core/input/actions.lua:279
---@param actionName string Nom de l'action.
function core_input_actions.triggerDownUp(actionName) end

--- Simule le relâchement d'une action nommée.
---Source : lua/ge/extensions/core/input/actions.lua:276
---@param actionName string Nom de l'action.
function core_input_actions.triggerUp(actionName) end

--- Opération inverse : retire le préfixe '<véhicule>__'. Loggue une erreur et renvoie le nom inchangé si le préfixe manque.
---Source : lua/ge/extensions/core/input/actions.lua:20
---@param uniqueActionName string Nom unique.
---@param vehicleName string|nil Nom du véhicule.
---@return string  Nom court.
function core_input_actions.uniqueNameToName(uniqueActionName, vehicleName) end

--- Résout un nom d'action : renvoie le nom s'il est actif ; suit récursivement les remplacements de core_input_deprecatedActions ; renvoie nil (avec log) si l'action est inactive, obsolète ou inconnue.
---Source : lua/ge/extensions/core/input/actions.lua:171
---@param action string Nom unique de l'action.
---@return string|nil  Nom valide ou nil.
function core_input_actions.upgradeAction(action) end

