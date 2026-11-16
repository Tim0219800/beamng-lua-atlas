# `flowgraph_nodes_gameplay_crawl_getCrawlStartTransform`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/crawl/getCrawlStartTransform.lua` · VM : Game Engine (GE) · 48 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/crawl/getCrawlStartTransform")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Get Crawl Start Transform » (catégorie repeat_instant, crawl). Donne la position (startPosition, vec3) et la rotation (startRotation, quat) de départ du crawl actif via bridge.getCrawlSpawnTransform. Sans crawl actif : erreur de nœud et valeurs {0,0,0} et {0,0,0,1}.

**Dépendances (chargées avant) :** `gameplay_crawl_flowgraphBridge`

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:init(mgr)` | Charge le bridge du crawl. | 22 |
| `C:work()` | Lit la transformation de spawn et la convertit en tables. | 26 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/crawl/getCrawlStartTransform.lua`.*
