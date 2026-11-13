---@meta
-- tim19Atlas stub generated from lua/common/interpolatedMap.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Table d'interpolation 1D (linéaire) ou 2D (bilinéaire) sur grille régulière ou irrégulière. new() crée l'objet, loadData(inputData, opts) charge les données (ce qui choisit la méthode get 1D ou 2D), puis get(x[, y]) renvoie la valeur interpolée. Sert pour des cartes moteur, courbes de couple, tables de coefficients. Garde en cache le dernier résultat et le dernier intervalle utilisé (recherche rapide si x varie peu).
--- Accès : `require("interpolatedMap")`
---@class interpolatedMap
local interpolatedMap = {}

--- Crée une table d'interpolation vide.
---Source : lua/common/interpolatedMap.lua:245
---@return table  Objet interpolatedMap avec méthodes loadData, get, reset.
function interpolatedMap.new() end

--- Objet renvoyé par new().
---@class interpolatedMap_interpolatedMap
local interpolatedMap_interpolatedMap = {}

--- Valeur interpolée : get(x) en 1D, get(x, y) en 2D. Remplacée par loadData selon la dimension.
---Source : lua/common/interpolatedMap.lua:dyn
---@param x number Abscisse.
---@param y number|nil Ordonnée (2D uniquement).
---@return number|nil  Valeur interpolée ; nil hors plage si clampToDataRange est faux.
function interpolatedMap_interpolatedMap:get(x, y) end

--- Charge les données (voir formats dans notes), calcule les bornes et choisit la méthode get 1D ou 2D.
---Source : lua/common/interpolatedMap.lua:dyn
---@param inputData table Données au format paires, deux lignes, ou tableau 2D.
---@param opts table|nil Options {xScale, yScale, zScale}.
function interpolatedMap_interpolatedMap:loadData(inputData, opts) end

--- Ne fait rien (fonction vide).
---Source : lua/common/interpolatedMap.lua:dyn
function interpolatedMap_interpolatedMap:reset() end

return interpolatedMap
