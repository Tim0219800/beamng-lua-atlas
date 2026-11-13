# `flowgraph_nodes_gameplay_rally_loop_rallyClock`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/rally/loop/rallyClock.lua` · VM : Game Engine (GE) · 80 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/rally/loop/rallyClock")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Rally Clock » (catégorie repeat_instant, tag rally). Fournit l'heure courante de l'époque rally (currentEpochTime, secondes, rm:getEpochTime()) et l'heure planifiée d'un évènement (scheduledEventTime, rm:getScheduledEventTime(eventName)) pour le nom d'évènement donné (nom de position, ex. « SS_start_line »). L'heure planifiée est mise en cache et recalculée seulement quand eventName ou la mission courante change.

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` | Vide le cache au démarrage du graphe. | 30 |
| `C:init(mgr, ...)` | Initialise le cache (nom d'évènement, id de mission, heure planifiée) à nil. | 23 |
| `C:work()` | Chaque frame : met à jour currentEpochTime et scheduledEventTime (avec cache). | 45 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/rally/loop/rallyClock.lua`.*
