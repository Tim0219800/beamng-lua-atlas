---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/uiStateManager.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Suit l'état de disponibilité des frameworks d'interface ('vue' et 'angular') et choisit l'écran initial. Quand les deux ont annoncé uiReady, il émet le hook onAllUiReady puis navigue vers l'écran de démarrage (consentement en ligne, disposition des boutons, jeu, onboarding ou menu) via ui_router. Il gère aussi la resynchronisation de la route après un rechargement F5 de l'UI.
--- Accès : extension `ui_uiStateManager` : `extensions.load("ui_uiStateManager")`, puis la globale `ui_uiStateManager`
---@class ui_uiStateManager
---@field dependencies string[] ui_router, ui_router_routeManager, ui_menuManager, ui_legal.
ui_uiStateManager = {}

--- Si tous les frameworks sont prêts, passe initialized à true, émet onAllUiReady et lance navigateToInitialScreen.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/uiStateManager.lua:110
function ui_uiStateManager._checkAllUiReady() end

--- Après un rechargement F5, renvoie à l'UI la route courante via guihooks 'ui_router_routeRefresh' ({request, resolved, refreshedBy}) pour chaque framework concerné.
---Source : lua/ge/extensions/ui/uiStateManager.lua:53
---@param uiType string Framework qui vient de se réannoncer.
---@return boolean  false si pas encore initialisé, sinon true.
function ui_uiStateManager.checkAndSyncRoute(uiType) end

--- Point d'entrée. En mode headless, émet directement le hook onUiReady ; sinon charge l'extension ui_router.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/uiStateManager.lua:15
---@param headlessMode boolean true si le jeu tourne sans interface.
function ui_uiStateManager.initialize(headlessMode) end

--- Indique si un framework donné, ou tous s'il n'y a pas d'argument, est prêt.
---Source : lua/ge/extensions/ui/uiStateManager.lua:39
---@param uiType string|nil Framework à tester, ou nil pour tous.
---@return boolean  true si prêt.
function ui_uiStateManager.isUiReady(uiType) end

--- Choisit l'écran de départ. Sans licence valide : 'legal.onlineFeatures' si le consentement en ligne manque, puis 'buttonLayout' si la fenêtre de disposition (showedInputLayoutPopupV37) n'a pas été vue. Sinon 'play' si on entre en jeu (état freeroam ou chargement), 'onboarding' si non montré, sinon 'menu'.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/uiStateManager.lua:86
function ui_uiStateManager.navigateToInitialScreen() end

--- Hook appelé au chargement : désactive le déchargement automatique de l'extension.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/uiStateManager.lua:78
function ui_uiStateManager.onExtensionLoaded() end

--- Appelée par l'UI quand un framework est chargé. Émet onUiReady(uiType), marque le framework prêt, puis soit resynchronise la route (déjà initialisé), soit vérifie si tous sont prêts.
---Source : lua/ge/extensions/ui/uiStateManager.lua:23
---@param uiType string 'vue' ou 'angular'.
function ui_uiStateManager.uiReady(uiType) end

