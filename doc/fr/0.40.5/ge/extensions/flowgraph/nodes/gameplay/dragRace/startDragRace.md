# `flowgraph_nodes_gameplay_dragRace_startDragRace`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/dragRace/startDragRace.lua` · VM : Game Engine (GE) · 56 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/dragRace/startDragRace")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Start Drag Race » (catégorie once_instant). Démarre l'activité de course de dragster, à appeler après la mise en place des véhicules. Pin d'entrée : lane (caché, optionnel, contexte freeroam). Sorties : flow (impulsion) et success. Échoue si les données ne sont pas chargées ou si la course est déjà démarrée.

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:workOnce()` | Appelle dragBridge.startDragRaceActivity(lane) après vérifications et renseigne success ; flow est toujours activé. | 23 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/dragRace/startDragRace.lua`.*
