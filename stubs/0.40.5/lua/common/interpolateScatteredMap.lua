---@meta
-- tim19Atlas stub generated from lua/common/interpolateScatteredMap.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Interpolation 2D sur points non structurés par triangulation de Delaunay (Bowyer-Watson). loadData construit la triangulation une fois ; get(x, y) cherche le triangle contenant le point en marchant de triangle voisin en triangle voisin (sans allocation) et interpole en coordonnées barycentriques. Utile pour des cartes z(x, y) dont les échantillons ne forment pas une grille.
--- Accès : `require("interpolateScatteredMap")`
---@class interpolateScatteredMap
local interpolateScatteredMap = {}

--- Crée un objet d'interpolation vide (valid = false, outsideMode 'default', defaultValue 0).
---Source : lua/common/interpolateScatteredMap.lua:491
---@return table  Objet avec méthodes loadData, get, validate, outsideValue, bruteForce, exportTriangles.
function interpolateScatteredMap.new() end

--- Objet renvoyé par new(). Champs : tris, triCount, hullEdges, valid, outsideMode, defaultValue, minX/maxX/minY/maxY, sx, sy.
---@class interpolateScatteredMap_interpolateScatteredMap
local interpolateScatteredMap_interpolateScatteredMap = {}

--- Recherche linéaire du triangle contenant (x, y) ; repli quand la marche échoue.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/interpolateScatteredMap.lua:dyn
---@param x number Abscisse.
---@param y number Ordonnée.
---@return integer  Indice du triangle, 0 si aucun.
function interpolateScatteredMap_interpolateScatteredMap:bruteForce(x, y) end

--- Reconstruit les triangles en coordonnées d'entrée pour debug/visualisation.
---Source : lua/common/interpolateScatteredMap.lua:dyn
---@return table[]  Liste {ax, ay, bx, by, cx, cy, va, vb, vc}.
function interpolateScatteredMap_interpolateScatteredMap:exportTriangles() end

--- Renvoie la valeur interpolée au point (x, y). Hors de l'enveloppe convexe, dépend de outsideMode.
---Source : lua/common/interpolateScatteredMap.lua:dyn
---@param x number Abscisse, dans les mêmes unités que les points après application de xScale (déduit du code : get n'applique pas xScale).
---@param y number Ordonnée.
---@return number|nil  Valeur ; nil seulement si outsideMode == 'nil' et point hors enveloppe.
function interpolateScatteredMap_interpolateScatteredMap:get(x, y) end

--- Charge les points, normalise, dédoublonne, triangule et prépare le voisinage des triangles.
---Source : lua/common/interpolateScatteredMap.lua:dyn
---@param inputData table[] Liste de points {x, y, value} ou {x=, y=, value=}.
---@param opts table|nil Options (voir notes).
---@return table  self ; vérifier self.valid.
function interpolateScatteredMap_interpolateScatteredMap:loadData(inputData, opts) end

--- Valeur à renvoyer pour un point hors enveloppe selon outsideMode (normalement appelée par get ; px, py en coordonnées normalisées).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/interpolateScatteredMap.lua:dyn
---@param px number x normalisé.
---@param py number y normalisé.
---@param ti integer Indice du triangle courant (utilisé en mode extrapolate).
---@return number|nil  Valeur extérieure.
function interpolateScatteredMap_interpolateScatteredMap:outsideValue(px, py, ti) end

--- Teste la carte sur les points d'entrée et renvoie l'erreur maximale.
---Source : lua/common/interpolateScatteredMap.lua:dyn
---@param inputData table[] Les points d'origine.
---@param tolerance number|nil Erreur tolérée (défaut 1e-4).
---@return number  Erreur absolue maximale.
---@return boolean  true si <= tolérance.
function interpolateScatteredMap_interpolateScatteredMap:validate(inputData, tolerance) end

return interpolateScatteredMap
