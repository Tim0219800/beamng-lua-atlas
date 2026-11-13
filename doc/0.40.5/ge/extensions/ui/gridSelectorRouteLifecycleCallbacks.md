# `ui_gridSelectorRouteLifecycleCallbacks`

*Fichier : `lua/ge/extensions/ui/gridSelectorRouteLifecycleCallbacks.lua` · VM : Game Engine (GE) · 178 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_gridSelectorRouteLifecycleCallbacks` : `extensions.load("ui_gridSelectorRouteLifecycleCallbacks")`, puis la globale `ui_gridSelectorRouteLifecycleCallbacks`

Callbacks de cycle de vie des routes de l'UI pour les écrans à sélecteur en grille. À l'entrée ou au montage d'une route, il calcule un instantané (ui_gridSelector.getSelectorSnapshot) à partir de la config `meta.gridSelector` de la route et l'ajoute à `data.gridSelector` (et `data.vehicleSelector` pour le backend vehicleSelector). Il relaie aussi les hooks onPauseEnter/onPauseMount/onPauseLeave à `ui_pause_routeLifecycleCallbacks` quand la route est une route de pause.

## Remarques

- Config par route : `route.meta.gridSelector = { backendName, routePath, defaultPath }`. Défaut intégré uniquement pour `pause.vehicleSelector` (backend vehicleSelector, routePath /vehicle-selector-pause, chemin { keys = { "allModels" } }).
- Le chemin vient de `toRoute.params` (path, keys ou pathMatch sous forme de table ou de chaîne « a/b/c »), sinon du chemin par défaut.
- Sans config valide, un avertissement est loggé et aucun instantané n'est joint.
- Une route est une route de pause si son nom est `pause`, commence par `pause.` ou par `menu.pause`.
- onRouteLeave ne joint pas d'instantané : il ne fait que relayer onPauseLeave.

**Dépendances (chargées avant) :** `ui_gridSelector`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_gridSelectorRouteLifecycleCallbacks.onRouteEnter(context, toRoute, fromRoute, data)` | Appelée par le routeur d'UI à l'entrée dans une route. Relaie onPauseEnter si c'est une route de pause, puis joint l'instantané du sélecteur à `data`. *(interne)* *(hook)* | 163 |
| `ui_gridSelectorRouteLifecycleCallbacks.onRouteLeave(context, toRoute, fromRoute, data)` | Appelée par le routeur d'UI en quittant une route. Relaie seulement onPauseLeave pour les routes de pause. *(interne)* *(hook)* | 173 |
| `ui_gridSelectorRouteLifecycleCallbacks.onRouteMount(context, toRoute, fromRoute, data)` | Appelée par le routeur d'UI au montage de la route. Relaie onPauseMount si route de pause, puis joint l'instantané du sélecteur à `data`. *(interne)* *(hook)* | 168 |

### Détail des paramètres

#### `ui_gridSelectorRouteLifecycleCallbacks.onRouteEnter(context, toRoute, fromRoute, data)`

Appelée par le routeur d'UI à l'entrée dans une route. Relaie onPauseEnter si c'est une route de pause, puis joint l'instantané du sélecteur à `data`.

- `context` (*any*) : Contexte du routeur.
- `toRoute` (*table*) : Route cible (name, params, meta).
- `fromRoute` (*table|nil*) : Route quittée.
- `data` (*table*) : Table de données de la route, enrichie de gridSelector.

#### `ui_gridSelectorRouteLifecycleCallbacks.onRouteLeave(context, toRoute, fromRoute, data)`

Appelée par le routeur d'UI en quittant une route. Relaie seulement onPauseLeave pour les routes de pause.

- `context` (*any*) : Contexte du routeur.
- `toRoute` (*table|nil*) : Route cible.
- `fromRoute` (*table*) : Route quittée.
- `data` (*table|nil*) : Données de la route.

#### `ui_gridSelectorRouteLifecycleCallbacks.onRouteMount(context, toRoute, fromRoute, data)`

Appelée par le routeur d'UI au montage de la route. Relaie onPauseMount si route de pause, puis joint l'instantané du sélecteur à `data`.

- `context` (*any*) : Contexte du routeur.
- `toRoute` (*table*) : Route cible.
- `fromRoute` (*table|nil*) : Route quittée.
- `data` (*table*) : Données de la route.

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table<integer, string> | Charge ui_gridSelector avant ce module. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/gridSelectorRouteLifecycleCallbacks.lua`.*
