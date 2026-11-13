---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/variableStorage.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Instance de stockage de variables. Champs : mgr, id, variables (nom -> {name, baseValue, value, index, type, fixedType, undeletable, mergeStrat, mergeFuns, monitored, keepAfterStop}), variableChanges, sortedVariableNames, customVariableOrder, types.
---@class flowgraph_variableStorage
local flowgraph_variableStorage = {}

--- Appelé à l'arrêt : vide les changements en attente et remet chaque variable à sa valeur de base (ou conserve sa valeur si `keepAfterStop`).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/variableStorage.lua:340
function flowgraph_variableStorage:_executionStopped() end

--- Appelé quand le projet est vidé ; équivaut à `_executionStopped`.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/variableStorage.lua:336
function flowgraph_variableStorage:_onClear() end

--- Recharge les variables depuis les données de sauvegarde (accepte l'ancien format sans `list`), triées par index puis nom.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/variableStorage.lua:372
---@param data table Données sauvegardées.
function flowgraph_variableStorage:_onDeserialized(data) end

--- Sérialise les variables : {list = [{name, value=baseValue, index, type, mergeStrat, fixedType, undeletable, monitored, keep}], customVariableOrder}.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/variableStorage.lua:351
---@return table  Données de sauvegarde.
function flowgraph_variableStorage:_onSerialize() end

--- Ajoute une variable. Renvoie false (et log une erreur) si elle existe déjà.
---Source : lua/ge/extensions/flowgraph/variableStorage.lua:119
---@param name string Nom.
---@param value any Valeur de départ.
---@param type string Type.
---@param mergeStrat string Nom de stratégie de fusion.
---@param fixedType boolean|nil Interdit le changement de type.
---@param undeletable boolean|nil Interdit la suppression.
---@return boolean  true si ajoutée.
function flowgraph_variableStorage:addVariable(name, value, type, mergeStrat, fixedType, undeletable) end

--- Soumet une valeur à la stratégie de fusion de la variable ; effective après `finalizeChanges`. Refuse nil.
---Source : lua/ge/extensions/flowgraph/variableStorage.lua:314
---@param name string Variable.
---@param value any Valeur.
---@return boolean  false si inexistante ou valeur nil.
function flowgraph_variableStorage:change(name, value) end

--- Change la valeur de base et la valeur courante, après test de compatibilité de type.
---Source : lua/ge/extensions/flowgraph/variableStorage.lua:291
---@param name string Variable.
---@param value any Nouvelle valeur.
---@return boolean  false si inexistante ou type incompatible.
function flowgraph_variableStorage:changeBase(name, value) end

--- Déplace une variable dans `customVariableOrder` pour qu'elle soit placée avant/après l'index `newIdx` (relatif à l'ordre d'origine).
---Source : lua/ge/extensions/flowgraph/variableStorage.lua:101
---@param name string Variable à déplacer.
---@param newIdx integer Nouvel index.
function flowgraph_variableStorage:changeCustomVariableOrder(name, newIdx) end

--- Change immédiatement la valeur courante, sans fusion ni test de type.
---Source : lua/ge/extensions/flowgraph/variableStorage.lua:305
---@param name string Variable.
---@param value any Nouvelle valeur.
---@return boolean  false si inexistante.
function flowgraph_variableStorage:changeInstant(name, value) end

--- Supprime toutes les variables et les changements en attente.
---Source : lua/ge/extensions/flowgraph/variableStorage.lua:82
function flowgraph_variableStorage:clear() end

--- Finalise les fusions de toutes les variables modifiées (`finalize`, puis `init`) et vide la liste des changements. Appelé par le manager en fin de frame (déduit du code).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/variableStorage.lua:328
function flowgraph_variableStorage:finalizeChanges() end

--- Lit la valeur courante d'une variable. Log une erreur si elle n'existe pas.
---Source : lua/ge/extensions/flowgraph/variableStorage.lua:57
---@param name string Nom.
---@return any  Valeur ou nil.
---@return boolean  true si la variable existe.
function flowgraph_variableStorage:get(name) end

--- Renvoie la table complète de la variable (valeur, type, stratégie…).
---Source : lua/ge/extensions/flowgraph/variableStorage.lua:70
---@param name string Nom.
---@return table|nil  Variable.
---@return boolean  true si elle existe.
function flowgraph_variableStorage:getFull(name) end

--- Plus grand `index` de tri parmi les variables (0 si aucune).
---Source : lua/ge/extensions/flowgraph/variableStorage.lua:111
---@return integer  Index max.
function flowgraph_variableStorage:getMaxSortIndex() end

--- Renvoie les stratégies de fusion triées proposées pour un type (voir `sortedMergeFuns`).
---Source : lua/ge/extensions/flowgraph/variableStorage.lua:48
---@param type string Type de variable (ou 'any', 'all').
---@return table[]  Liste {name, desc, num}, vide si inconnu.
function flowgraph_variableStorage:getMergeStrats(type) end

--- Renvoie « (nom du manager / id du manager) » pour les logs.
---Source : lua/ge/extensions/flowgraph/variableStorage.lua:40
---@return string  Nom d'affichage.
function flowgraph_variableStorage:getName() end

--- Liste des types de variables supportés (string, number, bool, vec3, quat, color) avec couleur et icône.
---Source : lua/ge/extensions/flowgraph/variableStorage.lua:44
---@return table[]  Types.
function flowgraph_variableStorage:getTypes() end

--- Constructeur : prend un id unique du manager, crée les tables et complète la liste des types avec couleur et icône de l'éditeur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/variableStorage.lua:25
---@param mgr table Manager de flowgraph.
function flowgraph_variableStorage:init(mgr) end

--- Reconstruit `sortedVariableNames`, noms triés par `index`.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/variableStorage.lua:88
function flowgraph_variableStorage:refreshSortedVariableNames() end

--- Supprime une variable (sauf `undeletable`) et la retire de l'ordre personnalisé.
---Source : lua/ge/extensions/flowgraph/variableStorage.lua:236
---@param name string Variable.
---@return boolean  false si inexistante ou non supprimable.
function flowgraph_variableStorage:removeVariable(name) end

--- Renomme une variable et prévient les nœuds getVariable/setVariable de tous les graphes et macros.
---Source : lua/ge/extensions/flowgraph/variableStorage.lua:255
---@param name string Ancien nom.
---@param newName string Nouveau nom.
---@return boolean  false si `newName` existe déjà.
function flowgraph_variableStorage:renameVariable(name, newName) end

--- Active/désactive le typage fixe.
---Source : lua/ge/extensions/flowgraph/variableStorage.lua:208
---@param name string Variable.
---@param fixedType boolean|nil true pour fixer.
---@return boolean  false si inexistante.
function flowgraph_variableStorage:setFixedType(name, fixedType) end

--- Si true, la valeur courante devient la valeur de base à l'arrêt du projet (conservée).
---Source : lua/ge/extensions/flowgraph/variableStorage.lua:226
---@param name string Variable.
---@param keep boolean|nil true pour conserver.
---@return boolean  false si inexistante.
function flowgraph_variableStorage:setKeepAfterStop(name, keep) end

--- Fixe la stratégie de fusion et l'initialise. Une stratégie invalide est remplacée par une valeur par défaut selon le type.
---Source : lua/ge/extensions/flowgraph/variableStorage.lua:140
---@param name string Variable.
---@param strat string Stratégie.
---@return boolean  false si la variable n'existe pas.
function flowgraph_variableStorage:setMergeStrat(name, strat) end

--- Marque la variable comme surveillée (affichage dans l'éditeur).
---Source : lua/ge/extensions/flowgraph/variableStorage.lua:217
---@param name string Variable.
---@param monitor boolean|nil true pour surveiller.
---@return boolean  false si inexistante.
function flowgraph_variableStorage:setMonitor(name, monitor) end

--- Change le type d'une variable (valeurs remises à un défaut du type), repasse en stratégie `last` et prévient les nœuds getVariable/setVariable.
---Source : lua/ge/extensions/flowgraph/variableStorage.lua:163
---@param name string Variable.
---@param type string Nouveau type.
---@return boolean  false si inexistante ou type fixe.
function flowgraph_variableStorage:updateType(name, type) end

--- Dit si une variable existe.
---Source : lua/ge/extensions/flowgraph/variableStorage.lua:52
---@param name string Nom.
---@return boolean  true si elle existe.
function flowgraph_variableStorage:variableExists(name) end

