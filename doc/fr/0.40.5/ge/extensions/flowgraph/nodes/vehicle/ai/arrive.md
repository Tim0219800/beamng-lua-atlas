# `flowgraph_nodes_vehicle_ai_arrive`

*Fichier : `lua/ge/extensions/flowgraph/nodes/vehicle/ai/arrive.lua` · VM : Game Engine (GE) · 110 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/vehicle/ai/arrive")` (fichier sous extensions/ mais pas une extension classique)

Nœud « AI Arrive » (couleur ai, once_f_duration, comportement duration). Envoie un véhicule vers un waypoint du navgraph (mode IA « manual » + ai.setTarget) et considère l'arrivée quand la distance entre l'avant du véhicule et le waypoint est inférieure à checkDistance (rayon du waypoint si vide) et que la vitesse est inférieure à checkVelocity. Entrées : aiVehId, waypointName, checkDistance (caché, 1), checkVelocity (caché, 0,1). Sortie : distance (cachée). Donnée : autoDisableOnArrive (true) désactive l'IA à l'arrivée.

## Remarques

- Le pin hérité inRadius est remappé vers complete.
- Le test d'arrivée précède l'envoi de la commande : l'état finished peut être écrasé par « started » à la première frame (le même work appelle ensuite setDurationState('started')).
- checkVelocity vide donne un seuil de 10000 m/s (équivalent à pas de limite).

## Classe `C`

Classe du nœud flowgraph ; chaque instance représente un nœud dans un graphe.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStopped()` | Appelle onNodeReset. | 46 |
| `C:drawMiddle(builder, style)` | Affiche l'état et si la commande a été envoyée. | 50 |
| `C:getVeh()` | Renvoie le véhicule de aiVehId, ou celui du joueur sans entrée. | 56 |
| `C:init()` | Initialise sentCommand, data.autoDisableOnArrive=true et l'état de durée « inactive ». | 35 |
| `C:onNodeReset()` | Remet sentCommand à false et l'état à « inactive ». | 41 |
| `C:work()` | Si flow est actif et pas terminé : vérifie le waypoint et le véhicule (erreur de nœud sinon), calcule la distance depuis le milieu de l'avant, passe à « finished » à l'arrivée (et désactive l'IA si autoDisableOnArrive), puis envoie une fois ai.setState manual et ai.setTarget. | 66 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/vehicle/ai/arrive.lua`.*
