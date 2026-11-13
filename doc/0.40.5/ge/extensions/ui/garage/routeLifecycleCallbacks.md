# `ui_garage_routeLifecycleCallbacks`

*Fichier : `lua/ge/extensions/ui/garage/routeLifecycleCallbacks.lua` · VM : Game Engine (GE) · 70 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_garage_routeLifecycleCallbacks` : `extensions.load("ui_garage_routeLifecycleCallbacks")`, puis la globale `ui_garage_routeLifecycleCallbacks`

Callbacks de cycle de vie des routes UI du garage en mode photo. Pour les routes « garage.photomode » (et « garage.photomode.* »), ouvre une session photomode avec le profil « garage » à l'entrée, y joint les données de route fournies par ui_pause_providers_routeData_photomode, et ferme la session à la sortie. Les autres routes sont ignorées.

## Remarques

- Dépend de ui_pause_providers_routeData_photomode et ui_pause_photomode (déclarées dans M.dependencies).
- Les trois hooks appellent dump(...) pour journaliser le nom de la route (traces de debug laissées dans le code).
- onPhotomodeLeave n'a pas de filtre sur le nom de route : il appelle onPhotomodeRouteLeave et endPhotomodeSession pour toute sortie qui lui est notifiée.

**Dépendances (chargées avant) :** `ui_pause_providers_routeData_photomode`, `ui_pause_photomode`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_garage_routeLifecycleCallbacks.onPhotomodeEnter(context, toRoute, fromRoute, data)` | Hook appelé quand l'UI entre dans une route photomode. Si la route est garage.photomode[.*] : démarre la session photomode (profil « garage »), ajoute data.photomode et notifie onPhotomodeRouteEnter. *(interne)* *(hook)* | 35 |
| `ui_garage_routeLifecycleCallbacks.onPhotomodeLeave(context, toRoute, fromRoute, data)` | Hook appelé à la sortie de la route : notifie onPhotomodeRouteLeave puis termine la session photomode (endPhotomodeSession). *(interne)* *(hook)* | 57 |
| `ui_garage_routeLifecycleCallbacks.onPhotomodeMount(context, toRoute, fromRoute, data)` | Hook appelé au montage de la route : ajoute data.photomode si la route est garage.photomode[.*]. *(interne)* *(hook)* | 52 |

### Détail des paramètres

#### `ui_garage_routeLifecycleCallbacks.onPhotomodeEnter(context, toRoute, fromRoute, data)`

Hook appelé quand l'UI entre dans une route photomode. Si la route est garage.photomode[.*] : démarre la session photomode (profil « garage »), ajoute data.photomode et notifie onPhotomodeRouteEnter.

- `context` (*table*) : Contexte du changement de route (non utilisé).
- `toRoute` (*table*) : Route cible ; seul le champ name est lu.
- `fromRoute` (*table|nil*) : Route précédente (non utilisée).
- `data` (*table*) : Données de route, enrichies avec photomode.

#### `ui_garage_routeLifecycleCallbacks.onPhotomodeLeave(context, toRoute, fromRoute, data)`

Hook appelé à la sortie de la route : notifie onPhotomodeRouteLeave puis termine la session photomode (endPhotomodeSession).

- `context` (*table*) : Contexte du changement de route (non utilisé).
- `toRoute` (*table|nil*) : Route d'arrivée ; name transmis à onPhotomodeRouteLeave.
- `fromRoute` (*table|nil*) : Route quittée (utilisée pour le log).
- `data` (*table*) : Données de route (non utilisées).

#### `ui_garage_routeLifecycleCallbacks.onPhotomodeMount(context, toRoute, fromRoute, data)`

Hook appelé au montage de la route : ajoute data.photomode si la route est garage.photomode[.*].

- `context` (*table*) : Contexte du changement de route (non utilisé).
- `toRoute` (*table*) : Route cible ; seul name est lu.
- `fromRoute` (*table|nil*) : Route précédente (non utilisée).
- `data` (*table*) : Données de route, enrichies avec photomode.

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | string[] | Extensions chargées avant : ui_pause_providers_routeData_photomode, ui_pause_photomode. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/garage/routeLifecycleCallbacks.lua`.*
