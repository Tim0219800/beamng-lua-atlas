# `flowgraph_nodes_gameplay_crawl_resetCrawl`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/crawl/resetCrawl.lua` · VM : Game Engine (GE) · 40 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/crawl/resetCrawl")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Reset Crawl » (catégorie once_instant, crawl). Remet à zéro le crawl actif : téléporte le véhicule au départ et réinitialise données et timers. Le système reste actif mais le timer est arrêté jusqu'à Start Crawl. Sorties : success, failed, isActive.

**Dépendances (chargées avant) :** `gameplay_crawl_flowgraphBridge`

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:init(mgr)` | Charge le bridge du crawl. | 23 |
| `C:work()` | Appelle bridge.resetCrawl(). Succès : isActive vrai ; échec : isActive = bridge.isCrawlActive(). | 27 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/crawl/resetCrawl.lua`.*
