# `flowgraph_nodes_vehicle_ai_goToEndLine`

*Fichier : `lua/ge/extensions/flowgraph/nodes/vehicle/ai/goToEndLine.lua` · VM : Game Engine (GE) · 101 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/vehicle/ai/goToEndLine")` (fichier sous extensions/ mais pas une extension classique)

Nœud « AI Go To The End Line » (couleur ai, comportement duration, pas de catégorie). Envoie un véhicule en mode IA « manual » vers une ligne d'arrivée donnée par une position, et active la sortie flow quand il est à moins de checkDistance (1 m par défaut) et plus lent que checkVelocity. Entrées : flow, reset, aiVehId, endLinePosition (vec3, caché), checkDistance (caché), checkVelocity (0,1, caché). Sorties : flow, distance (cachée). Donnée : autoDisableOnArrive (true).

## Remarques

- Bug : le code écrit self.pinOut.inRadius.value alors que le pin inRadius n'existe pas dans pinSchema : l'accès lèverait une erreur dès que le véhicule est dans le rayon.
- Contrairement à AI Arrive, aucune commande ai.setTarget n'est envoyée : le mode manual est activé sans cible, le véhicule n'est donc pas vraiment dirigé vers endLinePosition par ce nœud.
- La description du pin flow de sortie contient une faute (« slowe »).

## Classe `C`

Classe du nœud flowgraph ; chaque instance représente un nœud dans un graphe.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStopped()` | Appelle onNodeReset. | 39 |
| `C:getVeh()` | Renvoie le véhicule dont l'id est donné en entrée, ou le véhicule du joueur (getPlayerVehicle(0)) sans entrée. | 43 |
| `C:init()` | Active autoDisableOnArrive et appelle onNodeReset. | 29 |
| `C:onNodeReset()` | Remet complete et sentCommand à false. | 34 |
| `C:work()` | Gère reset ; si déjà arrivé, active flow. Sinon calcule la distance entre le milieu de l'avant du véhicule et endLinePosition, détermine l'arrivée (distance et vitesse) et désactive l'IA si autoDisableOnArrive ; envoie une fois ai.setState manual. Erreur de nœud si aucune position n'est donnée. | 53 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/vehicle/ai/goToEndLine.lua`.*
