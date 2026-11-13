---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/util/customFields.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Objet renvoyé par le constructeur du module. Champs : names (ordre des champs), types, values, tags (ensemble) et sortedTags (liste triée).
---@class gameplay_util_customFields
local gameplay_util_customFields = {}

--- Ajoute un champ typé ; la valeur est validée selon le type.
---Source : lua/ge/extensions/gameplay/util/customFields.lua:137
---@param name string Nom du champ.
---@param datatype string string, number, boolean, vec3 ou quat.
---@param value any Valeur initiale.
---@return boolean  false si le nom existe déjà.
function gameplay_util_customFields:add(name, datatype, value) end

--- Ajoute un tag et retrie la liste.
---Source : lua/ge/extensions/gameplay/util/customFields.lua:103
---@param tag string Tag à ajouter.
---@return boolean|nil  false si absent ou déjà présent, nil sinon.
function gameplay_util_customFields:addTag(tag) end

--- Lit un champ.
---Source : lua/ge/extensions/gameplay/util/customFields.lua:152
---@param name string Nom du champ.
---@return any  Valeur.
---@return string|nil  Type.
---@return boolean  true si trouvé.
function gameplay_util_customFields:get(name) end

--- Teste l'existence d'un champ.
---Source : lua/ge/extensions/gameplay/util/customFields.lua:151
---@param name string Nom du champ.
---@return boolean
function gameplay_util_customFields:has(name) end

--- Initialise les tables names, types, values, tags et sortedTags.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/util/customFields.lua:10
function gameplay_util_customFields:init() end

--- Recrée tous les champs et tags depuis les données sérialisées (efface l'état existant).
---Source : lua/ge/extensions/gameplay/util/customFields.lua:37
---@param data table Table produite par onSerialize.
function gameplay_util_customFields:onDeserialized(data) end

--- Renvoie {names, types, values, tags} ; vec3 et quat sont convertis en tables.
---Source : lua/ge/extensions/gameplay/util/customFields.lua:18
---@return table  Données sérialisables.
function gameplay_util_customFields:onSerialize() end

--- Supprime un champ.
---Source : lua/ge/extensions/gameplay/util/customFields.lua:125
---@param name string Nom du champ.
---@return boolean  false si le champ n'existe pas.
function gameplay_util_customFields:remove(name) end

--- Retire un tag, désigné par son nom ou son indice dans sortedTags.
---Source : lua/ge/extensions/gameplay/util/customFields.lua:112
---@param tag string|integer Nom ou indice.
---@return boolean  false si le tag n'existe pas.
function gameplay_util_customFields:removeTag(tag) end

--- Change la valeur d'un champ existant (sans validation de type).
---Source : lua/ge/extensions/gameplay/util/customFields.lua:91
---@param name string Nom du champ.
---@param value any Nouvelle valeur.
---@return boolean  false si le champ n'existe pas.
function gameplay_util_customFields:set(name, value) end

--- Reconstruit sortedTags (tags triés alphabétiquement) à partir de tags.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/util/customFields.lua:160
function gameplay_util_customFields:updateTags() end

--- Convertit une valeur vers le type demandé (string, number, boolean, vec3, quat).
---Source : lua/ge/extensions/gameplay/util/customFields.lua:62
---@param value any Valeur à convertir.
---@param datatype string Type cible.
---@return any  Valeur convertie ; nil si le type est inconnu.
function gameplay_util_customFields:validate(value, datatype) end

