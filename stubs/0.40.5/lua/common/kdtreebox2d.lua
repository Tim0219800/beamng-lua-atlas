---@meta
-- tim19Atlas stub generated from lua/common/kdtreebox2d.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Arbre k-d pour boîtes 2D (xmin, ymin, xmax, ymax), donc 4 dimensions, permettant de retrouver rapidement tous les éléments dont la boîte intersecte une zone de requête. Typiquement utilisé pour des segments de route, des zones ou des obstacles. Flux : new -> preLoad (pour chaque élément) -> build -> query / queryNotNested. Les requêtes sont des itérateurs Lua utilisables dans une boucle for.
--- Accès : `require("kdtreebox2d")`
---@class kdtreebox2d
local kdtreebox2d = {}

--- Crée un arbre k-d de boîtes 2D vide.
---Source : lua/common/kdtreebox2d.lua:106
---@param itemCount integer|nil nombre d'éléments prévus, pour préallouer (facultatif)
---@return kdTree  arbre vide
function kdtreebox2d.new(itemCount) end

--- Objet renvoyé par new(). Champs : tree, items, itemCount, nonLeafLimIdx et états de requête internes.
---@class kdtreebox2d_kdTree
local kdtreebox2d_kdTree = {}

--- Interne : construction récursive d'un noeud ; renvoie la boîte englobante du sous-arbre.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/kdtreebox2d.lua:160
---@param axis integer axe courant (1 à 4)
---@param left integer indice de début dans items
---@param right integer indice de fin dans items
---@param treeIdx integer indice du noeud dans tree
---@return number  xmin
---@return number  ymin
---@return number  xmax
---@return number  ymax
function kdtreebox2d_kdTree:_build(axis, left, right, treeIdx) end

--- Affiche (print) des statistiques de l'arbre : profondeur, nombre de noeuds, de feuilles, d'éléments.
---Source : lua/common/kdtreebox2d.lua:275
function kdtreebox2d_kdTree:analytics() end

--- Construit l'arbre à partir des éléments chargés (sélection de médiane récursive en alternant les 4 axes).
---Source : lua/common/kdtreebox2d.lua:187
function kdtreebox2d_kdTree:build() end

--- Vide un arbre existant pour le réutiliser (utile pour des arbres mis à jour souvent). Sans effet avant build.
---Source : lua/common/kdtreebox2d.lua:122
function kdtreebox2d_kdTree:clear() end

--- Renvoie une table {tree, nonLeafLimIdx, items, itemCount} (références, pas de copie) pour la sérialiser ou la réutiliser.
---Source : lua/common/kdtreebox2d.lua:138
---@return table  données exportées
function kdtreebox2d_kdTree:export() end

--- Remplace le contenu par des données produites par export().
---Source : lua/common/kdtreebox2d.lua:147
---@param kdTreeData table table d'export
function kdtreebox2d_kdTree:import(kdTreeData) end

--- Ajoute un élément (avant build).
---Source : lua/common/kdtreebox2d.lua:154
---@param id any identifiant de l'élément renvoyé par les requêtes
---@param xmin number xmin
---@param ymin number ymin
---@param xmax number xmax
---@param ymax number ymax
function kdtreebox2d_kdTree:preLoad(id, xmin, ymin, xmax, ymax) end

--- Itérateur (à utiliser dans for) sur les ids des éléments intersectant la boîte donnée ; supporte les requêtes imbriquées.
---Source : lua/common/kdtreebox2d.lua:247
---@param query_xmin number xmin
---@param query_ymin number ymin
---@param query_xmax number xmax
---@param query_ymax number ymax
---@return function  itérateur renvoyant les ids
---@return table  état d'itération
function kdtreebox2d_kdTree:query(query_xmin, query_ymin, query_xmax, query_ymax) end

--- Comme query mais sans allocation (réutilise l'état de l'arbre) : ne pas imbriquer.
---Source : lua/common/kdtreebox2d.lua:261
---@param query_xmin number xmin
---@param query_ymin number ymin
---@param query_xmax number xmax
---@param query_ymax number ymax
---@return function  itérateur renvoyant les ids
---@return table  état d'itération (l'arbre lui-même)
function kdtreebox2d_kdTree:queryNotNested(query_xmin, query_ymin, query_xmax, query_ymax) end

return kdtreebox2d
