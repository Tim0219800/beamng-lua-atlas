# `flowgraph_nodes_gameplay_traffic_fileVehicleGroup`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/traffic/fileVehicleGroup.lua` · VM : Game Engine (GE) · 57 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/traffic/fileVehicleGroup")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « File Vehicle Group » (once_p_duration). Charge un fichier .vehGroup.json (jsonReadFile). Si le fichier a un generator ou pas de data, le groupe est généré avec core_multiSpawn.createGroup(amount, generator) (amount par défaut 10). Sortie : group (vehicleGroupData) pour les nœuds de spawn de trafic.

## Classe `C`

Classe du nœud flowgraph (créée via `_flowgraph_createNode(C)`).

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStopped()` | Appelé à l'arrêt de l'exécution du projet flowgraph ; libère l'état interne. | 36 |
| `C:init()` | Initialise l'état interne du nœud à sa création (appelé par le moteur flowgraph). | 22 |
| `C:onNodeReset()` | Appelé lors de la réinitialisation du nœud ; remet son état interne à zéro. | 32 |
| `C:postInit()` | Appelé après la création des pins du nœud ; sert à ajuster les pins (modèles de valeurs, filtres de fichiers, clés dynamiques). | 26 |
| `C:work()` | Au premier appel, résout le chemin, lit le fichier, génère les données si nécessaire et publie le groupe ; erreur de nœud si le fichier est introuvable. | 40 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/traffic/fileVehicleGroup.lua`.*
