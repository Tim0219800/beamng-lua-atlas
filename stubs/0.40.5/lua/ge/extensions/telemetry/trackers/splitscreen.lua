---@meta
-- tim19Atlas stub generated from lua/ge/extensions/telemetry/trackers/splitscreen.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Suiveur de télémétrie de l'écran partagé : sessions d'écran partagé, durée d'usage de chaque configuration et modes de jeu multi-siège joués. splitScreenStarted et splitScreenStopped encadrent une session dans un niveau ; l'activité « splitScreenActive » redémarre quand le nombre de joueurs, la disposition ou le mode change ; « splitScreenGamemode » couvre un mode de jeu multi-siège.
--- Accès : extension `telemetry_trackers_splitscreen` : `extensions.load("telemetry_trackers_splitscreen")`, puis la globale `telemetry_trackers_splitscreen`
---@class telemetry_trackers_splitscreen
---@field dependencies string[] telemetry_core.
telemetry_trackers_splitscreen = {}

--- Hook appelé à la fin du niveau : clôt mode de jeu, activité et session (raison levelEnded).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/trackers/splitscreen.lua:160
function telemetry_trackers_splitscreen.onClientEndMission() end

--- Hook appelé au démarrage d'un niveau : resynchronise l'état d'écran partagé.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/trackers/splitscreen.lua:156
function telemetry_trackers_splitscreen.onClientStartMission() end

--- Hook appelé à la fermeture du jeu : clôt tout (raison gameExit).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/trackers/splitscreen.lua:166
function telemetry_trackers_splitscreen.onExit() end

--- Hook appelé au chargement : déchargement manuel et synchronisation avec la configuration courante de render_splitScreen.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/trackers/splitscreen.lua:151
function telemetry_trackers_splitscreen.onExtensionLoaded() end

--- Hook appelé au déchargement : clôt tout (même fonction que onExit).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/trackers/splitscreen.lua:166
function telemetry_trackers_splitscreen.onExtensionUnloaded() end

--- Hook appelé à l'écran de fin d'une manche : émet splitScreenGamemodeFinished (tied, hasWinner).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/trackers/splitscreen.lua:132
---@param gamemodeId string Identifiant du mode de jeu.
---@param result table|nil Résultat ({tied, winnerPlayer}).
function telemetry_trackers_splitscreen.onMultiseatGamemodeFinished(gamemodeId, result) end

--- Hook appelé pour chaque manche lancée, y compris un redémarrage depuis l'écran de fin ou le menu pause : termine le mode précédent (restarted ou switched) et démarre l'activité splitScreenGamemode.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/trackers/splitscreen.lua:121
---@param gamemodeId string Identifiant du mode de jeu.
function telemetry_trackers_splitscreen.onMultiseatGamemodeLaunched(gamemodeId) end

--- Hook appelé quand le mode de jeu s'arrête : termine l'activité avec la raison « stopped ».
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/trackers/splitscreen.lua:142
function telemetry_trackers_splitscreen.onMultiseatGamemodeStopped() end

--- Hook appelé quand la configuration d'écran partagé change : démarre/met à jour la session et l'activité, ou les termine si désactivé.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/trackers/splitscreen.lua:96
---@param enabled boolean Écran partagé actif.
---@param playerCount integer Nombre de joueurs.
---@param layout any Disposition.
---@param mode any Mode.
function telemetry_trackers_splitscreen.onSplitScreenChanged(enabled, playerCount, layout, mode) end

--- Hook appelé quand le joueur demande le démarrage de l'écran partagé : mémorise l'origine.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/trackers/splitscreen.lua:54
---@param entry string discover ou multiseatSettings.
---@param activity string Identifiant du mode de jeu ou « freeroam ».
function telemetry_trackers_splitscreen.onSplitScreenStartRequested(entry, activity) end

