---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/notebook/structured.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Stockage « structuré » d'une pacenote de rallye en six emplacements fixes (clés de chaîne "1" à "6", qui sont aussi l'ordre de lecture) : 1 = prudence (caution), 2 et 3 = modificateurs avant le virage, 4 = virage (corner), 5 et 6 = modificateurs après. Un emplacement vide vaut {}. Chaque élément est une table typée { type = ..., ... } ; le style actif fournit les libellés. Le module migre aussi les anciens schémas v1 (liste) et v2 (4 emplacements) à la désérialisation. Le module renvoie un constructeur d'objet (classe C) et expose des helpers M.* qui acceptent un objet ou une table brute.
--- Accès : `require("extensions/gameplay/rally/notebook/structured")` (fichier sous extensions/ mais pas une extension classique)
---@class gameplay_rally_notebook_structured
gameplay_rally_notebook_structured = {}

--- Version utilitaire : renvoie la liste ordonnée des éléments non vides d'un objet structuré ou d'une table brute (gère aussi les anciens schémas v2). (assignée dynamiquement)
---Source : lua/ge/extensions/gameplay/rally/notebook/structured.lua:dyn
---@param structured table Objet structuré ou table brute (avec ou sans champ items).
---@return table[]  Éléments dans l'ordre des emplacements ; {} si l'argument n'est pas une table.
function gameplay_rally_notebook_structured.orderedItems(structured) end

--- Version utilitaire : remplace le contenu par une liste ordonnée d'éléments, répartis dans les emplacements. Appelle la méthode d'instance si elle existe, sinon écrit items et schemaVersion dans la table. (assignée dynamiquement)
---Source : lua/ge/extensions/gameplay/rally/notebook/structured.lua:dyn
---@param structured table Objet structuré ou table brute (modifié en place).
---@param items table[] Éléments typés.
function gameplay_rally_notebook_structured.setOrderedItems(structured, items) end

--- Version utilitaire : renvoie l'élément d'un emplacement, ou nil s'il est vide. (assignée dynamiquement)
---Source : lua/ge/extensions/gameplay/rally/notebook/structured.lua:dyn
---@param structured table Objet structuré ou table brute.
---@param index integer Numéro d'emplacement de 1 à 6.
---@return table|nil  Élément { type = ... } ou nil.
function gameplay_rally_notebook_structured.slotItem(structured, index) end

--- Version utilitaire : renvoie la table des six emplacements (clés "1".."6") normalisée, en migrant les schémas v1/v2 si besoin. (assignée dynamiquement)
---Source : lua/ge/extensions/gameplay/rally/notebook/structured.lua:dyn
---@param structured table Objet structuré ou table brute.
---@return table<string, table>  Carte d'emplacements ; emplacements vides = {}.
function gameplay_rally_notebook_structured.slotItems(structured) end

--- Objet renvoyé par Structured() : champs schemaVersion et items (carte des six emplacements).
---@class gameplay_rally_notebook_structured_C
local gameplay_rally_notebook_structured_C = {}

--- true si au moins un emplacement est rempli.
---Source : lua/ge/extensions/gameplay/rally/notebook/structured.lua:311
---@return boolean  Résultat.
function gameplay_rally_notebook_structured_C:hasItems() end

--- Constructeur : schéma courant, six emplacements vides.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/notebook/structured.lua:248
function gameplay_rally_notebook_structured_C:init() end

--- Nombre d'éléments non vides.
---Source : lua/ge/extensions/gameplay/rally/notebook/structured.lua:307
---@return integer  Compte.
function gameplay_rally_notebook_structured_C:itemCount() end

--- Recharge depuis des données sauvegardées (data.items, data.schemaVersion) en migrant les schémas v1 (liste ordonnée) et v2 (quatre emplacements) vers le schéma v3.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/notebook/structured.lua:253
---@param data table|nil Données sérialisées ; nil laisse l'objet vide.
function gameplay_rally_notebook_structured_C:onDeserialized(data) end

--- Renvoie { schemaVersion, items } où items est la carte normalisée des six emplacements.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/notebook/structured.lua:274
---@return table  Données à écrire en JSON.
function gameplay_rally_notebook_structured_C:onSerialize() end

--- Liste des éléments non vides dans l'ordre des emplacements 1 à 6.
---Source : lua/ge/extensions/gameplay/rally/notebook/structured.lua:281
---@return table[]  Éléments.
function gameplay_rally_notebook_structured_C:orderedItems() end

--- Remplace le contenu à partir d'une liste ordonnée (caution -> 1, corner -> 4, modificateurs -> 2/3 avant ou 5/6 après le corner). Les surplus sont ignorés avec un avertissement.
---Source : lua/ge/extensions/gameplay/rally/notebook/structured.lua:297
---@param items table[] Éléments typés.
function gameplay_rally_notebook_structured_C:setOrderedItems(items) end

--- Remplace le contenu à partir d'une carte d'emplacements (clés "1".."6" ou entiers).
---Source : lua/ge/extensions/gameplay/rally/notebook/structured.lua:302
---@param items table Carte d'emplacements.
function gameplay_rally_notebook_structured_C:setSlotItems(items) end

--- Élément d'un emplacement, ou nil s'il est vide.
---Source : lua/ge/extensions/gameplay/rally/notebook/structured.lua:289
---@param index integer Emplacement de 1 à 6.
---@return table|nil  Élément ou nil.
function gameplay_rally_notebook_structured_C:slotItem(index) end

--- Copie normalisée de la carte des six emplacements.
---Source : lua/ge/extensions/gameplay/rally/notebook/structured.lua:285
---@return table<string, table>  Emplacements "1".."6".
function gameplay_rally_notebook_structured_C:slotItems() end

--- Table du module : helpers orderedItems, slotItems, slotItem, setOrderedItems (voir functions). Appeler le module comme une fonction crée une instance de C.
---@class gameplay_rally_notebook_structured_M
local gameplay_rally_notebook_structured_M = {}

---Source : lua/ge/extensions/gameplay/rally/notebook/structured.lua:315
---@param structured any
function gameplay_rally_notebook_structured_M.orderedItems(structured) end

---Source : lua/ge/extensions/gameplay/rally/notebook/structured.lua:359
---@param structured any
---@param items any
function gameplay_rally_notebook_structured_M.setOrderedItems(structured, items) end

---Source : lua/ge/extensions/gameplay/rally/notebook/structured.lua:342
---@param structured any
---@param index any
function gameplay_rally_notebook_structured_M.slotItem(structured, index) end

---Source : lua/ge/extensions/gameplay/rally/notebook/structured.lua:327
---@param structured any
function gameplay_rally_notebook_structured_M.slotItems(structured) end

