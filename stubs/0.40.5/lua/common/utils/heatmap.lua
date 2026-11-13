---@meta
-- tim19Atlas stub generated from lua/common/utils/heatmap.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Preuve de concept : génère une image SVG (2048x2048) du réseau routier de la carte (map.getMap()) avec un point rouge par véhicule à chaque appel de update(). Se charge avec require('utils/heatmap'). Sert à visualiser des trajectoires ; l'image est écrite avec la bibliothèque libs/EzSVG.
--- Accès : `require("utils/heatmap")`
---@class utils_heatmap
local utils_heatmap = {}

--- Sauvegarde puis libère le document et la position du terrain.
---Source : lua/common/utils/heatmap.lua:74
function utils_heatmap.destroy() end

--- Crée le document SVG, mémorise la position du terrain et dessine les routes et noeuds de la carte.
---Source : lua/common/utils/heatmap.lua:80
---@param _filename string Fichier SVG de sortie
function utils_heatmap.init(_filename) end

--- Écrit le SVG courant dans le fichier choisi à init(). Ne fait rien si aucun document.
---Source : lua/common/utils/heatmap.lua:69
function utils_heatmap.save() end

--- À appeler à chaque frame (y compris en menu, sans rendu 3D) : dessine un cercle rouge à la position de chaque objet de map.objects.
---Source : lua/common/utils/heatmap.lua:96
function utils_heatmap.update() end

return utils_heatmap
