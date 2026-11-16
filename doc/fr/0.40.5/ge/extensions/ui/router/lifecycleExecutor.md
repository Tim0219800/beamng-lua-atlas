# `ui_router_lifecycleExecutor`

*Fichier : `lua/ge/extensions/ui/router/lifecycleExecutor.lua` · VM : Game Engine (GE) · 56 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_router_lifecycleExecutor` : `extensions.load("ui_router_lifecycleExecutor")`, puis la globale `ui_router_lifecycleExecutor`

Exécute les hooks de cycle de vie d'une route (onEnter, onMount, onLeave…) pour le routeur. Il résout la référence de fonction déclarée sur le nœud de route (via ui/router/utils), appelle le hook sous pcall avec (context, toRoute, fromRoute, data) et journalise les erreurs sans interrompre le routeur.

## Remarques

- runLifecycleHook renvoie (ok, erreur, estErreurDure). Un hook absent compte comme un succès. Une erreur de résolution de la référence peut être « dure » (isHard, définie par Utils.resolveFunctionReference) : le routeur abandonne alors la navigation (lifecycle_hook_error) ; une exception levée dans le hook n'est jamais dure.
- Les messages d'erreur vides sont remplacés par "unknown_error".

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_router_lifecycleExecutor.resolveHook(route, hookName)` | Résout la fonction du hook hookName sur le nœud de route (via Utils.resolveFunctionReference, avec un libellé « Lifecycle hook X on route Y »). Renvoie nil, nil, nil si la route ou le hook est absent. | 15 |
| `ui_router_lifecycleExecutor.runLifecycleHook(route, hookName, context, toRoute, fromRoute, data)` | Exécute le hook sous pcall avec (context, toRoute, fromRoute, data) ; journalise les erreurs au niveau E. | 30 |
| `ui_router_lifecycleExecutor.sanitizeError(err)` | Renvoie l'erreur si c'est une chaîne non vide, sinon "unknown_error". | 8 |

### Détail des paramètres

#### `ui_router_lifecycleExecutor.resolveHook(route, hookName)`

Résout la fonction du hook hookName sur le nœud de route (via Utils.resolveFunctionReference, avec un libellé « Lifecycle hook X on route Y »). Renvoie nil, nil, nil si la route ou le hook est absent.

- `route` (*table|nil*) : Nœud de route portant les hooks.
- `hookName` (*string*) : Nom du hook : onEnter, onMount, onLeave…
- **renvoie** : function|nil La fonction résolue.
- **renvoie** : string|nil Message d'erreur de résolution.
- **renvoie** : boolean|nil true si l'erreur de résolution est dure.

#### `ui_router_lifecycleExecutor.runLifecycleHook(route, hookName, context, toRoute, fromRoute, data)`

Exécute le hook sous pcall avec (context, toRoute, fromRoute, data) ; journalise les erreurs au niveau E.

- `route` (*table|nil*) : Nœud de route portant le hook.
- `hookName` (*string*) : Nom du hook.
- `context` (*table*) : Contexte de navigation.
- `toRoute` (*table|nil*) : Route de destination.
- `fromRoute` (*table|nil*) : Route d'origine.
- `data` (*table*) : Données de route partagées entre hooks.
- **renvoie** : boolean true si le hook est absent ou a réussi.
- **renvoie** : string|nil Message d'erreur.
- **renvoie** : boolean true si l'erreur est dure (résolution invalide).

#### `ui_router_lifecycleExecutor.sanitizeError(err)`

Renvoie l'erreur si c'est une chaîne non vide, sinon "unknown_error".

- `err` (*any*) : Erreur brute.
- **renvoie** : string Message d'erreur exploitable.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/router/lifecycleExecutor.lua`.*
