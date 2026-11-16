# `ui_router_models_PendingTransition`

*File: `lua/ge/extensions/ui/router/models/PendingTransition.lua` · VM: Game Engine (GE) · 165 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_router_models_PendingTransition`: `extensions.load("ui_router_models_PendingTransition")`, then the global `ui_router_models_PendingTransition`

"PendingTransition" data model: represents a navigation transition in progress {transitionId, action, toRoute, fromRoute, options}. Provides a constructor, validation and predicates on the action (back, forward, history update, forward stack clearing).

## Notes

- In the current router.lua, transitions are handled by transitionManager: this model seems little or not used by the router (inferred from code; not verified elsewhere).
- Valid actions: push, replace, back, forward (Constants.NavigationAction); an invalid action becomes push with a warning. The identifier is "transition_<counter>_<UUID>".

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_router_models_PendingTransition.create(action, toRoute, fromRoute, options)` | Creates a PendingTransition. Returns nil (error logged) if toRoute is missing. | 53 |
| `ui_router_models_PendingTransition.isBackward(transition)` | Indicates whether the action is "back". | 115 |
| `ui_router_models_PendingTransition.isForward(transition)` | Indicates whether the action is "forward". | 125 |
| `ui_router_models_PendingTransition.shouldClearForward(transition)` | Indicates whether the navigation clears the "forward" stack (push and replace). | 152 |
| `ui_router_models_PendingTransition.shouldUpdateHistory(transition)` | Indicates whether the navigation adds an entry to the history (push only). | 135 |
| `ui_router_models_PendingTransition.validate(transition)` | Checks the presence of transitionId, action and toRoute. | 86 |

### Parameter details

#### `ui_router_models_PendingTransition.create(action, toRoute, fromRoute, options)`

Creates a PendingTransition. Returns nil (error logged) if toRoute is missing.

- `action` (*string*) : push, replace, back or forward.
- `toRoute` (*table*) : Destination ResolvedRoute.
- `fromRoute` (*table|nil*) : Origin history entry.
- `options` (*table|nil*) : Navigation options ({} by default).
- **returns**: table|nil {transitionId, action, toRoute, fromRoute, options}.

#### `ui_router_models_PendingTransition.isBackward(transition)`

Indicates whether the action is "back".

- `transition` (*table|nil*) : Transition.
- **returns**: boolean|nil true if action == back (nil/false if transition is nil).

#### `ui_router_models_PendingTransition.isForward(transition)`

Indicates whether the action is "forward".

- `transition` (*table|nil*) : Transition.
- **returns**: boolean|nil true if action == forward.

#### `ui_router_models_PendingTransition.shouldClearForward(transition)`

Indicates whether the navigation clears the "forward" stack (push and replace).

- `transition` (*table|nil*) : Transition.
- **returns**: boolean true for push and replace.

#### `ui_router_models_PendingTransition.shouldUpdateHistory(transition)`

Indicates whether the navigation adds an entry to the history (push only).

- `transition` (*table|nil*) : Transition.
- **returns**: boolean true for push.

#### `ui_router_models_PendingTransition.validate(transition)`

Checks the presence of transitionId, action and toRoute.

- `transition` (*table|nil*) : Transition to validate.
- **returns**: boolean true if valid.
- **returns**: string[] List of errors.

## Calls into the engine (C++)

- `Engine.` `generateUUID`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/router/models/PendingTransition.lua`.*
