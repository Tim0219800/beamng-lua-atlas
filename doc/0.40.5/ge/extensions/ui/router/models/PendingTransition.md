# `ui_router_models_PendingTransition`

*Fichier : `lua/ge/extensions/ui/router/models/PendingTransition.lua` · VM : Game Engine (GE) · 165 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_router_models_PendingTransition` : `extensions.load("ui_router_models_PendingTransition")`, puis la globale `ui_router_models_PendingTransition`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_router_models_PendingTransition.create(action, toRoute, fromRoute, options)` | Create a new PendingTransition.<br><br>  @param action - Navigation action ("push"\|"replace"\|"back"\|"forward")<br>  @param toRoute - ResolvedRoute we're navigating to<br>  @param fromRoute - HistoryEntry we're navigating from (optional)<br>  @param options - Navigation options (optional)<br>  @return PendingTransition | 53 |
| `ui_router_models_PendingTransition.isBackward(transition)` | Check if this is a backward navigation.<br><br>  @param transition - The PendingTransition<br>  @return boolean | 115 |
| `ui_router_models_PendingTransition.isForward(transition)` | Check if this is a forward navigation.<br><br>  @param transition - The PendingTransition<br>  @return boolean | 125 |
| `ui_router_models_PendingTransition.shouldClearForward(transition)` | Check if this navigation should clear forward stack.<br><br>  @param transition - The PendingTransition<br>  @return boolean | 152 |
| `ui_router_models_PendingTransition.shouldUpdateHistory(transition)` | Check if this navigation should update history.<br><br>  @param transition - The PendingTransition<br>  @return boolean | 135 |
| `ui_router_models_PendingTransition.validate(transition)` | Check if a PendingTransition is valid.<br><br>  @param transition - The PendingTransition to validate<br>  @return isValid, errors | 86 |

## Appels vers le moteur (C++)

- `Engine.` `generateUUID`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/router/models/PendingTransition.lua`.*
