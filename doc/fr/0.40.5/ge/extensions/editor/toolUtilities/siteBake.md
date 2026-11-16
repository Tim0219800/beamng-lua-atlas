# `editor_toolUtilities_siteBake`

*Fichier : `lua/ge/extensions/editor/toolUtilities/siteBake.lua` · VM : Game Engine (GE) · 289 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_toolUtilities_siteBake` : `extensions.load("editor_toolUtilities_siteBake")`, puis la globale `editor_toolUtilities_siteBake`

Transforme ce qu'un éditeur vient de construire dans le monde en ce que porte un manifeste de site. Un site est conçu à un endroit de la carte et placé ailleurs : toutes les cuissons soustraient donc leur origine (ox, oy, oz) à tout avant d'écrire (géométrie, transformations du kit, lampes, plantations, plan du sol). L'origine choisie importe peu au placeur (il se recale sur les bornes lues) mais doit être la MÊME pour toutes les listes d'un manifeste. Les coordonnées de plan sont arrondies au millimètre.

## Remarques

- Un « plan » de sol est composé de polygones ou de polylignes {x,y} ; une « feature » de terraform est soit un QUAD gradué (4 coins avec leurs hauteurs), soit des RINGS à hauteur commune ; mode par défaut 'carve'.
- Les anneaux de feature sortent plats (un seul z par feature) ; le lecteur doit les refaire en vec3.
- groupInstances regroupe par forme + couleur (glow) + indicateur street (pièce posée sur le trottoir) + stand (poteau sur la ligne de sol, hauteur étirée par le placeur). Chaque instance occupe 12 nombres dans xf : position (3), axe avant (3), axe haut (3), échelle (3).
- Les lampes sortent { x, y, z, r (rayon), b (luminosité), col, street } et, pour un projecteur, dir et cone.
- localPaint exige que extensions.editor_terrainEditor.getTerrainBlock() existe, et nomme les couches de peinture par nom (un indice n'est valable que pour un seul terrain).
- Les plantes voyagent en ancres (items déjà dispersés, ou points + espèces + graine déjà calculée) car la forêt appartient au niveau et non au site.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_toolUtilities_siteBake.bounds(parts, instances, ox, oy, oz)` | L'étendue de tout ce que la cuisson place (sommets des parts et positions des instances, relatifs à l'origine), pour que le placeur cadre un site, le choisisse sous le curseur et sache la place qu'il lui faut avant de charger un maillage. Renvoie deux coins nuls si rien. | 253 |
| `editor_toolUtilities_siteBake.groupInstances(instances, ox, oy, oz)` | Regroupe les placements du kit par forme. Un groupe par maillage distinct devient un seul dessin instancié à l'arrivée : une place avec deux cents bornes identiques coûte une forme et deux cents transformations. | 109 |
| `editor_toolUtilities_siteBake.harvestKit(list, out)` | Relit les repères de pièces du kit déjà posées dans la scène et les ajoute à out comme des enregistrements d'instance acceptés par groupInstances. Accepte indifféremment des entrées de kit (champ obj) ou les objets eux-mêmes ; les objets disparus ou sans shapeName sont ignorés ; la lueur nocturne (nightEmissive) est relue. | 153 |
| `editor_toolUtilities_siteBake.instanceCount(groups)` | Nombre de pièces que dresse une liste de groupes (taille de xf divisée par 12), pour un affichage avant écriture. | 183 |
| `editor_toolUtilities_siteBake.localFeatures(features, ox, oy, oz)` | Les formes auxquelles le site demande que le sol soit taillé, dans son repère. Chaque feature devient { quad = 4 coins {x,y,z locaux}, mode, band } ou { rings, z, mode, band }. Ignore tout ce à quoi sert la feature (palier, rampe, mur de soutènement). | 59 |
| `editor_toolUtilities_siteBake.localLamps(lights, ox, oy, oz)` | Les lampes qui accompagnent les pièces, dans le repère du site. La couleur vient de glow ou de col (blanc par défaut). Un projecteur (dx présent) sort avec dir et cone ; une ampoule non. | 190 |
| `editor_toolUtilities_siteBake.localPaint(coats, ox, oy)` | La peinture de terrain qu'un site pose, dans son repère. Chaque couche { m, ring } ou { m, xs, ys } (cellule par cellule) sort nommée par couche de matériau du terrain. | 87 |
| `editor_toolUtilities_siteBake.localPlants(anchors, ox, oy, oz)` | Plantation sous forme d'ancres : { items } pour des plantes déjà dispersées (x, y, sp, s, a), ou { points, species, speciesWeights, size, vary, seed, drape, street } pour une dispersion à refaire (la graine est déjà calculée, pour obtenir les mêmes plantes aux mêmes endroits). | 211 |
| `editor_toolUtilities_siteBake.localPts(pts, ox, oy)` | Une polyligne de la même façon (sans minimum de points). Sert aussi pour des normales unitaires avec une origine nulle. | 34 |
| `editor_toolUtilities_siteBake.localRing(ring, ox, oy)` | Un polygone de plan, local à l'origine de cuisson, arrondi au millimètre. Renvoie nil si moins de 3 points, pour qu'un appelant puisse collecter le retour directement dans une liste. | 26 |
| `editor_toolUtilities_siteBake.localRings(rings, ox, oy)` | Une liste d'anneaux locaux ; nil si aucun n'était un polygone (une clé absente du manifeste signifie « ce site n'en a pas »). | 42 |
| `editor_toolUtilities_siteBake.plantCount(anchors)` | Nombre de plantes qu'une cuisson porterait, sur toutes les ancres (items ou points). Uniquement pour un affichage. | 242 |

### Détail des paramètres

#### `editor_toolUtilities_siteBake.bounds(parts, instances, ox, oy, oz)`

L'étendue de tout ce que la cuisson place (sommets des parts et positions des instances, relatifs à l'origine), pour que le placeur cadre un site, le choisisse sous le curseur et sache la place qu'il lui faut avant de charger un maillage. Renvoie deux coins nuls si rien.

- `parts` (*table|nil*) : Parts de maillage avec verts.
- `instances` (*table|nil*) : Instances avec px, py, pz.
- `ox` (*number*) : x de l'origine.
- `oy` (*number*) : y de l'origine.
- `oz` (*number*) : z de l'origine.
- **renvoie** : table Coin minimal {x,y,z}.
- **renvoie** : table Coin maximal {x,y,z}.

#### `editor_toolUtilities_siteBake.groupInstances(instances, ox, oy, oz)`

Regroupe les placements du kit par forme. Un groupe par maillage distinct devient un seul dessin instancié à l'arrivée : une place avec deux cents bornes identiques coûte une forme et deux cents transformations.

- `instances` (*table|nil*) : Liste d'instances { shape, px, py, pz, ax, ay, az, ux, uy, uz, scl, glow, street, stand }.
- `ox` (*number*) : x de l'origine.
- `oy` (*number*) : y de l'origine.
- `oz` (*number*) : z de l'origine.
- **renvoie** : table Liste de groupes { shape, xf (12 nombres par instance), glow, street, stand }.

#### `editor_toolUtilities_siteBake.harvestKit(list, out)`

Relit les repères de pièces du kit déjà posées dans la scène et les ajoute à out comme des enregistrements d'instance acceptés par groupInstances. Accepte indifféremment des entrées de kit (champ obj) ou les objets eux-mêmes ; les objets disparus ou sans shapeName sont ignorés ; la lueur nocturne (nightEmissive) est relue.

- `list` (*table|nil*) : Liste d'entrées { obj } ou d'objets de scène.
- `out` (*table|nil*) : Liste à compléter (créée si nil).
- **renvoie** : table Enregistrements { shape, glow, px, py, pz, ax.., ux.., scl = {x,y,z} }.

#### `editor_toolUtilities_siteBake.instanceCount(groups)`

Nombre de pièces que dresse une liste de groupes (taille de xf divisée par 12), pour un affichage avant écriture.

- `groups` (*table|nil*) : Groupes renvoyés par groupInstances.
- **renvoie** : number Nombre de pièces.

#### `editor_toolUtilities_siteBake.localFeatures(features, ox, oy, oz)`

Les formes auxquelles le site demande que le sol soit taillé, dans son repère. Chaque feature devient { quad = 4 coins {x,y,z locaux}, mode, band } ou { rings, z, mode, band }. Ignore tout ce à quoi sert la feature (palier, rampe, mur de soutènement).

- `features` (*table|nil*) : Liste de features { quad } ou { rings, z }, avec mode ('carve' par défaut) et band.
- `ox` (*number*) : x de l'origine.
- `oy` (*number*) : y de l'origine.
- `oz` (*number*) : z de l'origine.
- **renvoie** : table|nil Liste de features locales, nil s'il n'y en a pas.

#### `editor_toolUtilities_siteBake.localLamps(lights, ox, oy, oz)`

Les lampes qui accompagnent les pièces, dans le repère du site. La couleur vient de glow ou de col (blanc par défaut). Un projecteur (dx présent) sort avec dir et cone ; une ampoule non.

- `lights` (*table|nil*) : Liste d'enregistrements de lumière { px, py, pz, radius, brightness, glow|col, street, dx, dy, dz, cone }.
- `ox` (*number*) : x de l'origine.
- `oy` (*number*) : y de l'origine.
- `oz` (*number*) : z de l'origine.
- **renvoie** : table|nil Liste de lampes locales, nil si vide.

#### `editor_toolUtilities_siteBake.localPaint(coats, ox, oy)`

La peinture de terrain qu'un site pose, dans son repère. Chaque couche { m, ring } ou { m, xs, ys } (cellule par cellule) sort nommée par couche de matériau du terrain.

- `coats` (*table|nil*) : Liste de couches : m = indice de matériau, ring ou xs/ys.
- `ox` (*number*) : x de l'origine.
- `oy` (*number*) : y de l'origine.
- **renvoie** : table|nil Liste { layer, ring } ou { layer, cells = {x1,y1,x2,y2,...} } ; nil si aucun bloc de terrain ou rien à peindre.

#### `editor_toolUtilities_siteBake.localPlants(anchors, ox, oy, oz)`

Plantation sous forme d'ancres : { items } pour des plantes déjà dispersées (x, y, sp, s, a), ou { points, species, speciesWeights, size, vary, seed, drape, street } pour une dispersion à refaire (la graine est déjà calculée, pour obtenir les mêmes plantes aux mêmes endroits).

- `anchors` (*table|nil*) : Ancres de l'éditeur.
- `ox` (*number*) : x de l'origine.
- `oy` (*number*) : y de l'origine.
- `oz` (*number*) : z de l'origine.
- **renvoie** : table|nil Liste d'ancres locales, nil si vide.

#### `editor_toolUtilities_siteBake.localPts(pts, ox, oy)`

Une polyligne de la même façon (sans minimum de points). Sert aussi pour des normales unitaires avec une origine nulle.

- `pts` (*table|nil*) : Liste de points {x,y}.
- `ox` (*number*) : x de l'origine.
- `oy` (*number*) : y de l'origine.
- **renvoie** : table Polyligne locale.

#### `editor_toolUtilities_siteBake.localRing(ring, ox, oy)`

Un polygone de plan, local à l'origine de cuisson, arrondi au millimètre. Renvoie nil si moins de 3 points, pour qu'un appelant puisse collecter le retour directement dans une liste.

- `ring` (*table|nil*) : Liste de points {x,y}.
- `ox` (*number*) : x de l'origine.
- `oy` (*number*) : y de l'origine.
- **renvoie** : table|nil Anneau local.

#### `editor_toolUtilities_siteBake.localRings(rings, ox, oy)`

Une liste d'anneaux locaux ; nil si aucun n'était un polygone (une clé absente du manifeste signifie « ce site n'en a pas »).

- `rings` (*table|nil*) : Liste d'anneaux.
- `ox` (*number*) : x de l'origine.
- `oy` (*number*) : y de l'origine.
- **renvoie** : table|nil Liste d'anneaux locaux.

#### `editor_toolUtilities_siteBake.plantCount(anchors)`

Nombre de plantes qu'une cuisson porterait, sur toutes les ancres (items ou points). Uniquement pour un affichage.

- `anchors` (*table|nil*) : Ancres de plantation.
- **renvoie** : integer Nombre de plantes.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/toolUtilities/siteBake.lua`.*
