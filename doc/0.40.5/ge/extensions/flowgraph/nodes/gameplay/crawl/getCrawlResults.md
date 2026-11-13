# `flowgraph_nodes_gameplay_crawl_getCrawlResults`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/crawl/getCrawlResults.lua` · VM : Game Engine (GE) · 65 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/crawl/getCrawlResults")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Get Crawl Results » (catégorie repeat_instant, crawl). Lit les résultats d'un crawl terminé (bridge.getCrawlEndData). Sorties : time, points (pénalités), damage, recoveries, completed, disqualified, pathnodeTimings (table). Si les données manquent : erreur de nœud et valeurs à 0, false ou {}.

**Dépendances (chargées avant) :** `gameplay_crawl_flowgraphBridge`

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:init(mgr)` | Charge le bridge du crawl. | 27 |
| `C:work()` | Copie les champs de getCrawlEndData vers les pins de sortie. | 31 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/crawl/getCrawlResults.lua`.*
