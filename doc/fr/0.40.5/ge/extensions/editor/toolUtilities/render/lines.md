# `editor_toolUtilities_render_lines`

*Fichier : `lua/ge/extensions/editor/toolUtilities/render/lines.lua` · VM : Game Engine (GE) · 138 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_toolUtilities_render_lines` : `extensions.load("editor_toolUtilities_render_lines")`, puis la globale `editor_toolUtilities_render_lines`

Dessin de lignes de debug pour les outils d'édition de splines de l'éditeur (issu de l'ancien render.lua monolithique). Chaque fonction trace un segment p0-p1 avec le style (couleur, épaisseur) correspondant à un usage : spline, fil de fer, ligne de chute d'élévation, normale, navigation, etc. Module feuille : dépend de utils/debugDraw, du style partagé et de util (rampe de couleur bleu vers rouge).

## Exemple

```lua
local rLines = require('editor/toolUtilities/render/lines')
rLines.drawSplineLine(vec3(0,0,10), vec3(5,0,10))
```

## Remarques

- Les variantes « culled » ne dessinent que si les DEUX extrémités sont à moins de 600 m de la caméra ; drawSplineLine, drawArcSegment, drawJoinLine et drawLineImmediate ne sont pas filtrées.
- Les couleurs sont des entiers packés (fonction color()) provenant de editor/toolUtilities/style.
- drawWireFrameLine modifie p0.z et p1.z de +0.05 (effet de bord sur les arguments) alors que ses copies offsetP0/offsetP1 sont dessinées sans le décalage : le décalage voulu n'est pas appliqué au tracé.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_toolUtilities_render_lines.drawActiveSegLine(p0, p1)` | Segment actif (colourLayerWire, épaisseur 2). | 62 |
| `editor_toolUtilities_render_lines.drawArcSegment(p0, p1)` | Segment d'arc (colourArcSeg, épaisseur arcSegThickness). Non filtré par distance. | 98 |
| `editor_toolUtilities_render_lines.drawBarCeilingLine(p0, p1, v, lim)` | Ligne de plafond de barre, colorée selon v sur la rampe bleu vers rouge. | 86 |
| `editor_toolUtilities_render_lines.drawDropLine(p0, p1, v, lim)` | Ligne de chute d'élévation colorée selon la valeur v sur la rampe bleu vers rouge entre 0 et lim. | 71 |
| `editor_toolUtilities_render_lines.drawDropLineDull(p0, p1)` | Ligne de chute atténuée (colourDropDull). | 73 |
| `editor_toolUtilities_render_lines.drawDropLineThick(p0, p1, v, lim)` | Comme drawDropLine avec l'épaisseur dropThicknessThicker. | 72 |
| `editor_toolUtilities_render_lines.drawElevDropLine(p0, p1, v, lim)` | Ligne de chute douce, fine et translucide (alpha 110), pour nœuds sélectionnés ou centres de jonction. Teinte selon \|v\| / lim (lim vaut 100 par défaut). | 75 |
| `editor_toolUtilities_render_lines.drawForegroundLine(p0, p1, col)` | Trace une ligne par-dessus la géométrie (sans test de profondeur) via debugDrawer:drawLine. | 34 |
| `editor_toolUtilities_render_lines.drawGroundLine(p0, p1)` | Ligne au sol (colourGround). | 65 |
| `editor_toolUtilities_render_lines.drawGroundLineDull(p0, p1)` | Ligne au sol atténuée (colourGroundDull). | 68 |
| `editor_toolUtilities_render_lines.drawJoinLine(p0, p1)` | Ligne de jonction/boucle à épaisseur pulsée dans le temps (os.clock, loopPulseHz). Non filtrée par distance. | 99 |
| `editor_toolUtilities_render_lines.drawLineCulled(p0, p1, thickness, col)` | Trace une ligne seulement si les deux extrémités sont à moins de 600 m de la caméra. | 27 |
| `editor_toolUtilities_render_lines.drawLineImmediate(p0, p1, thickness, col)` | Trace une ligne sans filtrage par distance (debugDraw.drawLineInstance_MinArg). | 25 |
| `editor_toolUtilities_render_lines.drawNavLine(p0, p1)` | Ligne de graphe de navigation (colourNav). | 84 |
| `editor_toolUtilities_render_lines.drawNormalLine(p0, p1)` | Ligne de normale (colourNormal). | 82 |
| `editor_toolUtilities_render_lines.drawPathLine(p0, p1)` | Ligne de chemin (colourPath). | 85 |
| `editor_toolUtilities_render_lines.drawPreviewWireLine(p0, p1)` | Fil de fer d'aperçu (colourPreviewWire). | 55 |
| `editor_toolUtilities_render_lines.drawRefNormalLine(p0, p1)` | Ligne de normale de référence (colourRefNormal). | 83 |
| `editor_toolUtilities_render_lines.drawRibLine(p0, p1)` | Ligne de nervure : passe de halo (colourRibGlow) puis passe de cœur (colourRibLine). | 58 |
| `editor_toolUtilities_render_lines.drawSplineLine(p0, p1)` | Ligne de spline sélectionnée : halo (épaisseur 4) puis cœur (épaisseur 2). Non filtrée par distance. | 94 |
| `editor_toolUtilities_render_lines.drawSplineLineDull(p0, p1)` | Ligne de spline atténuée (colourSplineDull). | 88 |
| `editor_toolUtilities_render_lines.drawSplineLineForeground(p0, p1)` | Ligne de spline au premier plan (couleur colourSplineForegroundF). | 38 |
| `editor_toolUtilities_render_lines.drawSplineLineLinked(p0, p1)` | Ligne de spline liée à une autre (colourSplineLinked). | 87 |
| `editor_toolUtilities_render_lines.drawSplineLineUnselected(p0, p1)` | Ligne de spline non sélectionnée (colourSplineDull, épaisseur 2). | 91 |
| `editor_toolUtilities_render_lines.drawSquareCornerLine(p0, p1)` | Ligne de marque d'angle droit (colourSquareCorner). | 80 |
| `editor_toolUtilities_render_lines.drawSquareCornerLineForeground(p0, p1)` | Marque d'angle droit au premier plan (colourSquareCornerF). | 81 |
| `editor_toolUtilities_render_lines.drawWireFrameLine(p0, p1)` | Fil de fer de couche (colourLayerWire, épaisseur 2). | 42 |
| `editor_toolUtilities_render_lines.drawWireFrameLine2(p0, p1)` | Fil de fer de deuxième couche (colourLayerWire2). | 49 |
| `editor_toolUtilities_render_lines.drawWireFrameLine3(p0, p1)` | Fil de fer de troisième couche (colourLayerWire3). | 52 |

### Détail des paramètres

#### `editor_toolUtilities_render_lines.drawActiveSegLine(p0, p1)`

Segment actif (colourLayerWire, épaisseur 2).

- `p0` (*vec3*) : Début.
- `p1` (*vec3*) : Fin.

#### `editor_toolUtilities_render_lines.drawArcSegment(p0, p1)`

Segment d'arc (colourArcSeg, épaisseur arcSegThickness). Non filtré par distance.

- `p0` (*vec3*) : Début.
- `p1` (*vec3*) : Fin.

#### `editor_toolUtilities_render_lines.drawBarCeilingLine(p0, p1, v, lim)`

Ligne de plafond de barre, colorée selon v sur la rampe bleu vers rouge.

- `p0` (*vec3*) : Début.
- `p1` (*vec3*) : Fin.
- `v` (*number*) : Valeur.
- `lim` (*number*) : Maximum de la rampe.

#### `editor_toolUtilities_render_lines.drawDropLine(p0, p1, v, lim)`

Ligne de chute d'élévation colorée selon la valeur v sur la rampe bleu vers rouge entre 0 et lim.

- `p0` (*vec3*) : Début.
- `p1` (*vec3*) : Fin.
- `v` (*number*) : Valeur à représenter.
- `lim` (*number*) : Valeur maximale de la rampe.

#### `editor_toolUtilities_render_lines.drawDropLineDull(p0, p1)`

Ligne de chute atténuée (colourDropDull).

- `p0` (*vec3*) : Début.
- `p1` (*vec3*) : Fin.

#### `editor_toolUtilities_render_lines.drawDropLineThick(p0, p1, v, lim)`

Comme drawDropLine avec l'épaisseur dropThicknessThicker.

- `p0` (*vec3*) : Début.
- `p1` (*vec3*) : Fin.
- `v` (*number*) : Valeur.
- `lim` (*number*) : Maximum de la rampe.

#### `editor_toolUtilities_render_lines.drawElevDropLine(p0, p1, v, lim)`

Ligne de chute douce, fine et translucide (alpha 110), pour nœuds sélectionnés ou centres de jonction. Teinte selon |v| / lim (lim vaut 100 par défaut).

- `p0` (*vec3*) : Début.
- `p1` (*vec3*) : Fin.
- `v` (*number*) : Valeur (valeur absolue utilisée).
- `lim` (*number|nil*) : Maximum de la rampe, défaut 100.

#### `editor_toolUtilities_render_lines.drawForegroundLine(p0, p1, col)`

Trace une ligne par-dessus la géométrie (sans test de profondeur) via debugDrawer:drawLine.

- `p0` (*vec3*) : Début.
- `p1` (*vec3*) : Fin.
- `col` (*integer*) : Couleur packée.

#### `editor_toolUtilities_render_lines.drawGroundLine(p0, p1)`

Ligne au sol (colourGround).

- `p0` (*vec3*) : Début.
- `p1` (*vec3*) : Fin.

#### `editor_toolUtilities_render_lines.drawGroundLineDull(p0, p1)`

Ligne au sol atténuée (colourGroundDull).

- `p0` (*vec3*) : Début.
- `p1` (*vec3*) : Fin.

#### `editor_toolUtilities_render_lines.drawJoinLine(p0, p1)`

Ligne de jonction/boucle à épaisseur pulsée dans le temps (os.clock, loopPulseHz). Non filtrée par distance.

- `p0` (*vec3*) : Début.
- `p1` (*vec3*) : Fin.

#### `editor_toolUtilities_render_lines.drawLineCulled(p0, p1, thickness, col)`

Trace une ligne seulement si les deux extrémités sont à moins de 600 m de la caméra.

- `p0` (*vec3*) : Début.
- `p1` (*vec3*) : Fin.
- `thickness` (*number*) : Épaisseur.
- `col` (*integer*) : Couleur packée.

#### `editor_toolUtilities_render_lines.drawLineImmediate(p0, p1, thickness, col)`

Trace une ligne sans filtrage par distance (debugDraw.drawLineInstance_MinArg).

- `p0` (*vec3*) : Début.
- `p1` (*vec3*) : Fin.
- `thickness` (*number*) : Épaisseur.
- `col` (*integer*) : Couleur packée.

#### `editor_toolUtilities_render_lines.drawNavLine(p0, p1)`

Ligne de graphe de navigation (colourNav).

- `p0` (*vec3*) : Début.
- `p1` (*vec3*) : Fin.

#### `editor_toolUtilities_render_lines.drawNormalLine(p0, p1)`

Ligne de normale (colourNormal).

- `p0` (*vec3*) : Début.
- `p1` (*vec3*) : Fin.

#### `editor_toolUtilities_render_lines.drawPathLine(p0, p1)`

Ligne de chemin (colourPath).

- `p0` (*vec3*) : Début.
- `p1` (*vec3*) : Fin.

#### `editor_toolUtilities_render_lines.drawPreviewWireLine(p0, p1)`

Fil de fer d'aperçu (colourPreviewWire).

- `p0` (*vec3*) : Début.
- `p1` (*vec3*) : Fin.

#### `editor_toolUtilities_render_lines.drawRefNormalLine(p0, p1)`

Ligne de normale de référence (colourRefNormal).

- `p0` (*vec3*) : Début.
- `p1` (*vec3*) : Fin.

#### `editor_toolUtilities_render_lines.drawRibLine(p0, p1)`

Ligne de nervure : passe de halo (colourRibGlow) puis passe de cœur (colourRibLine).

- `p0` (*vec3*) : Début.
- `p1` (*vec3*) : Fin.

#### `editor_toolUtilities_render_lines.drawSplineLine(p0, p1)`

Ligne de spline sélectionnée : halo (épaisseur 4) puis cœur (épaisseur 2). Non filtrée par distance.

- `p0` (*vec3*) : Début.
- `p1` (*vec3*) : Fin.

#### `editor_toolUtilities_render_lines.drawSplineLineDull(p0, p1)`

Ligne de spline atténuée (colourSplineDull).

- `p0` (*vec3*) : Début.
- `p1` (*vec3*) : Fin.

#### `editor_toolUtilities_render_lines.drawSplineLineForeground(p0, p1)`

Ligne de spline au premier plan (couleur colourSplineForegroundF).

- `p0` (*vec3*) : Début.
- `p1` (*vec3*) : Fin.

#### `editor_toolUtilities_render_lines.drawSplineLineLinked(p0, p1)`

Ligne de spline liée à une autre (colourSplineLinked).

- `p0` (*vec3*) : Début.
- `p1` (*vec3*) : Fin.

#### `editor_toolUtilities_render_lines.drawSplineLineUnselected(p0, p1)`

Ligne de spline non sélectionnée (colourSplineDull, épaisseur 2).

- `p0` (*vec3*) : Début.
- `p1` (*vec3*) : Fin.

#### `editor_toolUtilities_render_lines.drawSquareCornerLine(p0, p1)`

Ligne de marque d'angle droit (colourSquareCorner).

- `p0` (*vec3*) : Début.
- `p1` (*vec3*) : Fin.

#### `editor_toolUtilities_render_lines.drawSquareCornerLineForeground(p0, p1)`

Marque d'angle droit au premier plan (colourSquareCornerF).

- `p0` (*vec3*) : Début.
- `p1` (*vec3*) : Fin.

#### `editor_toolUtilities_render_lines.drawWireFrameLine(p0, p1)`

Fil de fer de couche (colourLayerWire, épaisseur 2).

- `p0` (*vec3*) : Début.
- `p1` (*vec3*) : Fin.

#### `editor_toolUtilities_render_lines.drawWireFrameLine2(p0, p1)`

Fil de fer de deuxième couche (colourLayerWire2).

- `p0` (*vec3*) : Début.
- `p1` (*vec3*) : Fin.

#### `editor_toolUtilities_render_lines.drawWireFrameLine3(p0, p1)`

Fil de fer de troisième couche (colourLayerWire3).

- `p0` (*vec3*) : Début.
- `p1` (*vec3*) : Fin.

## Appels vers le moteur (C++)

- `debugDrawer:` `drawLine`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/toolUtilities/render/lines.lua`.*
