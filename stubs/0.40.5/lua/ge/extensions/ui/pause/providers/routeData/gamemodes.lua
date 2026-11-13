---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/pause/providers/routeData/gamemodes.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Fournisseur de données du menu pause pour les modes de jeu multijoueur : liste des modes (composant GamemodesTab), configuration d'un mode (GamemodeSetupView) et réglages du mode en cours (GamemodeSettingsView). Si le multijoueur est actif, il ajoute la liste des joueurs en panneau latéral via routeData_multiplayer.
--- Accès : extension `ui_pause_providers_routeData_gamemodes` : `extensions.load("ui_pause_providers_routeData_gamemodes")`, puis la globale `ui_pause_providers_routeData_gamemodes`
---@class ui_pause_providers_routeData_gamemodes
---@field dependencies string[] {"ui_pause_providers_routeData_multiplayer"}
ui_pause_providers_routeData_gamemodes = {}

--- Renvoie la vue des réglages du mode en cours (GamemodeSettingsView).
---Source : lua/ge/extensions/ui/pause/providers/routeData/gamemodes.lua:42
---@param context table Contexte pause.
---@return table  {mainCardClass, mainPanelContent, sidePanelContents}
function ui_pause_providers_routeData_gamemodes.getGamemodeSettingsData(context) end

--- Renvoie la vue de configuration d'un mode (GamemodeSetupView, prop gamemodeName).
---Source : lua/ge/extensions/ui/pause/providers/routeData/gamemodes.lua:25
---@param context table Contexte pause.
---@param params table|nil Champ lu : gamemodeName.
---@return table  {mainCardClass, mainPanelContent, sidePanelContents}
function ui_pause_providers_routeData_gamemodes.getGamemodeSetupData(context, params) end

--- Renvoie le panneau principal GamemodesTab et, si context.isMultiplayerActive, le panneau latéral de la liste des joueurs.
---Source : lua/ge/extensions/ui/pause/providers/routeData/gamemodes.lua:16
---@param context table Contexte pause (champ lu : isMultiplayerActive).
---@return table  {mainPanelContent, sidePanelContents}
function ui_pause_providers_routeData_gamemodes.getGamemodesData(context) end

