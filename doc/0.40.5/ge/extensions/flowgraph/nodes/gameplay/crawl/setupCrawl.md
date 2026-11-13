# `flowgraph_nodes_gameplay_crawl_setupCrawl`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/crawl/setupCrawl.lua` · VM : Game Engine (GE) · 99 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/crawl/setupCrawl")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Setup Crawl » (catégorie once_instant, crawl). Prépare un parcours crawl : charge le trail, téléporte le véhicule au départ et charge les prefabs, sans démarrer le timer (utiliser Start Crawl). Pins d'entrée : trailId (chemin du trail) et vehicleId (0 = véhicule joueur). Sorties : success, failed, isSetup.

## Remarques

- Si trailId est vide : cherche la variable flowgraph « trailFile », puis le premier *.trail.json du dossier de la mission (mgr.activity.missionFolder).
- Écrit beaucoup de logs (tag SetupCrawl).

**Dépendances (chargées avant) :** `gameplay_crawl_flowgraphBridge`

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:init(mgr)` | Charge le bridge du crawl. | 25 |
| `C:work()` | Résout le trail, appelle bridge.loadCrawlTrail puis bridge.setupCrawl(vehicleId, trail) et renseigne les sorties. | 29 |

## Appels vers le moteur (C++)

- `FS:` `findFiles`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/crawl/setupCrawl.lua`.*
