# `ui_apps_minimap_layers`

*Fichier : `lua/ge/extensions/ui/apps/minimap/layers.lua` · VM : Game Engine (GE) · 45 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_apps_minimap_layers` : `extensions.load("ui_apps_minimap_layers")`, puis la globale `ui_apps_minimap_layers`

Constantes numériques des couches de dessin de la mini-carte. Les couches sont rendues de la plus basse (0) à la plus haute : fond, grille, routes, itinéraire, marqueurs de gameplay, véhicules, masque rond/carré, boussole, pointeurs, debug. Ce n'est pas une extension chargeable : les modules de la minimap le lisent par require("ui/apps/minimap/layers").

## Champs

| Champ | Type | Description |
|---|---|---|
| `BACKGROUND` | integer | 0 : fond (tout en bas). |
| `BG_GRID` | integer | 10 : grille de fond. |
| `COMPASS` | integer | 120 : boussole. |
| `DEBUG` | integer | 150 : couche de debug (tout en haut). |
| `GAMEPLAY_MARKERS` | integer | 60 : marqueurs de gameplay. |
| `GAMEPLAY_POINTER` | integer | 140 : pointeur de gameplay. |
| `ROADS_BG` | integer | 20 : contour des routes. |
| `ROADS_FG` | integer | 30 : trait des routes. |
| `ROUND_OR_SQUARE_MASK` | integer | 110 : masque d'occlusion (cadre rond ou carré). |
| `ROUTE_BG` | integer | 40 : contour de l'itinéraire. |
| `ROUTE_FG` | integer | 50 : trait de l'itinéraire. |
| `ROUTE_POINTER` | integer | 130 : pointeur vers la destination. |
| `VEHICLES_OTHER` | integer | 70 : autres véhicules. |
| `VEHICLES_POLICE` | integer | 80 : véhicules de police. |
| `VEHICLES_USABLE` | integer | 90 : véhicules utilisables. |
| `VEHICLE_PLAYER` | integer | 100 : véhicule du joueur. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/apps/minimap/layers.lua`.*
