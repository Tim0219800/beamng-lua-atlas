---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/gridSelectorUtils/buttonModule.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Petit utilitaire des sélecteurs en grille : gère un registre de boutons d'action. Chaque bouton reçoit un identifiant numérique incrémental et un callback ; l'UI renvoie l'identifiant pour déclencher l'action. `create()` renvoie une instance indépendante.
--- Accès : extension `ui_gridSelectorUtils_buttonModule` : `extensions.load("ui_gridSelectorUtils_buttonModule")`, puis la globale `ui_gridSelectorUtils_buttonModule`
---@class ui_gridSelectorUtils_buttonModule
ui_gridSelectorUtils_buttonModule = {}

--- Crée une instance de gestion de boutons avec son propre compteur et sa propre table.
---Source : lua/ge/extensions/ui/gridSelectorUtils/buttonModule.lua:4
---@return table  Instance avec getFreeButtonId, clearButtonFunctions, addButton, executeButton, getButtonInfo, getAllButtonInfos.
function ui_gridSelectorUtils_buttonModule.create() end

--- Objet renvoyé par create().
---@class ui_gridSelectorUtils_buttonModule_instance
local ui_gridSelectorUtils_buttonModule_instance = {}

--- Enregistre un callback et renvoie sa meta enrichie de `buttonId`.
---Source : lua/ge/extensions/ui/gridSelectorUtils/buttonModule.lua:dyn
---@param callback function Appelée avec additionalData lors de l'exécution.
---@param meta table|nil Métadonnées du bouton (libellé, etc.).
---@return table  meta avec buttonId.
function ui_gridSelectorUtils_buttonModule_instance:addButton(callback, meta) end

--- Vide la table des boutons (le compteur n'est pas remis à zéro).
---Source : lua/ge/extensions/ui/gridSelectorUtils/buttonModule.lua:dyn
function ui_gridSelectorUtils_buttonModule_instance:clearButtonFunctions() end

--- Exécute le callback du bouton et renvoie son résultat.
---Source : lua/ge/extensions/ui/gridSelectorUtils/buttonModule.lua:dyn
---@param buttonId integer Identifiant du bouton.
---@param additionalData any Transmis au callback.
---@return any  Valeur renvoyée par le callback, nil si bouton inconnu.
function ui_gridSelectorUtils_buttonModule_instance:executeButton(buttonId, additionalData) end

--- Renvoie la table complète des boutons indexée par identifiant.
---Source : lua/ge/extensions/ui/gridSelectorUtils/buttonModule.lua:dyn
---@return table<integer, table>  Tous les boutons.
function ui_gridSelectorUtils_buttonModule_instance:getAllButtonInfos() end

--- Renvoie { callback, meta } d'un bouton.
---Source : lua/ge/extensions/ui/gridSelectorUtils/buttonModule.lua:dyn
---@param buttonId integer Identifiant du bouton.
---@return table|nil  Info du bouton.
function ui_gridSelectorUtils_buttonModule_instance:getButtonInfo(buttonId) end

--- Incrémente le compteur et renvoie un nouvel identifiant.
---Source : lua/ge/extensions/ui/gridSelectorUtils/buttonModule.lua:dyn
---@return integer  Nouvel identifiant.
function ui_gridSelectorUtils_buttonModule_instance:getFreeButtonId() end

