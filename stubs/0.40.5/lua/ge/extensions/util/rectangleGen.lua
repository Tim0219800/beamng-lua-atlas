---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/rectangleGen.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Générateur de graphe par découpage de rectangles, utilisé pour la génération procédurale de circuits (voir procTrack). À partir de rectangles de départ, il coupe successivement le plus grand rectangle découpable (verticalement ou horizontalement) jusqu'à obtenir le nombre de zones voulu, puis calcule les voisinages entre rectangles adjacents. Chaque rectangle devient un nœud (son centre arrondi) du graphe retourné.
--- Accès : extension `util_rectangleGen` : `extensions.load("util_rectangleGen")`, puis la globale `util_rectangleGen`
---@class util_rectangleGen
util_rectangleGen = {}

--- Distance euclidienne 2D entre les points (a, b) et (x, y).
---Source : lua/ge/extensions/util/rectangleGen.lua:196
---@param a number X du premier point
---@param b number Y du premier point
---@param x number X du second point
---@param y number Y du second point
---@return number  Distance
function util_rectangleGen.dist(a, b, x, y) end

--- Découpe récursivement les rectangles de départ, calcule les voisins (rectangles adjacents partageant un bord) et construit le graphe de nœuds.
---Source : lua/ge/extensions/util/rectangleGen.lua:8
---@param params table Paramètres : startingRects, rectModeParams, path (voir notes)
---@return table  {nodes = liste de {x, y, neighbours = liste de {index, dist}, name = 'rect_<i>', force, closestNeighbourDist}, start = nœud ou nil, finish = nœud ou nil}
function util_rectangleGen.getGraph(params) end

