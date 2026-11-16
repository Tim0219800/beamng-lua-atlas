# `gameplay_race_path`

*Fichier : `lua/ge/extensions/gameplay/race/path.lua` · VM : Game Engine (GE) · 648 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/gameplay/race/path")` (fichier sous extensions/ mais pas une extension classique)

Classe du chemin de course (race path) : conteneur de pathnodes, segments, positions de départ (startPositions) et pacenotes, avec métadonnées (nom, auteurs, difficulté, tours par défaut, préfabs). Il construit une configuration de parcours (autoConfig : graphe de segments, branchement, circuit fermé, parcours linéaire), la classe (classify), calcule un chemin pour l'IA, se sérialise en JSON et peut être converti depuis d'anciens formats (scénarios, checkpoints de scène, 'tracks'). Le module renvoie une fabrique : require('/lua/ge/extensions/gameplay/race/path')(name). Il est utilisé par l'éditeur de course et par race.lua.

## Remarques

- init(name) ignore son argument : le nom reste « Path » (valeur codée en dur). copy() passe un nom, sans effet.
- copy() est cassé : il appelle cpy.onDeserialized(self.onSerialize()) avec un point au lieu de deux-points, donc sans self (erreur Lua).
- autoConfig référence une variable globale reverse (jamais définie) : targetNode vaut toujours seg.to.
- autoConfig suppose qu'il n'y a qu'un seul premier segment ; startNode doit exister (sinon config vide).
- classify() appelle autoConfig puis lit les startPositions et pathnodes d'ids invalides : un objet 'missing' est renvoyé par sortedList pour un id absent ; classify échoue si endNode ne correspond à rien et que le circuit n'est pas fermé de manière valide.
- Champs d'identifiants : startNode, endNode, defaultStartPosition, reverseStartPosition, rollingStartPosition, rollingReverseStartPosition (-1 si non défini) ; champs de préfabs : prefabs, forwardPrefabs, reversePrefabs.
- Les quatre collections (pathnodes, segments, startPositions, pacenotes) sont des gameplay/util/sortedList avec .objects (par id), .sorted (liste triée), create, clear.
- postCreate : le premier pathnode créé devient startNode, la première position de départ devient defaultStartPosition.
- getAiPath ne gère pas les chemins avec branchement ; elle utilise map.findClosestRoad pour associer chaque pathnode à un nœud de route.
- reverse() inverse from/to de tous les segments et permute startNode/endNode (si endNode défini) ; les startPositions ne changent pas.

## Classe `C`

Chemin de course. Champs principaux : id, name, description, authors, date, difficulty (24 par défaut), defaultLaps (1), config (résultat d'autoConfig), simplifyAiPath, hideMission, isReversed, aiPath, aiDetailedPath, aiPathDistance.

Le module renvoie un constructeur : `local obj = require("gameplay_race_path")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:autoConfig()` | Construit la configuration automatique dans self.config : à partir du startNode, graphe des segments (successeurs, prédécesseurs, lastInLap, targetNode, segments visibles suivants), indicateurs branching et closed, liste linearPathnodes pour un parcours non branché, et pacenotes associés à chaque segment (segmentToPacenotes). | 57 |
| `C:classify()` | Appelle autoConfig et renvoie la classification du chemin : départ lancé autorisé, inversible, fermé, branché. | 606 |
| `C:copy()` | Prévu pour dupliquer le chemin ; cassé dans cette version (voir notes). | 382 |
| `C:drawAiRouteDebug()` | Dessine le chemin détaillé de l'IA (sphères de 1 m et prismes colorés) s'il existe. | 222 |
| `C:drawDebug(drawMode)` | Dessine pathnodes, segments, positions de départ et pacenotes. | 215 |
| `C:findSegments(from, to)` | Ids des segments valides dont le départ vaut from et/ou l'arrivée vaut to (nil = pas de filtre). | 194 |
| `C:findStartPositionByName(name)` | Cherche une position de départ par son nom. | 311 |
| `C:fromCheckpointList(list, closed)` | Réinitialise le chemin à partir d'objets de scène (CameraBookmark/waypoints) : un pathnode par objet (rayon = plus grande échelle, normale si directionalWaypoint), segments dans l'ordre. | 427 |
| `C:fromLapConfig(lapConfig, closed)` | Réinitialise le chemin et le construit à partir d'une liste de checkpoints d'un ancien scénario (positions lues dans le scénario actif extensions.scenario_scenarios), reliés dans l'ordre par des segments ; le dernier rejoint le premier si closed. | 399 |
| `C:fromTrack(trackInfo, usePrefabs)` | Réinitialise le chemin à partir d'une description de track (ancien format) : ligne de départ/arrivée, lapConfig, préfabs optionnels (auto-détectés _forward et _reverse), segments, métadonnées et positions de départ des sphères d'apparition. | 469 |
| `C:getAiPath()` | Calcule le chemin IA à partir de la configuration : liste des nœuds de route (noms) proches de chaque pathnode, puis chemin détaillé via le module route. Renvoie deux tables vides si la configuration n'est pas prête. S'arrête aux branchements. | 245 |
| `C:getLastPathnode()` | Dernier pathnode de la liste triée. | 638 |
| `C:getNextUniqueIdentifier()` | Renvoie un identifiant unique croissant pour les objets du chemin. | 7 |
| `C:init(name)` | Constructeur / réinitialisation : valeurs par défaut, collections vides. L'argument name est ignoré. | 14 |
| `C:onDeserialized(data)` | Restaure le chemin à partir de données sérialisées (vide puis recrée collections, convertit les ids avec une table oldIdMap). | 352 |
| `C:onSerialize()` | Sérialise le chemin en table JSON (métadonnées, collections, ids de départ/arrivée, préfabs, classification, options). | 320 |
| `C:recalculateSegments()` | Recrée les segments en reliant les pathnodes dans l'ordre trié. | 629 |
| `C:reverse()` | Inverse le sens du chemin : permute startNode et endNode, inverse from/to des segments, bascule isReversed. | 389 |

## Appels vers le moteur (C++)

- `FS:` `fileExists`
- `debugDrawer:` `drawSphere`, `drawSquarePrism`
- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/race/path.lua`.*
