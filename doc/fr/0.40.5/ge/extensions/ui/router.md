# `ui_router`

*Fichier : `lua/ge/extensions/ui/router.lua` · VM : Game Engine (GE) · 1176 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_router` : `extensions.load("ui_router")`, puis la globale `ui_router`

Routeur de navigation de l'interface côté Lua (ui_router). Il orchestre un « handshake » avec les frameworks UI (Vue, Angular/legacy) : résolution de la route, gardes de sortie/entrée, hooks de cycle de vie (onLeave, onEnter, onMount), envoi du changement de route au framework, puis réception des accusés (reçu, navigation démarrée, route validée, montée). Il délègue l'état aux modules ui/router/* (navigationState, transitionManager, frameworkManager, guardManager, scopeManager, breadcrumbManager…). Un moddeur s'en sert surtout pour appeler navigate/back/reload et pour écouter les hooks onUiChangedState et onUiActiveScopeChanged.

## Exemple

```lua
-- naviguer vers une route avec des paramètres
local res = ui_router.navigate("mainmenu", {})
if not res.success then log("W", "mod", "échec : " .. tostring(res.reason)) end
-- navigation non annulable (verrou de protection)
ui_router.navigate("photomode", nil, {cancellable = false})
```

## Remarques

- Séquence d'une navigation : 1) navigate émet le changement de route (FrameworkManager.sendRouteChange) ; 2) routeChangeReceived ; 3) routeNavigationStarted ; 4) routeChangeComplete promeut l'entrée en attente et termine la transition, sauf pour les routes Vue qui attendent un accusé de montage ; 5) routeMounted exécute onMount et termine la transition.
- Pour les routes Vue, les accusés doivent renvoyer un identifiant de transition non vide (sinon reason="missing_transition_id"). Angular/legacy peuvent s'en passer et sont validés par nom de route.
- Un navigate avec options.cancellable == false acquiert un verrou identifié par un jeton unique ("navProtect_N") qui bloque tout navigate/back/reload suivant (reason="active_navigation_not_cancellable") jusqu'à l'état terminal de cette navigation (fin, annulation, échec, timeout, reset, désérialisation). Sinon la dernière navigation l'emporte et annule la transition en cours (annulation « navigation_replaced »).
- Les échecs de navigate renvoient {result=false, success=false, reason=...} : active_navigation_not_cancellable, route_not_found, guard_blocked_exit, guard_blocked_enter, lifecycle_hook_error, navigation_preempted, ou l'erreur de résolution de la référence de route.
- Le nom de route accepte une référence enrichie : route relative résolue contre la route courante, requête inline (?a=1) et portée (:scope). Les paramètres explicites l'emportent sur ceux de la requête.
- Hooks émis : extensions.hook(BEFORE_ROUTE_CHANGE, entry), AFTER_ROUTE_CHANGE, ROUTE_CHANGE_CANCELLED (toRoute, fromRoute, reason, transitionId, plus timeoutClassification/phase/... pour un timeout), ROUTE_TIMING (routeName, {total, enter, ready, mountAcked} en ms), onUiChangedState(nomRoute, routeOrigine) et onUiActiveScopeChanged(payload). Évènement UI : guihooks ui_router_routeData (namespace, route, fromRoute, scopeTree, scopeParentMap, targetScope, breadcrumbs, data, status, error) avec status = enter-ready, mounted-ready ou error.
- NavigationObserver (diagnostic) n'est chargé que si shipping_build ~= true.
- back() ne renvoie rien (nil) si la route courante n'a ni backTarget ni gestionnaire de retour valide.
- L'extension se met en déchargement manuel à son chargement (setExtensionUnloadMode manual) et recharge les gardes (GuardManager.reloadGuards).
- Fonctions dépréciées : push, replace (journalisent un avertissement puis appellent navigate) et forward (renvoie {result=false, reason="deprecated_method"}). Les fonctions __test_* sont des points d'accès réservés aux tests.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_router.__test_getProtectionToken()` | Point d'accès réservé aux tests : renvoie le jeton du verrou de navigation protégée. *(interne)* | 1148 |
| `ui_router.__test_setProtectionToken(token)` | Point d'accès réservé aux tests : impose le jeton du verrou de navigation protégée. *(interne)* | 1152 |
| `ui_router.back(options)` | Retour : navigue vers le backTarget de la route courante (avec les paramètres de l'entrée précédente si elle correspond, sinon ceux de la route courante, et restoreLastScope = true) ; sinon exécute le gestionnaire de retour déclaré (RouteHandlers) si le mode est « handler ». | 715 |
| `ui_router.cancel(options)` | Annule la transition en cours (raison « cancelled ») : notifie le framework et émet le hook ROUTE_CHANGE_CANCELLED. | 751 |
| `ui_router.forward(options)` | Déprécié et non implémenté : renvoie toujours un échec. | 1167 |
| `ui_router.getBreadcrumbs()` | Renvoie le fil d'Ariane de la route courante (NavigationState.getBreadcrumbs). | 1049 |
| `ui_router.getCurrent()` | Renvoie l'entrée de navigation courante (validée) de NavigationState. | 768 |
| `ui_router.getState()` | Renvoie l'état du routeur : la route courante et l'état de portée active. | 1122 |
| `ui_router.isNavigationProtected()` | Indique si une navigation protégée (cancellable = false) est active. | 1129 |
| `ui_router.navigate(routename, params, options)` | Navigue vers une route : résout la cible, exécute les gardes de sortie de la route courante, annule toute transition en cours, exécute onLeave, les gardes d'entrée, onEnter, émet les données de route (status enter-ready) puis lance la transition vers le framework UI. | 624 |
| `ui_router.onDeserialize(data)` | Hook appelé après un rechargement : efface le verrou de protection (périmé) et restaure NavigationState à partir de data.navigation. *(interne)* *(hook)* | 1072 |
| `ui_router.onExtensionLoaded()` | Hook appelé au chargement de l'extension : passe en déchargement manuel et recharge les gardes de route. *(interne)* *(hook)* | 1083 |
| `ui_router.onGuiUpdate(dtReal, dtSim, dtRaw)` | Hook appelé à chaque mise à jour GUI (arguments de temps de la boucle principale) : fait avancer le TransitionManager, renvoie le message de changement de route au framework si besoin (resends de démarrage) ou traite un timeout de transition (émet les données de route en erreur puis annule). *(interne)* *(hook)* | 1053 |
| `ui_router.onSerialize()` | Hook appelé avant un rechargement des extensions Lua : renvoie {navigation = NavigationState.serialize()}. *(interne)* *(hook)* | 1065 |
| `ui_router.push(routename, params, options)` | Déprécié : journalise un avertissement et appelle navigate. | 1157 |
| `ui_router.reload(routeName, params, options)` | Rejoue la navigation : réutilise le nom, les paramètres et les options de l'entrée courante pour les arguments absents, puis appelle navigate. | 772 |
| `ui_router.replace(routename, params, options)` | Déprécié : journalise un avertissement et appelle navigate. | 1162 |
| `ui_router.reportActiveScope(payload)` | Appelé par l'interface pour signaler la portée (scope) active. Ignore les rapports d'une route périmée, mémorise la dernière portée active de la route (hors popup, et si la portée est déclarée dans l'arbre) puis émet le hook onUiActiveScopeChanged. | 1089 |
| `ui_router.resetStates()` | Réinitialise tout l'état du routeur : navigation, transition, observateur (non shipping), verrou de protection, données de route et portée active. | 1133 |
| `ui_router.routeChangeComplete(frameworkId, routeName, transitionId)` | Accusé du framework : la route est validée côté UI. Promeut l'entrée en attente en entrée courante, notifie le framework, émet les hooks AFTER_ROUTE_CHANGE et onUiChangedState, et termine la transition sauf si un accusé de montage Vue est attendu (et onEnter n'a pas échoué). | 853 |
| `ui_router.routeChangeFailed(frameworkId, routeName, transitionId)` | Échec de navigation signalé par le framework (par exemple chargement d'un composant Vue impossible). Annule la navigation en cours sans toucher à la route validée : valide route et identifiant, refuse si la route est déjà validée, exécute le onLeave de la destination en attente pour annuler les effets de son onEnter, puis annule la transition. | 934 |
| `ui_router.routeChangeReceived(frameworkId, routeName, transitionId)` | Accusé du framework : le changement de route a été reçu. Marque la progression routeChangeReceived de la transition. | 802 |
| `ui_router.routeChangeRejected(frameworkId, routeName, transitionId, reason)` | Rejet définitif par l'UI d'un changement de route impossible ou mal formé (les routes simplement absentes ne sont pas rejetées car elles peuvent s'enregistrer plus tard). Annule la transition active si l'identifiant correspond. | 830 |
| `ui_router.routeMounted(routeName, transitionId)` | Accusé Vue : le composant de la route est monté. Exige un identifiant de transition, une route validée (sinon reason="not_committed"), exécute onMount, émet les données de route (status mounted-ready ou error) et termine la transition. Un accusé tardif/dupliqué pour la route déjà validée renvoie {success=true, stale=true}. | 977 |
| `ui_router.routeNavigationStarted(frameworkId, routeName, transitionId)` | Accusé du framework : la navigation côté UI a démarré. Exige un identifiant de transition pour Vue pendant une transition. | 807 |

### Détail des paramètres

#### `ui_router.__test_getProtectionToken()`

Point d'accès réservé aux tests : renvoie le jeton du verrou de navigation protégée.

- **renvoie** : string|nil Jeton actif ou nil.

#### `ui_router.__test_setProtectionToken(token)`

Point d'accès réservé aux tests : impose le jeton du verrou de navigation protégée.

- `token` (*string|nil*) : Jeton à imposer.

#### `ui_router.back(options)`

Retour : navigue vers le backTarget de la route courante (avec les paramètres de l'entrée précédente si elle correspond, sinon ceux de la route courante, et restoreLastScope = true) ; sinon exécute le gestionnaire de retour déclaré (RouteHandlers) si le mode est « handler ».

- `options` (*table|nil*) : Options de navigation copiées dans la navigation de retour.
- **renvoie** : table|any Résultat de navigate ou du gestionnaire ; {result=false, reason="no_current_route"} sans route courante ; nil si rien à faire.

#### `ui_router.cancel(options)`

Annule la transition en cours (raison « cancelled ») : notifie le framework et émet le hook ROUTE_CHANGE_CANCELLED.

- `options` (*table|nil*) : Inutilisé.
- **renvoie** : table {success=true}, ou {success=false, message} s'il n'y a aucune transition.

#### `ui_router.forward(options)`

Déprécié et non implémenté : renvoie toujours un échec.

- `options` (*table|nil*) : Inutilisé.
- **renvoie** : table {result=false, reason="deprecated_method"}.

#### `ui_router.getBreadcrumbs()`

Renvoie le fil d'Ariane de la route courante (NavigationState.getBreadcrumbs).

- **renvoie** : table Liste des miettes de pain.

#### `ui_router.getCurrent()`

Renvoie l'entrée de navigation courante (validée) de NavigationState.

- **renvoie** : table|nil Entrée courante {request, resolved, routeNode, …} ou nil.

#### `ui_router.getState()`

Renvoie l'état du routeur : la route courante et l'état de portée active.

- **renvoie** : table {currentRoute=entry|nil, activeScope={activeScopeId, previousActiveScopeId, routeName}}.

#### `ui_router.isNavigationProtected()`

Indique si une navigation protégée (cancellable = false) est active.

- **renvoie** : boolean true si le verrou de protection est détenu.

#### `ui_router.navigate(routename, params, options)`

Navigue vers une route : résout la cible, exécute les gardes de sortie de la route courante, annule toute transition en cours, exécute onLeave, les gardes d'entrée, onEnter, émet les données de route (status enter-ready) puis lance la transition vers le framework UI.

- `routename` (*string*) : Nom de la route, éventuellement relatif, avec requête inline (?a=1) et portée (:scope).
- `params` (*table|nil*) : Paramètres de route (prioritaires sur les paramètres de la requête inline).
- `options` (*table|nil*) : Options : cancellable (false = navigation protégée), decorator, showDecorator, restoreLastScope, routeScopeId (ajouté automatiquement)… transmises à la requête de route.
- **renvoie** : table {result=true, success=true, data=entry} ou {result=false, success=false, reason=string, failedGuard?}.

#### `ui_router.onDeserialize(data)`

Hook appelé après un rechargement : efface le verrou de protection (périmé) et restaure NavigationState à partir de data.navigation.

- `data` (*table|nil*) : Données produites par onSerialize.

#### `ui_router.onGuiUpdate(dtReal, dtSim, dtRaw)`

Hook appelé à chaque mise à jour GUI (arguments de temps de la boucle principale) : fait avancer le TransitionManager, renvoie le message de changement de route au framework si besoin (resends de démarrage) ou traite un timeout de transition (émet les données de route en erreur puis annule).

- `dtReal` (*number*) : Delta de temps réel (secondes).
- `dtSim` (*number*) : Delta de temps simulé (inutilisé).
- `dtRaw` (*number*) : Delta de temps brut (inutilisé).

#### `ui_router.onSerialize()`

Hook appelé avant un rechargement des extensions Lua : renvoie {navigation = NavigationState.serialize()}.

- **renvoie** : table Données à restaurer par onDeserialize.

#### `ui_router.push(routename, params, options)`

Déprécié : journalise un avertissement et appelle navigate.

- `routename` (*string*) : Route cible.
- `params` (*table|nil*) : Paramètres.
- `options` (*table|nil*) : Options.
- **renvoie** : table Résultat de navigate.

#### `ui_router.reload(routeName, params, options)`

Rejoue la navigation : réutilise le nom, les paramètres et les options de l'entrée courante pour les arguments absents, puis appelle navigate.

- `routeName` (*string|nil*) : Route cible (défaut : route courante).
- `params` (*table|nil*) : Paramètres (défaut : ceux de la requête courante).
- `options` (*table|nil*) : Options (défaut : celles de la requête courante).
- **renvoie** : table Résultat de navigate, ou {success=false, message} s'il n'y a aucune route à recharger.

#### `ui_router.replace(routename, params, options)`

Déprécié : journalise un avertissement et appelle navigate.

- `routename` (*string*) : Route cible.
- `params` (*table|nil*) : Paramètres.
- `options` (*table|nil*) : Options.
- **renvoie** : table Résultat de navigate.

#### `ui_router.reportActiveScope(payload)`

Appelé par l'interface pour signaler la portée (scope) active. Ignore les rapports d'une route périmée, mémorise la dernière portée active de la route (hors popup, et si la portée est déclarée dans l'arbre) puis émet le hook onUiActiveScopeChanged.

- `payload` (*table*) : {routeName?, activeScopeId?, isPopup?}.
- **renvoie** : table {success=true}, ou {success=false, reason="invalid_payload"|"stale_route", stale?}.

#### `ui_router.routeChangeComplete(frameworkId, routeName, transitionId)`

Accusé du framework : la route est validée côté UI. Promeut l'entrée en attente en entrée courante, notifie le framework, émet les hooks AFTER_ROUTE_CHANGE et onUiChangedState, et termine la transition sauf si un accusé de montage Vue est attendu (et onEnter n'a pas échoué).

- `frameworkId` (*string*) : Framework émetteur.
- `routeName` (*string*) : Route validée (doit correspondre à l'entrée en attente).
- `transitionId` (*string|nil*) : Identifiant de transition (obligatoire pour Vue).
- **renvoie** : table {success=true, alreadyCommitted?} ou {success=false, reason=no_active_transition|missing_transition_id|missing_transition_meta|missing_pending_entry|route_mismatch|transition_id_mismatch|missing_current_entry}.

#### `ui_router.routeChangeFailed(frameworkId, routeName, transitionId)`

Échec de navigation signalé par le framework (par exemple chargement d'un composant Vue impossible). Annule la navigation en cours sans toucher à la route validée : valide route et identifiant, refuse si la route est déjà validée, exécute le onLeave de la destination en attente pour annuler les effets de son onEnter, puis annule la transition.

- `frameworkId` (*string*) : Framework émetteur (exigé avec identifiant pour Vue).
- `routeName` (*string*) : Route en échec.
- `transitionId` (*string|nil*) : Identifiant de transition.
- **renvoie** : table {success=true} ou {success=false, reason=no_active_transition|missing_transition_id|already_committed|<raison de validation>}.

#### `ui_router.routeChangeReceived(frameworkId, routeName, transitionId)`

Accusé du framework : le changement de route a été reçu. Marque la progression routeChangeReceived de la transition.

- `frameworkId` (*string*) : Framework (« vue », …) ; inutilisé ici.
- `routeName` (*string*) : Route accusée.
- `transitionId` (*string|nil*) : Identifiant de transition renvoyé par l'UI.
- **renvoie** : table Résultat de TransitionManager.markProgress.

#### `ui_router.routeChangeRejected(frameworkId, routeName, transitionId, reason)`

Rejet définitif par l'UI d'un changement de route impossible ou mal formé (les routes simplement absentes ne sont pas rejetées car elles peuvent s'enregistrer plus tard). Annule la transition active si l'identifiant correspond.

- `frameworkId` (*string*) : Framework émetteur.
- `routeName` (*string*) : Route rejetée.
- `transitionId` (*string|nil*) : Identifiant de transition (validé s'il est fourni).
- `reason` (*string|nil*) : Raison du rejet (diagnostic, transmise au hook).
- **renvoie** : table {success=true} ou {success=false, reason="no_active_transition"|"transition_id_mismatch"}.

#### `ui_router.routeMounted(routeName, transitionId)`

Accusé Vue : le composant de la route est monté. Exige un identifiant de transition, une route validée (sinon reason="not_committed"), exécute onMount, émet les données de route (status mounted-ready ou error) et termine la transition. Un accusé tardif/dupliqué pour la route déjà validée renvoie {success=true, stale=true}.

- `routeName` (*string*) : Route montée.
- `transitionId` (*string*) : Identifiant de transition de l'UI (obligatoire).
- **renvoie** : table {success=true, stale?|skipped?|alreadyMounted?} ou {success=false, reason=no_active_transition|missing_transition_id|missing_transition_context|route_mismatch|transition_id_mismatch|missing_transition_meta|not_committed|lifecycle_hook_error}.

#### `ui_router.routeNavigationStarted(frameworkId, routeName, transitionId)`

Accusé du framework : la navigation côté UI a démarré. Exige un identifiant de transition pour Vue pendant une transition.

- `frameworkId` (*string*) : Framework émetteur.
- `routeName` (*string*) : Route accusée.
- `transitionId` (*string|nil*) : Identifiant de transition.
- **renvoie** : table {success=false, reason="missing_transition_id"} ou résultat de markProgress.

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onUiActiveScopeChanged`
- `onUiChangedState` — écouté par 7 module(s)

**Évènements UI (guihooks.trigger) :** `ui_router_routeData`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/router.lua`.*
