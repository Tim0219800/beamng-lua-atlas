---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/snaproad/normals.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Petit utilitaire de calcul de normales pour les points d'un snaproad de rallye. À partir d'un point doté de liens prev/next, il calcule le vecteur normal « vers l'avant » en s'appuyant sur les voisins disponibles (rallyUtil.calculateForwardNormal).
--- Accès : extension `gameplay_rally_snaproad_normals` : `extensions.load("gameplay_rally_snaproad_normals")`, puis la globale `gameplay_rally_snaproad_normals`
---@class gameplay_rally_snaproad_normals
gameplay_rally_snaproad_normals = {}

--- Calcule la normale vers l'avant du point. Utilise prev→next si les deux existent, sinon courant→next, sinon prev→courant ; renvoie nil si aucun voisin n'existe.
---Source : lua/ge/extensions/gameplay/rally/snaproad/normals.lua:19
---@param point table Point avec pos, prev et next
---@return vec3|nil  Vecteur normal construit à partir de x, y, z du résultat de rallyUtil.calculateForwardNormal
function gameplay_rally_snaproad_normals.forwardNormalVec(point) end

--- Renvoie le triplet (point précédent, point courant, point suivant) d'un point ; renvoie nil, nil, nil si le point est nil.
---Source : lua/ge/extensions/gameplay/rally/snaproad/normals.lua:9
---@param point table|nil Point avec champs prev et next (et pos)
---@return table|nil  point.prev
---@return table|nil  le point lui-même
---@return table|nil  point.next
function gameplay_rally_snaproad_normals.normalAlignPoints(point) end

