# `editor_toolUtilities_networkState`

*Fichier : `lua/ge/extensions/editor/toolUtilities/networkState.lua` · VM : Game Engine (GE) · 166 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_toolUtilities_networkState` : `extensions.load("editor_toolUtilities_networkState")`, puis la globale `editor_toolUtilities_networkState`

Tableau d'échange entre le réseau routier de l'éditeur et les outils qui construisent contre lui (parcelles, trottoirs, parkings). Le réseau publie ses données une fois avec provide(t) au chargement de l'outil de route ; les autres outils lisent (roads, surfaces, overRoad...). Dans l'autre sens, un outil qui a pavé des bas-côtés les publie (publishFootway) et peut demander des passages piétons (crossingSites, applyCrossings). Aucun côté ne connaît l'autre.

## Remarques

- Tant que le réseau n'a pas appelé provide, chaque lecteur reçoit une réponse vide honnête : tables vides, 0, false ; busy() renvoie true.
- busy() : vrai si le réseau n'est pas chargé, a des routes ou jonctions en attente de reconstruction (longtemps après un chargement ou un rechargement Lua) ou si un noeud est en cours de déplacement ; il faut attendre qu'il soit faux avant de poser du terrain contre les routes.
- Champs attendus par provide : roads, groundSegs, surfaces, invalidate, sig, rev, features, heldPastEdge, footwayChanged (plus busy, overRoad, crossingSites, applyCrossings utilisés par les passerelles).
- overRoad appelle net.overRoad sans test d'existence : avec un réseau fourni sans cette fonction, l'appel échouerait (le code ne le protège que pour 'net' nul).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_toolUtilities_networkState.applyCrossings(owner, list)` | Pose les passages voulus par ce propriétaire (liste de sites réduite à ceux retenus) à la place de sa demande précédente. Liste vide : retire ses passages. Les passages posés à la main ou demandés par un autre sont laissés. | 114 |
| `editor_toolUtilities_networkState.busy()` | Vrai si les réponses du réseau sont encore en cours de stabilisation (voir notes). | 76 |
| `editor_toolUtilities_networkState.crossingSites(density, depthM)` | Où le réseau poserait un passage piéton : un site sur chaque approche des jonctions qui comptent. Chaque site indique la route, la position le long d'elle et les deux points que sa bande atteindrait. Les sites ayant déjà un passage sont omis. | 106 |
| `editor_toolUtilities_networkState.features()` | Ce que le réseau a demandé au terrain : le sol qu'il a nivelé et les structures qu'il y a posées. | 88 |
| `editor_toolUtilities_networkState.footwayFor(groupId)` | Tout ce qui est pavé sur les bas-côtés d'une route, fusionné entre propriétaires. Renvoie nil si personne n'y a pavé (le réseau comprend : peindre le fondu sur toute la longueur). | 129 |
| `editor_toolUtilities_networkState.groundSegs(road)` | Indique, par segment de divPoint, quels segments d'une route reposent sur le sol (et non sur un tablier ou dans un tunnel) ; les culées de pont comptent comme sol. Renvoie nil si tous les segments sont au sol. | 42 |
| `editor_toolUtilities_networkState.heldPastEdge(paved)` | Distance au-delà du bord de la surface d'une route sur laquelle sa pente tient encore le terrain à la hauteur de la route, prioritaire sur ce qu'un site pose là. | 96 |
| `editor_toolUtilities_networkState.invalidate()` | Les surfaces sont mises en cache : cet appel dit au réseau qu'un outil vient de déplacer quelque chose. | 63 |
| `editor_toolUtilities_networkState.overRoad(ring)` | Indique si un anneau tombe sur une surface du réseau. Demandé au réseau plutôt que calculé depuis surfaces, car une jonction est en partie bornée par des lignes. | 57 |
| `editor_toolUtilities_networkState.provide(t)` | Côté réseau : enregistre la table de fonctions du réseau routier. Appelée une fois au chargement de l'outil de route ; tout le reste du module y renvoie. *(interne)* | 29 |
| `editor_toolUtilities_networkState.publishFootway(owner, byGroup)` | Côté outil de pavage : publie les bas-côtés que ce propriétaire a pavés, { [groupId] = { left = spans, right = spans } }, en remplaçant sa publication précédente. Le réseau est prévenu aussitôt (footwayChanged) car le fondu sous les dalles est du terrain peint à repeindre. | 121 |
| `editor_toolUtilities_networkState.rev()` | Compteur incrémenté à chaque reconstruction d'une route ou jonction (hauteurs comprises), pour les outils qui posent quelque chose sur la surface d'une route. | 82 |
| `editor_toolUtilities_networkState.roads()` | Toutes les routes posées, en géométrie plan : id, divPoints, tangents, binormals. Les noeuds de jonction et le reste sont exclus. | 35 |
| `editor_toolUtilities_networkState.sig()` | Compteur incrémenté quand les surfaces du réseau changent, pour qu'un outil remarque qu'une route a bougé sous son terrain. | 68 |
| `editor_toolUtilities_networkState.surfaces()` | Tout ce que le réseau a revêtu, en plan : les anneaux fermés de chaussée et de jonction scellée, puis les lignes de bord qui ne délimitent aucune aire propre. | 49 |

### Détail des paramètres

#### `editor_toolUtilities_networkState.applyCrossings(owner, list)`

Pose les passages voulus par ce propriétaire (liste de sites réduite à ceux retenus) à la place de sa demande précédente. Liste vide : retire ses passages. Les passages posés à la main ou demandés par un autre sont laissés.

- `owner` (*any*) : Nom du propriétaire (nil = rien).
- `list` (*table[]*) : Sites retenus.
- **renvoie** : integer Nombre posés.
- **renvoie** : integer Nombre retirés (0, 0 sans réseau ou sans owner).

#### `editor_toolUtilities_networkState.busy()`

Vrai si les réponses du réseau sont encore en cours de stabilisation (voir notes).

- **renvoie** : boolean true si le réseau n'est pas prêt.

#### `editor_toolUtilities_networkState.crossingSites(density, depthM)`

Où le réseau poserait un passage piéton : un site sur chaque approche des jonctions qui comptent. Chaque site indique la route, la position le long d'elle et les deux points que sa bande atteindrait. Les sites ayant déjà un passage sont omis.

- `density` (*number*) : Proportion de sites gardés.
- `depthM` (*number*) : Profondeur de la bande (m).
- **renvoie** : table[] Sites de passage.

#### `editor_toolUtilities_networkState.features()`

Ce que le réseau a demandé au terrain : le sol qu'il a nivelé et les structures qu'il y a posées.

- **renvoie** : table Éléments de sol nivelé.
- **renvoie** : table Éléments de structures.

#### `editor_toolUtilities_networkState.footwayFor(groupId)`

Tout ce qui est pavé sur les bas-côtés d'une route, fusionné entre propriétaires. Renvoie nil si personne n'y a pavé (le réseau comprend : peindre le fondu sur toute la longueur).

- `groupId` (*any*) : Id de groupe de la route.
- **renvoie** : table|nil { left, right } listes de spans, ou nil.

#### `editor_toolUtilities_networkState.groundSegs(road)`

Indique, par segment de divPoint, quels segments d'une route reposent sur le sol (et non sur un tablier ou dans un tunnel) ; les culées de pont comptent comme sol. Renvoie nil si tous les segments sont au sol.

- `road` (*table*) : Route (élément de roads()).
- **renvoie** : table|nil Marqueurs par segment, ou nil.

#### `editor_toolUtilities_networkState.heldPastEdge(paved)`

Distance au-delà du bord de la surface d'une route sur laquelle sa pente tient encore le terrain à la hauteur de la route, prioritaire sur ce qu'un site pose là.

- `paved` (*boolean|nil*) : Pour un bas-côté qu'un autre a déclaré trottoir : la route n'y garde pas d'accotement nu.
- **renvoie** : number Distance en mètres (0 sans réseau).

#### `editor_toolUtilities_networkState.overRoad(ring)`

Indique si un anneau tombe sur une surface du réseau. Demandé au réseau plutôt que calculé depuis surfaces, car une jonction est en partie bornée par des lignes.

- `ring` (*table*) : Anneau de points.
- **renvoie** : boolean true si l'anneau recouvre le réseau (false si le réseau n'est pas fourni).

#### `editor_toolUtilities_networkState.provide(t)`

Côté réseau : enregistre la table de fonctions du réseau routier. Appelée une fois au chargement de l'outil de route ; tout le reste du module y renvoie.

- `t` (*table*) : Table avec roads, groundSegs, surfaces, invalidate, sig, rev, features, heldPastEdge, footwayChanged, etc.

#### `editor_toolUtilities_networkState.publishFootway(owner, byGroup)`

Côté outil de pavage : publie les bas-côtés que ce propriétaire a pavés, { [groupId] = { left = spans, right = spans } }, en remplaçant sa publication précédente. Le réseau est prévenu aussitôt (footwayChanged) car le fondu sous les dalles est du terrain peint à repeindre.

- `owner` (*any*) : Nom du propriétaire ; nil = sans effet.
- `byGroup` (*table*) : Spans gauche/droite par id de groupe de route.

#### `editor_toolUtilities_networkState.rev()`

Compteur incrémenté à chaque reconstruction d'une route ou jonction (hauteurs comprises), pour les outils qui posent quelque chose sur la surface d'une route.

- **renvoie** : number Révision (0 sans réseau).

#### `editor_toolUtilities_networkState.roads()`

Toutes les routes posées, en géométrie plan : id, divPoints, tangents, binormals. Les noeuds de jonction et le reste sont exclus.

- **renvoie** : table[] Routes (table vide partagée si le réseau n'est pas fourni).

#### `editor_toolUtilities_networkState.sig()`

Compteur incrémenté quand les surfaces du réseau changent, pour qu'un outil remarque qu'une route a bougé sous son terrain.

- **renvoie** : number Signature (0 sans réseau).

#### `editor_toolUtilities_networkState.surfaces()`

Tout ce que le réseau a revêtu, en plan : les anneaux fermés de chaussée et de jonction scellée, puis les lignes de bord qui ne délimitent aucune aire propre.

- **renvoie** : table[] Anneaux fermés.
- **renvoie** : table[] Lignes de bord.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/toolUtilities/networkState.lua`.*
