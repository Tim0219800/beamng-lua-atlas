# `flowgraph_nodes_career_garageComputerUtil`

*Fichier : `lua/ge/extensions/flowgraph/nodes/career/garageComputerUtil.lua` · VM : Game Engine (GE) · 71 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/career/garageComputerUtil")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Garage Computer Util » (catégorie repeat_instant, couleur/icône ui), aide pour le tutoriel du garage. Impulsions de sortie d'une frame : computerOpened (menu de l'ordinateur ouvert), tuningStarted, tuningApplied, shoppingStarted (achat de pièces ouvert), partInstalled, transactionComplete.

## Remarques

- Les descriptions des pins partInstalled et transactionComplete disent « part shopping opened » (copier-coller dans le jeu).

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:init()` | Crée la table de drapeaux. | 28 |
| `C:onCareerTuningApplied()` | Hook : tuning appliqué. | 55 |
| `C:onCareerTuningStarted()` | Hook : tuning commencé. | 51 |
| `C:onComputerMenuOpened()` | Hook : menu de l'ordinateur du garage ouvert. | 47 |
| `C:onPartShoppingPartInstalled(data)` | Hook : pièce installée. | 63 |
| `C:onPartShoppingStarted()` | Hook : achat de pièces ouvert. | 59 |
| `C:onPartShoppingTransactionComplete()` | Hook : transaction d'achat terminée. | 67 |
| `C:work(args)` | Chaque frame : met toutes les sorties à faux, applique les drapeaux reçus puis les efface. | 33 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/career/garageComputerUtil.lua`.*
