# `flowgraph_nodes_gameplay_crawl_getDynamicObjects`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/crawl/getDynamicObjects.lua` · VM : Game Engine (GE) · 37 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/crawl/getDynamicObjects")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Get Dynamic Objects » (catégorie repeat_instant, crawl). Récupère les objets d'un prefab ayant un champ dynamique donné. Pins d'entrée : prefabId (0 = rien) et dynamicName ('crawlDynamic' par défaut). Sortie : dynamicObjects (table d'ids) via bridge.getDynamicObjectsFromPrefab.

**Dépendances (chargées avant) :** `gameplay_crawl_flowgraphBridge`

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:init(mgr)` | Charge le bridge du crawl. | 19 |
| `C:work()` | Renvoie {} si prefabId est nil ou 0, sinon la liste fournie par le bridge. | 23 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/crawl/getDynamicObjects.lua`.*
