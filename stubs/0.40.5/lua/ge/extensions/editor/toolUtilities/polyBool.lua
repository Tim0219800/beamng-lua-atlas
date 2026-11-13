---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/polyBool.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Booléens 2D sur polygones (union, différence), maison, de type Martinez, adaptés de l'approche polybooljs (MIT). Un polygone est une table { regions = { ring, ... }, inverted = bool } où chaque ring est une liste de points {x,y}. Les calculs se font dans un repère local proche de l'origine pour que l'epsilon absolu ne s'écrase pas aux coordonnées monde. areas range ensuite une liste d'anneaux en anneaux extérieurs avec leurs trous, prêts pour une triangulation.
--- Accès : extension `editor_toolUtilities_polyBool` : `extensions.load("editor_toolUtilities_polyBool")`, puis la globale `editor_toolUtilities_polyBool`
---@class editor_toolUtilities_polyBool
editor_toolUtilities_polyBool = {}

--- Trie la liste plate d'anneaux d'un résultat booléen en anneaux extérieurs portant chacun leurs trous. L'imbrication se déduit de la profondeur de contenance : pair = plein, impair = trou. Extérieurs orientés CCW, trous CW. Chaque trou est rattaché à l'anneau le plus profond qui le contient.
---Source : lua/ge/extensions/editor/toolUtilities/polyBool.lua:829
---@param regions table Liste d'anneaux {x,y} (par ex. result.regions de difference).
---@return table  Liste de { ring = anneau, holes = { anneau, ... } }.
function editor_toolUtilities_polyBool.areas(regions) end

--- Différence booléenne : subject moins clip. Travaille dans un repère local comme unionMany.
---Source : lua/ge/extensions/editor/toolUtilities/polyBool.lua:774
---@param subject table Polygone, anneau ou liste d'anneaux dont on soustrait.
---@param clip table Polygone, anneau ou liste d'anneaux à soustraire.
---@return table  Polygone résultat { regions, inverted }.
function editor_toolUtilities_polyBool.difference(subject, clip) end

--- Réunit plusieurs polygones en un seul. Renvoie un polygone vide si la liste est vide.
---Source : lua/ge/extensions/editor/toolUtilities/polyBool.lua:744
---@param polys table Liste de polygones { regions = {ring,...}, inverted = bool }.
---@return table  Polygone résultat { regions, inverted } en coordonnées monde.
function editor_toolUtilities_polyBool.unionMany(polys) end

