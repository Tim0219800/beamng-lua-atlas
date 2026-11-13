---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/ezObjectSelect/transformGizmo.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Guides visuels 3D de l'outil Easy Object Select pendant une translation, une mise à l'échelle ou une rotation. Dessinés avec debugDrawer : flèches (ligne + prisme) pour la translation, lignes + sphères pour l'échelle, anneau de 64 segments et arc d'angle pour la rotation. Les couleurs sont rouge/vert/bleu pour X/Y/Z ; la longueur du guide dépend de la distance à la caméra (0.16 × distance, bornée entre 1.5 et 30 m).
--- Accès : extension `editor_ezObjectSelect_transformGizmo` : `extensions.load("editor_ezObjectSelect_transformGizmo")`, puis la globale `editor_ezObjectSelect_transformGizmo`
---@class editor_ezObjectSelect_transformGizmo
editor_ezObjectSelect_transformGizmo = {}

--- Renvoie la table des couleurs d'axes {x, y, z} (ColorF).
---Source : lua/ge/extensions/editor/ezObjectSelect/transformGizmo.lua:42
---@return table<string, ColorF>  Couleurs des axes x, y, z.
function editor_ezObjectSelect_transformGizmo.axisColors() end

--- Dessine l'anneau de rotation autour de l'axe donné et, si l'angle n'est pas nul, un arc épais de l'angle parcouru depuis le vecteur de départ.
---Source : lua/ge/extensions/editor/ezObjectSelect/transformGizmo.lua:92
---@param pivot vec3 Centre de la rotation.
---@param axis vec3 Axe de rotation (normalisé en interne, défaut Z).
---@param startVector vec3|nil Vecteur de départ projeté sur le plan de l'anneau.
---@param angle number|nil Angle en radians.
function editor_ezObjectSelect_transformGizmo.drawRotation(pivot, axis, startVector, angle) end

--- Dessine les guides de mise à l'échelle (ligne terminée par une sphère) pour les axes concernés.
---Source : lua/ge/extensions/editor/ezObjectSelect/transformGizmo.lua:64
---@param pivot vec3 Centre de l'échelle.
---@param axes table<string, vec3> Directions des axes x, y, z.
---@param constraint table|nil Contrainte d'axe/plan, ou nil.
function editor_ezObjectSelect_transformGizmo.drawScale(pivot, axes, constraint) end

--- Dessine les flèches de translation depuis le pivot pour les axes concernés par la contrainte.
---Source : lua/ge/extensions/editor/ezObjectSelect/transformGizmo.lua:46
---@param pivot vec3 Point d'origine des flèches.
---@param axes table<string, vec3> Directions des axes x, y, z (monde ou locales).
---@param constraint table|nil Contrainte d'axe/plan ({axis, exclude}), ou nil pour les trois axes.
function editor_ezObjectSelect_transformGizmo.drawTranslate(pivot, axes, constraint) end

