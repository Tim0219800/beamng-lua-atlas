---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/gameBlur.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Gère des rectangles de flou plein écran dessinés derrière l'interface (effet scenetree.ScreenBlurFX). Les rectangles sont rangés par groupes dans M.blurRects ; à chaque onPreRender ils sont envoyés à addFrameBlurRect. Coordonnées normalisées : (0,0) en haut à gauche, (1,1) en bas à droite.
--- Accès : extension `ui_gameBlur` : `extensions.load("ui_gameBlur")`, puis la globale `ui_gameBlur`
---@class ui_gameBlur
---@field onExtensionLoaded nil Toujours nil (référence à une variable non définie).
---@field onExtensionUnloaded nil Toujours nil (référence à une variable non définie).
---@field setColor nil Toujours nil (référence à une variable non définie).
ui_gameBlur = {}

--- Hook de pré-rendu : envoie chaque rectangle au ScreenBlurFX (addFrameBlurRect) si l'UI est visible.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/gameBlur.lua:48
function ui_gameBlur.onPreRender() end

--- Supprime tous les groupes de rectangles de flou.
---Source : lua/ge/extensions/ui/gameBlur.lua:39
function ui_gameBlur.removeAllGroups() end

--- Supprime un groupe de rectangles.
---Source : lua/ge/extensions/ui/gameBlur.lua:35
---@param group string Nom du groupe.
function ui_gameBlur.removeGroup(group) end

--- Remplace tous les rectangles d'un groupe par la liste donnée.
---Source : lua/ge/extensions/ui/gameBlur.lua:31
---@param group string Nom du groupe.
---@param data table Liste de rectangles {x, y, w, h, alpha}.
function ui_gameBlur.replaceGroup(group, data) end

