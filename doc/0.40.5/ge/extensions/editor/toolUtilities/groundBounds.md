# `editor_toolUtilities_groundBounds`

*Fichier : `lua/ge/extensions/editor/toolUtilities/groundBounds.lua` · VM : Game Engine (GE) · 200 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_toolUtilities_groundBounds` : `extensions.load("editor_toolUtilities_groundBounds")`, puis la globale `editor_toolUtilities_groundBounds`

Répond aux questions que tout outil de l'éditeur posant une surface sur un contour dessiné au sol doit se poser : qu'est-ce qui est déjà là (routes, jonctions, bâtiments, terrains d'autres outils), que reste-t-il du contour une fois ces obstacles soustraits, et quels côtés sont coupés ou affleurants. Fait aussi l'inverse : publier ce que l'outil occupe. S'appuie sur groundClaims, networkState, polyBool et geom.

## Remarques

- Constantes : marge de route 0.10 m, retrait de route pour les éléments posés (standoff) 0.6 m, tolérance de côté dessiné 0.05 m, tolérance de joint affleurant 0.20 m.
- Les obstacles sont rognés à la boîte du contour (+1 m) et soustraits un par un par polyBool.difference, car deux obstacles partageant le bord de la boîte s'annuleraient en une seule soustraction.
- 'owner' est le nom sous lequel l'outil publie ses propres revendications : elles ne lui sont pas renvoyées comme obstacles.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_toolUtilities_groundBounds.clip(ring, obs, owner, site)` | Soustrait les obstacles du contour et renvoie les morceaux restants à traiter un par un. Chaque morceau est { ring, holes, cut, flush } : cut[i] vrai si le côté i vient d'une soustraction (route ou bâtiment de l'autre côté), flush[i] vrai s'il touche un terrain déjà posé par un autre outil (jonction ouverte). | 122 |
| `editor_toolUtilities_groundBounds.largest(areas)` | Renvoie le plus grand morceau (par aire absolue), pour un outil qui ne pose qu'UNE chose sur son contour. | 157 |
| `editor_toolUtilities_groundBounds.obstacles(ring, owner, site, roadMargin)` | Liste ce que owner ne doit pas paver près de ce contour : surfaces de route et jonctions (networkState.surfaces, avec au moins 0.10 m de marge) et revendications des autres outils. Renvoie aussi une seconde liste où les routes sont agrandies de 0.6 m, pour y placer des éléments en retrait. | 40 |
| `editor_toolUtilities_groundBounds.pieceAt(areas, x, y)` | Indique sur quel morceau tombe un point (dans l'anneau et hors de ses trous), ou nil s'il n'est sur aucun. | 169 |
| `editor_toolUtilities_groundBounds.publish(owner, rings)` | Annonce aux autres outils de terrain ce que celui-ci occupe, sans marge (groundClaims.publish avec marge 0), pour que deux surfaces contiguës se lisent comme une seule. | 184 |
| `editor_toolUtilities_groundBounds.sig()` | Empreinte de tout ce qui, hors du contour, détermine sa forme (réseau routier et revendications), pour reconstruire quand une route ou un bâtiment bouge. Calculée à chaque frame sans construire d'anneau. | 189 |

### Détail des paramètres

#### `editor_toolUtilities_groundBounds.clip(ring, obs, owner, site)`

Soustrait les obstacles du contour et renvoie les morceaux restants à traiter un par un. Chaque morceau est { ring, holes, cut, flush } : cut[i] vrai si le côté i vient d'une soustraction (route ou bâtiment de l'autre côté), flush[i] vrai s'il touche un terrain déjà posé par un autre outil (jonction ouverte).

- `ring` (*table*) : Contour (au moins 3 points) ; sinon renvoie {}.
- `obs` (*table[]|nil*) : Obstacles (résultat de obstacles) ; sans obstacle, un seul morceau égal au contour.
- `owner` (*any*) : Propriétaire à exclure.
- `site` (*any|nil*) : Étiquette de site ignorée.
- **renvoie** : table[] Liste de morceaux { ring, holes, cut, flush }.

#### `editor_toolUtilities_groundBounds.largest(areas)`

Renvoie le plus grand morceau (par aire absolue), pour un outil qui ne pose qu'UNE chose sur son contour.

- `areas` (*table[]|nil*) : Morceaux issus de clip.
- **renvoie** : table|nil Le plus grand morceau, ou nil.

#### `editor_toolUtilities_groundBounds.obstacles(ring, owner, site, roadMargin)`

Liste ce que owner ne doit pas paver près de ce contour : surfaces de route et jonctions (networkState.surfaces, avec au moins 0.10 m de marge) et revendications des autres outils. Renvoie aussi une seconde liste où les routes sont agrandies de 0.6 m, pour y placer des éléments en retrait.

- `ring` (*table*) : Contour du site (points {x, y}).
- `owner` (*any*) : Nom du propriétaire à exclure.
- `site` (*any|nil*) : Dossier (étiquette) du site en édition : là où une copie existe déjà, elle est le contour et non un obstacle.
- `roadMargin` (*number|nil*) : Marge de route supérieure au défaut.
- **renvoie** : table[] Anneaux obstacles.
- **renvoie** : table[] Mêmes obstacles, routes agrandies de 0.6 m.

#### `editor_toolUtilities_groundBounds.pieceAt(areas, x, y)`

Indique sur quel morceau tombe un point (dans l'anneau et hors de ses trous), ou nil s'il n'est sur aucun.

- `areas` (*table[]|nil*) : Morceaux issus de clip.
- `x` (*number*) : X monde.
- `y` (*number*) : Y monde.
- **renvoie** : integer|nil Indice du morceau dans areas, ou nil.

#### `editor_toolUtilities_groundBounds.publish(owner, rings)`

Annonce aux autres outils de terrain ce que celui-ci occupe, sans marge (groundClaims.publish avec marge 0), pour que deux surfaces contiguës se lisent comme une seule.

- `owner` (*any*) : Nom du propriétaire.
- `rings` (*table[]*) : Anneaux occupés.

#### `editor_toolUtilities_groundBounds.sig()`

Empreinte de tout ce qui, hors du contour, détermine sa forme (réseau routier et revendications), pour reconstruire quand une route ou un bâtiment bouge. Calculée à chaque frame sans construire d'anneau.

- **renvoie** : number networkState.sig() + groundClaims.sig() * 104729.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/toolUtilities/groundBounds.lua`.*
