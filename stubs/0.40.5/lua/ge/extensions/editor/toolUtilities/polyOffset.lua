---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/polyOffset.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Décalage latéral d'une polyligne 2D dont chaque arête porte une normale sortante. Gère les coins par jonction en onglet (miter), en chanfrein ou par intersection de droites, avec une limite d'onglet pour les angles aigus. run construit un ruban fermé entre la ligne et son décalage.
--- Accès : extension `editor_toolUtilities_polyOffset` : `extensions.load("editor_toolUtilities_polyOffset")`, puis la globale `editor_toolUtilities_polyOffset`
---@class editor_toolUtilities_polyOffset
---@field MITER_LIMIT number Facteur maximal (4.0) de longueur d'onglet par rapport à |d|.
editor_toolUtilities_polyOffset = {}

--- Intersection de deux droites P + t*D et Q + s*E en 2D. Renvoie nil si elles sont parallèles (déterminant < 1e-9).
---Source : lua/ge/extensions/editor/toolUtilities/polyOffset.lua:15
---@param px number x du point de la première droite.
---@param py number y du point de la première droite.
---@param dx number x de la direction de la première droite.
---@param dy number y de la direction de la première droite.
---@param qx number x du point de la seconde droite.
---@param qy number y du point de la seconde droite.
---@param ex number x de la direction de la seconde droite.
---@param ey number y de la direction de la seconde droite.
---@return number|nil  x de l'intersection.
---@return number|nil  y de l'intersection.
function editor_toolUtilities_polyOffset.lineIntersect(px, py, dx, dy, qx, qy, ex, ey) end

--- Point décalé d'un sommet entre deux normales d'arêtes : l'onglet, ramené le long de sa bissectrice quand l'angle est trop aigu (limite MITER_LIMIT * |d|).
---Source : lua/ge/extensions/editor/toolUtilities/polyOffset.lua:24
---@param cx number x du sommet.
---@param cy number y du sommet.
---@param n1 table Normale {x,y} de l'arête entrante.
---@param n2 table Normale {x,y} de l'arête sortante.
---@param d number Distance de décalage signée.
---@return number  x du point décalé.
---@return number  y du point décalé.
function editor_toolUtilities_polyOffset.mitrePt(cx, cy, n1, n2, d) end

--- Décale une polyligne latéralement de la distance signée d. Le type de jonction aux coins est choisi par join : 'chamfer' (deux points), 'miter' (un point par sommet) ou autre/nil (intersection des arêtes décalées, repli en deux points si trop loin).
---Source : lua/ge/extensions/editor/toolUtilities/polyOffset.lua:37
---@param pts table Liste de points {x,y}.
---@param nrm table Normales {x,y} unitaires, une par arête.
---@param d number Distance de décalage signée, en mètres.
---@param join string|nil 'chamfer', 'miter' ou nil pour la jonction par intersection.
---@return table  Liste de points {x,y} décalés.
function editor_toolUtilities_polyOffset.polyline(pts, nrm, d, join) end

--- Construit un anneau fermé allant de la ligne à son décalage : la base est enfoncée de overlap dans la masse derrière (côté opposé), puis le bord extérieur est parcouru en sens inverse.
---Source : lua/ge/extensions/editor/toolUtilities/polyOffset.lua:75
---@param pts table Liste de points {x,y}.
---@param nrm table Normales par arête.
---@param d number Distance de décalage signée.
---@param join string|nil Type de jonction, voir polyline.
---@param overlap number|nil Enfoncement de la base (défaut 0.05 m).
---@return table|nil  Anneau de points {x,y}, ou nil si moins de 2 points ou |d| < 1e-4.
function editor_toolUtilities_polyOffset.run(pts, nrm, d, join, overlap) end

