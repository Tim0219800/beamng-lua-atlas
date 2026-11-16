# `flowgraph_nodes_vehicle_ai_flee`

*Fichier : `lua/ge/extensions/flowgraph/nodes/vehicle/ai/flee.lua` · VM : Game Engine (GE) · 36 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/vehicle/ai/flee")` (fichier sous extensions/ mais pas une extension classique)

Nœud « AI Flee » (couleur ai, once_p_duration). Met un véhicule en mode IA « flee » pour fuir un autre véhicule. Entrées : aiVehId (sans valeur = véhicule du joueur), targetId (par défaut le véhicule du joueur).

## Classe `C`

Classe du nœud flowgraph ; chaque instance représente un nœud dans un graphe.

| Méthode | Description | Ligne |
|---|---|---|
| `C:workOnce()` | Envoie au véhicule ai.setMode("flee") puis ai.setTargetObjectID(targetId). | 21 |

## Appels vers le moteur (C++)

- `be:` `getPlayerVehicleID`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/vehicle/ai/flee.lua`.*
