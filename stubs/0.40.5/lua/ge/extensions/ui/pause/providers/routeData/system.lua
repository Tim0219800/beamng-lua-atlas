---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/pause/providers/routeData/system.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Fournisseur de données du menu pause pour la page Système. Il construit le rail de boutons en trois groupes : topSystemButtons (Options, Mods, HUD, Statistiques), firstDriveButtons (redémarrer, réinitialiser la progression, passer en freeroam, seulement pendant l'expérience First Drive) et exitSystemButtons (déconnexion multijoueur, quitter vers le menu principal, quitter le jeu avec confirmation).
--- Accès : extension `ui_pause_providers_routeData_system` : `extensions.load("ui_pause_providers_routeData_system")`, puis la globale `ui_pause_providers_routeData_system`
---@class ui_pause_providers_routeData_system
---@field dependencies string[] {"ui_pause_actions"}
ui_pause_providers_routeData_system = {}

--- Renvoie {heading = ui.pause.system, sidePanelContents = nil, rail = groupes de boutons}. Chaque bouton est enregistré via ui_pause_actions.registerButton (donc exécutable ensuite avec executeAction).
---Source : lua/ge/extensions/ui/pause/providers/routeData/system.lua:219
---@param context table Contexte pause (champs lus : mode, isMultiplayerActive, isFirstDriveActive, isFirstDriveGuided).
---@return table  Données de la page système.
function ui_pause_providers_routeData_system.getSystemData(context) end

