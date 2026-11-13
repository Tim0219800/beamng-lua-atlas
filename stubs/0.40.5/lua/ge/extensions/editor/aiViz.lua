---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/aiViz.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Visualisation du navgraph de l'IA dans l'éditeur. Quand un mode de dessin est actif, dessine les nœuds de la carte de navigation (map.getMap().nodes) sous forme de sphères, les liens (prismes colorés selon le mode), les voies et flèches de sens (lanes ou oneWay), et surligne le nœud ou le lien survolé par la souris. Quatre modes exclusifs : drivability, type (public/private), speedLimit et hiddenInNavi. Les liens proches (moins de 100 m en distance de chemin depuis le nœud survolé) sont aussi tracés en vert. Les nœuds sont indexés dans un quadtree.
--- Accès : extension `editor_aiViz` : `extensions.load("editor_aiViz")`, puis la globale `editor_aiViz`
---@class editor_aiViz
editor_aiViz = {}

--- Active ou désactive un mode de dessin ; activer un mode désactive les autres.
---Source : lua/ge/extensions/editor/aiViz.lua:389
---@param mode string "drivability", "type", "speedLimit" ou "hiddenInNavi".
---@param enabled boolean Activer ou désactiver.
function editor_aiViz.enableDrawMode(mode, enabled) end

--- Retourne le mode de dessin actif.
---Source : lua/ge/extensions/editor/aiViz.lua:401
---@return string|nil  Nom du mode ou nil si rien n'est dessiné.
function editor_aiViz.getDrawMode() end

--- Hook de dessin de l'éditeur : gère le survol (rayon caméra/souris contre nœuds et liens) et dessine les nœuds proches de la caméra selon le mode.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/aiViz.lua:305
function editor_aiViz.onEditorGui() end

--- Hook émis quand le navgraph est rechargé : vide le cache de nœuds et reconstruit le quadtree.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/aiViz.lua:300
function editor_aiViz.onNavgraphReloaded() end

