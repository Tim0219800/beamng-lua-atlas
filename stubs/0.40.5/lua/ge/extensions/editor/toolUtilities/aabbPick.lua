---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/aabbPick.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Utilitaire de sélection par rayon contre des boîtes alignées sur les axes (AABB), sans allocation. Sert aux outils de l'éditeur qui doivent choisir un objet du monde par sa boîte englobante (ex. instances de bâtiments posées). Parcours linéaire des candidats.
--- Accès : extension `editor_toolUtilities_aabbPick` : `extensions.load("editor_toolUtilities_aabbPick")`, puis la globale `editor_toolUtilities_aabbPick`
---@class editor_toolUtilities_aabbPick
editor_toolUtilities_aabbPick = {}

--- Renvoie l'id de la boîte la plus proche (par distance d'entrée) que le rayon traverse. Le fournisseur provider(visit) doit appeler visit(id, minx, miny, minz, maxx, maxy, maxz) une fois par boîte candidate.
---Source : lua/ge/extensions/editor/toolUtilities/aabbPick.lua:49
---@param ox number Origine du rayon, x
---@param oy number Origine du rayon, y
---@param oz number Origine du rayon, z
---@param dx number Direction, x
---@param dy number Direction, y
---@param dz number Direction, z
---@param provider function function(visit) qui énumère les boîtes via visit(id, minx, miny, minz, maxx, maxy, maxz).
---@return any|nil  Id gagnant, ou nil si aucune boîte touchée.
---@return number  Distance d'entrée du gagnant (absente si nil).
function editor_toolUtilities_aabbPick.pickNearest(ox, oy, oz, dx, dy, dz, provider) end

--- Test rayon/AABB par la méthode des slabs. Renvoie la distance d'entrée t le long du rayon (>= 0) si touché, sinon nil.
---Source : lua/ge/extensions/editor/toolUtilities/aabbPick.lua:16
---@param ox number Origine du rayon, x
---@param oy number Origine du rayon, y
---@param oz number Origine du rayon, z
---@param dx number Direction, x
---@param dy number Direction, y
---@param dz number Direction, z
---@param minx number Coin min de la boîte, x
---@param miny number Coin min de la boîte, y
---@param minz number Coin min de la boîte, z
---@param maxx number Coin max de la boîte, x
---@param maxy number Coin max de la boîte, y
---@param maxz number Coin max de la boîte, z
---@return number|nil  Distance d'entrée, ou nil si le rayon rate la boîte ou si elle est derrière lui.
function editor_toolUtilities_aabbPick.rayAabb(ox, oy, oz, dx, dy, dz, minx, miny, minz, maxx, maxy, maxz) end

