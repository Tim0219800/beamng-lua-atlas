# `ui_apps_minimap_route`

*Fichier : `lua/ge/extensions/ui/apps/minimap/route.lua` · VM : Game Engine (GE) · 97 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_apps_minimap_route` : `extensions.load("ui_apps_minimap_route")`, puis la globale `ui_apps_minimap_route`

Dessine sur la mini-carte l'itinéraire de navigation (core_groundMarkers.routePlanner.path) et le pointeur de destination. L'itinéraire est un trait bleu sur contour blanc qui devient plus clair près de la position courante (mélange sur 75 m). Les autres extensions peuvent remplacer l'itinéraire via le hook onMinimapRouteOverride. Module utilitaire de la minimap, chargé par require.

## Remarques

- L'itinéraire est tronqué à 3000 points (routeMaxLength).
- onMinimapRouteOverride(routes) : chaque extension peut ajouter des routes (listes de points avec pos et distToTarget) à la table fournie ; si elle n'est pas vide, elle remplace l'itinéraire normal.
- Les segments hors du carré camPos ± cullRadius sont ignorés.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_apps_minimap_route.drawNavigationRoute(td, dpi, camPos, cullRadius)` | Dessine l'itinéraire : les routes de remplacement si une extension en fournit via onMinimapRouteOverride, sinon le chemin du routePlanner. | 67 |
| `ui_apps_minimap_route.drawRoutePointer(td)` | Dessine un pointeur circulaire sur le dernier point de l'itinéraire (la destination) via ui_apps_minimap_utils.simpleCircleWithEdgePointer ; ne fait rien s'il n'y a pas de route. | 83 |

### Détail des paramètres

#### `ui_apps_minimap_route.drawNavigationRoute(td, dpi, camPos, cullRadius)`

Dessine l'itinéraire : les routes de remplacement si une extension en fournit via onMinimapRouteOverride, sinon le chemin du routePlanner.

- `td` (*table*) : Objet de dessin de la minimap (lineRoundEndWithBackground).
- `dpi` (*number|nil*) : Facteur d'échelle d'écran, 1 par défaut.
- `camPos` (*vec3|nil*) : Position de la caméra pour le culling.
- `cullRadius` (*number|nil*) : Demi-côté du carré de culling, en mètres ; sans lui, aucun culling.

#### `ui_apps_minimap_route.drawRoutePointer(td)`

Dessine un pointeur circulaire sur le dernier point de l'itinéraire (la destination) via ui_apps_minimap_utils.simpleCircleWithEdgePointer ; ne fait rien s'il n'y a pas de route.

- `td` (*table*) : Objet de dessin (non utilisé directement).

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onMinimapRouteOverride`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/apps/minimap/route.lua`.*
