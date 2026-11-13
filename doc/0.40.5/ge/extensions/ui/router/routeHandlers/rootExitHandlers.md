# `ui_router_routeHandlers_rootExitHandlers`

*Fichier : `lua/ge/extensions/ui/router/routeHandlers/rootExitHandlers.lua` · VM : Game Engine (GE) · 23 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_router_routeHandlers_rootExitHandlers` : `extensions.load("ui_router_routeHandlers_rootExitHandlers")`, puis la globale `ui_router_routeHandlers_rootExitHandlers`

Gestionnaire de sortie des routes racines (garage / menu).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_router_routeHandlers_rootExitHandlers.garageExitHandler()` | Bascule entre « menu » et « garage » : sans route courante, navigue vers « menu » ; si la route courante est « menu », navigue vers « garage » ; sinon navigue vers « menu ». | 7 |

### Détail des paramètres

#### `ui_router_routeHandlers_rootExitHandlers.garageExitHandler()`

Bascule entre « menu » et « garage » : sans route courante, navigue vers « menu » ; si la route courante est « menu », navigue vers « garage » ; sinon navigue vers « menu ».

- **renvoie** : boolean|nil true dans les deux premiers cas, nil dans le dernier.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/router/routeHandlers/rootExitHandlers.lua`.*
