# `flowgraph_nodes_gameplay_sites_zoneByName`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/sites/zoneByName.lua` · VM : Game Engine (GE) · 72 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/sites/zoneByName")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Zone by Name ». Cherche une zone dans sitesData.zones.byName. Entrées : flow, sitesData, zoneName ; sorties : flow, exists (caché), zone (zoneData).

## Classe `C`

Classe du nœud flowgraph (créée via `_flowgraph_createNode(C)`).

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` | Appelé au démarrage de l'exécution du projet flowgraph ; réinitialise l'état interne du nœud. | 45 |
| `C:drawCustomProperties()` | Dessine les propriétés personnalisées du nœud dans le panneau de l'éditeur flowgraph (ImGui). | 27 |
| `C:drawMiddle(builder, style)` | Dessine le contenu central du nœud dans l'éditeur flowgraph (ImGui). | 66 |
| `C:init(mgr, ...)` | Initialise l'état interne du nœud à sa création (appelé par le moteur flowgraph). | 23 |
| `C:work(args)` | Retrouve la zone par nom, publie zone et active flow/exists si elle existe et n'est pas missing. | 49 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/sites/zoneByName.lua`.*
