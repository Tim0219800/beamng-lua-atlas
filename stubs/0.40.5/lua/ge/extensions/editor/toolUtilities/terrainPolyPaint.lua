---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/terrainPolyPaint.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Peinture de matériau de terrain sur un anneau polygonal (remplissage par lignes de balayage) ou sur une liste de cellules, avec un enregistrement d'annulation. Un enregistrement est { xs, ys, prev, cnt } : coordonnées monde de chaque cellule peinte et son indice de matériau d'ORIGINE, pour restaurer exactement l'état d'avant. Chaque enregistrement est une surcouche vivante jusqu'à revert ou release ; les enregistrements s'empilent dans l'ordre de peinture, et liftAll/layAll les retirent et les remettent tous (sauvegarde du terrain, repeinture du réseau dessous). Une seule mise à jour de grille est faite sur la zone touchée.
--- Accès : extension `editor_toolUtilities_terrainPolyPaint` : `extensions.load("editor_toolUtilities_terrainPolyPaint")`, puis la globale `editor_toolUtilities_terrainPolyPaint`
---@class editor_toolUtilities_terrainPolyPaint
editor_toolUtilities_terrainPolyPaint = {}

--- Remet la peinture, du plus ancien au plus récent, par-dessus ce qui se trouve maintenant dessous, puis rafraîchit la grille sur la zone touchée.
---Source : lua/ge/extensions/editor/toolUtilities/terrainPolyPaint.lua:191
function editor_toolUtilities_terrainPolyPaint.layAll() end

--- Retire la peinture de tous les enregistrements vivants, du plus récent au plus ancien. S'emboîte : seul l'appel le plus externe agit. Pas de rafraîchissement de grille, layAll suit toujours dans la même frame.
---Source : lua/ge/extensions/editor/toolUtilities/terrainPolyPaint.lua:173
function editor_toolUtilities_terrainPolyPaint.liftAll() end

--- Peint une liste explicite de cellules (xs/ys monde) toutes avec `matIdx`.
---Source : lua/ge/extensions/editor/toolUtilities/terrainPolyPaint.lua:113
---@param xs number[] X monde des cellules.
---@param ys number[] Y monde des cellules.
---@param matIdx integer Indice de matériau.
---@param prev integer[]|nil Matériaux d'origine déjà connus ; s'ils sont absents ou vides, ils sont lus sur le terrain.
---@return table|nil  Enregistrement d'annulation, nil si la liste est vide ou sans terrain.
function editor_toolUtilities_terrainPolyPaint.paintCells(xs, ys, matIdx, prev) end

--- Peint les cellules du terrain à l'intérieur de `ring` (remplissage par balayage), puis rafraîchit la grille sur la boîte touchée. Renvoie l'enregistrement d'annulation, nil si rien n'a été peint.
---Source : lua/ge/extensions/editor/toolUtilities/terrainPolyPaint.lua:82
---@param ring table Anneau de points en XY monde (3 au moins).
---@param mat integer|function Indice de couche pour tout l'anneau, ou fonction mat(gx, gy, wx, wy) interrogée par cellule qui renvoie un indice, ou nil pour laisser la cellule.
---@return table|nil  Enregistrement { xs, ys, prev, cnt, ... }.
function editor_toolUtilities_terrainPolyPaint.paintRing(ring, mat) end

--- Cède la peinture d'un enregistrement au terrain (gravure, cuisson) : elle reste peinte et n'est plus retirée avec le reste.
---Source : lua/ge/extensions/editor/toolUtilities/terrainPolyPaint.lua:166
---@param rec table|nil Enregistrement.
function editor_toolUtilities_terrainPolyPaint.release(rec) end

--- Remet les cellules d'un enregistrement dans leurs matériaux d'origine puis fait une mise à jour de grille unique. Les enregistrements peints par-dessus depuis sont retirés d'abord puis remis, pour que chaque cellule retrouve ce qui était vraiment dessous.
---Source : lua/ge/extensions/editor/toolUtilities/terrainPolyPaint.lua:135
---@param rec table|nil Enregistrement renvoyé par paintRing ou paintCells.
function editor_toolUtilities_terrainPolyPaint.revert(rec) end

