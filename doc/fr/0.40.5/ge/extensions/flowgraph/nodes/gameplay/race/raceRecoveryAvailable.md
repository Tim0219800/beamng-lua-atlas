# `flowgraph_nodes_gameplay_race_raceRecoveryAvailable`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/race/raceRecoveryAvailable.lua` · VM : Game Engine (GE) · 36 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/race/raceRecoveryAvailable")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Race Recovery Available » (catégorie logic). Teste si un véhicule dispose d'un point de recovery (race:hasRecoveryPosition(vehId)). Sorties flow 'true' (recovery disponible) et 'false' (sinon).

## Remarques

- Le code assigne C.tags deux fois ; la seconde (tableau vide) écrase {'scenario'}.

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:work()` | Met à jour les sorties 'true' et 'false' selon hasRecoveryPosition. | 28 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/race/raceRecoveryAvailable.lua`.*
