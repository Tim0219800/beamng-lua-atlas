# `flowgraph_nodes_gameplay_crawl_startCrawl`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/crawl/startCrawl.lua` · VM : Game Engine (GE) · 43 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/crawl/startCrawl")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Start Crawl » (catégorie once_instant, crawl). Démarre la course et le timer du crawl ; nécessite que Setup Crawl ait été exécuté (utilise son trail et son véhicule). Sorties : success, failed.

**Dépendances (chargées avant) :** `gameplay_crawl_flowgraphBridge`

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:init(mgr)` | Charge le bridge du crawl. | 22 |
| `C:work()` | Appelle bridge.startCrawl(nil, nil) et renseigne success/failed. | 26 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/crawl/startCrawl.lua`.*
