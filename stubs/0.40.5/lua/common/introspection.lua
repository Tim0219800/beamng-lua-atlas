---@meta
-- tim19Atlas stub generated from lua/common/introspection.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Outil de debug qui parcourt _G et les modules standard (table, math, string, coroutine, os, io, debug, package) pour lister les fonctions des classes exposées par le moteur (tables ayant un champ ___type de la forme class<...> ou static_class<...>). S'utilise à la console : require('introspection').gather_methods().
--- Accès : `require("introspection")`
---@class introspection
local introspection = {}

--- Construit et renvoie la liste des méthodes de toutes les classes C++/Lua exposées (et des modules standard), avec nom de classe, nom de méthode, signature et indicateur statique.
---Source : lua/common/introspection.lua:10
---@return table[]  Tableau d'entrées {class_name=string, method_name=string, signature=string, is_static=boolean}.
function introspection.gather_methods() end

return introspection
