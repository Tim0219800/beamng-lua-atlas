---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/crawl/debugDraw.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Visualisation de debug en lecture seule des parcours du mode crawl, via debugDrawer : points de passage (sphères, flèches de direction, étiquettes) et segments, zone limite, position de départ. Partagé par l'éditeur de crawl et l'overlay de dev en jeu pour garder un rendu cohérent. À appeler à chaque image de rendu.
--- Accès : extension `gameplay_crawl_debugDraw` : `extensions.load("gameplay_crawl_debugDraw")`, puis la globale `gameplay_crawl_debugDraw`
---@class gameplay_crawl_debugDraw
gameplay_crawl_debugDraw = {}

--- Dessine la zone limite en appelant boundary:drawDebug(drawMode) (le culling caméra est fait par la zone).
---Source : lua/ge/extensions/gameplay/crawl/debugDraw.lua:99
---@param boundary table|nil Zone avec la méthode drawDebug.
---@param drawMode any Mode de dessin transmis tel quel à drawDebug.
function gameplay_crawl_debugDraw.drawBoundary(boundary, drawMode) end

--- Dessine chaque noeud (sphère, flèche selon sa rotation, étiquette « indice: nom [REC]/[BONUS] ») et les cylindres entre noeuds consécutifs, avec éventuellement la distance cumulée.
---Source : lua/ge/extensions/gameplay/crawl/debugDraw.lua:53
---@param nodes table<integer, table> Noeuds : pos (vec3), radius, rotation (quat), name, flags (isRecoveryCheckpoint, isBonusCheckpoint).
---@param opts table|nil {maxDist = number (m, 400 par défaut), showSegmentDistance = boolean, showLabels = boolean (vrai par défaut)}.
function gameplay_crawl_debugDraw.drawPath(nodes, opts) end

--- Dessine la sphère de la zone de départ, une flèche de direction et, si présent, une petite sphère à iconPosition.
---Source : lua/ge/extensions/gameplay/crawl/debugDraw.lua:105
---@param startingPosition table|nil Position de départ : transform (position, rotation, radius) et iconPosition.
function gameplay_crawl_debugDraw.drawStartingPosition(startingPosition) end

