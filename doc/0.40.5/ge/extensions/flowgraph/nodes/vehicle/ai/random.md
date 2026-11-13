# `flowgraph_nodes_vehicle_ai_random`

*Fichier : `lua/ge/extensions/flowgraph/nodes/vehicle/ai/random.lua` · VM : Game Engine (GE) · 34 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/vehicle/ai/random")` (fichier sous extensions/ mais pas une extension classique)

Nœud « AI Random » (couleur ai, once_p_duration). Met un véhicule en mode IA « random » (roule sur des routes aléatoires). Entrée : aiVehId (sans valeur = véhicule du joueur).

## Classe `C`

Classe du nœud flowgraph ; chaque instance représente un nœud dans un graphe.

| Méthode | Description | Ligne |
|---|---|---|
| `C:workOnce()` | Envoie au véhicule ai.setState({mode = "random"}). | 21 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/vehicle/ai/random.lua`.*
