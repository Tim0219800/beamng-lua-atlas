---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/utils.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Utilitaires du flowgraph : détection de type d'une valeur, test de compatibilité avec un type de pin, valeur par défaut par type, étiquette ImGui, et fonctions de fusion (merge) utilisées par les variables du `variableStorage` quand plusieurs nœuds écrivent la même variable dans la même frame. Il est chargé comme extension `flowgraph_utils` mais aussi par `require` depuis pin et variableStorage.
--- Accès : extension `flowgraph_utils` : `extensions.load("flowgraph_utils")`, puis la globale `flowgraph_utils`
---@class flowgraph_utils
---@field mergeFuns table<string, table> Fonctions de fusion par catégorie : all, number, bool, vec3, string, any. Chaque entrée : {num, description, init, merge, finalize}.
---@field sortedMergeFuns table<string, table[]> Listes triées {name, desc, num} par catégorie (any, all, number, string, bool, vec3), pour l'affichage dans l'éditeur.
flowgraph_utils = {}

--- Valeur par défaut d'un type : 0 (number/any), '' (string), true (bool), {0,0,0} (vec3), {0,0,0,0} (quat), {1,1,1,1} (color), {} (table). Si `typeName` est une liste, utilise le premier élément. Autre type : nil.
---Source : lua/ge/extensions/flowgraph/utils.lua:31
---@param typeName string|table Type ou liste de types.
---@return any  Valeur par défaut ou nil.
function flowgraph_utils.getDefaultValueForType(typeName) end

--- Donne le type flowgraph d'une valeur Lua : bool, string, number, vec3 (table de 3), quat (table de 4), sinon nil.
---Source : lua/ge/extensions/flowgraph/utils.lua:10
---@param value any Valeur à tester.
---@return string|nil  Nom du type ou nil.
function flowgraph_utils.getVariableType(value) end

--- Dit si une valeur peut être stockée dans un pin/variable du type `compType`.
---Source : lua/ge/extensions/flowgraph/utils.lua:21
---@param value any Valeur.
---@param compType string Type visé (bool, string, number, vec3, quat, color, table).
---@return boolean  true si compatible.
function flowgraph_utils.isVariableCompatible(value, compType) end

--- Dessine en ImGui une petite étiquette (fond rouge translucide par défaut) juste au-dessus de la ligne courante.
---Source : lua/ge/extensions/flowgraph/utils.lua:53
---@param label string Texte.
---@param color any ImVec4 de fond (défaut rouge 0,4 alpha).
function flowgraph_utils.showLabel(label, color) end

