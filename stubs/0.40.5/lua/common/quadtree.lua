---@meta
-- tim19Atlas stub generated from lua/common/quadtree.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Quadtree 2D pour boîtes (insertion, suppression, requête, compression). Contrairement aux arbres k-d, on peut insérer et retirer des éléments après la construction, et une requête en cours n'est pas perturbée par une suppression. Chaque élément est (id, xmin, ymin, xmax, ymax). Flux : newQuadtree -> preLoad (pour dimensionner le canevas) -> build(maxDepth) -> [compress] -> insert/remove/query.
--- Accès : `require("quadtree")`
---@class quadtree
---@field lineBBox function Alias de lineBB2d (mathlib) : boîte englobante d'un segment élargi d'un rayon.
---@field pointBBox function Alias de pointBB2d (mathlib) : boîte englobante d'un point élargi d'un rayon.
local quadtree = {}

--- Crée un quadtree vide. Profondeur max par défaut 10 (la racine est la profondeur 1).
---Source : lua/common/quadtree.lua:81
---@param numOfItems integer|nil nombre d'éléments prévus pour préallouer (facultatif)
---@return quadTree  quadtree vide
function quadtree.newQuadtree(numOfItems) end

--- Objet renvoyé par newQuadtree().
---@class quadtree_quadTree
local quadtree_quadTree = {}

--- Affiche (print) la profondeur, le nombre de noeuds et d'éléments occupés.
---Source : lua/common/quadtree.lua:361
function quadtree_quadTree:analytics() end

--- Insère tous les éléments préchargés dans l'arbre. maxDepth (défaut 10) borne la profondeur.
---Source : lua/common/quadtree.lua:244
---@param maxDepth integer|nil profondeur maximale
function quadtree_quadTree:build(maxDepth) end

--- Réduit la mémoire en recopiant les tables de noeuds à la taille exacte. Optionnel après build.
---Source : lua/common/quadtree.lua:347
function quadtree_quadTree:compress() end

--- Renvoie les données de l'arbre {tree, children, nodeCount, maxDepth, xmin, xmax, ymin, ymax} (références).
---Source : lua/common/quadtree.lua:101
---@return table  données exportées
function quadtree_quadTree:export() end

--- Charge des données produites par export() (et abandonne la liste préchargée).
---Source : lua/common/quadtree.lua:114
---@param quadTreeData table table d'export
function quadtree_quadTree:import(quadTreeData) end

--- Insère un élément (après build ou en cours d'utilisation) dans le noeud le plus profond qui le contient entièrement.
---Source : lua/common/quadtree.lua:144
---@param itm_id any identifiant
---@param itm_xmin number xmin
---@param itm_ymin number ymin
---@param itm_xmax number xmax
---@param itm_ymax number ymax
function quadtree_quadTree:insert(itm_id, itm_xmin, itm_ymin, itm_xmax, itm_ymax) end

--- Mémorise un élément et agrandit le canevas de l'arbre ; à utiliser avant build().
---Source : lua/common/quadtree.lua:124
---@param itm_id any identifiant
---@param itm_xmin number xmin
---@param itm_ymin number ymin
---@param itm_xmax number xmax
---@param itm_ymax number ymax
function quadtree_quadTree:preLoad(itm_id, itm_xmin, itm_ymin, itm_xmax, itm_ymax) end

--- Itérateur sur les ids des éléments intersectant la boîte de requête ; supporte les requêtes imbriquées et les suppressions pendant l'itération.
---Source : lua/common/quadtree.lua:310
---@param query_xmin number xmin
---@param query_ymin number ymin
---@param query_xmax number xmax
---@param query_ymax number ymax
---@return function  itérateur renvoyant les ids
---@return table  état d'itération
function quadtree_quadTree:query(query_xmin, query_ymin, query_xmax, query_ymax) end

--- Comme query sans allocation ; ne pas imbriquer.
---Source : lua/common/quadtree.lua:329
---@param query_xmin number xmin
---@param query_ymin number ymin
---@param query_xmax number xmax
---@param query_ymax number ymax
---@return function  itérateur renvoyant les ids
---@return table  état d'itération (l'arbre)
function quadtree_quadTree:queryNotNested(query_xmin, query_ymin, query_xmax, query_ymax) end

--- Retire l'élément d'identifiant itm_id en le cherchant le long du chemin menant à son centre (itm_x, itm_y). Sans effet s'il n'est pas trouvé.
---Source : lua/common/quadtree.lua:194
---@param itm_id any identifiant
---@param itm_x number x du centre de l'élément
---@param itm_y number y du centre de l'élément
function quadtree_quadTree:remove(itm_id, itm_x, itm_y) end

return quadtree
