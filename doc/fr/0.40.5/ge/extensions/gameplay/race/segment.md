# `gameplay_race_segment`

*Fichier : `lua/ge/extensions/gameplay/race/segment.lua` · VM : Game Engine (GE) · 250 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/gameplay/race/segment")` (fichier sous extensions/ mais pas une extension classique)

Classe d'un segment de chemin de course : tronçon entre deux pathnodes (from et to). Trois représentations sont prévues : « waypoint » (ligne droite entre les deux nœuds), un chemin navgraph rempli automatiquement en capsules, ou des capsules manuelles (points avec rayon). Le segment dit si un véhicule est dedans (contains) et s'il a atteint le nœud d'arrivée (finished). Le module renvoie une fabrique : require('/lua/ge/extensions/gameplay/race/segment')(path, name, forceId).

## Remarques

- Incohérence des noms de mode : la liste locale modes vaut {'waypoint', 'navgraphCapsule', 'manualCapsules'}, mais le code teste 'waypoint', 'navpath' et 'capsules'. Les valeurs 'navgraphCapsule' et 'manualCapsules' ne sont traitées nulle part : contains renvoie alors false.
- Une capsule est un point {pos, radius, name} ; les capsules d'un segment relient from, les capsulePoints, puis to. Le rayon est interpolé linéairement le long de chaque tronçon.
- Les capsules générées par fillNavpath portent _generated = true et sont recalculées à chaque appel de fillNavpath.
- isValid lit .missing sur les pathnodes from et to : erreur Lua si l'un des ids n'existe pas dans path.pathnodes.objects.
- contains en mode waypoint exige state.currentSegments, state.previousCorners et state.currentCorners.

## Classe `C`

Segment de course. Champs : path, id, name (« Segment <id> » par défaut), mode ('waypoint' par défaut), from et to (ids de pathnodes, -1 si aucun), capsulePoints, sortOrder, _drawMode.

Le module renvoie un constructeur : `local obj = require("gameplay_race_segment")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:addCapsule(pos, radius, name, index)` | Insère une capsule à l'index donné (à la fin par défaut). | 78 |
| `C:capsuleContains(point, id)` | Indique si un point est dans le tronçon de capsule entre les points id et id+1 (distance au segment inférieure au rayon interpolé). | 96 |
| `C:checkMode()` | Revalide le mode après un changement d'extrémité : en mode 'navpath', recalcule le chemin si possible, sinon repasse en 'waypoint'. | 43 |
| `C:contains(point, state)` | Indique si le véhicule est dans le segment. En mode waypoint : vrai s'il est déjà dans ce segment (state.currentSegments) ou s'il vient de traverser le pathnode de départ. En mode 'capsules' ou 'navpath' : vrai s'il est dans une des capsules. | 107 |
| `C:drawDebug(drawMode)` | Dessine le segment (prisme entre les deux nœuds en mode waypoint, capsules et bords sinon) et son nom. Ne dessine rien si le segment est invalide. | 176 |
| `C:fillNavpath()` | Remplit les capsules avec les nœuds intermédiaires du plus court chemin map.getPath entre les nœuds navgraph from et to (extrémités exclues). | 67 |
| `C:finished(point, state)` | Indique si le véhicule vient de traverser le pathnode d'arrivée (intersectCorners). | 139 |
| `C:getBeNavpath()` | Indique si les deux pathnodes d'extrémité sont en mode navgraph (donc si un chemin navgraph est possible). | 23 |
| `C:getCapsuleCount()` | Nombre de points de capsule, extrémités comprises (#capsulePoints + 2). | 86 |
| `C:getCapsuleNode(i)` | Point i de la chaîne de capsules : 1 = pathnode from, dernier = pathnode to, sinon un capsulePoint. | 87 |
| `C:getFrom()` | Pathnode de départ. | 32 |
| `C:getTo()` | Pathnode d'arrivée. | 33 |
| `C:init(path, name, forceId)` | Constructeur : id, nom, mode 'waypoint', from/to à -1, liste de capsules vide. | 11 |
| `C:isValid()` | Indique si les pathnodes from et to existent, ne sont pas marqués missing et sont différents. | 240 |
| `C:onDeserialized(data, oldIdMap)` | Restaure le segment ; convertit from/to avec oldIdMap, applique le mode puis ajoute les capsules sauvegardées. | 160 |
| `C:onSerialize()` | Sérialise le segment (name, mode, from, to, oldId, capsules). | 144 |
| `C:removeCapsule(index)` | Retire la capsule d'index donné. | 82 |
| `C:setFrom(from)` | Définit le pathnode de départ (par id) et revalide le mode. | 34 |
| `C:setMode(mode)` | Change le mode : 'waypoint' vide les capsules ; 'navpath' les remplit depuis le navgraph. | 55 |
| `C:setTo(to)` | Définit le pathnode d'arrivée (par id) et revalide le mode. | 38 |

## Appels vers le moteur (C++)

- `debugDrawer:` `drawSphere`, `drawSquarePrism`, `drawTextAdvanced`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/race/segment.lua`.*
