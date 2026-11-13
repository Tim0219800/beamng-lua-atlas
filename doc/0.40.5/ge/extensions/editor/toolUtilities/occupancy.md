# `editor_toolUtilities_occupancy`

*Fichier : `lua/ge/extensions/editor/toolUtilities/occupancy.lua` · VM : Game Engine (GE) · 922 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_toolUtilities_occupancy` : `extensions.load("editor_toolUtilities_occupancy")`, puis la globale `editor_toolUtilities_occupancy`

Grille d'occupation 2D grossière (cellules de 1 m) partagée par l'écartement des piles de pont et celui de la végétation. Les routes (groupes à divPoints/binormales) et les jonctions sont fournies à rebuild ; le Rail Network poste ses voies et jonctions via setRail ; tout est estampillé ensemble, avec les obstacles statiques (rivières, bâtiments, clôtures, lacs), les terrains revendiqués par d'autres outils (groundClaims) et une couche propre aux plantes (setPlantKeepOut). Chaque cellule garde un propriétaire (chaîne), ou false si plusieurs se la partagent. Les requêtes (occupiedAt, transportAt, blocked, overhangAt…) répondent « y a-t-il quelque chose ici ».

## Remarques

- Propriétaires (premier caractère) : 'g' route/rail, 'p' chemin, 'j' jonction, 'b' bâtiment ; suffixe 'b' = tronçon de pont d'une liaison (une pile peut se tenir sous son propre tablier), suffixe 't' = souterrain (tunnel, jonction en tunnel, terrain réclamé pour la couverture) ; les rails sont 'gr', 'jr'. Les plantes se tiennent sur ce qui est enterré, tout le reste l'évite.
- Marges : rubans de route 0.5 m, rivières +1 m au-delà du demi-largeur, bâtiments +1 m, clôtures 0.5 m, lacs +1 m, terrains revendiqués 0.5 m ; accotement stabilisé compté en largeur constante.
- Les requêtes rafraîchissent la grille à la demande (freshen) : elle est restampillée si la révision du rail ou des revendications a changé. revision() change à chaque restampillage.
- Les rayons radius valent 0 si nil. Hors de la grille, toutes les requêtes répondent false.
- setRivers/setBuildings/setFences/setLakes remplacent chacun leur liste ; les listes survivent à rebuild() pour que le remaillage des piles continue de les éviter.
- Structures attendues : rivières { pts = {{x,y},...}, halfW = n } ; bâtiments et lacs = listes d'anneaux {x,y} remplis ; clôtures = polylignes {x,y}.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_toolUtilities_occupancy.blocked(cluster, x, y, halfX, halfY, pass)` | Vrai si une cellule de l'empreinte alignée sur les axes appartient à un propriétaire hors du cluster. pass(owner), si fourni, laisse passer d'autres propriétaires. | 629 |
| `editor_toolUtilities_occupancy.buildingAt(x, y, radius)` | Vrai si une cellule de BÂTIMENT (propriétaire 'b', empreinte estampillée + 1 m) se trouve dans le rayon. | 852 |
| `editor_toolUtilities_occupancy.clearClusterCache(cluster)` | Efface l'ensemble de propriétaires autorisés mis en cache dans un cluster (_pierAllow), à appeler quand le cluster change. | 870 |
| `editor_toolUtilities_occupancy.clearStatics()` | Efface tous les obstacles statiques (rivières, bâtiments, clôtures, lacs). | 894 |
| `editor_toolUtilities_occupancy.heightAt(owner, x, y)` | Hauteur de la route (à son point le plus proche de x, y) ou de la jonction estampillée sous ce propriétaire ; nil pour tout autre propriétaire. | 651 |
| `editor_toolUtilities_occupancy.occupiedAt(x, y, radius)` | Vrai si quelque chose est estampillé dans le rayon (tous propriétaires, couche des plantes comprise) hors souterrain : un arbre se tient sur la colline au-dessus d'un tunnel. Sert à l'écartement de la végétation. | 701 |
| `editor_toolUtilities_occupancy.occupiedAtExcluding(x, y, radius, ownerId)` | Comme occupiedAt mais IGNORE les cellules appartenant uniquement à ownerId (le ruban de l'appelant, tronçons de tablier et de tunnel compris). Ne tient pas compte de la couche des plantes. | 725 |
| `editor_toolUtilities_occupancy.overhangAt(x, y, radius)` | Vrai si le centre d'une cellule de route, de rail ou de jonction, ou une cellule CONSTRUITE de la couche des plantes, se trouve dans le rayon : ce qu'une couronne de cette largeur surplomberait ou traverserait en poussant. Un disque (et non la boîte de roadRailAt), exact sur les cellules partagées. Les blocs sans route ni construction sont sautés d'un coup, donc un point éloigné coûte quelques lectures quel que soit le rayon. Le milieu rempli d'une jonction ne marque aucun bloc, mais rien d'extérieur ne l'atteint sans traverser la peau du bord, qui en marque. | 814 |
| `editor_toolUtilities_occupancy.ownerFor(g)` | Chaîne propriétaire d'un groupe (« g » suivi de son id), à passer à occupiedAtExcluding. | 745 |
| `editor_toolUtilities_occupancy.pointInPoly(px, py, poly)` | Test point dans polygone en 2D (lancer de rayon, règle pair-impair). | 248 |
| `editor_toolUtilities_occupancy.railCluster(trackIds, jctIds)` | Construit le cluster de ce sous lequel les piles d'un pont ferroviaire peuvent se tenir, pour blocked : les tronçons de pont de ces voies et ces jonctions. | 881 |
| `editor_toolUtilities_occupancy.railRev()` | Révision du rail (0 si non enregistré). Les routes restampillent la grille elles-mêmes une fois stabilisées ; les changements du rail sont repérés à partir de cette révision. | 90 |
| `editor_toolUtilities_occupancy.rebuild(groups, jcts, clearSegs)` | Restampille la grille depuis les routes et jonctions. Mémorise les entrées pour pouvoir estampiller plus tard un terrain revendiqué sans remaillage du réseau. | 472 |
| `editor_toolUtilities_occupancy.revision()` | Compteur qui change chaque fois que la grille change : un outil qui garde des choses hors de la grille compare cette valeur au lieu de redemander pour chaque point. | 719 |
| `editor_toolUtilities_occupancy.roadBetween(x, y, radius, zLo, zHi, skip)` | Vrai si une route ou jonction autre que celle de skip (son ownerFor, tronçons de tablier compris) est estampillée dans le rayon autour de (x, y) à une hauteur strictement comprise entre zLo et zHi. | 663 |
| `editor_toolUtilities_occupancy.roadRailAt(x, y, radius)` | Comme transportAt mais les CHEMINS sont ignorés : vrai seulement pour un ruban de route ou de rail 'g' ou une jonction 'j' (ou une cellule multi-propriétaire, gardée par prudence car ses propriétaires sont perdus). | 774 |
| `editor_toolUtilities_occupancy.setBuildings(list)` | Enregistre les bâtiments (polygones remplis) comme obstacles statiques. | 891 |
| `editor_toolUtilities_occupancy.setFences(list)` | Enregistre les clôtures, murs et haies (polylignes fines) comme obstacles statiques. | 892 |
| `editor_toolUtilities_occupancy.setLakes(list)` | Enregistre les lacs (polygones de rivage remplis) comme obstacles statiques. | 893 |
| `editor_toolUtilities_occupancy.setPlantKeepOut(get, rev)` | Source du terrain que les plantes évitent en plus du reste : get() renvoie `paved, built` où paved = { { ring = r, holes = { r, ... } }, ... } (un tronc ne peut pas s'y tenir) et built = { r, ... } (une couronne ne peut pas non plus l'atteindre). rev() change quand l'un ou l'autre change. Source unique ; voir occupiedAt et overhangAt. | 847 |
| `editor_toolUtilities_occupancy.setRail(get, rev)` | Côté Rail Network : get() renvoie ses voies (lues comme des groupes de route), ses plates-formes de jonction ({ id, pos, lines = { { pts, halfW } } }) et les clearSegs de ses voies ; rev() est incrémentée à chaque changement. | 876 |
| `editor_toolUtilities_occupancy.setRivers(list)` | Enregistre les rivières comme obstacles statiques (importeur). Remplace la liste précédente ; la liste survit à rebuild(). | 890 |
| `editor_toolUtilities_occupancy.transportAt(x, y, radius)` | Vrai si une cellule de TRANSPORT (route 'g', chemin 'p', jonction 'j', ou cellule multi-propriétaire) se trouve dans le rayon. | 750 |

### Détail des paramètres

#### `editor_toolUtilities_occupancy.blocked(cluster, x, y, halfX, halfY, pass)`

Vrai si une cellule de l'empreinte alignée sur les axes appartient à un propriétaire hors du cluster. pass(owner), si fourni, laisse passer d'autres propriétaires.

- `cluster` (*table*) : Cluster (avec _pierAllow mis en cache) ; voir railCluster.
- `x` (*number*) : x du centre.
- `y` (*number*) : y du centre.
- `halfX` (*number*) : Demi-étendue en x.
- `halfY` (*number*) : Demi-étendue en y.
- `pass` (*function|nil*) : pass(owner) renvoie true pour tolérer ce propriétaire.
- **renvoie** : boolean true si l'empreinte est bloquée.

#### `editor_toolUtilities_occupancy.buildingAt(x, y, radius)`

Vrai si une cellule de BÂTIMENT (propriétaire 'b', empreinte estampillée + 1 m) se trouve dans le rayon.

- `x` (*number*) : x.
- `y` (*number*) : y.
- `radius` (*number|nil*) : Rayon (0 si nil).
- **renvoie** : boolean true si un bâtiment est présent.

#### `editor_toolUtilities_occupancy.clearClusterCache(cluster)`

Efface l'ensemble de propriétaires autorisés mis en cache dans un cluster (_pierAllow), à appeler quand le cluster change.

- `cluster` (*table|nil*) : Cluster concerné.

#### `editor_toolUtilities_occupancy.heightAt(owner, x, y)`

Hauteur de la route (à son point le plus proche de x, y) ou de la jonction estampillée sous ce propriétaire ; nil pour tout autre propriétaire.

- `owner` (*string*) : Chaîne propriétaire.
- `x` (*number*) : x.
- `y` (*number*) : y.
- **renvoie** : number|nil Hauteur z.

#### `editor_toolUtilities_occupancy.occupiedAt(x, y, radius)`

Vrai si quelque chose est estampillé dans le rayon (tous propriétaires, couche des plantes comprise) hors souterrain : un arbre se tient sur la colline au-dessus d'un tunnel. Sert à l'écartement de la végétation.

- `x` (*number*) : x.
- `y` (*number*) : y.
- `radius` (*number|nil*) : Rayon (0 si nil).
- **renvoie** : boolean true si occupé.

#### `editor_toolUtilities_occupancy.occupiedAtExcluding(x, y, radius, ownerId)`

Comme occupiedAt mais IGNORE les cellules appartenant uniquement à ownerId (le ruban de l'appelant, tronçons de tablier et de tunnel compris). Ne tient pas compte de la couche des plantes.

- `x` (*number*) : x.
- `y` (*number*) : y.
- `radius` (*number|nil*) : Rayon (0 si nil).
- `ownerId` (*string|nil*) : Propriétaire à ignorer, voir ownerFor.
- **renvoie** : boolean true si autre chose occupe la zone.

#### `editor_toolUtilities_occupancy.overhangAt(x, y, radius)`

Vrai si le centre d'une cellule de route, de rail ou de jonction, ou une cellule CONSTRUITE de la couche des plantes, se trouve dans le rayon : ce qu'une couronne de cette largeur surplomberait ou traverserait en poussant. Un disque (et non la boîte de roadRailAt), exact sur les cellules partagées. Les blocs sans route ni construction sont sautés d'un coup, donc un point éloigné coûte quelques lectures quel que soit le rayon. Le milieu rempli d'une jonction ne marque aucun bloc, mais rien d'extérieur ne l'atteint sans traverser la peau du bord, qui en marque.

- `x` (*number*) : x.
- `y` (*number*) : y.
- `radius` (*number*) : Rayon de la couronne en mètres.
- **renvoie** : boolean true si une couronne de ce rayon surplomberait quelque chose.

#### `editor_toolUtilities_occupancy.ownerFor(g)`

Chaîne propriétaire d'un groupe (« g » suivi de son id), à passer à occupiedAtExcluding.

- `g` (*table*) : Groupe (route) avec un champ id.
- **renvoie** : string Propriétaire.

#### `editor_toolUtilities_occupancy.pointInPoly(px, py, poly)`

Test point dans polygone en 2D (lancer de rayon, règle pair-impair).

- `px` (*number*) : x du point.
- `py` (*number*) : y du point.
- `poly` (*table*) : Liste de sommets {x,y}.
- **renvoie** : boolean true si le point est à l'intérieur.

#### `editor_toolUtilities_occupancy.railCluster(trackIds, jctIds)`

Construit le cluster de ce sous lequel les piles d'un pont ferroviaire peuvent se tenir, pour blocked : les tronçons de pont de ces voies et ces jonctions.

- `trackIds` (*table*) : Identifiants de voies.
- `jctIds` (*table*) : Identifiants de jonctions.
- **renvoie** : table Cluster { _pierAllow = ensemble de propriétaires }.

#### `editor_toolUtilities_occupancy.railRev()`

Révision du rail (0 si non enregistré). Les routes restampillent la grille elles-mêmes une fois stabilisées ; les changements du rail sont repérés à partir de cette révision.

- **renvoie** : integer Révision du rail.

#### `editor_toolUtilities_occupancy.rebuild(groups, jcts, clearSegs)`

Restampille la grille depuis les routes et jonctions. Mémorise les entrées pour pouvoir estampiller plus tard un terrain revendiqué sans remaillage du réseau.

- `groups` (*table*) : Liste de groupes (routes) avec id, divPoints, binormales, divWidths, leftExtM, rightExtM, isEnabled.
- `jcts` (*table*) : Liste de jonctions.
- `clearSegs` (*function|nil*) : clearSegs(g, kind) renvoie le masque par segment d'une liaison (false sur ses portées de ce type, 'bridge' ou 'tunnel'), ou nil si elle n'en a pas. Fournie par le réseau qui possède les portées.

#### `editor_toolUtilities_occupancy.revision()`

Compteur qui change chaque fois que la grille change : un outil qui garde des choses hors de la grille compare cette valeur au lieu de redemander pour chaque point.

- **renvoie** : integer Révision de la grille.

#### `editor_toolUtilities_occupancy.roadBetween(x, y, radius, zLo, zHi, skip)`

Vrai si une route ou jonction autre que celle de skip (son ownerFor, tronçons de tablier compris) est estampillée dans le rayon autour de (x, y) à une hauteur strictement comprise entre zLo et zHi.

- `x` (*number*) : x.
- `y` (*number*) : y.
- `radius` (*number*) : Rayon de recherche en mètres.
- `zLo` (*number*) : Hauteur minimale.
- `zHi` (*number*) : Hauteur maximale.
- `skip` (*string|nil*) : Propriétaire à ignorer (ainsi que ses suffixes b et t).
- **renvoie** : boolean true si une route se trouve entre ces hauteurs.

#### `editor_toolUtilities_occupancy.roadRailAt(x, y, radius)`

Comme transportAt mais les CHEMINS sont ignorés : vrai seulement pour un ruban de route ou de rail 'g' ou une jonction 'j' (ou une cellule multi-propriétaire, gardée par prudence car ses propriétaires sont perdus).

- `x` (*number*) : x.
- `y` (*number*) : y.
- `radius` (*number|nil*) : Rayon (0 si nil).
- **renvoie** : boolean true si une route, un rail ou une jonction est présent.

#### `editor_toolUtilities_occupancy.setBuildings(list)`

Enregistre les bâtiments (polygones remplis) comme obstacles statiques.

- `list` (*table|nil*) : Liste d'anneaux {x,y}.

#### `editor_toolUtilities_occupancy.setFences(list)`

Enregistre les clôtures, murs et haies (polylignes fines) comme obstacles statiques.

- `list` (*table|nil*) : Liste de polylignes {x,y}.

#### `editor_toolUtilities_occupancy.setLakes(list)`

Enregistre les lacs (polygones de rivage remplis) comme obstacles statiques.

- `list` (*table|nil*) : Liste d'anneaux {x,y}.

#### `editor_toolUtilities_occupancy.setPlantKeepOut(get, rev)`

Source du terrain que les plantes évitent en plus du reste : get() renvoie `paved, built` où paved = { { ring = r, holes = { r, ... } }, ... } (un tronc ne peut pas s'y tenir) et built = { r, ... } (une couronne ne peut pas non plus l'atteindre). rev() change quand l'un ou l'autre change. Source unique ; voir occupiedAt et overhangAt.

- `get` (*function*) : Renvoie paved, built.
- `rev` (*function*) : Renvoie la révision de la source.

#### `editor_toolUtilities_occupancy.setRail(get, rev)`

Côté Rail Network : get() renvoie ses voies (lues comme des groupes de route), ses plates-formes de jonction ({ id, pos, lines = { { pts, halfW } } }) et les clearSegs de ses voies ; rev() est incrémentée à chaque changement.

- `get` (*function*) : Fournit voies, jonctions et clearSegs.
- `rev` (*function*) : Renvoie la révision du rail.

#### `editor_toolUtilities_occupancy.setRivers(list)`

Enregistre les rivières comme obstacles statiques (importeur). Remplace la liste précédente ; la liste survit à rebuild().

- `list` (*table|nil*) : Liste de { pts = {{x,y},...}, halfW = n }.

#### `editor_toolUtilities_occupancy.transportAt(x, y, radius)`

Vrai si une cellule de TRANSPORT (route 'g', chemin 'p', jonction 'j', ou cellule multi-propriétaire) se trouve dans le rayon.

- `x` (*number*) : x.
- `y` (*number*) : y.
- `radius` (*number|nil*) : Rayon (0 si nil).
- **renvoie** : boolean true si du transport est présent.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/toolUtilities/occupancy.lua`.*
