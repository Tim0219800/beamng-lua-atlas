# `flowgraph_nodes_gameplay_sites_parkingspot`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/sites/parkingspot.lua` · VM : Game Engine (GE) · 143 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/sites/parkingspot")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Parking Spot » (catégorie repeat_instant). Décompose une place de parking (parkingSpotData) : sorties name, pos, rot (quat), scl (vec3). Option data.fixedHeight (>0) remplace la hauteur de scl. Des pins dynamiques exposent les champs personnalisés (options, défaut « key »).

## Classe `C`

Classe du nœud flowgraph (créée via `_flowgraph_createNode(C)`).

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` | Appelé au démarrage de l'exécution du projet flowgraph ; réinitialise l'état interne du nœud. | 106 |
| `C:_onDeserialized(nodeData)` | Restaure les réglages propres au nœud à partir des données sauvegardées. | 135 |
| `C:_onSerialize(res)` | Ajoute les réglages propres au nœud à la table `res` lors de la sauvegarde du graphe. | 131 |
| `C:drawCustomProperties()` | Dessine les propriétés personnalisées du nœud dans le panneau de l'éditeur flowgraph (ImGui). | 66 |
| `C:init(mgr, ...)` | Initialise l'état interne du nœud à sa création (appelé par le moteur flowgraph). | 27 |
| `C:postInit()` | Appelé après la création des pins du nœud ; sert à ajuster les pins (modèles de valeurs, filtres de fichiers, clés dynamiques). | 32 |
| `C:updateKeys()` | Reconstruit les pins de sortie dynamiques à partir de la liste d'options du nœud. | 36 |
| `C:work(args)` | Recopie nom, position, rotation et échelle de la place sur les sorties, applique fixedHeight si > 0 et lit les champs personnalisés. | 110 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/sites/parkingspot.lua`.*
