---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/modules/buttonModule.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Module flowgraph (moduleOrder 0) qui gère des boutons personnalisés affichés dans l'interface pendant un projet flowgraph. Chaque bouton a un label, un style, un état actif, un ordre, et des variables clicked/complete stockées dans un variableStorage. Dans afterTrigger, la liste des boutons actifs, triée par ordre puis id, est envoyée à l'UI via guihooks.trigger('CustomFGButtons', data). Le clic revient par une commande Lua qui appelle buttonClicked.
--- Accès : `require("extensions/flowgraph/modules/buttonModule")` (fichier sous extensions/ mais pas une extension classique)
---@class flowgraph_modules_buttonModule
flowgraph_modules_buttonModule = {}

--- Ajoute un bouton et renvoie son id. (assignée dynamiquement)
---Source : lua/ge/extensions/flowgraph/modules/buttonModule.lua:dyn
---@param data table champs facultatifs label (défaut 'Button <id>'), style (défaut 'default'), active (défaut true), order (défaut id)
---@return integer  id du bouton
function flowgraph_modules_buttonModule.addButton(data) end

--- Appelé après le tick du graphe : finalise les variables, envoie les boutons actifs triés à l'UI si modifiés, puis remet clicked à false. (assignée dynamiquement)
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/modules/buttonModule.lua:dyn
function flowgraph_modules_buttonModule.afterTrigger() end

--- Appelé quand l'UI signale un clic : met clicked et complete à true. (assignée dynamiquement)
---Source : lua/ge/extensions/flowgraph/modules/buttonModule.lua:dyn
---@param id integer id du bouton
function flowgraph_modules_buttonModule.buttonClicked(id) end

--- Vide variables et boutons, remet le compteur d'ids à 0 et envoie une liste vide à l'UI (CustomFGButtons). (assignée dynamiquement)
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/modules/buttonModule.lua:dyn
function flowgraph_modules_buttonModule.clear() end

--- Appelé à l'arrêt du projet : appelle clear() (les boutons disparaissent de l'UI). (assignée dynamiquement)
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/modules/buttonModule.lua:dyn
function flowgraph_modules_buttonModule.executionStopped() end

--- Renvoie la table du bouton (champs de type variable : label, style, active, order, clicked, complete). (assignée dynamiquement)
---Source : lua/ge/extensions/flowgraph/modules/buttonModule.lua:dyn
---@param id integer id du bouton
---@return table|nil  bouton
function flowgraph_modules_buttonModule.getButton(id) end

--- Construit la chaîne de commande Lua exécutée par l'UI au clic : récupère le module 'button' du manager et appelle buttonClicked(id). (assignée dynamiquement)
---Source : lua/ge/extensions/flowgraph/modules/buttonModule.lua:dyn
---@param id integer id du bouton
---@return string  code Lua
function flowgraph_modules_buttonModule.getCmd(id) end

--- Incrémente et renvoie un id de bouton. (assignée dynamiquement)
---Source : lua/ge/extensions/flowgraph/modules/buttonModule.lua:dyn
---@return integer  id
function flowgraph_modules_buttonModule.getFreeId() end

--- Crée le variableStorage et appelle clear(). (assignée dynamiquement)
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/modules/buttonModule.lua:dyn
function flowgraph_modules_buttonModule.init() end

--- Change un champ du bouton via le variableStorage (appliqué à la fin du tick) et marque la liste comme modifiée. (assignée dynamiquement)
---Source : lua/ge/extensions/flowgraph/modules/buttonModule.lua:dyn
---@param id integer id du bouton
---@param field string label, style, active, order, clicked ou complete
---@param val any nouvelle valeur
function flowgraph_modules_buttonModule.set(id, field, val) end

--- Classe locale `C` de lua/ge/extensions/flowgraph/modules/buttonModule.lua
---@class flowgraph_modules_buttonModule_C
local flowgraph_modules_buttonModule_C = {}

--- adds a new Button.
---Source : lua/ge/extensions/flowgraph/modules/buttonModule.lua:27
---@param data any
function flowgraph_modules_buttonModule_C:addButton(data) end

---Source : lua/ge/extensions/flowgraph/modules/buttonModule.lua:67
function flowgraph_modules_buttonModule_C:afterTrigger() end

---Source : lua/ge/extensions/flowgraph/modules/buttonModule.lua:57
---@param id any
function flowgraph_modules_buttonModule_C:buttonClicked(id) end

---Source : lua/ge/extensions/flowgraph/modules/buttonModule.lua:18
function flowgraph_modules_buttonModule_C:clear() end

---Source : lua/ge/extensions/flowgraph/modules/buttonModule.lua:93
function flowgraph_modules_buttonModule_C:executionStopped() end

---Source : lua/ge/extensions/flowgraph/modules/buttonModule.lua:51
---@param id any
function flowgraph_modules_buttonModule_C:getButton(id) end

---Source : lua/ge/extensions/flowgraph/modules/buttonModule.lua:62
---@param id any
function flowgraph_modules_buttonModule_C:getCmd(id) end

---Source : lua/ge/extensions/flowgraph/modules/buttonModule.lua:8
function flowgraph_modules_buttonModule_C:getFreeId() end

---Source : lua/ge/extensions/flowgraph/modules/buttonModule.lua:13
function flowgraph_modules_buttonModule_C:init() end

---Source : lua/ge/extensions/flowgraph/modules/buttonModule.lua:55
---@param id any
---@param field any
---@param val any
function flowgraph_modules_buttonModule_C:set(id, field, val) end

