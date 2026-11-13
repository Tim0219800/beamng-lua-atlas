# `ui_router_navigationObserver`

*Fichier : `lua/ge/extensions/ui/router/navigationObserver.lua` · VM : Game Engine (GE) · 234 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_router_navigationObserver` : `extensions.load("ui_router_navigationObserver")`, puis la globale `ui_router_navigationObserver`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_router_navigationObserver.attachResolvedTarget(attempt, target)` | Attach the resolved navigation target (canonical route, effective params, scope, options) to<br> an attempt after resolveNavigationTarget() succeeds. | 179 |
| `ui_router_navigationObserver.beginAttempt()` | Begin a new attempt at navigate() entry, capturing the external Lua caller. Must be called<br>  before any router wrapper obscures the caller. Returns the attempt so the navigate() call can<br>  hold its own reference across re-entrant navigations. | 164 |
| `ui_router_navigationObserver.getCurrentAttempt()` |  | 189 |
| `ui_router_navigationObserver.reportPreemption(preemptedAttempt, replacementAttempt, phase)` | Report a proven preemption: preemptedAttempt was in flight when replacementAttempt superseded<br>  it. Classifies the pair, emits a single warning, and returns the record. Skips no-op cases<br>  (missing attempts, self-preemption) and never reports the same preempted attempt twice.<br><br>  @param preemptedAttempt - the older navigation that was cut short<br>  @param replacementAttempt - the navigation that superseded it<br>  @param phase - diagnostic label for where the preemption was detected<br>  @return the warning record, or nil when nothing was reported | 203 |
| `ui_router_navigationObserver.reset()` |  | 227 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `ModuleName` | string |  |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/router/navigationObserver.lua`.*
