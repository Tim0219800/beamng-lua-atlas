# `interpolateScatteredMap`

*Fichier : `lua/common/interpolateScatteredMap.lua` · VM : Commun (GE + véhicule) · 510 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("interpolateScatteredMap")`

Interpolation 2D sur points non structurés par triangulation de Delaunay (Bowyer-Watson). loadData construit la triangulation une fois ; get(x, y) cherche le triangle contenant le point en marchant de triangle voisin en triangle voisin (sans allocation) et interpole en coordonnées barycentriques. Utile pour des cartes z(x, y) dont les échantillons ne forment pas une grille.

## Exemple

```lua
local m = require('interpolateScatteredMap').new()
m:loadData({{0,0,1},{1,0,2},{0,1,3},{1,1,4}}, {outsideMode = 'clamp'})
local z = m:get(0.3, 0.4)
```

## Remarques

- Points acceptés : {x, y, value} ou {x=..., y=..., value=...}. Les points sans les trois champs sont ignorés.
- opts : outsideMode ('default' = defaultValue, 'nil', 'clamp' = valeur interpolée sur l'arête de l'enveloppe la plus proche, 'extrapolate' = prolongement du plan du triangle courant), defaultValue (défaut 0), xScale/yScale/zScale, joggle (perturbation des points, défaut 0, désactivé), dedupTol (tolérance de dédoublonnage, défaut 1e-9, sur coordonnées normalisées).
- Il faut au moins 3 points distincts et une étendue non nulle en x et en y ; sinon loadData renvoie self avec valid == false et get renvoie defaultValue.
- Les coordonnées sont normalisées dans [0,1]² pour la triangulation ; le dédoublonnage est en O(n²) donc coûteux sur beaucoup de points.
- Le résultat du dernier appel (x, y, mode, defaultValue) est mis en cache.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `interpolateScatteredMap.new()` | Crée un objet d'interpolation vide (valid = false, outsideMode 'default', defaultValue 0). | 491 |

### Détail des paramètres

#### `interpolateScatteredMap.new()`

Crée un objet d'interpolation vide (valid = false, outsideMode 'default', defaultValue 0).

- **renvoie** : table Objet avec méthodes loadData, get, validate, outsideValue, bruteForce, exportTriangles.

## Classe `interpolateScatteredMap`

Objet renvoyé par new(). Champs : tris, triCount, hullEdges, valid, outsideMode, defaultValue, minX/maxX/minY/maxY, sx, sy.

| Méthode | Description | Ligne |
|---|---|---|
| `interpolateScatteredMap:bruteForce(x, y)` | Recherche linéaire du triangle contenant (x, y) ; repli quand la marche échoue. | dyn |
| `interpolateScatteredMap:exportTriangles()` | Reconstruit les triangles en coordonnées d'entrée pour debug/visualisation. | dyn |
| `interpolateScatteredMap:get(x, y)` | Renvoie la valeur interpolée au point (x, y). Hors de l'enveloppe convexe, dépend de outsideMode. | dyn |
| `interpolateScatteredMap:loadData(inputData, opts)` | Charge les points, normalise, dédoublonne, triangule et prépare le voisinage des triangles. | dyn |
| `interpolateScatteredMap:outsideValue(px, py, ti)` | Valeur à renvoyer pour un point hors enveloppe selon outsideMode (normalement appelée par get ; px, py en coordonnées normalisées). | dyn |
| `interpolateScatteredMap:validate(inputData, tolerance)` | Teste la carte sur les points d'entrée et renvoie l'erreur maximale. | dyn |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/interpolateScatteredMap.lua`.*
