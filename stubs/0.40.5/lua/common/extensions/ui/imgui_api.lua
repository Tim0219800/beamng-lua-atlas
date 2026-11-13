---@meta
-- tim19Atlas stub generated from lua/common/extensions/ui/imgui_api.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Module interne qui assemble l'API ImGui : crée la table M avec le champ ctx (contexte ImGui global) puis y injecte les fonctions générées de imgui_luaintf.lua et les ajouts personnalisés de imgui_custom_luaintf.lua. Le fichier précise de ne pas l'utiliser directement (utiliser ui_imgui) et qu'il doit rester synchronisé avec imgui_api.h côté C++.
--- Accès : extension `ui_imgui_api` : `extensions.load("ui_imgui_api")`, puis la globale `ui_imgui_api`
---@class ui_imgui_api
---@field ctx userdata|nil Contexte ImGui global Lua ; nil à la création, renseigné par ui_imgui.
ui_imgui_api = {}

