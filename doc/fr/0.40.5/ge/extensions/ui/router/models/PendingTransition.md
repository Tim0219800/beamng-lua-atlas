# `ui_router_models_PendingTransition`

*Fichier : `lua/ge/extensions/ui/router/models/PendingTransition.lua` · VM : Game Engine (GE) · 165 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_router_models_PendingTransition` : `extensions.load("ui_router_models_PendingTransition")`, puis la globale `ui_router_models_PendingTransition`

Modèle de données « PendingTransition » : représente une transition de navigation en cours {transitionId, action, toRoute, fromRoute, options}. Fournit un constructeur, une validation et des prédicats sur l'action (retour, avant, mise à jour de l'historique, effacement de la pile avant).

## Remarques

- Dans router.lua actuel, les transitions sont gérées par transitionManager : ce modèle semble peu ou pas utilisé par le routeur (déduit du code ; non vérifié ailleurs).
- Actions valides : push, replace, back, forward (Constants.NavigationAction) ; une action invalide devient push avec un avertissement. L'identifiant est « transition_<compteur>_<UUID> ».

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_router_models_PendingTransition.create(action, toRoute, fromRoute, options)` | Crée une PendingTransition. Renvoie nil (erreur journalisée) si toRoute est absent. | 53 |
| `ui_router_models_PendingTransition.isBackward(transition)` | Indique si l'action est « back ». | 115 |
| `ui_router_models_PendingTransition.isForward(transition)` | Indique si l'action est « forward ». | 125 |
| `ui_router_models_PendingTransition.shouldClearForward(transition)` | Indique si la navigation efface la pile « avant » (push et replace). | 152 |
| `ui_router_models_PendingTransition.shouldUpdateHistory(transition)` | Indique si la navigation ajoute une entrée à l'historique (uniquement push). | 135 |
| `ui_router_models_PendingTransition.validate(transition)` | Vérifie la présence de transitionId, action et toRoute. | 86 |

### Détail des paramètres

#### `ui_router_models_PendingTransition.create(action, toRoute, fromRoute, options)`

Crée une PendingTransition. Renvoie nil (erreur journalisée) si toRoute est absent.

- `action` (*string*) : push, replace, back ou forward.
- `toRoute` (*table*) : ResolvedRoute de destination.
- `fromRoute` (*table|nil*) : Entrée d'historique d'origine.
- `options` (*table|nil*) : Options de navigation ({} par défaut).
- **renvoie** : table|nil {transitionId, action, toRoute, fromRoute, options}.

#### `ui_router_models_PendingTransition.isBackward(transition)`

Indique si l'action est « back ».

- `transition` (*table|nil*) : Transition.
- **renvoie** : boolean|nil true si action == back (nil/false si transition nil).

#### `ui_router_models_PendingTransition.isForward(transition)`

Indique si l'action est « forward ».

- `transition` (*table|nil*) : Transition.
- **renvoie** : boolean|nil true si action == forward.

#### `ui_router_models_PendingTransition.shouldClearForward(transition)`

Indique si la navigation efface la pile « avant » (push et replace).

- `transition` (*table|nil*) : Transition.
- **renvoie** : boolean true pour push et replace.

#### `ui_router_models_PendingTransition.shouldUpdateHistory(transition)`

Indique si la navigation ajoute une entrée à l'historique (uniquement push).

- `transition` (*table|nil*) : Transition.
- **renvoie** : boolean true pour push.

#### `ui_router_models_PendingTransition.validate(transition)`

Vérifie la présence de transitionId, action et toRoute.

- `transition` (*table|nil*) : Transition à valider.
- **renvoie** : boolean true si valide.
- **renvoie** : string[] Liste des erreurs.

## Appels vers le moteur (C++)

- `Engine.` `generateUUID`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/router/models/PendingTransition.lua`.*
