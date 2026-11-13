# `flowgraph_nodes_vehicle_ai_getAIMode`

*Fichier : `lua/ge/extensions/flowgraph/nodes/vehicle/ai/getAIMode.lua` · VM : Game Engine (GE) · 53 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/vehicle/ai/getAIMode")` (fichier sous extensions/ mais pas une extension classique)

Nœud « Get AI Mode » (couleur ai, repeat_p_duration). Lit le mode IA courant d'un véhicule. Entrée : vehId (sans valeur = joueur). Sortie : aiMode (string). La valeur arrive de façon asynchrone : le véhicule exécute une commande qui rappelle le nœud côté moteur de jeu.

## Classe `C`

Classe du nœud flowgraph ; chaque instance représente un nœud dans un graphe.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` | Oublie le dernier mode reçu. | 40 |
| `C:getAIMode(mode)` | Rappel appelé depuis le véhicule avec le mode IA ; le mémorise dans returnedMode. | 48 |
| `C:getCmd()` | Construit la commande Lua exécutée côté véhicule : lit ai.getState().mode et rappelle n:getAIMode(mode) sur ce nœud via core_flowgraphManager.getManagerGraphNode. | 44 |
| `C:init()` | Ne fait rien. | 21 |
| `C:work()` | Envoie au véhicule la commande de getCmd et publie le dernier mode reçu sur aiMode (la valeur a donc au moins une frame de retard). | 25 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/vehicle/ai/getAIMode.lua`.*
