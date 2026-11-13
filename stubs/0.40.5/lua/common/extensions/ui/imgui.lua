---@meta
-- tim19Atlas stub generated from lua/common/extensions/ui/imgui.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Extension ui_imgui : point d'entrée d'ImGui pour les moddeurs Lua. Dans la VM du jeu (GE) elle devient simplement le module ui/imgui_api (aucun wrapper) ; les centaines de fonctions ImGui (Begin, Text, Button…) et leurs enums viennent donc de imgui_luaintf.lua et imgui_custom_luaintf.lua. Elle récupère le contexte ImGui principal au chargement et active le style BeamNG.
--- Accès : extension `ui_imgui` : `extensions.load("ui_imgui")`, puis la globale `ui_imgui`
---@class ui_imgui
---@field flags function Alias de bit.bor, pour combiner des flags (im.flags(im.WindowFlags_NoMove, im.WindowFlags_NoResize)).
---@field setEnabled function|nil En GE : fonction qui loggue une erreur (impossible d'activer/désactiver imgui côté GE). nil hors VM game.
ui_imgui = {}

--- Hook appelé au chargement (y compris rechargement dynamique) : récupère de nouveau le contexte ImGui principal.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/extensions/ui/imgui.lua:29
function ui_imgui.onExtensionLoaded() end

--- Hook appelé quand ImGui est prêt la première fois : récupère le contexte principal (M.ctx = Engine.imgui.GetMainContext()) et appelle Engine.imgui.enableBeamNGStyle().
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/extensions/ui/imgui.lua:22
function ui_imgui.onImGuiReady() end

