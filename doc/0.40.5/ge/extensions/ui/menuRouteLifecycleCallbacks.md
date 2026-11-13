# `ui_menuRouteLifecycleCallbacks`

*Fichier : `lua/ge/extensions/ui/menuRouteLifecycleCallbacks.lua` · VM : Game Engine (GE) · 12 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_menuRouteLifecycleCallbacks` : `extensions.load("ui_menuRouteLifecycleCallbacks")`, puis la globale `ui_menuRouteLifecycleCallbacks`

Petite extension qui relie des événements du jeu à la navigation de l'interface. Actuellement elle ne contient qu'un hook : à l'entrée en mode photo, elle ouvre la route « pause.photomode » via ui_router.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_menuRouteLifecycleCallbacks.onPhotomodeEnter()` | Hook appelé à l'entrée en mode photo ; navigue vers la route « pause.photomode » de l'interface. *(interne)* *(hook)* | 7 |

### Détail des paramètres

#### `ui_menuRouteLifecycleCallbacks.onPhotomodeEnter()`

Hook appelé à l'entrée en mode photo ; navigue vers la route « pause.photomode » de l'interface.

- **renvoie** : any Résultat de ui_router.navigate (déduit du code).

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/menuRouteLifecycleCallbacks.lua`.*
