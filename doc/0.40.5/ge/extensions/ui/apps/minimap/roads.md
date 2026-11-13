# `ui_apps_minimap_roads`

*Fichier : `lua/ge/extensions/ui/apps/minimap/roads.lua` · VM : Game Engine (GE) · 100 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_apps_minimap_roads` : `extensions.load("ui_apps_minimap_roads")`, puis la globale `ui_apps_minimap_roads`

Dessine les routes du graphe de navigation (map.getMap()) sur la mini-carte. Au premier appel, il construit un tableau de segments (positions, couleur selon drivability) et un kd-tree 2D (kdtreebox2d) ; aux appels suivants il interroge le kd-tree autour de la caméra et trace les segments visibles avec td:lineRoundEndWithBackground sur les couches ROADS_BG/ROADS_FG. Module utilitaire de la minimap, chargé par require, pas une extension à appeler directement.

## Remarques

- Le premier appel de drawRoads ne dessine rien : il ne fait que construire le cache ; le dessin commence au deuxième appel.
- Couleur selon link.drivability : >= 0.9 couleur normale, > 0.25 colorLow, sinon colorLowest. Les liens hiddenInNavi sont ignorés.
- S'il n'y a aucune route et que la grille n'est pas déjà activée (debugSettings.drawGrid), il appelle ui_apps_minimap_utils.drawGrid si elle existe.
- Appeler reset() quand la carte de navigation change, sinon le cache reste ancien.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_apps_minimap_roads.drawRoads(p, radius, td, debugSettings, camPos, scale, dpi)` | Construit le cache des routes au premier appel, puis dessine les routes visibles dans le carré de côté 2*radius centré sur la caméra. | 15 |
| `ui_apps_minimap_roads.reset()` | Vide le cache (kd-tree et indicateur hasRoads) ; il sera reconstruit au prochain drawRoads. | 95 |

### Détail des paramètres

#### `ui_apps_minimap_roads.drawRoads(p, radius, td, debugSettings, camPos, scale, dpi)`

Construit le cache des routes au premier appel, puis dessine les routes visibles dans le carré de côté 2*radius centré sur la caméra.

- `p` (*table|nil*) : Profileur optionnel (méthode add).
- `radius` (*number*) : Demi-côté de la zone interrogée, en mètres monde.
- `td` (*table*) : Objet de dessin de la minimap (doit fournir lineRoundEndWithBackground).
- `debugSettings` (*table*) : Réglages de debug ; seul drawGrid est lu.
- `camPos` (*vec3*) : Position de la caméra (x, y utilisés).
- `scale` (*number*) : Échelle de la carte ; la largeur de trait est 2 / scale * dpi.
- `dpi` (*number|nil*) : Facteur d'échelle d'écran, 1 par défaut.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/apps/minimap/roads.lua`.*
