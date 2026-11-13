---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/loop/uiColors.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Palette de couleurs d'interface pour le rallye : une couleur de thème pour la boucle (loop) et une pour la spéciale (stage), avec une variante en mode NGRC. Les fonctions écrivent la couleur dans le champ theme d'une table cible (données envoyées à l'UI). Une couleur de thème globale peut surcharger toutes les autres.
--- Accès : extension `gameplay_rally_loop_uiColors` : `extensions.load("gameplay_rally_loop_uiColors")`, puis la globale `gameplay_rally_loop_uiColors`
---@class gameplay_rally_loop_uiColors
gameplay_rally_loop_uiColors = {}

--- Renvoie l'override normalisé courant.
---Source : lua/ge/extensions/gameplay/rally/loop/uiColors.lua:30
---@return string|nil  Couleur '#RRGGBB' ou nil.
function gameplay_rally_loop_uiColors.getThemeOverride() end

--- Définit (ou efface avec nil / valeur invalide) une couleur de thème qui remplace les couleurs par défaut.
---Source : lua/ge/extensions/gameplay/rally/loop/uiColors.lua:26
---@param hexOrNil string|nil Couleur hexadécimale, avec ou sans '#', 6 chiffres.
function gameplay_rally_loop_uiColors.setThemeOverride(hexOrNil) end

--- Écrit target.theme avec la couleur de la boucle (ou de l'override s'il existe). Ne fait rien si target est nil.
---Source : lua/ge/extensions/gameplay/rally/loop/uiColors.lua:43
---@param target table|nil Table à modifier.
---@param isNgrcMode boolean true pour la variante NGRC.
function gameplay_rally_loop_uiColors.updateForLoop(target, isNgrcMode) end

--- Idem pour la couleur de spéciale.
---Source : lua/ge/extensions/gameplay/rally/loop/uiColors.lua:47
---@param target table|nil Table à modifier.
---@param isNgrcMode boolean true pour la variante NGRC.
function gameplay_rally_loop_uiColors.updateForStage(target, isNgrcMode) end

