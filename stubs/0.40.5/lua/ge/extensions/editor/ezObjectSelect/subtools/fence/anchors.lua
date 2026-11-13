---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/ezObjectSelect/subtools/fence/anchors.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Découverte automatique d'une clôture dans l'outil Easy Object Select. À partir d'un TSStatic de départ (dont le mesh figure dans la liste d'assets autorisés), il cherche les TSStatic voisins dont les ancres (milieux des petits côtés de la boîte, via objectBoxAnchors) se correspondent mutuellement à moins de options.distance, construit le graphe de connexion, ordonne les pièces, détecte une boucle et calcule les points de jonction de la spline. draw() trace ces jonctions avec debugDrawer.
--- Accès : extension `editor_ezObjectSelect_subtools_fence_anchors` : `extensions.load("editor_ezObjectSelect_subtools_fence_anchors")`, puis la globale `editor_ezObjectSelect_subtools_fence_anchors`
---@class editor_ezObjectSelect_subtools_fence_anchors
editor_ezObjectSelect_subtools_fence_anchors = {}

--- Parcourt en largeur les pièces de clôture connectées au seed. Renvoie nil et un message si l'objet de départ n'est pas une pièce éligible.
---Source : lua/ge/extensions/editor/ezObjectSelect/subtools/fence/anchors.lua:184
---@param seedObjectId integer ID de l'objet TSStatic de départ.
---@param options table|nil assetPaths (string[], mesh autorisés), distance (m, défaut 0.5, min 0.001), maximumPieces (défaut 2048).
---@return table|nil  {ids (ordonnés), graph, descriptors, joints (vec3[]), isLoop, capped}.
---@return string|nil  Message d'erreur si nil.
function editor_ezObjectSelect_subtools_fence_anchors.discover(seedObjectId, options) end

--- Dessine avec debugDrawer:drawLine la polyligne des jonctions (et le segment de fermeture si boucle) du résultat de discover.
---Source : lua/ge/extensions/editor/ezObjectSelect/subtools/fence/anchors.lua:251
---@param result table|nil Résultat de discover ; ne fait rien si nil.
function editor_ezObjectSelect_subtools_fence_anchors.draw(result) end

