---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/util/sortedList.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Liste ordonnée. Champs : name, parent, objectConstructor, objects (id -> objet), sorted (tableau trié), byName.
---@class gameplay_util_sortedList
local gameplay_util_sortedList = {}

--- Reconstruit l'index byName.
---Source : lua/ge/extensions/gameplay/util/sortedList.lua:74
function gameplay_util_sortedList:buildNamesDir() end

--- Vide la liste (objects, sorted, byName) puis appelle postClear.
---Source : lua/ge/extensions/gameplay/util/sortedList.lua:22
function gameplay_util_sortedList:clear() end

--- Crée un élément via objectConstructor, l'enregistre et retrie (sauf skipSort), puis appelle postCreate.
---Source : lua/ge/extensions/gameplay/util/sortedList.lua:32
---@param name string Nom de l'élément.
---@param forceId integer|nil Id imposé.
---@param skipSort boolean|nil Ne pas retrier (utile pour les créations en série).
---@return table  Nouvel élément.
function gameplay_util_sortedList:create(name, forceId, skipSort) end

--- Appelle drawDebug(drawMode) sur chaque élément.
---Source : lua/ge/extensions/gameplay/util/sortedList.lua:83
---@param drawMode any Mode de dessin transmis tel quel.
function gameplay_util_sortedList:drawDebug(drawMode) end

--- Crée la liste (vide).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/util/sortedList.lua:10
---@param name string Nom de la liste.
---@param parent table Objet parent passé au constructeur des éléments.
---@param objectConstructor function function(parent, name, forceId) renvoyant un nouvel élément.
function gameplay_util_sortedList:init(name, parent, objectConstructor) end

--- Échange la position d'un élément avec son voisin dans la direction donnée.
---Source : lua/ge/extensions/gameplay/util/sortedList.lua:63
---@param id integer Id de l'élément.
---@param dir integer -1 vers le début, +1 vers la fin.
function gameplay_util_sortedList:move(id, dir) end

--- Vide la liste et recrée les éléments depuis les données.
---Source : lua/ge/extensions/gameplay/util/sortedList.lua:98
---@param data table[]|nil Données sérialisées.
---@param oldIdMap table<integer, integer> Table remplie avec ancien id -> nouvel id.
function gameplay_util_sortedList:onDeserialized(data, oldIdMap) end

--- Renvoie la liste des éléments non procéduraux sérialisés, dans l'ordre.
---Source : lua/ge/extensions/gameplay/util/sortedList.lua:89
---@param parent any Inutilisé.
---@return table[]  Données des éléments.
function gameplay_util_sortedList:onSerialize(parent) end

--- Retire un élément (objet ou id), retrie puis appelle postRemove.
---Source : lua/ge/extensions/gameplay/util/sortedList.lua:43
---@param obj table|integer Élément ou son id.
function gameplay_util_sortedList:remove(obj) end

--- Reconstruit sorted selon sortOrder et renumérote sortOrder de 1 à N.
---Source : lua/ge/extensions/gameplay/util/sortedList.lua:52
function gameplay_util_sortedList:sort() end

