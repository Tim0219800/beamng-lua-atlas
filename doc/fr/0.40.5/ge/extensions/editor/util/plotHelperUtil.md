# `editor_util_plotHelperUtil`

*Fichier : `lua/ge/extensions/editor/util/plotHelperUtil.lua` · VM : Game Engine (GE) · 615 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/editor/util/plotHelperUtil")` (fichier sous extensions/ mais pas une extension classique)

Aide d'éditeur : graphique 2D imgui (grille, axes, points, courbe Catmull-Rom optionnelle, réticule, annotations verticales) avec déplacement à la souris (glisser bouton gauche) et zoom à la molette. Le module renvoie un constructeur : require('/lua/ge/extensions/editor/util/plotHelperUtil')(params). Utile pour tracer des courbes (ex. tables JBeam) dans une fenêtre d'éditeur. Chaque instance reçoit un id unique (compteur local) pour ses identifiants imgui.

## Exemple

```lua
local plot = require('/lua/ge/extensions/editor/util/plotHelperUtil')({autoScale = true, showCatmullRomCurve = true})
plot:setData({{0, 0, 1}, {1, 2, 3}, {2, 4, 5}}) -- {x, y1, y2...}
plot:setSeriesNames({'A', 'B'})
-- dans onEditorGui, dans une fenêtre imgui :
plot:draw(400, 300, dt)
```

## Remarques

- Format des données de setData : {{x0, y0, y1, ...}, ...} ; setDataMulti attend déjà des séries : data[serie][i] = {x, y}.
- Marge de 50 px (borderSize) autour de la zone de tracé ; le point hors des bornes donne nil dans graphPtToImSS / graphPtToImWS (sauf clampVal).
- init : sans paramètres, échelle -5..5, showCatmullRomCurve = true, catmullDataPoints = 10 (champ jamais relu : le code utilise catmullromCurveLines, 10 par défaut). allowZoom vaut vrai par défaut (params.allowZoom or true, remis à faux seulement si params.allowZoom == false).
- Formats d'étiquette par défaut : '%0.3f' (formatX, formatY) ; taille de point 4, épaisseur 2.
- Incohérence dans le code : setScale calcule centerPos comme la demi-étendue ((max-min)/2) et non le centre ; les commentaires de setSeriesColors et setSeriesFormat disent « names » par copier-coller.
- draw retourne tôt, sans EndChild, si self.data est nil (BeginChild1 déjà appelé).

## Classe `C`

Instance de graphique.

Le module renvoie un constructeur : `local obj = require("editor_util_plotHelperUtil")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:draw(width, height, dt)` | Méthode principale à appeler à chaque mise à jour graphique, dans une fenêtre imgui : gère la souris, crée un child imgui et dessine grille, données, courbe Catmull-Rom, réticule et annotations. | 230 |
| `C:drawCatmullSpline()` | Dessine la courbe Catmull-Rom calculée. | 368 |
| `C:drawData()` | Dessine les points de chaque série (couleur de série ou rainbowColor). | 500 |
| `C:drawGridAndAxesLabels()` | Dessine la grille et les étiquettes des axes. | 402 |
| `C:generateCatmullSplinePoints()` | Génère les points de la courbe Catmull-Rom pour chaque série (adapté de lua/vehicle/ve_utils.lua, modifié pour plusieurs y) ; séries de moins de 2 points ignorées, séries de 2 points copiées telles quelles. | 324 |
| `C:getOptimalTickIncrement(ticks, range)` | Calcule l'incrément de graduation (1, 2 ou 5 selon l'ordre de grandeur) le plus proche du nombre de graduations voulu. | 485 |
| `C:getOrderOfMagnitude(num)` | Renvoie l'exposant x de num écrit a * 10^x. | 599 |
| `C:graphPtToImSS(x, y, clampVal)` | Coordonnées imgui (espace écran) d'un point du graphe ; nil si le point est hors bornes, sauf avec clampVal (valeurs bornées à 0..1). | 555 |
| `C:graphPtToImWS(x, y)` | Coordonnées imgui (espace fenêtre) d'un point du graphe ; nil si hors bornes. | 580 |
| `C:init(params)` | Initialise le graphique. params.scale = {xMin, xMax, yMin, yMax}, params.initData, params.autoScale, params.showCatmullRomCurve, params.catmullromCurveLines (> 200 conseillé), params.allowZoom, pointSize, pointThickness, formatX, formatY. | 34 |
| `C:moveGraph(dt)` | Déplace le graphe quand on glisse avec le bouton gauche (le clic initial doit être dans le graphe). | 181 |
| `C:normToImSS(x, y)` | Coordonnées imgui (espace écran) depuis des coordonnées normalisées : (0,0) bas gauche, (1,1) haut droite. | 550 |
| `C:normToImWS(x, y)` | Comme normToImSS mais en espace fenêtre. | 575 |
| `C:overlayTextLines(lines)` | Affiche des lignes de texte en surimpression en haut à gauche du graphe. | 311 |
| `C:roundToDigits(num, dec)` | Arrondit num à dec décimales. | 592 |
| `C:scaleToFitData()` | Ajuste le domaine et la plage pour contenir tous les points, avec 10 % de marge de chaque côté. Sans effet sans données. | 136 |
| `C:scaleX(x)` | Convertit une fraction normalisée x (0..1) en valeur x du graphe selon l'échelle courante. | 603 |
| `C:scaleY(y)` | Convertit une fraction normalisée y (0..1) en valeur y du graphe selon l'échelle courante. | 604 |
| `C:setAnnotationX(annotation)` | Définit les annotations verticales : liste de paires {x, libellé}, tracées comme ligne et texte dans le graphe. | 131 |
| `C:setData(data)` | Définit les données au format {{x0, y0, y1, ...}, ...} (plusieurs valeurs y par x), converti en séries puis passé à setDataMulti. | 80 |
| `C:setDataMulti(data)` | Définit les données par série : data[serie] = liste de {x, y}. Recalcule l'échelle si autoScale, et les points Catmull-Rom si showCatmullRomCurve. | 94 |
| `C:setScale(xMin, xMax, yMin, yMax)` | Définit les bornes du graphique ; chaque paramètre est facultatif (nil = inchangé). | 164 |
| `C:setSeriesColors(colors)` | Définit les couleurs des séries au format {r, g, b, a} avec des valeurs de 0 à 1 (convertit en U32). Sans couleur, la série utilise rainbowColor. | 116 |
| `C:setSeriesFormat(format)` | Remplace directement la table de format des séries (name, color, uColor par série). | 127 |
| `C:setSeriesNames(names)` | Définit les noms des séries (liste) ; nom par défaut tostring(i). | 106 |
| `C:zoomGraph(dt)` | Zoom à la molette selon la position de la souris ; sans effet si allowZoom est faux ou si la souris est hors du graphe. | 212 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/util/plotHelperUtil.lua`.*
