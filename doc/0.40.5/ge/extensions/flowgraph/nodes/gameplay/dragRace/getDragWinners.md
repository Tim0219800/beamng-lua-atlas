# `flowgraph_nodes_gameplay_dragRace_getDragWinners`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/dragRace/getDragWinners.lua` · VM : Game Engine (GE) · 73 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/dragRace/getDragWinners")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Get Drag Race Winner Data » (catégorie repeat_instant). Donne le résultat du joueur à la fin d'une course de dragster. Sorties : playerWin, playerPos (position), dialDiff (ET + RT du joueur moins son dial), threshold (meilleur adversaire moins joueur en ET + RT ; positif si le joueur franchit la ligne en premier). Source : dragBridge.getPlayerRaceResult ou getWinnersData.

## Remarques

- Si les gagnants sont indisponibles ou vides, une erreur de nœud est posée et les sorties ne sont pas modifiées.
- dialDiff et threshold ne sont renseignés que si getPlayerRaceResult existe.

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` | Vide data et result. | 25 |
| `C:work()` | Lit le résultat du bridge et alimente les sorties utilisées. | 30 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/dragRace/getDragWinners.lua`.*
