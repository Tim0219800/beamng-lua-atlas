# `flowgraph_nodes_gameplay_sites_parkingspotByName`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/sites/parkingspotByName.lua` · VM : Game Engine (GE) · 72 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/sites/parkingspotByName")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Parking Spot by Name ». Cherche une place de parking par nom dans sitesData.parkingSpots.byName. Entrées : flow, sitesData, spotName ; sorties : flow (vrai si trouvée), exists (caché), spot (parkingSpotData).

## Classe `C`

Classe du nœud flowgraph (créée via `_flowgraph_createNode(C)`).

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` | Appelé au démarrage de l'exécution du projet flowgraph ; réinitialise l'état interne du nœud. | 45 |
| `C:drawCustomProperties()` | Dessine les propriétés personnalisées du nœud dans le panneau de l'éditeur flowgraph (ImGui). | 27 |
| `C:drawMiddle(builder, style)` | Dessine le contenu central du nœud dans l'éditeur flowgraph (ImGui). | 66 |
| `C:init(mgr, ...)` | Initialise l'état interne du nœud à sa création (appelé par le moteur flowgraph). | 23 |
| `C:work(args)` | Retrouve la place par nom, publie spot et active flow/exists si elle existe et n'est pas missing. | 49 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/sites/parkingspotByName.lua`.*
