# `editor_toolUtilities_engineeredGeom`

*Fichier : `lua/ge/extensions/editor/toolUtilities/engineeredGeom.lua` · VM : Game Engine (GE) · 699 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_toolUtilities_engineeredGeom` : `extensions.load("editor_toolUtilities_engineeredGeom")`, puis la globale `editor_toolUtilities_engineeredGeom`

Géométrie de route « d'ingénieur » pour les outils d'édition de splines de l'éditeur : transforme la polyligne des noeuds d'une spline en axe ligne - clothoïde - arc - clothoïde - ligne (virages arrondis à rayon adaptatif, profil vertical lissé, élargissement dans les virages serrés). Les outils l'appellent via sampleInto selon group.geometryMode ('engineered' ou 'spline'). Il remplit divPoints, divWidths, normals, divCurv et discMap de la spline, puis calcule le repère de Frenet via geom.computeFrenetFrame.

## Exemple

```lua
local eng = require('editor/toolUtilities/engineeredGeom')
eng.applyDefaults(group)
if not eng.sampleInto(group, {zMode = 'free', lonRes = 1.5}) then
  -- mode spline : l'outil échantillonne lui-même avec geom.catmullRom*
end
```

## Remarques

- Unités : mètres et radians. Constantes par défaut : rayon 40 m, transition (clothoïde) 15 m, rayon minimal 8 m, angle minimal 0.75 degré (en dessous, le noeud est traversé sans arrondi), élargissement max 2.5 m, longueur de lissage vertical 40 m.
- Les boucles (spline.isLoop) et les splines de moins de 3 noeuds n'ont pas de virage intérieur : buildCenterline retombe sur geom.catmullRomRaycast / catmullRomConformToTerrain / catmullRomFree selon zMode, et met divCurv à nil.
- Le rayon est ajusté sur des arcs durs (Ls = 0) puis les spirales sont ajoutées ensuite : la transition n'influence donc jamais le rayon retenu. Des surcharges par noeud existent dans spline.corners[i] ({ radiusM, taperM }).
- sampleInto ne transmet pas minAngleDeg ni stepM à buildCenterline ; seuls minR, lonRes, deckZ, maxStep, zMode, levelStart et levelFinish sont repris.
- Le module s'appuie sur editor/toolUtilities/geom, util et style.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_toolUtilities_engineeredGeom.applyDefaults(group)` | Complète un groupe avec les champs du mode ingénieur uniquement s'ils sont nil (geometryMode = 'spline', engRadiusM, engTransM, engVertLenM, curveWidenMaxM, curveWidenRunoffM, corners = {}). À appeler à la création d'un groupe et à la désérialisation de sessions anciennes. | 574 |
| `editor_toolUtilities_engineeredGeom.buildCenterline(spline, p)` | Construit l'axe en plan de la spline à partir de ses noeuds (virages à clothoïdes), puis le profil vertical selon zMode, et met à jour spline.divPoints, divWidths, normals, divCurv, discMap avant d'appeler geom.computeFrenetFrame. Ne renvoie rien (sauf pour le repli Catmull-Rom). | 290 |
| `editor_toolUtilities_engineeredGeom.buildCenterlineConform(spline, p)` | Enveloppe de buildCenterline avec zMode = 'conform' (axe conforme au terrain). | 556 |
| `editor_toolUtilities_engineeredGeom.buildCenterlineFree(spline, p)` | Enveloppe de buildCenterline avec zMode = 'free' (hauteurs des noeuds libres). | 548 |
| `editor_toolUtilities_engineeredGeom.buildCenterlineRaycast(spline, p)` | Enveloppe de buildCenterline avec zMode = 'raycast' (axe posé sur le terrain par lancer de rayon). | 552 |
| `editor_toolUtilities_engineeredGeom.drawControlPolygon(group)` | Dessine en debugDrawer, pour un groupe en mode ingénieur : le polygone des noeuds (guide fin), une sphère sur chaque noeud intérieur et l'axe résultant coloré par courbure (turquoise en ligne droite, ambre au virage le plus serré). Fondu selon la distance caméra (plein sous 90 m, invisible au-delà de 550 m). Sans effet hors mode 'engineered' ou avec moins de 2 noeuds. | 603 |
| `editor_toolUtilities_engineeredGeom.sampleInto(group, opts)` | Point d'entrée unique d'échantillonnage selon group.geometryMode. En mode 'engineered', appelle buildCenterline avec les champs eng* du groupe et renvoie true. Sinon, met group.divCurv à nil et renvoie false pour que l'outil lance son propre échantillonneur geom.catmullRom*. | 591 |
| `editor_toolUtilities_engineeredGeom.selfTest()` | Auto-test manuel : construit un virage de 90 degrés (R 30, Ls 20) et journalise le nombre de points, l'écart max entre points et le coude max par pas. | 657 |
| `editor_toolUtilities_engineeredGeom.solveCorner(pPrev, pI, pNext, R, Ls, minAngle)` | Résout la géométrie d'un virage au noeud pI : déviation signée, rayon, longueur de spirale (réduite à R*\|delta\| si trop longue), angle de spirale, angle d'arc et distance tangente T absorbée sur chaque ligne droite voisine. Travaille en plan (x, y). Renvoie { through = true, T = 0 } si un segment est quasi nul ou si la déviation est inférieure à minAngle. | 62 |

### Détail des paramètres

#### `editor_toolUtilities_engineeredGeom.applyDefaults(group)`

Complète un groupe avec les champs du mode ingénieur uniquement s'ils sont nil (geometryMode = 'spline', engRadiusM, engTransM, engVertLenM, curveWidenMaxM, curveWidenRunoffM, corners = {}). À appeler à la création d'un groupe et à la désérialisation de sessions anciennes.

- `group` (*table*) : Groupe modifié sur place.

#### `editor_toolUtilities_engineeredGeom.buildCenterline(spline, p)`

Construit l'axe en plan de la spline à partir de ses noeuds (virages à clothoïdes), puis le profil vertical selon zMode, et met à jour spline.divPoints, divWidths, normals, divCurv, discMap avant d'appeler geom.computeFrenetFrame. Ne renvoie rien (sauf pour le repli Catmull-Rom).

- `spline` (*table*) : Spline avec nodes, widths, nmls, divPoints, divWidths, normals, discMap (et optionnellement isLoop, corners).
- `p` (*table|nil*) : { R, Ls, minR, minAngleDeg, stepM, lonRes, vertLen, deckZ, maxStep, levelStart, levelFinish, zMode = 'free'|'raycast'|'conform' }.

#### `editor_toolUtilities_engineeredGeom.buildCenterlineConform(spline, p)`

Enveloppe de buildCenterline avec zMode = 'conform' (axe conforme au terrain).

- `spline` (*table*) : Spline.
- `p` (*table|nil*) : Paramètres (voir buildCenterline) ; p.zMode est écrasé.

#### `editor_toolUtilities_engineeredGeom.buildCenterlineFree(spline, p)`

Enveloppe de buildCenterline avec zMode = 'free' (hauteurs des noeuds libres).

- `spline` (*table*) : Spline.
- `p` (*table|nil*) : Paramètres (voir buildCenterline) ; p.zMode est écrasé.

#### `editor_toolUtilities_engineeredGeom.buildCenterlineRaycast(spline, p)`

Enveloppe de buildCenterline avec zMode = 'raycast' (axe posé sur le terrain par lancer de rayon).

- `spline` (*table*) : Spline.
- `p` (*table|nil*) : Paramètres (voir buildCenterline) ; p.zMode est écrasé.

#### `editor_toolUtilities_engineeredGeom.drawControlPolygon(group)`

Dessine en debugDrawer, pour un groupe en mode ingénieur : le polygone des noeuds (guide fin), une sphère sur chaque noeud intérieur et l'axe résultant coloré par courbure (turquoise en ligne droite, ambre au virage le plus serré). Fondu selon la distance caméra (plein sous 90 m, invisible au-delà de 550 m). Sans effet hors mode 'engineered' ou avec moins de 2 noeuds.

- `group` (*table|nil*) : Groupe/spline à dessiner.

#### `editor_toolUtilities_engineeredGeom.sampleInto(group, opts)`

Point d'entrée unique d'échantillonnage selon group.geometryMode. En mode 'engineered', appelle buildCenterline avec les champs eng* du groupe et renvoie true. Sinon, met group.divCurv à nil et renvoie false pour que l'outil lance son propre échantillonneur geom.catmullRom*.

- `group` (*table*) : Groupe/spline avec geometryMode, engRadiusM, engTransM, engVertLenM.
- `opts` (*table|nil*) : { zMode = 'free'|'raycast'|'conform' (défaut 'free'), lonRes, deckZ, maxStep, minR, levelStart, levelFinish }. levelStart/levelFinish : en mode free, cette extrémité rejoint une plateforme plate, le profil arrive à plat.
- **renvoie** : boolean true si le mode ingénieur a échantillonné, false si l'appelant doit le faire.

#### `editor_toolUtilities_engineeredGeom.selfTest()`

Auto-test manuel : construit un virage de 90 degrés (R 30, Ls 20) et journalise le nombre de points, l'écart max entre points et le coude max par pas.

- **renvoie** : integer Nombre de points d'axe générés.

#### `editor_toolUtilities_engineeredGeom.solveCorner(pPrev, pI, pNext, R, Ls, minAngle)`

Résout la géométrie d'un virage au noeud pI : déviation signée, rayon, longueur de spirale (réduite à R*|delta| si trop longue), angle de spirale, angle d'arc et distance tangente T absorbée sur chaque ligne droite voisine. Travaille en plan (x, y). Renvoie { through = true, T = 0 } si un segment est quasi nul ou si la déviation est inférieure à minAngle.

- `pPrev` (*vec3*) : Noeud précédent.
- `pI` (*vec3*) : Noeud du virage (point d'intersection).
- `pNext` (*vec3*) : Noeud suivant.
- `R` (*number*) : Rayon d'arc voulu (m).
- `Ls` (*number*) : Longueur de spirale voulue (m).
- `minAngle` (*number*) : Déviation minimale (rad) sous laquelle aucun arrondi n'est fait.
- **renvoie** : table { through, delta, absD, turn (+1 gauche, -1 droite), R, Ls, thetaS, arc, T }.

## Champs

| Champ | Type | Description |
|---|---|---|
| `CONTROLS` | table | Métadonnées pour l'inspecteur, afin que tous les outils affichent les mêmes curseurs : radius, transition, vertical, widthTaper, widenAmount (chacun avec key, default, min, max, fmt, label, tooltip) et les infobulles toggleTooltip, modeEngTip, modeSmoothTip. |
| `DEFAULT_MIN_R` | number | Rayon plancher d'un virage (8.0 m). |

## Appels vers le moteur (C++)

- `debugDrawer:` `drawLineInstance`, `drawSphere`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/toolUtilities/engineeredGeom.lua`.*
