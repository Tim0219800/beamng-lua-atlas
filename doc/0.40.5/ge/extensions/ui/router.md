# `ui_router`

*Fichier : `lua/ge/extensions/ui/router.lua` · VM : Game Engine (GE) · 1176 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_router` : `extensions.load("ui_router")`, puis la globale `ui_router`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_router.__test_getProtectionToken()` | Test-only seams for the protected-navigation lock. Not part of the public router API; they let<br> the co-located navigationProtection tests seed and inspect the identity-safe token directly. | 1148 |
| `ui_router.__test_setProtectionToken(token)` |  | 1152 |
| `ui_router.back(options)` |  | 715 |
| `ui_router.cancel(options)` |  | 751 |
| `ui_router.forward(options)` |  | 1167 |
| `ui_router.getBreadcrumbs()` |  | 1049 |
| `ui_router.getCurrent()` |  | 768 |
| `ui_router.getState()` |  | 1122 |
| `ui_router.isNavigationProtected()` |  | 1129 |
| `ui_router.navigate(routename, params, options)` |  | 624 |
| `ui_router.onDeserialize(data)` | *(hook)* | 1072 |
| `ui_router.onExtensionLoaded()` | *(hook)* | 1083 |
| `ui_router.onGuiUpdate(dtReal, dtSim, dtRaw)` | *(hook)* | 1053 |
| `ui_router.onSerialize()` | *(hook)* | 1065 |
| `ui_router.push(routename, params, options)` | Deprecated methods | 1157 |
| `ui_router.reload(routeName, params, options)` |  | 772 |
| `ui_router.replace(routename, params, options)` |  | 1162 |
| `ui_router.reportActiveScope(payload)` |  | 1089 |
| `ui_router.resetStates()` |  | 1133 |
| `ui_router.routeChangeComplete(frameworkId, routeName, transitionId)` |  | 853 |
| `ui_router.routeChangeFailed(frameworkId, routeName, transitionId)` | Framework-reported navigation failure (e.g. the Vue push rejected because a component<br>  chunk failed to load). Rolls back the in-flight navigation without disturbing the<br>  committed route:<br>    - validates the failure against the active transition (route + transition id),<br>    - rejects a failure that arrives after commit (too late to roll back safely),<br>    - runs the pending destination's onLeave to reverse its onEnter side effects,<br>    - cancels the matching transition (which clears the pending entry), leaving the<br>      committed route untouched.<br><br>  @param frameworkId - Reporting framework (kept for API symmetry)<br>  @param routeName - Canonical route name that failed to hand off<br>  @param transitionId - Active transition id being echoed back (optional)<br>  @return { success, reason? } | 934 |
| `ui_router.routeChangeReceived(frameworkId, routeName, transitionId)` |  | 802 |
| `ui_router.routeChangeRejected(frameworkId, routeName, transitionId, reason)` | Definitive UI rejection of an in-flight route change.<br><br>  This is only for structurally impossible / malformed requests that can never resolve on the<br>  UI side. Missing routes are NOT rejected here: runtime/mod routes may register later, so those<br>  requests stay retryable via the startup resends. When the rejection matches the active<br>  transition, cancel it (clearing the pending entry) and notify with the transition id.<br><br>  @param frameworkId - Framework reporting the rejection (e.g. "vue")<br>  @param routeName - Route the UI rejected<br>  @param transitionId - Active transition id being echoed back (validated when provided)<br>  @param reason - Optional rejection reason for diagnostics<br>  @return { success, reason? } | 830 |
| `ui_router.routeMounted(routeName, transitionId)` |  | 977 |
| `ui_router.routeNavigationStarted(frameworkId, routeName, transitionId)` |  | 807 |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onUiActiveScopeChanged`
- `onUiChangedState` — écouté par 7 module(s)

**Évènements UI (guihooks.trigger) :** `ui_router_routeData`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/router.lua`.*
