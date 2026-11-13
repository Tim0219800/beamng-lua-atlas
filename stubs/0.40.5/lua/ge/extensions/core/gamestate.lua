---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/gamestate.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Extension GE `core_gamestate` : deux rôles. (1) Stocker l'état de JEU (freeroam, campagne… avec disposition d'applis et éléments de menu) et le diffuser aux extensions et à l'UI. (2) Piloter l'écran de chargement : les modules demandent à l'afficher (requestEnterLoadingScreen) et à le fermer (requestExitLoadingScreen) ; l'écran ne se ferme que quand TOUS les demandeurs ont terminé. Un moddeur l'utilise pour afficher l'écran de chargement pendant un travail long.
--- Accès : extension `core_gamestate` : `extensions.load("core_gamestate")`, puis la globale `core_gamestate`
---@class core_gamestate
---@field state table État de jeu courant {state, appLayout, menuItems, options} ; {} au départ et après un retour au menu principal.
core_gamestate = {}

--- Renvoie le nom de l'état de jeu s'il est non vide (affiche aussi l'état par dump(), debug).
---Source : lua/ge/extensions/core/gamestate.lua:43
---@return string|nil  Nom de l'état ou nil.
function core_gamestate.gameStateDecorator() end

--- Copie profonde de l'état de jeu.
---Source : lua/ge/extensions/core/gamestate.lua:39
---@return table  Copie de M.state.
function core_gamestate.getGameState() end

--- État de la demande d'un module.
---Source : lua/ge/extensions/core/gamestate.lua:97
---@param tagName string Identifiant du demandeur.
---@return boolean|nil  true = demandé, false = terminé, nil = jamais demandé.
function core_gamestate.getLoadingStatus(tagName) end

--- Indique si au moins un module demande l'écran de chargement. À ne pas utiliser pendant le processus de chargement lui-même (le code le déconseille) ; préférer getLoadingStatus.
---Source : lua/ge/extensions/core/gamestate.lua:93
---@return boolean  true si un chargement est demandé.
function core_gamestate.loading() end

--- Appelé par l'UI quand l'écran de chargement est réellement affiché : marque loadingActive et exécute les callbacks en attente.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/gamestate.lua:169
function core_gamestate.loadingScreenActive() end

--- Appelé par l'UI quand l'écran de chargement est fermé : remet les paramètres audio à 0, signale LoadingManager et émet le hook onLoadingScreenInactive.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/gamestate.lua:175
---@param state number|string État envoyé par l'UI (converti en nombre si possible).
function core_gamestate.loadingScreenInactive(state) end

--- Hook de changement de route UI : met à jour la musique du menu principal si les fonctions globales existent.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/gamestate.lua:224
---@param context table Contexte avec toRoute.name.
function core_gamestate.onAfterRouteChange(context) end

--- Hook de restauration : ne fait rien.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/gamestate.lua:184
---@param data any Non utilisé.
function core_gamestate.onDeserialized(data) end

--- Appelé au chargement de l'extension : demande à l'UI de signaler son initialisation (guihooks requestUIInitialised).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/gamestate.lua:202
function core_gamestate.onExtensionLoaded() end

--- Hook (alias de uiReady) appelé quand l'UI est prête : si un chargement attendait l'UI, ré-émet LoadingScreen {active = true}.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/gamestate.lua:187
function core_gamestate.onUIInitialised() end

--- Hook par image : si des callbacks attendent l'écran de chargement depuis plus d'1 s (temps cumulé borné à 1/30 s par image), force loadingScreenActive.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/gamestate.lua:210
---@param dtReal number Delta temps réel en secondes.
---@param dtSim number Delta simulation.
---@param dtRaw number Delta brut.
function core_gamestate.onUpdate(dtReal, dtSim, dtRaw) end

--- Demande l'affichage de l'écran de chargement au nom d'un module. À la première demande, envoie LoadingScreen {active = true} et règle les paramètres audio g_GameLoading=1 et g_FadeTimeMS=1000. func est appelé quand l'écran est prêt.
---Source : lua/ge/extensions/core/gamestate.lua:101
---@param tagName string Identifiant du demandeur (même nom à réutiliser pour la sortie). nil : ignoré.
---@param func function|nil Callback à exécuter quand l'écran est affiché.
function core_gamestate.requestEnterLoadingScreen(tagName, func) end

--- Indique que le demandeur a fini. Quand tous ont fini, l'écran de chargement est masqué (LoadingScreen {active = false, gotoMainMenu, gameState}) et la file de callbacks est vidée.
---Source : lua/ge/extensions/core/gamestate.lua:141
---@param tagName string Même identifiant que pour l'entrée. Un tag inconnu produit un avertissement.
---@param ignoreMenuswitch boolean|nil Non utilisé dans le code.
function core_gamestate.requestExitLoadingScreen(tagName, ignoreMenuswitch) end

--- Diffuse l'état de jeu courant : hook onGameStateUpdate et évènement UI GameStateUpdate (alias de sendGameState).
---Source : lua/ge/extensions/core/gamestate.lua:23
function core_gamestate.requestGameState() end

--- Indique à l'UI s'il faut afficher le fond du menu principal (guihooks ShowEntertainingBackground) : vrai quand getMissionFilename() est vide. Ne change pas la route de l'UI.
---Source : lua/ge/extensions/core/gamestate.lua:59
---@return boolean  true si aucun niveau n'est chargé.
function core_gamestate.requestMainMenuState() end

--- Met à jour l'état de jeu (freeroam, campagne…) puis le diffuse. Les paramètres nil gardent l'ancienne valeur.
---Source : lua/ge/extensions/core/gamestate.lua:29
---@param state string|nil Nom de l'état de jeu.
---@param appLayout any Disposition des applis UI (déduit du code).
---@param menuItems any Éléments de menu (déduit du code).
---@param options any Options supplémentaires.
function core_gamestate.setGameState(state, appLayout, menuItems, options) end

