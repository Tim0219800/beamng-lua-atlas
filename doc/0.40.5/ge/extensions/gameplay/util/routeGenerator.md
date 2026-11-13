# `gameplay_util_routeGenerator`

*Fichier : `lua/ge/extensions/gameplay/util/routeGenerator.lua` · VM : Game Engine (GE) · 851 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_util_routeGenerator` : `extensions.load("gameplay_util_routeGenerator")`, puis la globale `gameplay_util_routeGenerator`

Génère procéduralement un parcours de course sur le graphe routier de la carte (map.getMap().nodes). Une marche aléatoire guidée (angle préféré selon la fluidité demandée, évitement des demi-tours et des culs-de-sac, ratios cible trail/dirt/tarmac selon la praticabilité) produit un chemin, qui est lissé, ré-échantillonné tous les 8 m, puis réduit à des checkpoints par Douglas-Peucker, décalés avant les virages serrés et validés par A* pour que le marqueur au sol suive bien la route générée. Un moddeur l'appelle avec une position de départ et une distance cible.

## Exemple

```lua
local chemin, checkpoints, rayons, normales, distance = gameplay_util_routeGenerator.generateRaceRoute(vec3(x, y, z), 5000, dirDepart, nil, 2)
local depart = gameplay_util_routeGenerator.pickRandomRoadPoint()
```

## Remarques

- Phases : 1 marche dans le graphe, 1.5 suppression des petites déviations sur routes qui se chevauchent (déviation < 15 m), 1.75 ré-échantillonnage à 8 m, 2 sélection RDP (tolérance 30 m, espacement mini 30 m), 2.5 décalage des checkpoints avant les virages > 45°, 3 validation A* des marqueurs au sol.
- Valeurs par défaut : minDrivability 0,35 ; fluidité 2 (bornée à 1..3 : 1 = virages marqués, 3 = quasi droit) ; anticipation (lookAheadDistance) 300 m ; distance entre checkpoints 130 m ; rayon de checkpoint borné entre 4 et 13 m.
- Les liens dont la drivability est inférieure à minDrivability sont ignorés ; les routes à sens unique ne sont parcourues que dans leur sens.
- Classification des bandes : drivability < bandBoundaries[1] = trail, <= bandBoundaries[2] = dirt, sinon tarmac. targetRatios est une table {trail, dirt, tarmac} de proportions.
- L'appel réinitialise le générateur aléatoire global (math.randomseed(seed or os.time())) : avec la même seed et la même carte, le résultat est reproductible, mais l'état aléatoire global du jeu est modifié.
- Renvoie nil si la carte n'a aucun nœud ou si aucun nœud de départ connecté n'est trouvé.
- Si `job` est fourni (job du jobsystem), la fonction appelle job.yield() entre les phases : elle doit alors tourner dans une coroutine du jobsystem.
- Le premier point (départ du joueur) n'est pas renvoyé comme checkpoint.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_util_routeGenerator.generateRaceRoute(startPos, targetDistanceMeters, startDir, minDrivability, routeSmoothness, lookAheadDistance, job, seed, targetRatios, bandBoundaries, checkpointDistance)` | Génère un parcours de la longueur demandée à partir d'une position, avec checkpoints, rayons et normales. | 608 |
| `gameplay_util_routeGenerator.pickRandomRoadPoint()` | Choisit une position aléatoire : un nœud routier au hasard, sinon un point au hasard dans la boîte du terrain, sinon l'origine. | 813 |

### Détail des paramètres

#### `gameplay_util_routeGenerator.generateRaceRoute(startPos, targetDistanceMeters, startDir, minDrivability, routeSmoothness, lookAheadDistance, job, seed, targetRatios, bandBoundaries, checkpointDistance)`

Génère un parcours de la longueur demandée à partir d'une position, avec checkpoints, rayons et normales.

- `startPos` (*vec3*) : Position de départ.
- `targetDistanceMeters` (*number*) : Longueur visée du parcours (m).
- `startDir` (*vec3|nil*) : Direction de départ, pour choisir le sens de la route ; sinon le nœud connecté le plus proche.
- `minDrivability` (*number|nil*) : Praticabilité minimale des liens (0,35 par défaut).
- `routeSmoothness` (*integer|nil*) : 1 à 3 (2 par défaut) ; plus c'est haut, plus le tracé est droit.
- `lookAheadDistance` (*number|nil*) : Distance d'anticipation en m (300 par défaut).
- `job` (*table|nil*) : Job du jobsystem pour yield entre les phases.
- `seed` (*integer|nil*) : Graine aléatoire (os.time() par défaut).
- `targetRatios` (*table<string, number>|nil*) : Proportions visées {trail, dirt, tarmac}.
- `bandBoundaries` (*number[]|nil*) : Deux seuils de drivability séparant trail/dirt/tarmac.
- `checkpointDistance` (*number|nil*) : Distance cible entre checkpoints en m (130 par défaut).
- **renvoie** : vec3[]|nil Positions du chemin parcouru (grossier), nil en cas d'échec.
- **renvoie** : vec3[] Positions des checkpoints.
- **renvoie** : number[] Rayons des checkpoints (m).
- **renvoie** : vec3[] Normales (direction de passage, horizontale) des checkpoints.
- **renvoie** : number Distance totale parcourue (m).

#### `gameplay_util_routeGenerator.pickRandomRoadPoint()`

Choisit une position aléatoire : un nœud routier au hasard, sinon un point au hasard dans la boîte du terrain, sinon l'origine.

- **renvoie** : vec3 Position choisie.

## Champs

| Champ | Type | Description |
|---|---|---|
| `defaultMinDrivability` | number | 0,35. Le routage du marqueur au sol doit utiliser la même valeur, sinon la phase 3 valide un itinéraire que le joueur n'aura jamais. |
| `drivabilityPenalty` | number | 10. Pénalité de praticabilité à utiliser avec le routage de marqueur au sol. |
| `maxCheckpointRadius` | number | 13 (m). Rayon maximal d'un checkpoint généré. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/util/routeGenerator.lua`.*
