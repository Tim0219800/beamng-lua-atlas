# `ui_router_routeHandlers_missionExitHandlers`

*Fichier : `lua/ge/extensions/ui/router/routeHandlers/missionExitHandlers.lua` · VM : Game Engine (GE) · 47 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_router_routeHandlers_missionExitHandlers` : `extensions.load("ui_router_routeHandlers_missionExitHandlers")`, puis la globale `ui_router_routeHandlers_missionExitHandlers`

Gestionnaires de sortie/retour des écrans de mission et de pause. Quand un écran de début/fin de mission est actif, ils renvoient vers la route « mission.control » avec le mode correspondant ; sinon vers la route de gameplay (ui_menuManager.getGameplayRoute(), « play » par défaut).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_router_routeHandlers_missionExitHandlers.missionDetailsExitHandler()` | Quitte les détails de mission : si une mission est active et qu'un écran de début/fin est affiché, navigue vers mission.control avec {mode = mode de l'écran} ; sinon vers la route de gameplay. | 11 |
| `ui_router_routeHandlers_missionExitHandlers.missionVehicleSelectorBackHandler()` | Retour du sélecteur de véhicule de mission : même logique que pauseExitHandler. | 35 |
| `ui_router_routeHandlers_missionExitHandlers.pauseExitHandler()` | Quitte la pause : navigue vers mission.control {mode} si un écran de début/fin de mission est actif, sinon vers la route de gameplay. | 24 |

### Détail des paramètres

#### `ui_router_routeHandlers_missionExitHandlers.missionDetailsExitHandler()`

Quitte les détails de mission : si une mission est active et qu'un écran de début/fin est affiché, navigue vers mission.control avec {mode = mode de l'écran} ; sinon vers la route de gameplay.

- **renvoie** : table|nil Résultat de navigate dans le cas mission.control ; nil sinon (la navigation est lancée sans retourner son résultat).

#### `ui_router_routeHandlers_missionExitHandlers.missionVehicleSelectorBackHandler()`

Retour du sélecteur de véhicule de mission : même logique que pauseExitHandler.

- **renvoie** : table Résultat de ui_router.navigate.

#### `ui_router_routeHandlers_missionExitHandlers.pauseExitHandler()`

Quitte la pause : navigue vers mission.control {mode} si un écran de début/fin de mission est actif, sinon vers la route de gameplay.

- **renvoie** : table Résultat de ui_router.navigate.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/router/routeHandlers/missionExitHandlers.lua`.*
