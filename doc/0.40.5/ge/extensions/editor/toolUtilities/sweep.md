# `editor_toolUtilities_sweep`

*Fichier : `lua/ge/extensions/editor/toolUtilities/sweep.lua` · VM : Game Engine (GE) · 246 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_toolUtilities_sweep` : `extensions.load("editor_toolUtilities_sweep")`, puis la globale `editor_toolUtilities_sweep`

Géométrie par balayage (loft) pour les outils de bâtiment de l'éditeur : une pièce est une section (polygone 2D en coordonnées (s, t)) et un chemin de repères (frames). Sert à tailler gouttières, tuyaux, coudes, conduits, colonnes montantes. Écrit des faces dans un accumulateur `p` via meshPart.face4 et meshPart.face3. Un repère est une origine et deux axes : le point (s, t) de la section tombe en o + a*s + b*t, donc la même section balayée le long de +X, de +Z ou d'un virage ressort bien orientée sans être réécrite.

## Exemple

```lua
local sweep = require('editor/toolUtilities/sweep')
local sect = sweep.circleSection(0.05, 12)
local path = sweep.alongZ(0, 3)
sweep.loft(p, sect, path, 1.0)
sweep.cap(p, sect, path[1], -1, 1.0)
sweep.cap(p, sect, path[2], 1, 1.0)
```

## Remarques

- Un repère est une table { ox, oy, oz, ax, ay, az, bx, by, bz } ; un point de section est { s, t }.
- Le sens d'enroulement de la section détermine la normale des faces : fournir la même section inversée (reversed) tourne les faces vers l'intérieur, utile pour un alésage.
- cap utilise un éventail de triangles : la section doit être convexe, sinon il faut la buter contre la pièce suivante.
- Le paramètre uv est l'échelle des coordonnées de texture (U suit la longueur d'arc de la section, V la distance parcourue).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_toolUtilities_sweep.P(x, y, z)` | Crée un point { x, y, z }. | 23 |
| `editor_toolUtilities_sweep.alongX(x0, x1)` | Course le long de +X portant une section posée en (y, z). | 121 |
| `editor_toolUtilities_sweep.alongY(y0, y1)` | Course le long de +Y portant une section posée en (x, z). | 126 |
| `editor_toolUtilities_sweep.alongZ(z0, z1, cx, cy)` | Course montante le long de +Z portant une section posée en (x, y), éventuellement décalée de l'axe. | 131 |
| `editor_toolUtilities_sweep.at(f, s, t)` | Point monde correspondant au point (s, t) de la section dans le repère f. | 30 |
| `editor_toolUtilities_sweep.boxSection(hx, hy)` | Section carrée autour de l'origine, ou rectangulaire si on donne une seconde demi-taille. | 165 |
| `editor_toolUtilities_sweep.boxX(p, x0, x1, y0, y1, z0, z1, uv)` | Boîte fermée (loft plus deux capuchons) étendue le long de X, section en (y, z). | 136 |
| `editor_toolUtilities_sweep.boxZ(p, x0, x1, y0, y1, z0, z1, uv)` | La même boîte, dressée et balayée sur Z. Un loft pose U autour de la section et V le long du chemin : les deux posent la texture d'une face à angle droit l'une de l'autre. À utiliser pour un matériau qui a un SENS (comme la brique, dont les assises ressortent debout avec boxX). | 147 |
| `editor_toolUtilities_sweep.cap(p, sect, f, sgn, uv)` | Ferme une extrémité d'un loft, orientée dans le sens du chemin (sgn 1) ou en sens inverse. Triangulation en éventail, donc section convexe uniquement. | 73 |
| `editor_toolUtilities_sweep.circleSection(r, n)` | Section circulaire de rayon r à n points, autour de l'origine. | 155 |
| `editor_toolUtilities_sweep.fr(ox, oy, oz, ax, ay, az, bx, by, bz)` | Un repère d'un chemin balayé : le (s, t) de la section tombe en o + a*s + b*t. | 26 |
| `editor_toolUtilities_sweep.kinkPath(R, ang, segs)` | Un coude dans le plan vertical : entre le long de +Z à l'origine, ressort en penchant vers -Y (vers l'extérieur du mur). | 213 |
| `editor_toolUtilities_sweep.loft(p, sect, path, uv)` | Balaye une section fermée le long d'un chemin de repères : un quad par arête de section et par pas. Les UV suivent la longueur d'arc de la section en travers et la distance parcourue en long, donc une pièce étirée par le placeur reste texturée en carrelage. | 47 |
| `editor_toolUtilities_sweep.octPost(p, m, z0, z1, uv)` | Poteau octogonal dressé sur +Z entre deux hauteurs, fermé aux deux bouts (loft plus deux capuchons). | 178 |
| `editor_toolUtilities_sweep.octSection(m)` | OCTOGONE régulier autour de l'origine ; `m` va du centre à chacun des huit plats. | 171 |
| `editor_toolUtilities_sweep.rect8(hx, hy, cy)` | Rectangle écrit en HUIT points (et non quatre), pris aux mêmes angles qu'un cercle de même nombre, pour fermer une plaque plate d'une section sur l'autre. Centré en (0, cy). | 194 |
| `editor_toolUtilities_sweep.reversed(sect)` | Renvoie la section parcourue en sens inverse (les faces regarderont à l'intérieur). | 186 |
| `editor_toolUtilities_sweep.ring(p, inner, outer, f, sgn, uv)` | La bande plate entre deux sections de même nombre de points, à un repère : l'embouchure d'un tuyau ouvert. | 86 |
| `editor_toolUtilities_sweep.taper(p, s0, s1, f0, f1, uv)` | Balaye ENTRE deux sections de même nombre de points, un repère chacune : un rétrécissement de l'embouchure vers le col. Même quad par arête que le loft droit, mais chaque bout a sa forme. | 102 |
| `editor_toolUtilities_sweep.turnPath(R, sy, ang, segs)` | Quart de tour en plan : entre le long de +X à l'origine, sort vers `sy` sur Y. La section est portée sans se dérouler, donc une gouttière reste droite dans le virage. | 202 |

### Détail des paramètres

#### `editor_toolUtilities_sweep.P(x, y, z)`

Crée un point { x, y, z }.

- `x` (*number*) : X.
- `y` (*number*) : Y.
- `z` (*number*) : Z.
- **renvoie** : table Point { x, y, z }.

#### `editor_toolUtilities_sweep.alongX(x0, x1)`

Course le long de +X portant une section posée en (y, z).

- `x0` (*number*) : X de départ.
- `x1` (*number*) : X d'arrivée.
- **renvoie** : table Deux repères.

#### `editor_toolUtilities_sweep.alongY(y0, y1)`

Course le long de +Y portant une section posée en (x, z).

- `y0` (*number*) : Y de départ.
- `y1` (*number*) : Y d'arrivée.
- **renvoie** : table Deux repères.

#### `editor_toolUtilities_sweep.alongZ(z0, z1, cx, cy)`

Course montante le long de +Z portant une section posée en (x, y), éventuellement décalée de l'axe.

- `z0` (*number*) : Z de départ.
- `z1` (*number*) : Z d'arrivée.
- `cx` (*number|nil*) : Décalage X (0 par défaut).
- `cy` (*number|nil*) : Décalage Y (0 par défaut).
- **renvoie** : table Deux repères.

#### `editor_toolUtilities_sweep.at(f, s, t)`

Point monde correspondant au point (s, t) de la section dans le repère f.

- `f` (*table*) : Repère.
- `s` (*number*) : Coordonnée s.
- `t` (*number*) : Coordonnée t.
- **renvoie** : table Point { x, y, z }.

#### `editor_toolUtilities_sweep.boxSection(hx, hy)`

Section carrée autour de l'origine, ou rectangulaire si on donne une seconde demi-taille.

- `hx` (*number*) : Demi-taille en s.
- `hy` (*number|nil*) : Demi-taille en t (= hx par défaut).
- **renvoie** : table 4 points.

#### `editor_toolUtilities_sweep.boxX(p, x0, x1, y0, y1, z0, z1, uv)`

Boîte fermée (loft plus deux capuchons) étendue le long de X, section en (y, z).

- `p` (*table*) : Accumulateur de faces.
- `x0` (*number*) : X min.
- `x1` (*number*) : X max.
- `y0` (*number*) : Y min.
- `y1` (*number*) : Y max.
- `z0` (*number*) : Z min.
- `z1` (*number*) : Z max.
- `uv` (*number*) : Échelle UV.

#### `editor_toolUtilities_sweep.boxZ(p, x0, x1, y0, y1, z0, z1, uv)`

La même boîte, dressée et balayée sur Z. Un loft pose U autour de la section et V le long du chemin : les deux posent la texture d'une face à angle droit l'une de l'autre. À utiliser pour un matériau qui a un SENS (comme la brique, dont les assises ressortent debout avec boxX).

- `p` (*table*) : Accumulateur de faces.
- `x0` (*number*) : X min.
- `x1` (*number*) : X max.
- `y0` (*number*) : Y min.
- `y1` (*number*) : Y max.
- `z0` (*number*) : Z min.
- `z1` (*number*) : Z max.
- `uv` (*number*) : Échelle UV.

#### `editor_toolUtilities_sweep.cap(p, sect, f, sgn, uv)`

Ferme une extrémité d'un loft, orientée dans le sens du chemin (sgn 1) ou en sens inverse. Triangulation en éventail, donc section convexe uniquement.

- `p` (*table*) : Accumulateur de faces.
- `sect` (*table*) : Section convexe.
- `f` (*table*) : Repère de l'extrémité.
- `sgn` (*integer*) : 1 ou -1 : sens de la normale.
- `uv` (*number*) : Échelle UV.

#### `editor_toolUtilities_sweep.circleSection(r, n)`

Section circulaire de rayon r à n points, autour de l'origine.

- `r` (*number*) : Rayon.
- `n` (*integer*) : Nombre de points.
- **renvoie** : table Liste de { s, t }.

#### `editor_toolUtilities_sweep.fr(ox, oy, oz, ax, ay, az, bx, by, bz)`

Un repère d'un chemin balayé : le (s, t) de la section tombe en o + a*s + b*t.

- `ox` (*number*) : Origine X.
- `oy` (*number*) : Origine Y.
- `oz` (*number*) : Origine Z.
- `ax` (*number*) : Axe a, X.
- `ay` (*number*) : Axe a, Y.
- `az` (*number*) : Axe a, Z.
- `bx` (*number*) : Axe b, X.
- `by` (*number*) : Axe b, Y.
- `bz` (*number*) : Axe b, Z.
- **renvoie** : table Repère.

#### `editor_toolUtilities_sweep.kinkPath(R, ang, segs)`

Un coude dans le plan vertical : entre le long de +Z à l'origine, ressort en penchant vers -Y (vers l'extérieur du mur).

- `R` (*number*) : Rayon du coude.
- `ang` (*number*) : Angle total en radians.
- `segs` (*integer*) : Nombre de segments.
- **renvoie** : table segs + 1 repères.

#### `editor_toolUtilities_sweep.loft(p, sect, path, uv)`

Balaye une section fermée le long d'un chemin de repères : un quad par arête de section et par pas. Les UV suivent la longueur d'arc de la section en travers et la distance parcourue en long, donc une pièce étirée par le placeur reste texturée en carrelage.

- `p` (*table*) : Accumulateur de faces (meshPart).
- `sect` (*table*) : Section fermée, liste de { s, t }.
- `path` (*table*) : Liste de repères.
- `uv` (*number*) : Échelle UV.

#### `editor_toolUtilities_sweep.octPost(p, m, z0, z1, uv)`

Poteau octogonal dressé sur +Z entre deux hauteurs, fermé aux deux bouts (loft plus deux capuchons).

- `p` (*table*) : Accumulateur de faces.
- `m` (*number*) : Distance du centre à un plat.
- `z0` (*number*) : Hauteur de départ.
- `z1` (*number*) : Hauteur d'arrivée.
- `uv` (*number*) : Échelle UV.

#### `editor_toolUtilities_sweep.octSection(m)`

OCTOGONE régulier autour de l'origine ; `m` va du centre à chacun des huit plats.

- `m` (*number*) : Distance du centre à un plat.
- **renvoie** : table 8 points.

#### `editor_toolUtilities_sweep.rect8(hx, hy, cy)`

Rectangle écrit en HUIT points (et non quatre), pris aux mêmes angles qu'un cercle de même nombre, pour fermer une plaque plate d'une section sur l'autre. Centré en (0, cy).

- `hx` (*number*) : Demi-largeur.
- `hy` (*number*) : Demi-hauteur.
- `cy` (*number|nil*) : Décalage du centre en t (0 par défaut).
- **renvoie** : table 8 points.

#### `editor_toolUtilities_sweep.reversed(sect)`

Renvoie la section parcourue en sens inverse (les faces regarderont à l'intérieur).

- `sect` (*table*) : Section.
- **renvoie** : table Nouvelle section inversée.

#### `editor_toolUtilities_sweep.ring(p, inner, outer, f, sgn, uv)`

La bande plate entre deux sections de même nombre de points, à un repère : l'embouchure d'un tuyau ouvert.

- `p` (*table*) : Accumulateur de faces.
- `inner` (*table*) : Section intérieure.
- `outer` (*table*) : Section extérieure.
- `f` (*table*) : Repère.
- `sgn` (*integer*) : Sens de la normale (1 ou -1).
- `uv` (*number*) : Échelle UV.

#### `editor_toolUtilities_sweep.taper(p, s0, s1, f0, f1, uv)`

Balaye ENTRE deux sections de même nombre de points, un repère chacune : un rétrécissement de l'embouchure vers le col. Même quad par arête que le loft droit, mais chaque bout a sa forme.

- `p` (*table*) : Accumulateur de faces.
- `s0` (*table*) : Section de départ.
- `s1` (*table*) : Section d'arrivée (même nombre de points).
- `f0` (*table*) : Repère de départ.
- `f1` (*table*) : Repère d'arrivée.
- `uv` (*number*) : Échelle UV.

#### `editor_toolUtilities_sweep.turnPath(R, sy, ang, segs)`

Quart de tour en plan : entre le long de +X à l'origine, sort vers `sy` sur Y. La section est portée sans se dérouler, donc une gouttière reste droite dans le virage.

- `R` (*number*) : Rayon du virage.
- `sy` (*number*) : Côté du virage sur Y (signe).
- `ang` (*number*) : Angle total en radians.
- `segs` (*integer*) : Nombre de segments.
- **renvoie** : table segs + 1 repères.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/toolUtilities/sweep.lua`.*
