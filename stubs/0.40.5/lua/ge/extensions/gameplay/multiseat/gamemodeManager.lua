---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/multiseat/gamemodeManager.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Gestionnaire des modes de jeu multi-sièges (écran partagé). Il charge les fournisseurs gameplay/discover/multiseat/*Rules.lua, collecte leurs infos via le hook onGetMultiseatGamemodeInfos, démarre/arrête/relance un mode, gère le fondu, le blocage des actions d'entrée, l'attente des véhicules, ainsi que les écrans de début et de fin (via ui_router et mission.control). Un moddeur qui ajoute un mode multi-sièges passe par lui : il appelle ext.start(settings), ext.onReady(vehicles), ext.stop(), buildStartScreen, buildEndScreen.
--- Accès : extension `gameplay_multiseat_gamemodeManager` : `extensions.load("gameplay_multiseat_gamemodeManager")`, puis la globale `gameplay_multiseat_gamemodeManager`
---@class gameplay_multiseat_gamemodeManager
---@field ModuleName string Nom du module : 'gamemodeManager'.
gameplay_multiseat_gamemodeManager = {}

--- Passe la phase de 'starting' à 'waiting' : le mode annonce qu'il notifiera lui-même qu'il est prêt avec notifyReady.
---Source : lua/ge/extensions/gameplay/multiseat/gamemodeManager.lua:372
function gameplay_multiseat_gamemodeManager.deferReady() end

--- Nom du mode en cours.
---Source : lua/ge/extensions/gameplay/multiseat/gamemodeManager.lua:503
---@return string|nil  Nom, ou nil.
function gameplay_multiseat_gamemodeManager.getGamemodeId() end

--- Nombre maximal de joueurs du mode en cours (info.playerCount.max).
---Source : lua/ge/extensions/gameplay/multiseat/gamemodeManager.lua:507
---@return integer|nil  Maximum, ou nil.
function gameplay_multiseat_gamemodeManager.getMaxPlayers() end

--- Phase actuelle du mode.
---Source : lua/ge/extensions/gameplay/multiseat/gamemodeManager.lua:512
---@return string|nil  nil, 'starting', 'waiting' ou 'running'.
function gameplay_multiseat_gamemodeManager.getPhase() end

--- Nom affiché du joueur local d'index donné, d'après le persona du participant rejoint.
---Source : lua/ge/extensions/gameplay/multiseat/gamemodeManager.lua:128
---@param playerIndex integer Index du joueur (à partir de 0).
---@return string|nil  displayName, ou nil si inconnu.
function gameplay_multiseat_gamemodeManager.getPlayerName(playerIndex) end

--- Renvoie info.vehiclePool du mode en cours.
---Source : lua/ge/extensions/gameplay/multiseat/gamemodeManager.lua:394
---@return table|nil  Pool de véhicules déclaré par le mode.
function gameplay_multiseat_gamemodeManager.getVehiclePool() end

--- Retourne au menu principal (returnToMainMenu).
---Source : lua/ge/extensions/gameplay/multiseat/gamemodeManager.lua:319
function gameplay_multiseat_gamemodeManager.goToMainMenu() end

--- Indique si un mode est en cours.
---Source : lua/ge/extensions/gameplay/multiseat/gamemodeManager.lua:499
---@return boolean  true si un mode est actif.
function gameplay_multiseat_gamemodeManager.isActive() end

--- Indique si l'écran de début est en attente de la sortie de pause (la variable n'est jamais mise à true dans ce fichier).
---Source : lua/ge/extensions/gameplay/multiseat/gamemodeManager.lua:516
---@return boolean  Toujours false en pratique.
function gameplay_multiseat_gamemodeManager.isStartScreenPending() end

--- Passe en phase 'running', termine le fondu s'il est actif et exécute le callback défini par setReadyCallback. Sans effet hors phases 'starting'/'waiting'.
---Source : lua/ge/extensions/gameplay/multiseat/gamemodeManager.lua:378
function gameplay_multiseat_gamemodeManager.notifyReady() end

--- Hook après changement de route UI : si un écran de début est en attente et que la route cible est 'play' ou 'multiseat', le joue.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/multiseat/gamemodeManager.lua:591
---@param context table Contient toRoute.name.
function gameplay_multiseat_gamemodeManager.onAfterRouteChange(context) end

--- Hook de fin de niveau : arrête le mode sans réactiver le freeroam.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/multiseat/gamemodeManager.lua:686
function gameplay_multiseat_gamemodeManager.onClientEndMission() end

--- Hook de déchargement : débloque les actions, appelle ext.stop() et réinitialise tout l'état, y compris le registre des modes.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/multiseat/gamemodeManager.lua:599
function gameplay_multiseat_gamemodeManager.onExtensionUnloaded() end

--- Hook : ajoute le mode d'écran actif à la liste screensActive.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/multiseat/gamemodeManager.lua:581
---@param screensActive string[] Liste remplie en place.
function gameplay_multiseat_gamemodeManager.onGetIsMissionStartOrEndScreenActive(screensActive) end

--- Hook vide : le flux « véhicules prêts » d'onPreRender gère déjà la transition.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/multiseat/gamemodeManager.lua:587
function gameplay_multiseat_gamemodeManager.onLoadingScreenFadeout() end

--- Hook : exécute le callback du bouton cliqué (mgrId 'multiseatGamemode'). Pour l'écran de fin, immédiatement ; pour l'écran de début, après retour à la route multiseat, onUIStartButtonClicked et 0,1 s de délai.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/multiseat/gamemodeManager.lua:557
---@param button table Bouton avec mgrId et funId.
function gameplay_multiseat_gamemodeManager.onMissionScreenButtonClicked(button) end

--- Hook après application des réglages multi-sièges : relance le mode si changeSet.requiresRestart et si l'application a réussi sans exitAfterApply.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/multiseat/gamemodeManager.lua:681
---@param changeSet table Changements (requiresRestart).
---@param result table Résultat (success, exitAfterApply).
function gameplay_multiseat_gamemodeManager.onMultiseatSettingsApplied(changeSet, result) end

--- Hook de construction du menu pause multi-sièges : ajoute le bouton Modes de jeu s'il n'y a pas de mode actif, sinon Réglages, Quitter et Relancer le mode.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/multiseat/gamemodeManager.lua:624
---@param actions table[] Liste d'actions à compléter.
---@param context table Contexte (inutilisé).
---@param registerButton function Fonction qui enregistre un bouton et son callback.
function gameplay_multiseat_gamemodeManager.onPauseHomeRailBuildMultiseatActions(actions, context, registerButton) end

--- Appelé chaque image. En phase 'waiting' avec véhicules en attente : attend qu'ils soient prêts (ou le délai de 5 s), notifie prêt, appelle ext.onReady(vehicles), gèle les véhicules puis affiche l'écran de début.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/multiseat/gamemodeManager.lua:533
---@param dtReal number Delta temps réel (s).
---@param dtSim number Delta temps simulé (s).
function gameplay_multiseat_gamemodeManager.onPreRender(dtReal, dtSim) end

--- Hook : quand l'UI demande les données d'écran de mission (mode ne contenant pas 'test'), renvoie l'écran actif via onRequestMissionScreenDataReady et émet onMissionScreenReady.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/multiseat/gamemodeManager.lua:550
---@param mode string Mode d'écran demandé.
function gameplay_multiseat_gamemodeManager.onRequestMissionScreenData(mode) end

--- Hook de fondu d'écran : quand state vaut 1 (écran noir) et qu'un lancement est différé, lance le mode.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/multiseat/gamemodeManager.lua:527
---@param state integer État du fondu ; 1 = totalement fondu.
function gameplay_multiseat_gamemodeManager.onScreenFadeState(state) end

--- Hook de changement de véhicule : relance le mode si en phase 'running' et hors synchronisation des véhicules.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/multiseat/gamemodeManager.lua:675
---@param oldId integer Ancien id de véhicule.
---@param newId integer Nouvel id.
---@param player integer Joueur concerné.
function gameplay_multiseat_gamemodeManager.onVehicleSwitched(oldId, newId, player) end

--- Affiche l'écran de début s'il était en attente.
---Source : lua/ge/extensions/gameplay/multiseat/gamemodeManager.lua:520
---@return boolean  true si l'écran a été affiché.
function gameplay_multiseat_gamemodeManager.playPendingRound() end

--- Envoie à l'UI (guihooks OnGamemodeData, context 'multiseat') la liste des modes disponibles, le mode en cours, ses réglages et la liste des joueurs. Les modes mapUnsupported ou dépassant le nombre de joueurs sont comptés mais non listés.
---Source : lua/ge/extensions/gameplay/multiseat/gamemodeManager.lua:144
function gameplay_multiseat_gamemodeManager.requestGamemodeData() end

--- Relance le mode (celui en cours si name est nil) avec fondu. Si le mode demandé n'est pas le mode actif, appelle start.
---Source : lua/ge/extensions/gameplay/multiseat/gamemodeManager.lua:481
---@param name string|nil Mode à relancer.
---@param settings table|nil Nouveaux réglages ; nil = garder les actuels.
---@return boolean  false s'il n'y a aucun mode à relancer.
function gameplay_multiseat_gamemodeManager.restart(name, settings) end

--- Définit une fonction appelée une fois, quand le mode passe à la phase 'running' (notifyReady).
---Source : lua/ge/extensions/gameplay/multiseat/gamemodeManager.lua:368
---@param callback function|nil Fonction sans argument.
function gameplay_multiseat_gamemodeManager.setReadyCallback(callback) end

--- Indique si le démarrage a été demandé avec options.assignVehiclePool = true.
---Source : lua/ge/extensions/gameplay/multiseat/gamemodeManager.lua:399
---@return boolean  true si le pool doit être assigné.
function gameplay_multiseat_gamemodeManager.shouldAssignVehiclePool() end

--- Affiche l'écran de fin : émet onMultiseatGamemodeFinished, met le temps de simulation en pause, puis construit l'écran à partir de resultData et des surcharges de buildEndScreen du mode (header, headerColor, body, layout, pages, buttons). Par défaut : boutons Rejouer, Freeroam, Menu principal.
---Source : lua/ge/extensions/gameplay/multiseat/gamemodeManager.lua:252
---@param resultData table|nil Champs lus : title, tied, winnerPlayer (index), text.
function gameplay_multiseat_gamemodeManager.showEndScreen(resultData) end

--- Démarre un mode : charge ui_multiseat_freeroam, arrête le mode précédent, charge l'extension du mode (info.extensionPath), lui assigne ext.info, retient les réglages (défauts de info.settings si nil), désactive le freeroam multi-sièges puis lance le mode (avec fondu sauf options.withFade == false).
---Source : lua/ge/extensions/gameplay/multiseat/gamemodeManager.lua:432
---@param name string Nom du mode dans le registre.
---@param settings table|nil Réglages ; nil = valeurs par défaut.
---@param options table|nil withFade (boolean, false = sans fondu), assignVehiclePool (boolean).
---@return boolean  true si le lancement est démarré, false en cas d'erreur.
function gameplay_multiseat_gamemodeManager.start(name, settings, options) end

--- Arrête le mode en cours, appelle ext.stop() et réactive le freeroam multi-sièges (ui_multiseat_freeroam.activate).
---Source : lua/ge/extensions/gameplay/multiseat/gamemodeManager.lua:364
function gameplay_multiseat_gamemodeManager.stop() end

