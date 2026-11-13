---@meta
-- tim19Atlas stub generated from lua/common/kdtreebox3d.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Arbre k-d pour boîtes 3D (xmin, ymin, zmin, xmax, ymax, zmax), soit 6 dimensions. Permet de retrouver rapidement tous les éléments dont la boîte intersecte une boîte de requête. Même API que kdtreebox2d en 3D : new -> preLoad -> build -> query/queryNotNested ; export/import pour réutiliser un arbre.
--- Accès : `require("kdtreebox3d")`
---@class kdtreebox3d
local kdtreebox3d = {}

--- Crée un arbre k-d de boîtes 3D vide.
---Source : lua/common/kdtreebox3d.lua:115
---@param itemCount integer|nil nombre d'éléments prévus (préallocation, facultatif)
---@return kdTree  arbre vide
function kdtreebox3d.new(itemCount) end

--- Objet renvoyé par new().
---@class kdtreebox3d_kdTree
local kdtreebox3d_kdTree = {}

--- Interne : construction récursive d'un noeud.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/kdtreebox3d.lua:158
---@param axis integer axe courant
---@param left integer indice de début dans items
---@param right integer indice de fin
---@param treeIdx integer indice du noeud
function kdtreebox3d_kdTree:_build(axis, left, right, treeIdx) end

--- Affiche (print) des statistiques de l'arbre.
---Source : lua/common/kdtreebox3d.lua:284
function kdtreebox3d_kdTree:analytics() end

--- Construit l'arbre (médiane récursive en alternant les axes) à partir des éléments chargés.
---Source : lua/common/kdtreebox3d.lua:192
function kdtreebox3d_kdTree:build() end

--- Renvoie les données de l'arbre (références) pour sérialisation/réutilisation.
---Source : lua/common/kdtreebox3d.lua:130
---@return table  données exportées
function kdtreebox3d_kdTree:export() end

--- Charge des données produites par export().
---Source : lua/common/kdtreebox3d.lua:139
---@param kdTreeData table table d'export
function kdtreebox3d_kdTree:import(kdTreeData) end

--- Ajoute un élément (avant build).
---Source : lua/common/kdtreebox3d.lua:146
---@param id any identifiant renvoyé par les requêtes
---@param xmin number xmin
---@param ymin number ymin
---@param zmin number zmin
---@param xmax number xmax
---@param ymax number ymax
---@param zmax number zmax
function kdtreebox3d_kdTree:preLoad(id, xmin, ymin, zmin, xmax, ymax, zmax) end

--- Itérateur sur les ids des éléments dont la boîte intersecte la boîte de requête ; imbrication possible.
---Source : lua/common/kdtreebox3d.lua:254
---@param query_xmin number xmin
---@param query_ymin number ymin
---@param query_zmin number zmin
---@param query_xmax number xmax
---@param query_ymax number ymax
---@param query_zmax number zmax
---@return function  itérateur renvoyant les ids
---@return table  état d'itération
function kdtreebox3d_kdTree:query(query_xmin, query_ymin, query_zmin, query_xmax, query_ymax, query_zmax) end

--- Comme query sans allocation ; interdit d'imbriquer.
---Source : lua/common/kdtreebox3d.lua:268
---@param query_xmin number xmin
---@param query_ymin number ymin
---@param query_zmin number zmin
---@param query_xmax number xmax
---@param query_ymax number ymax
---@param query_zmax number zmax
---@return function  itérateur renvoyant les ids
---@return table  état d'itération (l'arbre)
function kdtreebox3d_kdTree:queryNotNested(query_xmin, query_ymin, query_zmin, query_xmax, query_ymax, query_zmax) end

return kdtreebox3d
