# `utils_debugDraw`

*Fichier : `lua/common/utils/debugDraw.lua` · VM : Commun (GE + véhicule) · 58 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("utils/debugDraw")`

Enveloppe rapide (FFI) autour du dessin de debug du moteur (BNG_DBG_DRAW_*). Dans le GE les appels se font dans onPreRender(), côté véhicule dans onDebugDraw(). Se charge avec require('utils/debugDraw'). Les couleurs sont des entiers 'packed' (voir la globale color() de utils.lua) et non des ColorF/ColorI. Les champs M.Sphere, M.Line, etc. sont les fonctions FFI brutes (coordonnées séparées x,y,z) ; les M.drawXxx acceptent des vec3.

## Exemple

```lua
local dd = require('utils/debugDraw')
dd.drawSphere(vec3(0,0,1), 0.5, color(255,0,0,255))
dd.drawTextAdvanced(vec3(0,0,2), 'hello')
```

## Remarques

- Si ffi est absent, un log E est émis et tous les champs valent nop (fonction vide).
- Bug : drawTextAdvanced utilise la variable `defaultTextColBg` (jamais définie ; la constante locale s'appelle DEFAULTTEXTCOLBG) : bgColorPacked vaut donc nil par défaut au lieu du gris translucide prévu.
- L'outil de génération signale les champs M.Cylinder, M.Line, etc. comme 'ffifound non définie' : c'est un faux positif de l'analyse, ffifound est bien défini localement (pcall(require,'ffi')).
- Les champs Cylinder, Line, Text, LineInstance_MinArgBatch et TriSolidBatch n'ont pas d'enveloppe vec3 ; il faut les appeler avec des coordonnées séparées (signature C du moteur, non visible dans ce fichier).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `utils_debugDraw.drawLineInstance_MinArg(posA, posB, w, packedCol)` | Dessine une ligne (version instanciée, arguments minimaux). | 37 |
| `utils_debugDraw.drawSphere(pos, r, packedCol, useZ)` | Dessine une sphère de debug. Seule différence avec debugDrawer : la couleur est un entier packed. | 33 |
| `utils_debugDraw.drawSquarePrism(base, tip, baseSize, tipSize, packedCol, useZ)` | Dessine un prisme à base carrée/rectangulaire entre deux points. | 40 |
| `utils_debugDraw.drawTextAdvanced(pos, txt, packedCol, useAdvancedText, twod, bgColorPacked, shadow, useZ)` | Dessine un texte à une position 3D ou 2D. Valeurs par défaut : texte blanc, useAdvancedText=false, twod=false, shadow=false, useZ=true. | 44 |
| `utils_debugDraw.drawTriSolid(posA, posB, posC, packedCol, useZ)` | Dessine un triangle plein. | 53 |

### Détail des paramètres

#### `utils_debugDraw.drawLineInstance_MinArg(posA, posB, w, packedCol)`

Dessine une ligne (version instanciée, arguments minimaux).

- `posA` (*vec3*) : Début
- `posB` (*vec3*) : Fin
- `w` (*number*) : Épaisseur
- `packedCol` (*integer*) : Couleur RGBA packed

#### `utils_debugDraw.drawSphere(pos, r, packedCol, useZ)`

Dessine une sphère de debug. Seule différence avec debugDrawer : la couleur est un entier packed.

- `pos` (*vec3*) : Centre (m)
- `r` (*number*) : Rayon (m)
- `packedCol` (*integer*) : Couleur RGBA packed (color())
- `useZ` (*boolean|nil*) : Test de profondeur, true par défaut

#### `utils_debugDraw.drawSquarePrism(base, tip, baseSize, tipSize, packedCol, useZ)`

Dessine un prisme à base carrée/rectangulaire entre deux points.

- `base` (*vec3*) : Centre de la base
- `tip` (*vec3*) : Centre de l'extrémité
- `baseSize` (*vec3*) : Dimensions (x,y) de la base
- `tipSize` (*vec3*) : Dimensions (x,y) de l'extrémité
- `packedCol` (*integer*) : Couleur RGBA packed
- `useZ` (*boolean|nil*) : Test de profondeur, true par défaut

#### `utils_debugDraw.drawTextAdvanced(pos, txt, packedCol, useAdvancedText, twod, bgColorPacked, shadow, useZ)`

Dessine un texte à une position 3D ou 2D. Valeurs par défaut : texte blanc, useAdvancedText=false, twod=false, shadow=false, useZ=true.

- `pos` (*vec3*) : Position
- `txt` (*string*) : Texte
- `packedCol` (*integer|nil*) : Couleur du texte (blanc par défaut)
- `useAdvancedText` (*boolean|nil*) : Texte avancé, false par défaut
- `twod` (*boolean|nil*) : Position 2D écran, false par défaut
- `bgColorPacked` (*integer|nil*) : Couleur de fond (voir notes : bug, nil par défaut)
- `shadow` (*boolean|nil*) : Ombre, false par défaut
- `useZ` (*boolean|nil*) : Test de profondeur, true par défaut

#### `utils_debugDraw.drawTriSolid(posA, posB, posC, packedCol, useZ)`

Dessine un triangle plein.

- `posA` (*vec3*) : Sommet A
- `posB` (*vec3*) : Sommet B
- `posC` (*vec3*) : Sommet C
- `packedCol` (*integer*) : Couleur RGBA packed
- `useZ` (*boolean|nil*) : Test de profondeur, true par défaut

## Champs

| Champ | Type | Description |
|---|---|---|
| `Cylinder` | function | BNG_DBG_DRAW_Cylinder, FFI brut (signature non visible ici). |
| `Line` | function | BNG_DBG_DRAW_Line, FFI brut (signature non visible ici). |
| `LineInstance_MinArg` | function | BNG_DBG_DRAW_LineInstance_MinArg(ax,ay,az,bx,by,bz,w,packedCol), FFI brut. |
| `LineInstance_MinArgBatch` | function | Version par lots de LineInstance_MinArg (FFI brut). |
| `Sphere` | function | BNG_DBG_DRAW_Sphere(x, y, z, r, packedCol, useZ), FFI brut. |
| `SquarePrism` | function | BNG_DBG_DRAW_SquarePrism(...), FFI brut. |
| `Text` | function | BNG_DBG_DRAW_Text, FFI brut (signature non visible ici). |
| `TextAdvanced` | function | BNG_DBG_DRAW_TextAdvanced(x,y,z,txt,packedCol,useAdvancedText,twod,bgColorPacked,shadow,useZ), FFI brut. |
| `TriSolid` | function | BNG_DBG_DRAW_TriSolid(...), FFI brut. |
| `TriSolidBatch` | function | Version par lots de TriSolid (FFI brut). |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/utils/debugDraw.lua`.*
