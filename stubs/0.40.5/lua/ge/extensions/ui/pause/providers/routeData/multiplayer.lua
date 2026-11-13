---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/pause/providers/routeData/multiplayer.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Fournisseur de données du menu pause pour le multijoueur : page d'accueil multijoueur (boutons Paramètres de session / Modes de jeu / Gérer les joueurs), réglages de session (PauseMultiplayerSessionTab) et liste des joueurs (PauseMultiplayerPlayerList). Les actions sont en lecture seule en mode freeroamTutorial.
--- Accès : extension `ui_pause_providers_routeData_multiplayer` : `extensions.load("ui_pause_providers_routeData_multiplayer")`, puis la globale `ui_pause_providers_routeData_multiplayer`
---@class ui_pause_providers_routeData_multiplayer
ui_pause_providers_routeData_multiplayer = {}

--- Renvoie la page d'accueil multijoueur avec trois boutons de navigation (routes pause.multiplayer.settings, pause.gamemodes ou pause.gamemodeSettings, pause.multiplayer.playerList). Les deux derniers ne sont activés que si une session multijoueur est active.
---Source : lua/ge/extensions/ui/pause/providers/routeData/multiplayer.lua:30
---@param context table Contexte pause (champs lus : isMultiplayerActive, mode).
---@return table  {active, disabledReason, mainPanelContent, sidePanelContents}
function ui_pause_providers_routeData_multiplayer.getMultiplayerData(context) end

--- Renvoie la page de gestion des joueurs (composant PauseMultiplayerPlayerList avec interactive = true).
---Source : lua/ge/extensions/ui/pause/providers/routeData/multiplayer.lua:103
---@return table  {mainPanelContent}
function ui_pause_providers_routeData_multiplayer.getMultiplayerPlayerListData() end

--- Renvoie la page de réglages de session (composant PauseMultiplayerSessionTab) avec la liste des joueurs en panneau latéral.
---Source : lua/ge/extensions/ui/pause/providers/routeData/multiplayer.lua:88
---@return table  {mainPanelContent, sidePanelContents}
function ui_pause_providers_routeData_multiplayer.getMultiplayerSettingsData() end

--- Renvoie le contenu du panneau latéral « Joueurs » (titre ui.multiplayer.players et composant PauseMultiplayerPlayerList). Aussi utilisé par routeData_gamemodes.
---Source : lua/ge/extensions/ui/pause/providers/routeData/multiplayer.lua:13
---@return table  Liste de panneaux latéraux.
function ui_pause_providers_routeData_multiplayer.getPlayerListSidePanelContents() end

