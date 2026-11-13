# `flowgraph_nodes_gameplay_crawl_applyPenalty`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/crawl/applyPenalty.lua` · VM : Game Engine (GE) · 50 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/crawl/applyPenalty")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Apply Penalty » (catégorie impulse, crawl). Applique manuellement des points de pénalité au crawl actif, en choisissant un type dans la liste du bridge (gameplay/crawl/flowgraphBridge). Pins d'entrée : flow (impulsion) et penaltyType (string).

## Remarques

- work écrit self.pinOut.success et failed, mais pinSchema ne déclare aucun pin de sortie : ces accès plantent si penaltyType est vide.
- Si penaltyType est valide, le résultat de bridge.applyPenalty n'est pas exposé.

**Dépendances (chargées avant) :** `gameplay_crawl_flowgraphBridge`

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:init(mgr)` | Charge le bridge du crawl. | 22 |
| `C:postInit()` | Remplit les modèles du pin penaltyType avec bridge.getPenaltyTypes(). | 26 |
| `C:work()` | Appelle bridge.applyPenalty(penaltyType) si le type est renseigné. | 35 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/crawl/applyPenalty.lua`.*
