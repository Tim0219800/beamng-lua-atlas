---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/discover.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Gère les « discovers » (expériences de l'écran Découvrir/Play). Il charge tous les fichiers *.lua de /gameplay/discover/ : chacun peut exporter pageInfo (page avec sections et discoverIds), experiences (liste d'expériences avec id, type 'mission' ou 'freeroam', trigger, onLoaded, onUnloaded, playerCount…) et getProgressTag. getDiscoverPages assemble les pages pour l'UI (cartes, images, tags officiel/mod/joueurs/durée), startDiscover lance une expérience (mission ou fonction trigger), et le module gère la navigation après le fondu de chargement, des popups d'introduction et la configuration d'écran partagé (splitscreen).
--- Accès : extension `gameplay_discover` : `extensions.load("gameplay_discover")`, puis la globale `gameplay_discover`
---@class gameplay_discover
---@field dependencies table<integer, string> Extensions chargées avant : {'ui_multiseat_multiseatConfiguration'}.
gameplay_discover = {}

--- Affiche la fenêtre d'introduction des commandes de base, en choisissant le premier popup basicDriving_<imagePack> existant selon les périphériques détectés (volant, joystick, xinput, gamepad, souris, clavier, puis fallback).
---Source : lua/ge/extensions/gameplay/discover.lua:437
function gameplay_discover.basicControlsIntroPopup() end

--- Indique si l'expérience peut démarrer avec le nombre de joueurs inscrits.
---Source : lua/ge/extensions/gameplay/discover.lua:523
---@param minPlayers integer Nombre minimal de joueurs.
---@param maxPlayers integer Nombre maximal de joueurs.
---@return boolean  Résultat de canStartWithOptIns (déduit du code).
function gameplay_discover.canStartSplitscreenDiscover(minPlayers, maxPlayers) end

--- Demande d'envoyer l'évènement UI 'ClearTasklist' à la prochaine fin de niveau.
---Source : lua/ge/extensions/gameplay/discover.lua:369
function gameplay_discover.clearTasksOnClientEndMission() end

--- Change le joueur associé à un périphérique : 'toggle' bascule, 'move' déplace selon direction, sinon passe au joueur suivant.
---Source : lua/ge/extensions/gameplay/discover.lua:500
---@param deviceId any Identifiant du périphérique.
---@param operation string|nil 'toggle', 'move' ou autre pour cycler.
---@param direction any Direction pour 'move'.
---@return any  Résultat de la fonction du module splitscreen.
function gameplay_discover.cycleSplitscreenDevicePlayer(deviceId, operation, direction) end

--- Construit la liste des pages pour l'UI : chaque page est copiée, ses sections remplies de cartes (formatDiscover), les tags (joueurs, version, durée, type, progression, officiel, mod) ajoutés, l'image choisie, puis le tout est trié par date décroissante puis sortBias.
---Source : lua/ge/extensions/gameplay/discover.lua:213
---@return table[]  Pages avec title, image, description, sections[].cards[], tagList, pageKind ('minor' par défaut), date, version, duration, isOfficial, isMod, modID, modName, modTitle, showMultiseatControllers.
function gameplay_discover.getDiscoverPages() end

--- Liste les joueurs inscrits à l'écran partagé.
---Source : lua/ge/extensions/gameplay/discover.lua:519
---@return any  Joueurs inscrits (déduit du code).
function gameplay_discover.getSplitscreenOptedInPlayers() end

--- Retourne l'état d'inscription des joueurs à l'écran partagé (module gameplay/discover/multiseat/splitscreen).
---Source : lua/ge/extensions/gameplay/discover.lua:496
---@return table  État des inscriptions (déduit du code).
function gameplay_discover.getSplitscreenPlayerOptIns() end

--- Ouvre un popup d'introduction (/gameplay/discover/popups/<id>/content.json) via ui_popup, une seule fois par id et par session.
---Source : lua/ge/extensions/gameplay/discover.lua:466
---@param id string Identifiant du popup.
function gameplay_discover.introPopup(id) end

--- Fait rejoindre un groupe de périphériques dans la configuration d'écran partagé.
---Source : lua/ge/extensions/gameplay/discover.lua:511
---@param groupId any Identifiant du groupe.
---@return any  Résultat de la fonction du module splitscreen.
function gameplay_discover.joinSplitscreenDeviceGroup(groupId) end

--- Quitte la configuration d'écran partagé du menu.
---Source : lua/ge/extensions/gameplay/discover.lua:527
---@return any  Résultat de la fonction du module splitscreen.
function gameplay_discover.leaveSplitscreenMenuSetup() end

--- Charge une fois tous les fichiers /gameplay/discover/*.lua : enregistre leurs pageInfo (avec dossier et métadonnées officiel/mod), leurs experiences par id et leurs tags de progression. Appelé automatiquement par getDiscoverPages et startDiscover.
---Source : lua/ge/extensions/gameplay/discover.lua:125
function gameplay_discover.loadDiscovers() end

--- Charge une extension une seule fois (extensions.load) et, si l'expérience en cours possède onUnloaded, enveloppe le onExtensionUnloaded de l'extension pour appeler onUnloaded à son déchargement.
---Source : lua/ge/extensions/gameplay/discover.lua:386
---@param extensionName string Nom de l'extension à charger.
function gameplay_discover.loadExt(extensionName) end

--- Libère lastDiscover et, si une navigation était attendue, ouvre la route UI de fin de chargement (playRoute ou 'play'), sauf si un écran de début/fin de mission est actif.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/discover.lua:350
---@return boolean  true si la navigation a eu lieu.
function gameplay_discover.navigateToPostLoadRoute() end

--- Hook appelé à la fin d'un niveau : réinitialise la navigation si aucune expérience n'est en chargement, et vide la liste de tâches si demandé.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/discover.lua:375
function gameplay_discover.onClientEndMission() end

--- Hook d'initialisation : passe le mode de déchargement en manuel et traite les arguments de ligne de commande -discover <id> et -discover firstStart.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/discover.lua:420
function gameplay_discover.onInit() end

--- Hook appelé au changement de langue : oublie les expériences chargées pour les recharger (traductions).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/discover.lua:152
function gameplay_discover.onLanguageChanged() end

--- Hook appelé au fondu de l'écran de chargement ; même fonction que navigateToPostLoadRoute.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/discover.lua:350
---@return boolean  true si la navigation a eu lieu.
function gameplay_discover.onLoadingScreenFadeout() end

--- Associe un périphérique à un joueur (persona).
---Source : lua/ge/extensions/gameplay/discover.lua:507
---@param deviceId any Identifiant du périphérique.
---@param personaNumber integer Numéro du joueur.
---@return any  Résultat de la fonction du module splitscreen.
function gameplay_discover.setSplitscreenDevicePlayer(deviceId, personaNumber) end

--- Inscrit ou désinscrit un joueur de l'écran partagé.
---Source : lua/ge/extensions/gameplay/discover.lua:515
---@param player integer Index du joueur.
---@param optedIn boolean true pour inscrire.
---@return any  Résultat de la fonction du module splitscreen.
function gameplay_discover.setSplitscreenPlayerOptIn(player, optedIn) end

--- Lance une expérience par id. Pour une mission (missionId), démarre via gameplay_missions_missionManager.startWithLoadingLevel ; pour une expérience à fonction trigger, appelle trigger(M) puis onLoaded(M). Valide d'abord la configuration d'écran partagé si playerCount est défini.
---Source : lua/ge/extensions/gameplay/discover.lua:285
---@param discoverId string Id de l'expérience (clé id dans experiences).
---@return boolean|nil  false si la configuration d'écran partagé est invalide ; nil sinon (même en cas d'échec ou de succès).
function gameplay_discover.startDiscover(discoverId) end

