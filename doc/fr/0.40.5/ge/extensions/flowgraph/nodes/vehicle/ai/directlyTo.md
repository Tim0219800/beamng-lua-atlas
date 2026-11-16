# `flowgraph_nodes_vehicle_ai_directlyTo`

*Fichier : `lua/ge/extensions/flowgraph/nodes/vehicle/ai/directlyTo.lua` · VM : Game Engine (GE) · 132 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/vehicle/ai/directlyTo")` (fichier sous extensions/ mais pas une extension classique)

Nœud « AI Directly To » (couleur ai, comportement duration + once). Fait rouler un véhicule en ligne droite vers une position cible, via un chemin interpolé envoyé à ai.startFollowing (mode « neverReset »). Entrées : flow, reset, vehId, target (vec3), targetVelocity (m/s, 1 par défaut). Sortie : flow, actif quand le véhicule est arrivé. Données : minDistance (1,5 m), handBrakeWhenFinished, straightenWheelsWhenFinished, maxStepDistance (5 m).

## Remarques

- Dans setupAI, la boucle va de 1 à steps+3 : le chemin dépasse la cible de trois points.
- La variable locale target est réassignée (target = target - origin), ce qui crée un nouvel objet à chaque appel.
- Le pin flow de sortie n'est jamais remis à false une fois complete.

## Classe `C`

Classe du nœud flowgraph ; chaque instance représente un nœud dans un graphe.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStopped()` | Appelle reset. | 40 |
| `C:drawMiddle(builder, style)` | Affiche les états Complete et Started. | 124 |
| `C:endAI()` | Envoie au véhicule ai:scriptStop(handBrake, straightenWheels) selon les données du nœud. | 60 |
| `C:getVeh()` | Renvoie le véhicule de vehId, ou celui du joueur sans entrée. | 50 |
| `C:init()` | Initialise started/complete et les données par défaut. | 31 |
| `C:reset()` | Remet started/complete à false et appelle endAI. | 44 |
| `C:setupAI()` | Construit un chemin de points espacés d'au plus maxStepDistance entre la position du véhicule et la cible (temps = distance / vitesse) et l'envoie par ai.startFollowing. | 67 |
| `C:work()` | Gère reset ; au premier flow lance setupAI ; ensuite teste la distance au carré à la cible et, sous minDistance, arrête l'IA, marque complete et active la sortie flow. | 96 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/vehicle/ai/directlyTo.lua`.*
