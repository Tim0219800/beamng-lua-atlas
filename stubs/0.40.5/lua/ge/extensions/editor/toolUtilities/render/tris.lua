---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/render/tris.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Dessin de triangles pleins pour les outils d'édition de splines (issu de l'ancien render.lua). Triangles filtrés à 600 m de la caméra, remplissage de polygones simples (triangulation par découpe d'oreilles) et remplissage de régions 2D avec trous par balayage de lignes (règle pair-impair). Sert aux aperçus de surfaces dans l'éditeur.
--- Accès : extension `editor_toolUtilities_render_tris` : `extensions.load("editor_toolUtilities_render_tris")`, puis la globale `editor_toolUtilities_render_tris`
---@class editor_toolUtilities_render_tris
editor_toolUtilities_render_tris = {}

--- Remplit un polygone simple, éventuellement concave, dont les sommets sont des vec3 déjà à la hauteur de dessin. Triangule en 2D (x,y) par découpe d'oreilles (geom.triangulatePolygon2D), puis dessine les triangles. Sans effet pour moins de 3 sommets ou un anneau dégénéré.
---Source : lua/ge/extensions/editor/toolUtilities/render/tris.lua:40
---@param verts vec3[] Sommets du polygone.
---@param col integer Couleur packée.
function editor_toolUtilities_render_tris.drawFilledPolygon(verts, col) end

--- Remplit un ensemble de régions 2D (anneaux {x=,y=}), trous compris, par balayage horizontal avec la règle pair-impair : un point dans un nombre impair d'anneaux est rempli. Gère formes concaves et régions disjointes sans triangulation.
---Source : lua/ge/extensions/editor/toolUtilities/render/tris.lua:56
---@param regions table Liste d'anneaux, chacun une liste de {x=,y=}.
---@param col integer Couleur packée.
---@param zFn function zFn(x, y) renvoie la hauteur de dessin (ex. hauteur du terrain).
---@param step number|nil Pas de balayage ; auto entre 0.25 et 3 m (hauteur/100) si nil.
function editor_toolUtilities_render_tris.drawFilledRegions2D(regions, col, zFn, step) end

--- Triangle de surface active (colourActiveSurf).
---Source : lua/ge/extensions/editor/toolUtilities/render/tris.lua:35
---@param a vec3 Sommet 1.
---@param b vec3 Sommet 2.
---@param c vec3 Sommet 3.
function editor_toolUtilities_render_tris.drawTriActiveSurface(a, b, c) end

--- Dessine un triangle plein de couleur col s'il est entièrement à moins de 600 m de la caméra.
---Source : lua/ge/extensions/editor/toolUtilities/render/tris.lua:27
---@param a vec3 Sommet 1.
---@param b vec3 Sommet 2.
---@param c vec3 Sommet 3.
---@param col integer Couleur packée.
function editor_toolUtilities_render_tris.drawTriCulled(a, b, c, col) end

--- Triangle de surface non sélectionnée (colourNotSelectedSurf).
---Source : lua/ge/extensions/editor/toolUtilities/render/tris.lua:33
---@param a vec3 Sommet 1.
---@param b vec3 Sommet 2.
---@param c vec3 Sommet 3.
function editor_toolUtilities_render_tris.drawTriNotSelectedSurface(a, b, c) end

--- Triangle de surface d'aperçu (colourPreviewSurf).
---Source : lua/ge/extensions/editor/toolUtilities/render/tris.lua:34
---@param a vec3 Sommet 1.
---@param b vec3 Sommet 2.
---@param c vec3 Sommet 3.
function editor_toolUtilities_render_tris.drawTriPreviewSurface(a, b, c) end

