# `flowgraph_nodes_gameplay_crawl_getCrawlData`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/crawl/getCrawlData.lua` · VM : Game Engine (GE) · 112 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/crawl/getCrawlData")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Get Crawl Data » (catégorie repeat_instant, crawl). Lit les données d'exécution du crawl actif via le bridge. Sorties : onCompleted, onDisqualified, onCheckpointReached (flux sur front), isCompleted, disqualified, crawlerPosition (vec3), crawlerDirection (quat, lacet seul), vehicleId, hasRecoveryCheckpoint, recoveryPosition, recoveryRotation. Sans crawl actif : erreur de nœud et valeurs nulles par défaut ({0,0,0}, {0,0,0,1}).

**Dépendances (chargées avant) :** `gameplay_crawl_flowgraphBridge`

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:init(mgr)` | Charge le bridge et initialise les derniers états (complété, disqualifié, index de checkpoint). | 31 |
| `C:work()` | Appelle bridge.getCrawlRuntimeData et getLastRecoveryCheckpoint, détecte les changements d'état et renseigne les pins. | 38 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/crawl/getCrawlData.lua`.*
