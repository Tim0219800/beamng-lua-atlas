---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/router.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Routeur de navigation de l'interface côté Lua (ui_router). Il orchestre un « handshake » avec les frameworks UI (Vue, Angular/legacy) : résolution de la route, gardes de sortie/entrée, hooks de cycle de vie (onLeave, onEnter, onMount), envoi du changement de route au framework, puis réception des accusés (reçu, navigation démarrée, route validée, montée). Il délègue l'état aux modules ui/router/* (navigationState, transitionManager, frameworkManager, guardManager, scopeManager, breadcrumbManager…). Un moddeur s'en sert surtout pour appeler navigate/back/reload et pour écouter les hooks onUiChangedState et onUiActiveScopeChanged.
--- Accès : extension `ui_router` : `extensions.load("ui_router")`, puis la globale `ui_router`
---@class ui_router
ui_router = {}

--- Point d'accès réservé aux tests : renvoie le jeton du verrou de navigation protégée.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/router.lua:1148
---@return string|nil  Jeton actif ou nil.
function ui_router.__test_getProtectionToken() end

--- Point d'accès réservé aux tests : impose le jeton du verrou de navigation protégée.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/router.lua:1152
---@param token string|nil Jeton à imposer.
function ui_router.__test_setProtectionToken(token) end

--- Retour : navigue vers le backTarget de la route courante (avec les paramètres de l'entrée précédente si elle correspond, sinon ceux de la route courante, et restoreLastScope = true) ; sinon exécute le gestionnaire de retour déclaré (RouteHandlers) si le mode est « handler ».
---Source : lua/ge/extensions/ui/router.lua:715
---@param options table|nil Options de navigation copiées dans la navigation de retour.
---@return table|any  Résultat de navigate ou du gestionnaire ; {result=false, reason="no_current_route"} sans route courante ; nil si rien à faire.
function ui_router.back(options) end

--- Annule la transition en cours (raison « cancelled ») : notifie le framework et émet le hook ROUTE_CHANGE_CANCELLED.
---Source : lua/ge/extensions/ui/router.lua:751
---@param options table|nil Inutilisé.
---@return table  {success=true}, ou {success=false, message} s'il n'y a aucune transition.
function ui_router.cancel(options) end

--- Déprécié et non implémenté : renvoie toujours un échec.
---Source : lua/ge/extensions/ui/router.lua:1167
---@param options table|nil Inutilisé.
---@return table  {result=false, reason="deprecated_method"}.
function ui_router.forward(options) end

--- Renvoie le fil d'Ariane de la route courante (NavigationState.getBreadcrumbs).
---Source : lua/ge/extensions/ui/router.lua:1049
---@return table  Liste des miettes de pain.
function ui_router.getBreadcrumbs() end

--- Renvoie l'entrée de navigation courante (validée) de NavigationState.
---Source : lua/ge/extensions/ui/router.lua:768
---@return table|nil  Entrée courante {request, resolved, routeNode, …} ou nil.
function ui_router.getCurrent() end

--- Renvoie l'état du routeur : la route courante et l'état de portée active.
---Source : lua/ge/extensions/ui/router.lua:1122
---@return table  {currentRoute=entry|nil, activeScope={activeScopeId, previousActiveScopeId, routeName}}.
function ui_router.getState() end

--- Indique si une navigation protégée (cancellable = false) est active.
---Source : lua/ge/extensions/ui/router.lua:1129
---@return boolean  true si le verrou de protection est détenu.
function ui_router.isNavigationProtected() end

--- Navigue vers une route : résout la cible, exécute les gardes de sortie de la route courante, annule toute transition en cours, exécute onLeave, les gardes d'entrée, onEnter, émet les données de route (status enter-ready) puis lance la transition vers le framework UI.
---Source : lua/ge/extensions/ui/router.lua:624
---@param routename string Nom de la route, éventuellement relatif, avec requête inline (?a=1) et portée (:scope).
---@param params table|nil Paramètres de route (prioritaires sur les paramètres de la requête inline).
---@param options table|nil Options : cancellable (false = navigation protégée), decorator, showDecorator, restoreLastScope, routeScopeId (ajouté automatiquement)… transmises à la requête de route.
---@return table  {result=true, success=true, data=entry} ou {result=false, success=false, reason=string, failedGuard?}.
function ui_router.navigate(routename, params, options) end

--- Hook appelé après un rechargement : efface le verrou de protection (périmé) et restaure NavigationState à partir de data.navigation.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/router.lua:1072
---@param data table|nil Données produites par onSerialize.
function ui_router.onDeserialize(data) end

--- Hook appelé au chargement de l'extension : passe en déchargement manuel et recharge les gardes de route.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/router.lua:1083
function ui_router.onExtensionLoaded() end

--- Hook appelé à chaque mise à jour GUI (arguments de temps de la boucle principale) : fait avancer le TransitionManager, renvoie le message de changement de route au framework si besoin (resends de démarrage) ou traite un timeout de transition (émet les données de route en erreur puis annule).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/router.lua:1053
---@param dtReal number Delta de temps réel (secondes).
---@param dtSim number Delta de temps simulé (inutilisé).
---@param dtRaw number Delta de temps brut (inutilisé).
function ui_router.onGuiUpdate(dtReal, dtSim, dtRaw) end

--- Hook appelé avant un rechargement des extensions Lua : renvoie {navigation = NavigationState.serialize()}.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/router.lua:1065
---@return table  Données à restaurer par onDeserialize.
function ui_router.onSerialize() end

--- Déprécié : journalise un avertissement et appelle navigate.
---Source : lua/ge/extensions/ui/router.lua:1157
---@param routename string Route cible.
---@param params table|nil Paramètres.
---@param options table|nil Options.
---@return table  Résultat de navigate.
function ui_router.push(routename, params, options) end

--- Rejoue la navigation : réutilise le nom, les paramètres et les options de l'entrée courante pour les arguments absents, puis appelle navigate.
---Source : lua/ge/extensions/ui/router.lua:772
---@param routeName string|nil Route cible (défaut : route courante).
---@param params table|nil Paramètres (défaut : ceux de la requête courante).
---@param options table|nil Options (défaut : celles de la requête courante).
---@return table  Résultat de navigate, ou {success=false, message} s'il n'y a aucune route à recharger.
function ui_router.reload(routeName, params, options) end

--- Déprécié : journalise un avertissement et appelle navigate.
---Source : lua/ge/extensions/ui/router.lua:1162
---@param routename string Route cible.
---@param params table|nil Paramètres.
---@param options table|nil Options.
---@return table  Résultat de navigate.
function ui_router.replace(routename, params, options) end

--- Appelé par l'interface pour signaler la portée (scope) active. Ignore les rapports d'une route périmée, mémorise la dernière portée active de la route (hors popup, et si la portée est déclarée dans l'arbre) puis émet le hook onUiActiveScopeChanged.
---Source : lua/ge/extensions/ui/router.lua:1089
---@param payload table {routeName?, activeScopeId?, isPopup?}.
---@return table  {success=true}, ou {success=false, reason="invalid_payload"|"stale_route", stale?}.
function ui_router.reportActiveScope(payload) end

--- Réinitialise tout l'état du routeur : navigation, transition, observateur (non shipping), verrou de protection, données de route et portée active.
---Source : lua/ge/extensions/ui/router.lua:1133
function ui_router.resetStates() end

--- Accusé du framework : la route est validée côté UI. Promeut l'entrée en attente en entrée courante, notifie le framework, émet les hooks AFTER_ROUTE_CHANGE et onUiChangedState, et termine la transition sauf si un accusé de montage Vue est attendu (et onEnter n'a pas échoué).
---Source : lua/ge/extensions/ui/router.lua:853
---@param frameworkId string Framework émetteur.
---@param routeName string Route validée (doit correspondre à l'entrée en attente).
---@param transitionId string|nil Identifiant de transition (obligatoire pour Vue).
---@return table  {success=true, alreadyCommitted?} ou {success=false, reason=no_active_transition|missing_transition_id|missing_transition_meta|missing_pending_entry|route_mismatch|transition_id_mismatch|missing_current_entry}.
function ui_router.routeChangeComplete(frameworkId, routeName, transitionId) end

--- Échec de navigation signalé par le framework (par exemple chargement d'un composant Vue impossible). Annule la navigation en cours sans toucher à la route validée : valide route et identifiant, refuse si la route est déjà validée, exécute le onLeave de la destination en attente pour annuler les effets de son onEnter, puis annule la transition.
---Source : lua/ge/extensions/ui/router.lua:934
---@param frameworkId string Framework émetteur (exigé avec identifiant pour Vue).
---@param routeName string Route en échec.
---@param transitionId string|nil Identifiant de transition.
---@return table  {success=true} ou {success=false, reason=no_active_transition|missing_transition_id|already_committed|<raison de validation>}.
function ui_router.routeChangeFailed(frameworkId, routeName, transitionId) end

--- Accusé du framework : le changement de route a été reçu. Marque la progression routeChangeReceived de la transition.
---Source : lua/ge/extensions/ui/router.lua:802
---@param frameworkId string Framework (« vue », …) ; inutilisé ici.
---@param routeName string Route accusée.
---@param transitionId string|nil Identifiant de transition renvoyé par l'UI.
---@return table  Résultat de TransitionManager.markProgress.
function ui_router.routeChangeReceived(frameworkId, routeName, transitionId) end

--- Rejet définitif par l'UI d'un changement de route impossible ou mal formé (les routes simplement absentes ne sont pas rejetées car elles peuvent s'enregistrer plus tard). Annule la transition active si l'identifiant correspond.
---Source : lua/ge/extensions/ui/router.lua:830
---@param frameworkId string Framework émetteur.
---@param routeName string Route rejetée.
---@param transitionId string|nil Identifiant de transition (validé s'il est fourni).
---@param reason string|nil Raison du rejet (diagnostic, transmise au hook).
---@return table  {success=true} ou {success=false, reason="no_active_transition"|"transition_id_mismatch"}.
function ui_router.routeChangeRejected(frameworkId, routeName, transitionId, reason) end

--- Accusé Vue : le composant de la route est monté. Exige un identifiant de transition, une route validée (sinon reason="not_committed"), exécute onMount, émet les données de route (status mounted-ready ou error) et termine la transition. Un accusé tardif/dupliqué pour la route déjà validée renvoie {success=true, stale=true}.
---Source : lua/ge/extensions/ui/router.lua:977
---@param routeName string Route montée.
---@param transitionId string Identifiant de transition de l'UI (obligatoire).
---@return table  {success=true, stale?|skipped?|alreadyMounted?} ou {success=false, reason=no_active_transition|missing_transition_id|missing_transition_context|route_mismatch|transition_id_mismatch|missing_transition_meta|not_committed|lifecycle_hook_error}.
function ui_router.routeMounted(routeName, transitionId) end

--- Accusé du framework : la navigation côté UI a démarré. Exige un identifiant de transition pour Vue pendant une transition.
---Source : lua/ge/extensions/ui/router.lua:807
---@param frameworkId string Framework émetteur.
---@param routeName string Route accusée.
---@param transitionId string|nil Identifiant de transition.
---@return table  {success=false, reason="missing_transition_id"} ou résultat de markProgress.
function ui_router.routeNavigationStarted(frameworkId, routeName, transitionId) end

