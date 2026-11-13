---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/util/vehicleSelectUtil.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Instance du sélecteur. Champs d'options : allowedTypes, allowedSubtypes, modelBlacklist (table clé->true), configBlacklist (model -> {configKey = true}), enableConfigs (true), enablePaints (false), enableCustomConfig (false), paintLayers (3), columnWidth (80 par défaut, multiplié par im.uiscale).
---@class editor_util_vehicleSelectUtil
local editor_util_vehicleSelectUtil = {}

--- Charge si nécessaire les listes de modèles (filtrés par type et blacklist, triés par nom), de configs (filtrées par blacklist et sous-types) et de peintures du modèle courant.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/util/vehicleSelectUtil.lua:155
function editor_util_vehicleSelectUtil:fetchData() end

--- Convertit une peinture (table {r,g,b,a}, ou table avec baseColor en tableau ou en x/y/z/w) en tableau flottant imgui à 4 composantes ; blanc par défaut.
---Source : lua/ge/extensions/editor/util/vehicleSelectUtil.lua:135
---@param paintTbl table|nil Peinture ou baseColor.
---@return cdata  Tableau float[4] temporaire de l'éditeur (editor.getTempFloatArray4_TableTable).
function editor_util_vehicleSelectUtil:getPaintPtr(paintTbl) end

--- Constructeur : crée un id unique, réinitialise sélections et options, puis applique `data` s'il est donné.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/util/vehicleSelectUtil.lua:19
---@param name string|nil Nom affiché de l'instance ('Vehicle' par défaut).
---@param data table|nil Sélection initiale : model, config, customConfigPath, customConfigActive, configPath, paintName(2,3).
function editor_util_vehicleSelectUtil:init(name, data) end

--- Callback d'edit mode vide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/util/vehicleSelectUtil.lua:479
function editor_util_vehicleSelectUtil:onActivate() end

--- Callback d'edit mode vide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/util/vehicleSelectUtil.lua:482
function editor_util_vehicleSelectUtil:onDeactivate() end

--- Efface les configs, la config choisie et la config personnalisée.
---Source : lua/ge/extensions/editor/util/vehicleSelectUtil.lua:89
function editor_util_vehicleSelectUtil:resetConfig() end

--- Efface la liste des modèles et le modèle choisi.
---Source : lua/ge/extensions/editor/util/vehicleSelectUtil.lua:83
function editor_util_vehicleSelectUtil:resetModel() end

--- Remet les options par défaut (types autorisés, blacklists vides, enableConfigs vrai, enablePaints faux, 3 couches de peinture).
---Source : lua/ge/extensions/editor/util/vehicleSelectUtil.lua:115
function editor_util_vehicleSelectUtil:resetOptions() end

--- Efface les peintures disponibles et choisies.
---Source : lua/ge/extensions/editor/util/vehicleSelectUtil.lua:99
function editor_util_vehicleSelectUtil:resetPaint() end

--- Efface type, modèle, config et peintures.
---Source : lua/ge/extensions/editor/util/vehicleSelectUtil.lua:107
function editor_util_vehicleSelectUtil:resetSelections() end

--- Définit directement la config par sa clé (le modèle doit déjà être défini) ; calcule configName et configPath. Remet config à nil si la config n'existe pas.
---Source : lua/ge/extensions/editor/util/vehicleSelectUtil.lua:55
---@param config string Clé de la config (nom du .pc sans extension).
function editor_util_vehicleSelectUtil:setConfig(config) end

--- Stub (TODO) : devrait filtrer les configs d'un modèle par champ/valeur ; ne fait rien.
---Source : lua/ge/extensions/editor/util/vehicleSelectUtil.lua:131
---@param model string Clé du modèle.
---@param key string Nom du champ.
---@param value any Valeur recherchée.
---@param disallow boolean true pour blacklister au lieu de whitelister.
function editor_util_vehicleSelectUtil:setConfigListByField(model, key, value, disallow) end

--- Définit directement le modèle par sa clé ; renseigne vehType et modelName depuis core_vehicles.getModel, ou remet model à nil si inconnu.
---Source : lua/ge/extensions/editor/util/vehicleSelectUtil.lua:42
---@param model string Clé du modèle (nom de dossier vehicles/<model>).
function editor_util_vehicleSelectUtil:setModel(model) end

--- Stub (TODO) : devrait filtrer les modèles par champ/valeur ; ne fait rien.
---Source : lua/ge/extensions/editor/util/vehicleSelectUtil.lua:127
---@param key string Nom du champ.
---@param value any Valeur recherchée.
---@param disallow boolean true pour blacklister au lieu de whitelister.
function editor_util_vehicleSelectUtil:setModelListByField(key, value, disallow) end

--- Copie les options enableConfigs, enablePaints, enableCustomConfig, paintLayers et columnWidth présentes (truthy) dans data vers l'instance.
---Source : lua/ge/extensions/editor/util/vehicleSelectUtil.lua:73
---@param data table Options à appliquer.
function editor_util_vehicleSelectUtil:setOptions(data) end

--- Dessine l'interface (combos Type, Model, Config, Paint 1-3, champ de config personnalisée) et applique les remises à zéro en cascade.
---Source : lua/ge/extensions/editor/util/vehicleSelectUtil.lua:206
---@return string|nil  Raison du changement : 'type', 'model', 'config', 'paintName', 'paintName2', 'paintName3', 'customConfig', ou nil.
function editor_util_vehicleSelectUtil:widget() end

