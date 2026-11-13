# `libs_ezSVG_EzSVG`

*Fichier : `lua/common/libs/ezSVG/EzSVG.lua` · VM : Commun (GE + véhicule) · 963 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("libs/ezSVG/EzSVG")`

EzSVG : bibliothèque tierce (Patrick Borgeat, 2012, reprise par BeamNG) pour générer des fichiers SVG depuis Lua. On crée des éléments (Circle, Rect, Line, Path, Polyline, Text, Group, dégradés…), on les ajoute à un groupe ou un document (add) puis on écrit le fichier avec Document:writeTo. Une pile de styles par défaut (setStyle, pushStyle, popStyle) s'applique aux éléments créés. Utile pour exporter des tracés (routes, graphes) depuis un script.

## Exemple

```lua
local svg = require('libs/ezSVG/EzSVG')
local doc = svg.Document(200, 200, svg.rgb(255,255,255))
doc:add(svg.Polyline({0, 0, 100, 100}, {fill = 'none', stroke = svg.rgb(255, 0, 0), stroke_width = 1}))
doc:writeTo('test.svg')
```

## Remarques

- Dans les tables de style, les clés avec _ sont converties en - (stroke_width devient stroke-width).
- popStyle lève « Style Stack Underflow! » si la pile est vide.
- Document:writeTo effectue une passe préliminaire pour placer dans <defs> les objets référencés qui ne sont pas dans l'arbre, puis écrit le fichier (io.open) sans vérifier que l'ouverture a réussi.
- Le dernier argument style de chaque constructeur est facultatif.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `libs_ezSVG_EzSVG.Circle(cx, cy, r, style)` | Crée un cercle. | 421 |
| `libs_ezSVG_EzSVG.Document(width, height, bgcolor, style)` | Crée le document SVG racine (groupe svg avec xmlns, taille et fond facultatif). Possède add et writeTo(filename). | 850 |
| `libs_ezSVG_EzSVG.Ellipse(cx, cy, rx, ry, style)` | Crée une ellipse. | 430 |
| `libs_ezSVG_EzSVG.Group(style)` | Crée un groupe <g> contenant d'autres éléments (méthode add). | 709 |
| `libs_ezSVG_EzSVG.Image(href, x, y, width, height, style)` | Crée une image référencée. | 641 |
| `libs_ezSVG_EzSVG.Line(x1, y1, x2, y2, style)` | Crée un segment. | 440 |
| `libs_ezSVG_EzSVG.LinearGradient(x1, y1, x2, y2, userSpaceUnits, spread, style)` | Crée un dégradé linéaire (stops ajoutés ensuite sur l'objet). | 750 |
| `libs_ezSVG_EzSVG.Mask(x, y, width, height, maskUnits, maskContentUnits, style)` | Crée un masque <mask>. | 817 |
| `libs_ezSVG_EzSVG.Path(style)` | Crée un tracé <path> dont les commandes d est construit par des méthodes sur l'objet. | 450 |
| `libs_ezSVG_EzSVG.Pattern(x, y, width, height, preserveAspectRatio, patternUnits, patternContentUnits, viewbox, style)` | Crée un motif de remplissage <pattern>. | 800 |
| `libs_ezSVG_EzSVG.Polygon(points, style)` | Crée un polygone fermé. | 624 |
| `libs_ezSVG_EzSVG.Polyline(points, style)` | Crée une polyligne ouverte. | 620 |
| `libs_ezSVG_EzSVG.RadialGradient(cx, cy, r, fx, fy, userSpaceUnits, spread, style)` | Crée un dégradé radial. | 764 |
| `libs_ezSVG_EzSVG.Rect(x, y, width, height, rx, ry, style)` | Crée un rectangle, éventuellement à coins arrondis. | 628 |
| `libs_ezSVG_EzSVG.SVG(x, y, width, height, style)` | Crée un élément <svg> imbriqué (groupe positionné). | 901 |
| `libs_ezSVG_EzSVG.Symbol(preserveAspectRatio, viewBox, style)` | Crée un <symbol> (modèle réutilisable via Use). | 791 |
| `libs_ezSVG_EzSVG.Text(text, x, y, style)` | Crée un élément texte. | 664 |
| `libs_ezSVG_EzSVG.TextRef(href, style)` | Crée une référence de texte (<tref>) vers un autre élément. | 702 |
| `libs_ezSVG_EzSVG.Use(href, x, y, width, height, style)` | Crée un <use> qui réutilise un élément défini ailleurs. | 779 |
| `libs_ezSVG_EzSVG.clearStyle()` | Réinitialise les styles par défaut de toutes les balises connues (tables vides). | 379 |
| `libs_ezSVG_EzSVG.gray(v)` | Gris : rgb(v, v, v). | 919 |
| `libs_ezSVG_EzSVG.hsv(h, s, v)` | Convertit une couleur TSV en chaîne rgb(). Les trois composantes sont en 0..255 (divisées par 255). | 923 |
| `libs_ezSVG_EzSVG.popStyle()` | Restaure les styles par défaut sauvegardés ; erreur si la pile est vide. | 399 |
| `libs_ezSVG_EzSVG.pushStyle()` | Sauvegarde une copie des styles par défaut sur la pile. | 386 |
| `libs_ezSVG_EzSVG.rgb(r, g, b)` | Formate une couleur SVG "rgb(r, g, b)" (valeurs 0..255, arrondies à l'entier inférieur). | 915 |
| `libs_ezSVG_EzSVG.setStyle(key, value, tag)` | Définit un style par défaut, pour une balise ou pour toutes. Accepte soit (clé, valeur, balise?), soit (table de styles, balise?). | 407 |

### Détail des paramètres

#### `libs_ezSVG_EzSVG.Circle(cx, cy, r, style)`

Crée un cercle.

- `cx` (*number*) : Centre X
- `cy` (*number*) : Centre Y
- `r` (*number*) : Rayon
- `style` (*table|nil*) : Style

#### `libs_ezSVG_EzSVG.Document(width, height, bgcolor, style)`

Crée le document SVG racine (groupe svg avec xmlns, taille et fond facultatif). Possède add et writeTo(filename).

- `width` (*number*) : Largeur
- `height` (*number*) : Hauteur
- `bgcolor` (*string|nil*) : Couleur de fond (ajoute un rectangle)
- `style` (*table|nil*) : Style
- **renvoie** : table Document

#### `libs_ezSVG_EzSVG.Ellipse(cx, cy, rx, ry, style)`

Crée une ellipse.

- `cx` (*number*) : Centre X
- `cy` (*number*) : Centre Y
- `rx` (*number*) : Rayon X
- `ry` (*number*) : Rayon Y
- `style` (*table|nil*) : Style

#### `libs_ezSVG_EzSVG.Group(style)`

Crée un groupe <g> contenant d'autres éléments (méthode add).

- `style` (*table|nil*) : Style

#### `libs_ezSVG_EzSVG.Image(href, x, y, width, height, style)`

Crée une image référencée.

- `href` (*string*) : URL ou chemin de l'image
- `x` (*number*) : X
- `y` (*number*) : Y
- `width` (*number*) : Largeur
- `height` (*number*) : Hauteur
- `style` (*table|nil*) : Style

#### `libs_ezSVG_EzSVG.Line(x1, y1, x2, y2, style)`

Crée un segment.

- `x1` (*number*) : X de départ
- `y1` (*number*) : Y de départ
- `x2` (*number*) : X d'arrivée
- `y2` (*number*) : Y d'arrivée
- `style` (*table|nil*) : Style

#### `libs_ezSVG_EzSVG.LinearGradient(x1, y1, x2, y2, userSpaceUnits, spread, style)`

Crée un dégradé linéaire (stops ajoutés ensuite sur l'objet).

- `x1` (*number*) : X de départ
- `y1` (*number*) : Y de départ
- `x2` (*number*) : X d'arrivée
- `y2` (*number*) : Y d'arrivée
- `userSpaceUnits` (*boolean|nil*) : Utiliser les unités utilisateur (déduit du nom)
- `spread` (*string|nil*) : Méthode d'étalement (spreadMethod)
- `style` (*table|nil*) : Style

#### `libs_ezSVG_EzSVG.Mask(x, y, width, height, maskUnits, maskContentUnits, style)`

Crée un masque <mask>.

- `x` (*number*) : X
- `y` (*number*) : Y
- `width` (*number*) : Largeur
- `height` (*number*) : Hauteur
- `maskUnits` (*string|nil*) : Attribut SVG
- `maskContentUnits` (*string|nil*) : Attribut SVG
- `style` (*table|nil*) : Style

#### `libs_ezSVG_EzSVG.Path(style)`

Crée un tracé <path> dont les commandes d est construit par des méthodes sur l'objet.

- `style` (*table|nil*) : Style

#### `libs_ezSVG_EzSVG.Pattern(x, y, width, height, preserveAspectRatio, patternUnits, patternContentUnits, viewbox, style)`

Crée un motif de remplissage <pattern>.

- `x` (*number*) : X
- `y` (*number*) : Y
- `width` (*number*) : Largeur
- `height` (*number*) : Hauteur
- `preserveAspectRatio` (*string|nil*) : Attribut SVG
- `patternUnits` (*string|nil*) : Attribut SVG
- `patternContentUnits` (*string|nil*) : Attribut SVG
- `viewbox` (*string|nil*) : Attribut SVG viewBox
- `style` (*table|nil*) : Style

#### `libs_ezSVG_EzSVG.Polygon(points, style)`

Crée un polygone fermé.

- `points` (*table<integer, number>*) : Liste plate de coordonnées {x1, y1, …}
- `style` (*table|nil*) : Style

#### `libs_ezSVG_EzSVG.Polyline(points, style)`

Crée une polyligne ouverte.

- `points` (*table<integer, number>*) : Liste plate de coordonnées {x1, y1, x2, y2, …}
- `style` (*table|nil*) : Style

#### `libs_ezSVG_EzSVG.RadialGradient(cx, cy, r, fx, fy, userSpaceUnits, spread, style)`

Crée un dégradé radial.

- `cx` (*number*) : Centre X
- `cy` (*number*) : Centre Y
- `r` (*number*) : Rayon
- `fx` (*number|nil*) : Foyer X
- `fy` (*number|nil*) : Foyer Y
- `userSpaceUnits` (*boolean|nil*) : Utiliser les unités utilisateur (déduit du nom)
- `spread` (*string|nil*) : Méthode d'étalement
- `style` (*table|nil*) : Style

#### `libs_ezSVG_EzSVG.Rect(x, y, width, height, rx, ry, style)`

Crée un rectangle, éventuellement à coins arrondis.

- `x` (*number*) : X
- `y` (*number*) : Y
- `width` (*number*) : Largeur
- `height` (*number*) : Hauteur
- `rx` (*number|nil*) : Rayon des coins en X
- `ry` (*number|nil*) : Rayon des coins en Y
- `style` (*table|nil*) : Style

#### `libs_ezSVG_EzSVG.SVG(x, y, width, height, style)`

Crée un élément <svg> imbriqué (groupe positionné).

- `x` (*number*) : X
- `y` (*number*) : Y
- `width` (*number*) : Largeur
- `height` (*number*) : Hauteur
- `style` (*table|nil*) : Style

#### `libs_ezSVG_EzSVG.Symbol(preserveAspectRatio, viewBox, style)`

Crée un <symbol> (modèle réutilisable via Use).

- `preserveAspectRatio` (*string|nil*) : Attribut SVG
- `viewBox` (*string|nil*) : Attribut SVG
- `style` (*table|nil*) : Style

#### `libs_ezSVG_EzSVG.Text(text, x, y, style)`

Crée un élément texte.

- `text` (*string*) : Contenu
- `x` (*number*) : X
- `y` (*number*) : Y
- `style` (*table|nil*) : Style

#### `libs_ezSVG_EzSVG.TextRef(href, style)`

Crée une référence de texte (<tref>) vers un autre élément.

- `href` (*any*) : Élément ou identifiant référencé (déduit du code)
- `style` (*table|nil*) : Style

#### `libs_ezSVG_EzSVG.Use(href, x, y, width, height, style)`

Crée un <use> qui réutilise un élément défini ailleurs.

- `href` (*any*) : Élément ou identifiant à réutiliser
- `x` (*number|nil*) : X
- `y` (*number|nil*) : Y
- `width` (*number|nil*) : Largeur
- `height` (*number|nil*) : Hauteur
- `style` (*table|nil*) : Style

#### `libs_ezSVG_EzSVG.gray(v)`

Gris : rgb(v, v, v).

- `v` (*number*) : Niveau 0..255
- **renvoie** : string Couleur

#### `libs_ezSVG_EzSVG.hsv(h, s, v)`

Convertit une couleur TSV en chaîne rgb(). Les trois composantes sont en 0..255 (divisées par 255).

- `h` (*number*) : Teinte 0..255
- `s` (*number*) : Saturation 0..255
- `v` (*number*) : Valeur 0..255
- **renvoie** : string Couleur rgb(...)

#### `libs_ezSVG_EzSVG.rgb(r, g, b)`

Formate une couleur SVG "rgb(r, g, b)" (valeurs 0..255, arrondies à l'entier inférieur).

- `r` (*number*) : Rouge
- `g` (*number*) : Vert
- `b` (*number*) : Bleu
- **renvoie** : string Couleur

#### `libs_ezSVG_EzSVG.setStyle(key, value, tag)`

Définit un style par défaut, pour une balise ou pour toutes. Accepte soit (clé, valeur, balise?), soit (table de styles, balise?).

- `key` (*string|table*) : Nom de propriété (stroke_width…) ou table de propriétés
- `value` (*any*) : Valeur (ou nom de balise si key est une table)
- `tag` (*string|nil*) : Balise ciblée ; toutes si nil

## Champs

| Champ | Type | Description |
|---|---|---|
| `knownTags` | table<integer, string> | Liste des balises SVG connues (rect, circle, ellipse, line, polyline, polygon, path, text, tspan, textPath, image, svg, g, defs, tref, linearGradient, radialGradient, stop, use, symbol, pattern, mask) pour lesquelles un style par défaut existe. |
| `styleStack` | table | Pile des jeux de styles sauvegardés par pushStyle. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/libs/ezSVG/EzSVG.lua`.*
