# `flowgraph_nodes_events_onBeamNGTrigger`

*Fichier : `lua/ge/extensions/flowgraph/nodes/events/onBeamNGTrigger.lua` · VM : Game Engine (GE) · 74 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/events/onBeamNGTrigger")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « on BeamNGTrigger » (catégorie repeat_instant, événement). Écoute le hook onBeamNGTrigger et laisse passer le flux selon l'événement (enter ou exit). Peut filtrer par nom de trigger (data.filterName, vide = tous). Sorties : enter, exit (impulsions), vehId, triggerId, vehicleName, triggerName.

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:drawMiddle(builder, style)` | Affiche le filtre actif dans le nœud. | 65 |
| `C:init(mgr, ...)` | Initialise data.filterName = "" et les drapeaux. | 32 |
| `C:onBeamNGTrigger(data)` | Hook appelé par le moteur à chaque événement de BeamNGTrigger. Ignore l'événement si le nom ne correspond pas au filtre, remplit les pins de sortie, lève enterFlag/exitFlag et déclenche le nœud. | 38 |
| `C:work(args)` | Copie enterFlag/exitFlag vers les pins enter/exit puis les remet à false. | 57 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/events/onBeamNGTrigger.lua`.*
