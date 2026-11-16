# `flowgraph_nodes_gameplay_crawl_stopCrawl`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/crawl/stopCrawl.lua` · VM : Game Engine (GE) · 40 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/crawl/stopCrawl")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Stop Crawl » (catégorie once_instant, crawl). Arrête le crawl actif. Sorties : success, failed (aucun crawl actif) et isActive (toujours faux).

**Dépendances (chargées avant) :** `gameplay_crawl_flowgraphBridge`

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:init(mgr)` | Charge le bridge du crawl. | 23 |
| `C:work()` | Appelle bridge.stopCrawl() et renseigne success/failed ; isActive = false. | 27 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/crawl/stopCrawl.lua`.*
