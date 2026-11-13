# `flowgraph_nodes_vehicle_ai_traffic`

*Fichier : `lua/ge/extensions/flowgraph/nodes/vehicle/ai/traffic.lua` · VM : Game Engine (GE) · 34 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/vehicle/ai/traffic")` (fichier sous extensions/ mais pas une extension classique)

Nœud « AI Traffic » (couleur ai, once_p_duration). Met un véhicule en mode IA « traffic » : il roule selon les règles de circulation. N'active pas le système de gestion du trafic. Entrée : aiVehId (sans valeur = véhicule du joueur).

## Classe `C`

Classe du nœud flowgraph ; chaque instance représente un nœud dans un graphe.

| Méthode | Description | Ligne |
|---|---|---|
| `C:workOnce()` | Envoie au véhicule ai.setMode("traffic"). | 21 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/vehicle/ai/traffic.lua`.*
