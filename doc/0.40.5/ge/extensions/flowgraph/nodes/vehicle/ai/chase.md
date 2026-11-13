# `flowgraph_nodes_vehicle_ai_chase`

*Fichier : `lua/ge/extensions/flowgraph/nodes/vehicle/ai/chase.lua` · VM : Game Engine (GE) · 37 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/vehicle/ai/chase")` (fichier sous extensions/ mais pas une extension classique)

Nœud « AI Chase » (couleur ai, once_p_duration). Met un véhicule en mode IA « chase » pour poursuivre un autre véhicule, avec contact intentionnel. Entrées : aiVehId (sans valeur = véhicule du joueur), targetId (par défaut le véhicule du joueur).

## Remarques

- Si aiVehId n'est pas fourni, le véhicule du joueur est à la fois poursuivant et cible par défaut.

## Classe `C`

Classe du nœud flowgraph ; chaque instance représente un nœud dans un graphe.

| Méthode | Description | Ligne |
|---|---|---|
| `C:workOnce()` | Envoie au véhicule ai.setMode("chase") puis ai.setTargetObjectID(targetId). | 22 |

## Appels vers le moteur (C++)

- `be:` `getPlayerVehicleID`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/vehicle/ai/chase.lua`.*
