---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/gridCap.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Construit un « chapeau » (capot) de triangles sur un contour qui doit suivre un champ de hauteur : une grille carrée alignée sur le fil (grain) du contour, découpée à ce contour. Chaque cellule entièrement dans le contour donne deux triangles aux hauteurs du champ ; seules les cellules traversées par le contour sont découpées (polyBool), ce qui évite les triangles très longs ou en éclat. Un passage de Delaunay améliore ensuite le maillage.
--- Accès : extension `editor_toolUtilities_gridCap` : `extensions.load("editor_toolUtilities_gridCap")`, puis la globale `editor_toolUtilities_gridCap`
---@class editor_toolUtilities_gridCap
editor_toolUtilities_gridCap = {}

--- Construit le chapeau sur les anneaux donnés (le contour extérieur, puis ses trous ; ouverts ou fermés) en coordonnées monde. Travaille dans le repère du grain où les cellules sont carrées. Renvoie nil si aucun triangle n'est produit.
---Source : lua/ge/extensions/editor/toolUtilities/gridCap.lua:206
---@param rings table[] Anneaux de points {x, y, z?} : le contour puis les trous.
---@param cf table Le grain : ax, ay (le long), inX, inY (en travers).
---@param zAt function Champ de hauteur zAt(x, y) -> z, en monde.
---@param cell number Pas de la grille (m).
---@return table|nil  Le maillage plat { x, y, z, tri, nv, nt } ou nil.
function editor_toolUtilities_gridCap.build(rings, cf, zAt, cell) end

--- Filtre les anneaux qui peuvent toucher une cellule de la grille sur laquelle le chapeau du contour 'outer' est posé (boîte dans le repère du grain, arrondie à la grille, plus un petit jeu). Les autres ne changent rien au résultat.
---Source : lua/ge/extensions/editor/toolUtilities/gridCap.lua:330
---@param outer table Contour extérieur.
---@param rings table[] Anneaux candidats.
---@param cf table Le grain (ax, ay, inX, inY).
---@param cell number Pas de la grille (m).
---@return table[]  Sous-liste des anneaux atteignables.
function editor_toolUtilities_gridCap.reaching(outer, rings, cf, cell) end

