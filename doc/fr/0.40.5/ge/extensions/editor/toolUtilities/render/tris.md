# `editor_toolUtilities_render_tris`

*Fichier : `lua/ge/extensions/editor/toolUtilities/render/tris.lua` · VM : Game Engine (GE) · 121 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_toolUtilities_render_tris` : `extensions.load("editor_toolUtilities_render_tris")`, puis la globale `editor_toolUtilities_render_tris`

Dessin de triangles pleins pour les outils d'édition de splines (issu de l'ancien render.lua). Triangles filtrés à 600 m de la caméra, remplissage de polygones simples (triangulation par découpe d'oreilles) et remplissage de régions 2D avec trous par balayage de lignes (règle pair-impair). Sert aux aperçus de surfaces dans l'éditeur.

## Remarques

- drawTriCulled ne dessine que si les trois sommets sont à moins de 600 m de la caméra ; le triangle est dessiné plein avec debugDraw.drawTriSolid.
- drawFilledRegions2D est destiné aux aperçus, pas à de la géométrie finale : l'escalier dû au pas de balayage sur les arêtes diagonales est masqué par le contour exact tracé par l'appelant.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_toolUtilities_render_tris.drawFilledPolygon(verts, col)` | Remplit un polygone simple, éventuellement concave, dont les sommets sont des vec3 déjà à la hauteur de dessin. Triangule en 2D (x,y) par découpe d'oreilles (geom.triangulatePolygon2D), puis dessine les triangles. Sans effet pour moins de 3 sommets ou un anneau dégénéré. | 40 |
| `editor_toolUtilities_render_tris.drawFilledRegions2D(regions, col, zFn, step)` | Remplit un ensemble de régions 2D (anneaux {x=,y=}), trous compris, par balayage horizontal avec la règle pair-impair : un point dans un nombre impair d'anneaux est rempli. Gère formes concaves et régions disjointes sans triangulation. | 56 |
| `editor_toolUtilities_render_tris.drawTriActiveSurface(a, b, c)` | Triangle de surface active (colourActiveSurf). | 35 |
| `editor_toolUtilities_render_tris.drawTriCulled(a, b, c, col)` | Dessine un triangle plein de couleur col s'il est entièrement à moins de 600 m de la caméra. | 27 |
| `editor_toolUtilities_render_tris.drawTriNotSelectedSurface(a, b, c)` | Triangle de surface non sélectionnée (colourNotSelectedSurf). | 33 |
| `editor_toolUtilities_render_tris.drawTriPreviewSurface(a, b, c)` | Triangle de surface d'aperçu (colourPreviewSurf). | 34 |

### Détail des paramètres

#### `editor_toolUtilities_render_tris.drawFilledPolygon(verts, col)`

Remplit un polygone simple, éventuellement concave, dont les sommets sont des vec3 déjà à la hauteur de dessin. Triangule en 2D (x,y) par découpe d'oreilles (geom.triangulatePolygon2D), puis dessine les triangles. Sans effet pour moins de 3 sommets ou un anneau dégénéré.

- `verts` (*vec3[]*) : Sommets du polygone.
- `col` (*integer*) : Couleur packée.

#### `editor_toolUtilities_render_tris.drawFilledRegions2D(regions, col, zFn, step)`

Remplit un ensemble de régions 2D (anneaux {x=,y=}), trous compris, par balayage horizontal avec la règle pair-impair : un point dans un nombre impair d'anneaux est rempli. Gère formes concaves et régions disjointes sans triangulation.

- `regions` (*table*) : Liste d'anneaux, chacun une liste de {x=,y=}.
- `col` (*integer*) : Couleur packée.
- `zFn` (*function*) : zFn(x, y) renvoie la hauteur de dessin (ex. hauteur du terrain).
- `step` (*number|nil*) : Pas de balayage ; auto entre 0.25 et 3 m (hauteur/100) si nil.

#### `editor_toolUtilities_render_tris.drawTriActiveSurface(a, b, c)`

Triangle de surface active (colourActiveSurf).

- `a` (*vec3*) : Sommet 1.
- `b` (*vec3*) : Sommet 2.
- `c` (*vec3*) : Sommet 3.

#### `editor_toolUtilities_render_tris.drawTriCulled(a, b, c, col)`

Dessine un triangle plein de couleur col s'il est entièrement à moins de 600 m de la caméra.

- `a` (*vec3*) : Sommet 1.
- `b` (*vec3*) : Sommet 2.
- `c` (*vec3*) : Sommet 3.
- `col` (*integer*) : Couleur packée.

#### `editor_toolUtilities_render_tris.drawTriNotSelectedSurface(a, b, c)`

Triangle de surface non sélectionnée (colourNotSelectedSurf).

- `a` (*vec3*) : Sommet 1.
- `b` (*vec3*) : Sommet 2.
- `c` (*vec3*) : Sommet 3.

#### `editor_toolUtilities_render_tris.drawTriPreviewSurface(a, b, c)`

Triangle de surface d'aperçu (colourPreviewSurf).

- `a` (*vec3*) : Sommet 1.
- `b` (*vec3*) : Sommet 2.
- `c` (*vec3*) : Sommet 3.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/toolUtilities/render/tris.lua`.*
