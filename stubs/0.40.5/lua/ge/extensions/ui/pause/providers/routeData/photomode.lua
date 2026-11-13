---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/pause/providers/routeData/photomode.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Fournisseur de données du menu pause pour la page du mode photo. Il renvoie la charge utile (payload) fournie par ui_pause_photomode.getRoutePayload(), ou à défaut une charge utile de repli (contractVersion 6) où toutes les sections et fonctions sont désactivées (caméra, scène, effets, capture, upload, Steam, etc.) et où la supersampling vaut 1 avec des limites de 1 à 24.
--- Accès : extension `ui_pause_providers_routeData_photomode` : `extensions.load("ui_pause_providers_routeData_photomode")`, puis la globale `ui_pause_providers_routeData_photomode`
---@class ui_pause_providers_routeData_photomode
---@field dependencies string[] {"ui_pause_photomode"}
ui_pause_providers_routeData_photomode = {}

--- Renvoie {mainPanelContent = {}, photomode = payload}, où payload vient de ui_pause_photomode.getRoutePayload() si disponible, sinon la charge utile de repli.
---Source : lua/ge/extensions/ui/pause/providers/routeData/photomode.lua:133
---@return table  Données de la route photomode.
function ui_pause_providers_routeData_photomode.getPhotomodeData() end

