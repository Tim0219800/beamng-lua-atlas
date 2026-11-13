# `editor_roadArchitect_overlays`

*Fichier : `lua/ge/extensions/editor/roadArchitect/overlays.lua` · VM : Game Engine (GE) · 524 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_roadArchitect_overlays` : `extensions.load("editor_roadArchitect_overlays")`, puis la globale `editor_roadArchitect_overlays`

Génération des routes de superposition (overlays) des jonctions de Road Architect : lignes de trajectoire fictives qui traversent la jonction, d'une voie d'entrée à une voie de sortie. Chaque fonction ajoute au tableau des routes une route marquée isOverlay, isJctRoad et non drivable (isDrivable = false), avec un profil créé par profileMgr.createOverlayProfile, et ajoute son nom à jct.roads. Les voies et sorties sont tirées au hasard avec math.randomseed(jct.seed[0]), donc le résultat est reproductible pour une même graine. Le nombre de superpositions est jct.numCrossings[0]. Appelé par le gestionnaire de jonctions de Road Architect lors de la finalisation d'une jonction.

## Remarques

- Le paramètre jct est la table de jonction de Road Architect ; les champs utilisés sont des pointeurs ImGui (accès avec [0]) : seed, numCrossings, laneWidthX, numLanesX (autoroutes), numRBLanes (rond-point), isYOneWay, isY1Outwards, isY2Outwards (jonction Y), plus jct.roads (noms des routes de la jonction, indices fixes selon le type).
- Les points sont lus dans renderData[i][voie][7] des routes de la jonction (centre de la voie), donc les données de rendu des routes doivent déjà être calculées.
- Carrefour, T, Y et rond-point choisissent au hasard une sortie de départ et d'arrivée dans une boucle while ; elle ne s'arrête que si la route de départ a au moins une voie droite et la route d'arrivée au moins une voie gauche. Si aucune combinaison ne satisfait cette condition, la boucle peut tourner indéfiniment.
- Chaque fonction se termine par roadMgr.recomputeMap() pour reconstruire la table nom -> indice des routes.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_roadArchitect_overlays.addCrossroadsOverlays(jct)` | Ajoute jct.numCrossings[0] routes de superposition à un carrefour à 4 branches (routes jct.roads[5..8]) : une trajectoire entre une voie de sortie d'une branche et une voie d'entrée d'une autre, lissée par des points Catmull-Rom chordaux. | 17 |
| `editor_roadArchitect_overlays.addHighwayMergeOverlays(jct)` | Ajoute des routes de superposition à une jonction de fusion d'autoroute (routes jct.roads[1..3]) : une trajectoire par traversée qui part d'une voie de la route 1, passe sur la route 2 (avec un éventuel changement de voie aléatoire d'une voie) puis sur la route 3. | 367 |
| `editor_roadArchitect_overlays.addHighwaySlipOverlays(jct)` | Ajoute des routes de superposition à une jonction d'autoroute avec bretelles (routes principales jct.roads[1..4] et bretelles d'entrée/sortie jct.roads[5] et [6]). | 457 |
| `editor_roadArchitect_overlays.addHighwayTransOverlays(jct)` | Ajoute des routes de superposition à une jonction de transition autoroute-urbain (routes jct.roads[1..3]), sur le même principe que la fusion d'autoroute. | 412 |
| `editor_roadArchitect_overlays.addRoundaboutOverlays(jct, cen)` | Ajoute des routes de superposition à un rond-point (branches jct.roads[5..8], anneau jct.roads[9]) : chaque trajectoire passe par un arc de l'anneau, construit en faisant tourner le vecteur rayon autour de l'axe vertical par pas de 45 degrés (17 points) pour chacune des jct.numRBLanes[0] voies de l'anneau. | 265 |
| `editor_roadArchitect_overlays.addTJunctionOverlays(jct)` | Ajoute jct.numCrossings[0] routes de superposition à une jonction en T (routes jct.roads[4..6]), avec la même méthode de tirage de voies et de lissage que pour un carrefour. | 121 |
| `editor_roadArchitect_overlays.addYJunctionOverlays(jct)` | Ajoute des routes de superposition à une jonction en Y. Gère les branches à sens unique (jct.isYOneWay[0]) et leur orientation (isY1Outwards, isY2Outwards) pour inverser le sens des points si besoin. | 205 |

### Détail des paramètres

#### `editor_roadArchitect_overlays.addCrossroadsOverlays(jct)`

Ajoute jct.numCrossings[0] routes de superposition à un carrefour à 4 branches (routes jct.roads[5..8]) : une trajectoire entre une voie de sortie d'une branche et une voie d'entrée d'une autre, lissée par des points Catmull-Rom chordaux.

- `jct` (*table*) : Table de la jonction (roads, seed, numCrossings, laneWidthX…).

#### `editor_roadArchitect_overlays.addHighwayMergeOverlays(jct)`

Ajoute des routes de superposition à une jonction de fusion d'autoroute (routes jct.roads[1..3]) : une trajectoire par traversée qui part d'une voie de la route 1, passe sur la route 2 (avec un éventuel changement de voie aléatoire d'une voie) puis sur la route 3.

- `jct` (*table*) : Table de la jonction (numLanesX, laneWidthX, numCrossings, seed, roads).

#### `editor_roadArchitect_overlays.addHighwaySlipOverlays(jct)`

Ajoute des routes de superposition à une jonction d'autoroute avec bretelles (routes principales jct.roads[1..4] et bretelles d'entrée/sortie jct.roads[5] et [6]).

- `jct` (*table*) : Table de la jonction à bretelles.

#### `editor_roadArchitect_overlays.addHighwayTransOverlays(jct)`

Ajoute des routes de superposition à une jonction de transition autoroute-urbain (routes jct.roads[1..3]), sur le même principe que la fusion d'autoroute.

- `jct` (*table*) : Table de la jonction de transition.

#### `editor_roadArchitect_overlays.addRoundaboutOverlays(jct, cen)`

Ajoute des routes de superposition à un rond-point (branches jct.roads[5..8], anneau jct.roads[9]) : chaque trajectoire passe par un arc de l'anneau, construit en faisant tourner le vecteur rayon autour de l'axe vertical par pas de 45 degrés (17 points) pour chacune des jct.numRBLanes[0] voies de l'anneau.

- `jct` (*table*) : Table de la jonction de rond-point.
- `cen` (*vec3*) : Centre du rond-point.

#### `editor_roadArchitect_overlays.addTJunctionOverlays(jct)`

Ajoute jct.numCrossings[0] routes de superposition à une jonction en T (routes jct.roads[4..6]), avec la même méthode de tirage de voies et de lissage que pour un carrefour.

- `jct` (*table*) : Table de la jonction en T.

#### `editor_roadArchitect_overlays.addYJunctionOverlays(jct)`

Ajoute des routes de superposition à une jonction en Y. Gère les branches à sens unique (jct.isYOneWay[0]) et leur orientation (isY1Outwards, isY2Outwards) pour inverser le sens des points si besoin.

- `jct` (*table*) : Table de la jonction en Y.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/roadArchitect/overlays.lua`.*
