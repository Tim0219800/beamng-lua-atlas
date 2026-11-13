# `editor_toolUtilities_sitePad`

*Fichier : `lua/ge/extensions/editor/toolUtilities/sitePad.lua` · VM : Game Engine (GE) · 258 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_toolUtilities_sitePad` : `extensions.load("editor_toolUtilities_sitePad")`, puis la globale `editor_toolUtilities_sitePad`

Une plate-forme de terrain plane (« pad ») sur laquelle un outil de site peut dessiner, et le sol propre du site taillé dedans. enter aplatit un carré de 300 m à 50 m d'altitude (niveau de référence du site) en mémorisant le sol réel ; leave le remet tel qu'il était ; carve y taille le plan de sol du site (terrasse, rampe, marches, sous-sol) pour qu'on le voie en dessinant ; suspend/resume l'enlèvent le temps d'une sauvegarde de niveau. Un seul pad à la fois (un seul outil tient l'écran).

## Remarques

- PAD_SIZE_M = 300 (carré pris à plat, coupé à une taille que rien de ce que les outils dessinent ne dépasse), PAD_Z = 50 (niveau de référence ; haut pour qu'un sous-sol, une cour anglaise ou des marches aient du sol à entailler).
- Le pad est une planche à dessin : il n'appelle volontairement PAS setTerrainDirty, pour que ouvrir un outil ne demande pas de sauvegarde du niveau. suspend() doit l'enlever pendant une sauvegarde, sinon un plateau de 300 m serait écrit comme vrai sol.
- Le pad est clippé au bloc de terrain (un site au bord de la carte obtient la part de pad qui existe). Sans terrain ni extension editor_terrainEditor, enter renvoie false.
- Les hauteurs de la grille de terrain sont mesurées depuis la base du bloc, pas depuis le z monde (écart de centaines de mètres) : toGridZ convertit ; cellZ renvoie des hauteurs en repère de grille, groundZ en repère monde.
- Paramètres de taille de la découpe (identiques à ceux avec lesquels le constructeur de ville nivelle un site posé) : profondeur d'influence 12, marge 3, décroissance 2, lissage 6.
- En mode real (sol réel), carve ajoute aussi les ouvrages qui l'emportent localement (heldFn), pour que la coupe cède devant l'accotement d'une route comme le fera le nivellement du niveau.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_toolUtilities_sitePad.carve(features, prio)` | Taille le plan de sol du site dans le pad, pour qu'une place en contrebas, une terrasse ou un escalier soient VISIBLES pendant le dessin. features est la même liste que celle cuite pour le placeur. La dernière coupe est d'abord annulée (une coupe se fond dans le sol autour, et se fondre dans un sol déjà abaissé grignoterait le pad à chaque fois) ; sans features, c'est tout ce que fait l'appel. | 150 |
| `editor_toolUtilities_sitePad.cellZ(gx, gy)` | Hauteur d'origine d'une cellule de la grille de hauteurs du pad (avant la pose), dans les unités de la grille (depuis la base du bloc) ; nil hors du pad. | 206 |
| `editor_toolUtilities_sitePad.centreFor(ring)` | Où un outil doit centrer son pad d'après les bornes de ce qu'il tient déjà (centre de la boîte englobante des points). Sans points, la visée de la caméra (util.lookAtGround), là où les outils posent une forme de départ. | 126 |
| `editor_toolUtilities_sitePad.drop()` | De combien le sol du pad est sous le niveau de référence ; nil sans pad. | 229 |
| `editor_toolUtilities_sitePad.enter(cx, cy, drop, real)` | Aplatit le carré centré sur (cx, cy) en mémorisant ce qui s'y trouvait, pour que leave le remette. Un pad déjà posé est d'abord remis (deux pads qui se chevauchent perdraient le sol réel). Appelle d'abord beforeEnterFn s'il n'y avait pas de pad. | 89 |
| `editor_toolUtilities_sitePad.groundZ(x, y)` | Le sol en (x, y) tel qu'il était avant la pose du pad ou toute coupe ; nil hors du pad. Ce dont un niveau se mesure : mesuré sur la coupe, chaque coupe déplacerait le niveau de la suivante. | 219 |
| `editor_toolUtilities_sitePad.isDown()` | Vrai si un pad est posé. | 203 |
| `editor_toolUtilities_sitePad.leave()` | Remet le sol comme il était. Seulement les hauteurs : ce que l'outil a construit sur le pad part par son propre démontage. Tout ce qui a été taillé DANS le pad part avec lui. | 61 |
| `editor_toolUtilities_sitePad.level()` | Le niveau monde (50 m) contre lequel un site posé sur le pad est TRACÉ. À utiliser pour tout ce qui se tient sur la planche à dessin à la place d'un échantillonnage du sol, qui n'est plus plat une fois que le site y a taillé ses formes. | 239 |
| `editor_toolUtilities_sitePad.redrop(d)` | Recoupe le pad à un autre abaissement, là où il se trouve. Sa coupe tombe avec lui : elle avait été taillée dans l'ancien sol. Renvoie false sans pad ou si l'abaissement est inchangé. | 232 |
| `editor_toolUtilities_sitePad.resume()` | Remet le pad en place après suspend, avec la même taille de coupe. | 195 |
| `editor_toolUtilities_sitePad.setBeforeEnter(fn)` | Enregistre qui rend une dernière fois le sol réel avant qu'un pad ne le mémorise : fn() s'exécute à l'entrée d'un éditeur (seulement s'il n'y avait pas déjà de pad). | 215 |
| `editor_toolUtilities_sitePad.setHeld(fn)` | Enregistre qui répond à ce qui l'emporte sur un site en sol réel : fn(x0, y0, x1, y1) renvoie ces features, chacune avec sa bande. | 212 |
| `editor_toolUtilities_sitePad.suspend()` | Enlève le pad du sol le temps d'une sauvegarde de niveau, en retenant sa position et ce qui y était taillé. Une sauvegarde écrit le terrain tel qu'elle le trouve : une planche à dessin restée là serait écrite comme vrai sol. | 186 |

### Détail des paramètres

#### `editor_toolUtilities_sitePad.carve(features, prio)`

Taille le plan de sol du site dans le pad, pour qu'une place en contrebas, une terrasse ou un escalier soient VISIBLES pendant le dessin. features est la même liste que celle cuite pour le placeur. La dernière coupe est d'abord annulée (une coupe se fond dans le sol autour, et se fondre dans un sol déjà abaissé grignoterait le pad à chaque fois) ; sans features, c'est tout ce que fait l'appel.

- `features` (*table|nil*) : Liste de features { quad } ou { rings, z } avec mode et band.
- `prio` (*number|nil*) : Sur sol réel, bande de priorité du site ; ce qui l'emporte à proximité entre dans la même passe à sa propre priorité.
- **renvoie** : boolean false s'il n'y a pas de pad.

#### `editor_toolUtilities_sitePad.cellZ(gx, gy)`

Hauteur d'origine d'une cellule de la grille de hauteurs du pad (avant la pose), dans les unités de la grille (depuis la base du bloc) ; nil hors du pad.

- `gx` (*integer*) : Colonne de la grille.
- `gy` (*integer*) : Ligne de la grille.
- **renvoie** : number|nil Hauteur en repère de grille.

#### `editor_toolUtilities_sitePad.centreFor(ring)`

Où un outil doit centrer son pad d'après les bornes de ce qu'il tient déjà (centre de la boîte englobante des points). Sans points, la visée de la caméra (util.lookAtGround), là où les outils posent une forme de départ.

- `ring` (*table|nil*) : Liste de points {x,y}.
- **renvoie** : number x du centre.
- **renvoie** : number y du centre.

#### `editor_toolUtilities_sitePad.drop()`

De combien le sol du pad est sous le niveau de référence ; nil sans pad.

- **renvoie** : number|nil Abaissement en mètres.

#### `editor_toolUtilities_sitePad.enter(cx, cy, drop, real)`

Aplatit le carré centré sur (cx, cy) en mémorisant ce qui s'y trouvait, pour que leave le remette. Un pad déjà posé est d'abord remis (deux pads qui se chevauchent perdraient le sol réel). Appelle d'abord beforeEnterFn s'il n'y avait pas de pad.

- `cx` (*number*) : x du centre.
- `cy` (*number*) : y du centre.
- `drop` (*number|nil*) : Abaisse le sol de cette distance SOUS le niveau de référence (un outil dont le site a du sol propre dessous, sous-sol ou cour anglaise, peut ainsi voir dedans). Le site reste à level() : le niveau de référence et la surface taillée se séparent.
- `real` (*boolean|nil*) : Laisse le sol tel quel et ne fait que le mémoriser : un site dessiné autour de sa parcelle est conçu sur le sol où il se tiendra. Un tel pad n'a pas de niveau de référence ; level n'est pas pour lui.
- **renvoie** : boolean true si le pad est posé.

#### `editor_toolUtilities_sitePad.groundZ(x, y)`

Le sol en (x, y) tel qu'il était avant la pose du pad ou toute coupe ; nil hors du pad. Ce dont un niveau se mesure : mesuré sur la coupe, chaque coupe déplacerait le niveau de la suivante.

- `x` (*number*) : x monde.
- `y` (*number*) : y monde.
- **renvoie** : number|nil Hauteur z monde.

#### `editor_toolUtilities_sitePad.isDown()`

Vrai si un pad est posé.

- **renvoie** : boolean true si pad posé.

#### `editor_toolUtilities_sitePad.leave()`

Remet le sol comme il était. Seulement les hauteurs : ce que l'outil a construit sur le pad part par son propre démontage. Tout ce qui a été taillé DANS le pad part avec lui.

- **renvoie** : boolean false s'il n'y avait pas de pad.

#### `editor_toolUtilities_sitePad.level()`

Le niveau monde (50 m) contre lequel un site posé sur le pad est TRACÉ. À utiliser pour tout ce qui se tient sur la planche à dessin à la place d'un échantillonnage du sol, qui n'est plus plat une fois que le site y a taillé ses formes.

- **renvoie** : number Niveau de référence (PAD_Z = 50).

#### `editor_toolUtilities_sitePad.redrop(d)`

Recoupe le pad à un autre abaissement, là où il se trouve. Sa coupe tombe avec lui : elle avait été taillée dans l'ancien sol. Renvoie false sans pad ou si l'abaissement est inchangé.

- `d` (*number*) : Nouvel abaissement en mètres.
- **renvoie** : boolean true si le pad a été refait.

#### `editor_toolUtilities_sitePad.resume()`

Remet le pad en place après suspend, avec la même taille de coupe.

- **renvoie** : boolean true si le pad et sa coupe sont rétablis.

#### `editor_toolUtilities_sitePad.setBeforeEnter(fn)`

Enregistre qui rend une dernière fois le sol réel avant qu'un pad ne le mémorise : fn() s'exécute à l'entrée d'un éditeur (seulement s'il n'y avait pas déjà de pad).

- `fn` (*function*) : fn() sans argument.

#### `editor_toolUtilities_sitePad.setHeld(fn)`

Enregistre qui répond à ce qui l'emporte sur un site en sol réel : fn(x0, y0, x1, y1) renvoie ces features, chacune avec sa bande.

- `fn` (*function*) : fn(x0, y0, x1, y1) -> liste de features.

#### `editor_toolUtilities_sitePad.suspend()`

Enlève le pad du sol le temps d'une sauvegarde de niveau, en retenant sa position et ce qui y était taillé. Une sauvegarde écrit le terrain tel qu'elle le trouve : une planche à dessin restée là serait écrite comme vrai sol.

- **renvoie** : boolean false s'il n'y avait pas de pad.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/toolUtilities/sitePad.lua`.*
