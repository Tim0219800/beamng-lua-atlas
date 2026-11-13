---@meta
-- tim19Atlas stub generated from lua/common/kdtreepoint3d.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Arbre k-d pour points 3D. Offre deux types de requêtes : les points dans une boîte (query / queryNotNested, itérateurs) et le point le plus proche d'un point donné (findNearest). Typique pour retrouver le noeud de route ou l'objet le plus proche d'une position. Flux : new -> preLoad -> build -> requêtes.
--- Accès : `require("kdtreepoint3d")`
---@class kdtreepoint3d
local kdtreepoint3d = {}

--- Crée un arbre k-d de points 3D vide.
---Source : lua/common/kdtreepoint3d.lua:105
---@param itemCount integer|nil nombre de points prévus (préallocation, facultatif)
---@return kdTree  arbre vide
function kdtreepoint3d.new(itemCount) end

--- Objet renvoyé par new().
---@class kdtreepoint3d_kdTree
local kdtreepoint3d_kdTree = {}

--- Interne : construction récursive d'un noeud.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/kdtreepoint3d.lua:143
---@param axis integer axe courant
---@param left integer début dans items
---@param right integer fin dans items
---@param treeIdx integer indice du noeud
function kdtreepoint3d_kdTree:_build(axis, left, right, treeIdx) end

--- Affiche (print) des statistiques de l'arbre.
---Source : lua/common/kdtreepoint3d.lua:309
function kdtreepoint3d_kdTree:analytics() end

--- Construit l'arbre à partir des points chargés.
---Source : lua/common/kdtreepoint3d.lua:175
function kdtreepoint3d_kdTree:build() end

--- Renvoie les données de l'arbre (références) pour réutilisation.
---Source : lua/common/kdtreepoint3d.lua:121
---@return table  données exportées
function kdtreepoint3d_kdTree:export() end

--- Trouve le point le plus proche de (x, y, z) et renvoie son id et la distance euclidienne.
---Source : lua/common/kdtreepoint3d.lua:262
---@param x number x
---@param y number y
---@param z number z
---@return any  id du point le plus proche
---@return number  distance
function kdtreepoint3d_kdTree:findNearest(x, y, z) end

--- Charge des données produites par export().
---Source : lua/common/kdtreepoint3d.lua:130
---@param kdTreeData table table d'export
function kdtreepoint3d_kdTree:import(kdTreeData) end

--- Ajoute un point (avant build).
---Source : lua/common/kdtreepoint3d.lua:137
---@param id any identifiant renvoyé par les requêtes
---@param x number x
---@param y number y
---@param z number z
function kdtreepoint3d_kdTree:preLoad(id, x, y, z) end

--- Itérateur sur les ids des points situés dans la boîte de requête ; imbrication possible.
---Source : lua/common/kdtreepoint3d.lua:233
---@param query_xmin number xmin
---@param query_ymin number ymin
---@param query_zmin number zmin
---@param query_xmax number xmax
---@param query_ymax number ymax
---@param query_zmax number zmax
---@return function  itérateur renvoyant les ids
---@return table  état d'itération
function kdtreepoint3d_kdTree:query(query_xmin, query_ymin, query_zmin, query_xmax, query_ymax, query_zmax) end

--- Comme query sans allocation ; ne pas imbriquer.
---Source : lua/common/kdtreepoint3d.lua:247
---@param query_xmin number xmin
---@param query_ymin number ymin
---@param query_zmin number zmin
---@param query_xmax number xmax
---@param query_ymax number ymax
---@param query_zmax number zmax
---@return function  itérateur renvoyant les ids
---@return table  état d'itération (l'arbre)
function kdtreepoint3d_kdTree:queryNotNested(query_xmin, query_ymin, query_zmin, query_xmax, query_ymax, query_zmax) end

return kdtreepoint3d
