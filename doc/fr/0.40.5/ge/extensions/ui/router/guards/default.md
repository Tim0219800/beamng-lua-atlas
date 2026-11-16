# `ui_router_guards_default`

*Fichier : `lua/ge/extensions/ui/router/guards/default.lua` · VM : Game Engine (GE) · 55 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_router_guards_default` : `extensions.load("ui_router_guards_default")`, puis la globale `ui_router_guards_default`

Trois gardes de navigation « par défaut » du routeur : journalisation de la navigation, blocage si le délai de transition est atteint, blocage si une transition est déjà en cours (sauf context.settings.force). Chacune reçoit (lifecycleName, context) et renvoie {result=boolean, context=...}.

## Remarques

- Ce module n'exporte pas de table M.guards : GuardManager.reloadGuards ne les enregistre donc pas, et GuardManager.executeGuards appelle les gardes avec (route, params, context), signature différente de celle-ci (lifecycleName, context). Ces fonctions semblent être un reliquat non branché dans le routeur actuel (déduit du code).
- handleTimeoutGuard appelle TransitionManager.isTimeoutReached ; le contexte reçoit reason="timeout_reached" ou "transition_in_progress" en cas de blocage.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_router_guards_default.handleTimeoutGuard(lifecycleName, context)` | Bloque la navigation si TransitionManager.isTimeoutReached() est vrai (context.reason = "timeout_reached"). | 16 |
| `ui_router_guards_default.handleTransitionStateGuard(lifecycleName, context)` | Autorise si aucune transition n'est en cours ou si context.settings.force est vrai ; sinon bloque avec context.reason = "transition_in_progress". | 34 |
| `ui_router_guards_default.logNavigationGuard(lifecycleName, context)` | Journalise (niveau debug) « Navigation: <context.to.name> » et autorise toujours. | 8 |

### Détail des paramètres

#### `ui_router_guards_default.handleTimeoutGuard(lifecycleName, context)`

Bloque la navigation si TransitionManager.isTimeoutReached() est vrai (context.reason = "timeout_reached").

- `lifecycleName` (*string*) : Nom de l'étape (inutilisé).
- `context` (*table*) : Contexte de navigation, modifié (reason).
- **renvoie** : table {result=false|true, context=context}.

#### `ui_router_guards_default.handleTransitionStateGuard(lifecycleName, context)`

Autorise si aucune transition n'est en cours ou si context.settings.force est vrai ; sinon bloque avec context.reason = "transition_in_progress".

- `lifecycleName` (*string*) : Nom de l'étape (inutilisé).
- `context` (*table*) : Contexte avec context.settings.force.
- **renvoie** : table {result=boolean, context=context}.

#### `ui_router_guards_default.logNavigationGuard(lifecycleName, context)`

Journalise (niveau debug) « Navigation: <context.to.name> » et autorise toujours.

- `lifecycleName` (*string*) : Nom de l'étape de cycle de vie (inutilisé).
- `context` (*table*) : Contexte de navigation avec context.to.name.
- **renvoie** : table {result=true, context=context}.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/router/guards/default.lua`.*
