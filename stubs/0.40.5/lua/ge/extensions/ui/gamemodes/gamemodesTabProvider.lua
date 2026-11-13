---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/gamemodes/gamemodesTabProvider.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Façade utilisée par l'onglet « modes de jeu » de l'UI. Selon qu'une session multijoueur existe (multiplayer_sessionManager.getCurrentSession() non nil), les appels sont redirigés vers multiplayer_uiBackend_multiplayerUIManager, sinon vers gameplay_multiseat_gamemodeManager (écran partagé). Chaque fonction vérifie que le module cible est chargé et ne fait rien sinon.
--- Accès : extension `ui_gamemodes_gamemodesTabProvider` : `extensions.load("ui_gamemodes_gamemodesTabProvider")`, puis la globale `ui_gamemodes_gamemodesTabProvider`
---@class ui_gamemodes_gamemodesTabProvider
ui_gamemodes_gamemodesTabProvider = {}

--- Réseau uniquement : l'hôte désélectionne le mode (deselectGamemodeForOwner).
---Source : lua/ge/extensions/ui/gamemodes/gamemodesTabProvider.lua:61
function ui_gamemodes_gamemodesTabProvider.deselectGamemode() end

--- Demande à envoyer à l'UI les données des modes de jeu (requestMultiplayerTabData en réseau, requestGamemodeData en écran partagé).
---Source : lua/ge/extensions/ui/gamemodes/gamemodesTabProvider.lua:8
function ui_gamemodes_gamemodesTabProvider.requestGamemodeData() end

--- Réseau uniquement : demande à changer son propre rôle dans le mode de jeu.
---Source : lua/ge/extensions/ui/gamemodes/gamemodesTabProvider.lua:93
---@param role any Rôle souhaité (déduit du code : transmis tel quel).
function ui_gamemodes_gamemodesTabProvider.requestSetOwnGamemodeRole(role) end

--- Redémarre un mode de jeu en écran partagé (gamemodeManager.restart). Sans effet en session réseau.
---Source : lua/ge/extensions/ui/gamemodes/gamemodesTabProvider.lua:44
---@param name string Nom du mode de jeu.
---@param settings table|nil Réglages du mode.
function ui_gamemodes_gamemodesTabProvider.restartGamemode(name, settings) end

--- Réseau uniquement : l'hôte sélectionne un mode (selectGamemodeForOwner).
---Source : lua/ge/extensions/ui/gamemodes/gamemodesTabProvider.lua:53
---@param name string Nom du mode de jeu.
function ui_gamemodes_gamemodesTabProvider.selectGamemode(name) end

--- Réseau uniquement : définit le rôle de l'hôte avant la phase « prêt ».
---Source : lua/ge/extensions/ui/gamemodes/gamemodesTabProvider.lua:85
---@param role any Rôle (déduit du code : transmis tel quel).
function ui_gamemodes_gamemodesTabProvider.setOwnerPreReadyRole(role) end

--- Démarre un mode de jeu (multiplayerUIManager.startGamemode ou gamemodeManager.start).
---Source : lua/ge/extensions/ui/gamemodes/gamemodesTabProvider.lua:20
---@param name string Nom du mode de jeu.
---@param settings table|nil Réglages du mode (déduit du code : transmis tels quels).
function ui_gamemodes_gamemodesTabProvider.startGamemode(name, settings) end

--- Réseau uniquement : lance la phase « prêt » des joueurs pour un mode.
---Source : lua/ge/extensions/ui/gamemodes/gamemodesTabProvider.lua:69
---@param gamemodeInfo table Informations du mode (déduit du code : transmises telles quelles).
function ui_gamemodes_gamemodesTabProvider.startReadyUp(gamemodeInfo) end

--- Arrête le mode de jeu en cours (stopGamemode en réseau, stop en écran partagé).
---Source : lua/ge/extensions/ui/gamemodes/gamemodesTabProvider.lua:32
function ui_gamemodes_gamemodesTabProvider.stopGamemode() end

--- Réseau uniquement : arrête la phase « prêt ».
---Source : lua/ge/extensions/ui/gamemodes/gamemodesTabProvider.lua:77
function ui_gamemodes_gamemodesTabProvider.stopReadyUp() end

