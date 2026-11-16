# `utils_pixellib`

*Fichier : `lua/common/utils/pixellib.lua` · VM : Commun (GE + véhicule) · 566 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("utils/pixellib")`

Petite bibliothèque de dessin de pixels en mémoire (tampon RGBA 8 bits via FFI) : points, lignes, cercles, rectangles, icônes et texte en police bitmap 'mini_font' (majuscules, chiffres et quelques signes). Le tampon s'enregistre en image (GBitmap:saveFile). Se charge avec require('utils/pixellib') ; M.create() renvoie un objet LuaPixelBuffer. Utile pour générer des images de debug (cartes, graphiques) sans UI. Voir M.test() pour un exemple complet.

## Exemple

```lua
local pb = require('utils/pixellib').create()
pb:init(250, 250)
pb:fill(ColorI(255,255,255,255))
pb:drawLine(vec3(0,0,0), vec3(100,50,0), ColorI(255,0,0,255), 2)
pb:drawText(vec3(10,200,0), 'Hello', ColorI(0,0,0,255))
pb:saveFile('test.png')
```

## Remarques

- Les positions de dessin (pos, p1, pos1…) sont des vec3 dont seuls x et y servent (z ignoré). Les couleurs sont des tables/objets avec champs r, g, b, a entiers 0..255 (ex. ColorI(255,0,0,255)).
- Les coordonnées sont en pixels ; l'origine (0,0) est en haut à gauche ; les pixels hors du tampon sont ignorés (drawPixel) ; la mémoire du tampon est indexée y*width + x.
- drawText met le texte en majuscules et ne gère que les caractères de mini_font (A-Z, 0-9, ! ? ' " . , : - _ et espace) ; la position pos.y est le BAS de la ligne de texte (le texte monte au-dessus).
- Incohérence : getPixel ne fait pas math.floor sur x et y (contrairement à drawPixel) ; avec des coordonnées non entières l'index FFI peut être faux.
- Incohérence : LuaPixelBuffer:init alloue width*height sans arrondir (math.floor n'est appliqué qu'aux champs width/height), ce qui peut sous-dimensionner le tampon avec des dimensions décimales.
- drawText : pour une espace, x avance de 4 puis ne trouvant pas la lettre dans mini_font il n'y a pas d'avance supplémentaire ; le décompte consumedWidth ne compte que les caractères dessinés.
- Les fonctions M.test() écrivent 'helloworld.png' dans le répertoire courant.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `utils_pixellib.create()` | Crée un objet LuaPixelBuffer vide ; appeler ensuite :init(width, height) pour allouer le tampon. | 32 |
| `utils_pixellib.test()` | Démonstration : dessine plusieurs primitives et du texte dans un tampon 250x250 puis l'enregistre en 'helloworld.png'. | 240 |

### Détail des paramètres

#### `utils_pixellib.create()`

Crée un objet LuaPixelBuffer vide ; appeler ensuite :init(width, height) pour allouer le tampon.

- **renvoie** : table Instance LuaPixelBuffer

## Classe `LuaPixelBuffer`

Tampon de pixels RGBA renvoyé par create(). Champs : width, height, bufSize, buf (cdata rgba_pixel_t[?]).

| Méthode | Description | Ligne |
|---|---|---|
| `LuaPixelBuffer:__tostring()` | Texte descriptif 'LuaPixelBuffer - ... [resolution: W x H (RGBA)]'. | 65 |
| `LuaPixelBuffer:_allocate_buffer(n)` | Alloue le tableau FFI de n pixels. Appelé par init. | 60 |
| `LuaPixelBuffer:drawCircle(pos, radius, color, lineWidth)` | Dessine le contour d'un cercle (algorithme du point milieu). | 97 |
| `LuaPixelBuffer:drawFilledCircle(pos, radius, color)` | Dessine un disque plein. | 130 |
| `LuaPixelBuffer:drawFilledRect(p1, width, height, color)` | Remplit un rectangle (bornes incluses : width+1 par height+1 pixels). | 155 |
| `LuaPixelBuffer:drawIcon(pos, type, color)` | Dessine une petite icône : 'x' (croix de 5x5) ou 'o' (cercle de rayon 2). Autre type : rien. | 194 |
| `LuaPixelBuffer:drawLine(pos1, pos2, color, lineWidth)` | Dessine un segment (parcours pixel par pixel selon l'axe dominant). | 217 |
| `LuaPixelBuffer:drawPixel(x, y, color)` | Écrit la couleur sur un pixel (copie r, g, b, a, sans mélange alpha). Ignore les coordonnées hors tampon. | 69 |
| `LuaPixelBuffer:drawPoint(x, y, color, size)` | Dessine un point : un pixel si size vaut 1/nil/0, sinon un disque plein de diamètre approximatif size. | 83 |
| `LuaPixelBuffer:drawRect(p1, width, height, color, lineWidth)` | Dessine le contour d'un rectangle avec 4 lignes. | 141 |
| `LuaPixelBuffer:drawText(pos, text, color)` | Écrit du texte avec la police bitmap interne (5 pixels de haut). pos.y est le bas de la ligne. | 164 |
| `LuaPixelBuffer:fill(color)` | Remplit tout le tampon avec une couleur. | 93 |
| `LuaPixelBuffer:getPixel(x, y)` | Lit un pixel du tampon. | 78 |
| `LuaPixelBuffer:init(width, height)` | Alloue le tampon et fixe width/height (arrondis à l'entier inférieur). Pixels initialement à zéro (transparents noirs). | 38 |
| `LuaPixelBuffer:saveFile(filename)` | Enregistre le tampon comme image via un GBitmap du moteur (format selon l'extension, ex. .png). Loggue une erreur si le chargement dans le bitmap échoue. | 56 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/utils/pixellib.lua`.*
