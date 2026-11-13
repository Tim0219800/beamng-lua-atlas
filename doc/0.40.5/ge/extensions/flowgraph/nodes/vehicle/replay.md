# `flowgraph_nodes_vehicle_replay`

*Fichier : `lua/ge/extensions/flowgraph/nodes/vehicle/replay.lua` · VM : Game Engine (GE) · 91 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/vehicle/replay")` (fichier sous extensions/ mais pas une extension classique)

Nœud « Timeline Replay » (comportement `duration`). Lance un fichier de replay (`core_replay.loadFile`) au début de son segment de timeline et l'arrête (`core_replay.stop`) à la fin. Pins d'entrée : `flow`, `filename` (string), `vehId`. Les replays sont listés dans l'éditeur (`core_replay.getRecordings`).

## Remarques

- `C.todo` : nœud prototype, ne fonctionne pas dans tous les cas.
- `init` appelle `_setupTimeline(5, 10)` : segment de timeline de 5 à 10 (unités de la timeline).
- Le pin `vehId` n'est pas utilisé dans le code.

## Classe `C`

Classe du nœud flowgraph (renvoyée par `_flowgraph_createNode(C)`). Champs de définition : name, description, category, pinSchema, tags.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStopped()` | Arrête le replay en cours. | 46 |
| `C:drawCustomProperties()` | Bouton « Load Replays » et liste déroulante pour choisir un enregistrement. | 50 |
| `C:drawMiddle(builder, style)` | Affiche le nom du replay et les drapeaux internes. | 82 |
| `C:init()` | Constructeur ; configure la timeline (5 à 10) et `replayName`. | 28 |
| `C:onTimelineBegin(globalTime, localTime)` | Appelé au début du segment de timeline ; demande le démarrage du replay. | 72 |
| `C:onTimelineEnd(globalTime, localTime)` | Appelé à la fin du segment ; demande l'arrêt du replay. | 77 |
| `C:work()` | Charge le replay (chemin relatif du `filename`) si `startReplay`, ou l'arrête si `stopReplay`. | 33 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/vehicle/replay.lua`.*
