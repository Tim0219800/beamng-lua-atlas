# `editor_toolUtilities_polyOffset`

*Fichier : `lua/ge/extensions/editor/toolUtilities/polyOffset.lua` · VM : Game Engine (GE) · 96 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_toolUtilities_polyOffset` : `extensions.load("editor_toolUtilities_polyOffset")`, puis la globale `editor_toolUtilities_polyOffset`

Décalage latéral d'une polyligne 2D dont chaque arête porte une normale sortante. Gère les coins par jonction en onglet (miter), en chanfrein ou par intersection de droites, avec une limite d'onglet pour les angles aigus. run construit un ruban fermé entre la ligne et son décalage.

## Remarques

- Travaille en 2D (x, y) uniquement.
- nrm doit contenir une normale par arête (#nrm >= #pts - 1) ; nrm[i] est la normale de l'arête entre pts[i] et pts[i+1].
- Une polyligne fermée (premier et dernier point confondus, plus de 3 points) voit sa couture traitée comme un coin ordinaire.
- MITER_LIMIT = 4 : un onglet ne dépasse jamais 4 fois la distance de décalage.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_toolUtilities_polyOffset.lineIntersect(px, py, dx, dy, qx, qy, ex, ey)` | Intersection de deux droites P + t*D et Q + s*E en 2D. Renvoie nil si elles sont parallèles (déterminant < 1e-9). | 15 |
| `editor_toolUtilities_polyOffset.mitrePt(cx, cy, n1, n2, d)` | Point décalé d'un sommet entre deux normales d'arêtes : l'onglet, ramené le long de sa bissectrice quand l'angle est trop aigu (limite MITER_LIMIT * \|d\|). | 24 |
| `editor_toolUtilities_polyOffset.polyline(pts, nrm, d, join)` | Décale une polyligne latéralement de la distance signée d. Le type de jonction aux coins est choisi par join : 'chamfer' (deux points), 'miter' (un point par sommet) ou autre/nil (intersection des arêtes décalées, repli en deux points si trop loin). | 37 |
| `editor_toolUtilities_polyOffset.run(pts, nrm, d, join, overlap)` | Construit un anneau fermé allant de la ligne à son décalage : la base est enfoncée de overlap dans la masse derrière (côté opposé), puis le bord extérieur est parcouru en sens inverse. | 75 |

### Détail des paramètres

#### `editor_toolUtilities_polyOffset.lineIntersect(px, py, dx, dy, qx, qy, ex, ey)`

Intersection de deux droites P + t*D et Q + s*E en 2D. Renvoie nil si elles sont parallèles (déterminant < 1e-9).

- `px` (*number*) : x du point de la première droite.
- `py` (*number*) : y du point de la première droite.
- `dx` (*number*) : x de la direction de la première droite.
- `dy` (*number*) : y de la direction de la première droite.
- `qx` (*number*) : x du point de la seconde droite.
- `qy` (*number*) : y du point de la seconde droite.
- `ex` (*number*) : x de la direction de la seconde droite.
- `ey` (*number*) : y de la direction de la seconde droite.
- **renvoie** : number|nil x de l'intersection.
- **renvoie** : number|nil y de l'intersection.

#### `editor_toolUtilities_polyOffset.mitrePt(cx, cy, n1, n2, d)`

Point décalé d'un sommet entre deux normales d'arêtes : l'onglet, ramené le long de sa bissectrice quand l'angle est trop aigu (limite MITER_LIMIT * |d|).

- `cx` (*number*) : x du sommet.
- `cy` (*number*) : y du sommet.
- `n1` (*table*) : Normale {x,y} de l'arête entrante.
- `n2` (*table*) : Normale {x,y} de l'arête sortante.
- `d` (*number*) : Distance de décalage signée.
- **renvoie** : number x du point décalé.
- **renvoie** : number y du point décalé.

#### `editor_toolUtilities_polyOffset.polyline(pts, nrm, d, join)`

Décale une polyligne latéralement de la distance signée d. Le type de jonction aux coins est choisi par join : 'chamfer' (deux points), 'miter' (un point par sommet) ou autre/nil (intersection des arêtes décalées, repli en deux points si trop loin).

- `pts` (*table*) : Liste de points {x,y}.
- `nrm` (*table*) : Normales {x,y} unitaires, une par arête.
- `d` (*number*) : Distance de décalage signée, en mètres.
- `join` (*string|nil*) : 'chamfer', 'miter' ou nil pour la jonction par intersection.
- **renvoie** : table Liste de points {x,y} décalés.

#### `editor_toolUtilities_polyOffset.run(pts, nrm, d, join, overlap)`

Construit un anneau fermé allant de la ligne à son décalage : la base est enfoncée de overlap dans la masse derrière (côté opposé), puis le bord extérieur est parcouru en sens inverse.

- `pts` (*table*) : Liste de points {x,y}.
- `nrm` (*table*) : Normales par arête.
- `d` (*number*) : Distance de décalage signée.
- `join` (*string|nil*) : Type de jonction, voir polyline.
- `overlap` (*number|nil*) : Enfoncement de la base (défaut 0.05 m).
- **renvoie** : table|nil Anneau de points {x,y}, ou nil si moins de 2 points ou |d| < 1e-4.

## Champs

| Champ | Type | Description |
|---|---|---|
| `MITER_LIMIT` | number | Facteur maximal (4.0) de longueur d'onglet par rapport à \|d\|. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/toolUtilities/polyOffset.lua`.*
