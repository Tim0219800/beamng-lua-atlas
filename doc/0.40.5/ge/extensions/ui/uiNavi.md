# `ui_uiNavi`

*Fichier : `lua/ge/extensions/ui/uiNavi.lua` · VM : Game Engine (GE) · 484 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_uiNavi` : `extensions.load("ui_uiNavi")`, puis la globale `ui_uiNavi`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_uiNavi.findClosestRoad(x, y, z)` |  | 9 |
| `ui_uiNavi.getBusStops()` |  | 183 |
| `ui_uiNavi.getMissions()` |  | 119 |
| `ui_uiNavi.getPointsOfInterest()` |  | 44 |
| `ui_uiNavi.getSpawnpoints()` |  | 13 |
| `ui_uiNavi.onExtensionLoaded()` | *(hook)* | 453 |
| `ui_uiNavi.onGuiUpdate(dtReal, dtSim, dtRaw)` | public interface *(hook)* | 228 |
| `ui_uiNavi.onVehicleSwitched(oid, nid)` | *(hook)* | 437 |
| `ui_uiNavi.planRoute(posX, posY)` | dev things | 172 |
| `ui_uiNavi.requestMissions()` |  | 123 |
| `ui_uiNavi.requestPoi()` |  | 60 |
| `ui_uiNavi.requestUIDashboardMap()` |  | 386 |
| `ui_uiNavi.requestVehicleDashboardMap(dashboard, initmap, vehId)` |  | 411 |
| `ui_uiNavi.route_end()` |  | 145 |
| `ui_uiNavi.route_requestStatus(oldPos, newPos)` | // TODO: figure out good distance | 158 |
| `ui_uiNavi.route_start(wp, pos)` | // WARNING: multiseat might result in several active players (?)<br> // in this case we will currently only render the path for the last player.<br> // in the future we might want to support rendering several paths | 139 |
| `ui_uiNavi.setMissions(m)` |  | 127 |

**Évènements UI (guihooks.trigger) :** `MapMissions`, `MapPointsOfInterest`, `NavigationMap`, `NavigationMapUpdate`, `RouteEnded`, `RoutePlanned`, `RouteReachedDestination`, `RouteUpdate`

## Appels vers le moteur (C++)

- `FS:` `fileExists`
- `be:` `getPlayerVehicleID`
- `scenetree.` `findClassObjects`, `findObject`, `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/uiNavi.lua`.*
