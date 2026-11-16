# `flowgraph_nodes_gameplay_completeScenario`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/completeScenario.lua` · VM : Game Engine (GE) · 35 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/completeScenario")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Complete Scenario » (catégorie once_instant). Termine le scénario courant via scenario_scenarios.finish. Pins d'entrée : reason (message final) et fail (bool, si vrai le scénario échoue). Sans reason, le message vaut « Failed » ou « Completed ».

## Remarques

- Ne fait rien si scenario_scenarios n'est pas chargé.
- En cas d'échec la table passée contient failed = reason, sinon msg = reason.

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:drawMiddle(builder, style)` | Dessin du nœud dans l'éditeur. | 30 |
| `C:workOnce()` | Appelle scenario_scenarios.finish({failed=...}) ou ({msg=...}) selon fail. | 19 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/completeScenario.lua`.*
