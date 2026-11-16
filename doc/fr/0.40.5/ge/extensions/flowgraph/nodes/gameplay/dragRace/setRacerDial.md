# `flowgraph_nodes_gameplay_dragRace_setRacerDial`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/dragRace/setRacerDial.lua` · VM : Game Engine (GE) · 83 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/dragRace/setRacerDial")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Set Drag Racer Dial » (catégorie once_instant). Règle le dial (temps annoncé) d'un ou plusieurs pilotes. Pin d'entrée : dials, table d'entrées {racerId = number, value = number}. Sorties : flow (impulsion), success (tout réussi), count (nombre de dials valides). Appelle dragBridge.setRacersDial.

## Remarques

- count est calculé avant l'appel : c'est le nombre d'entrées valides dont le racerId existe dans dragData.racers.
- Table vide : success faux, count 0, mais flux donné.

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:workOnce()` | Valide les entrées, appelle setRacersDial et renseigne success/count ; signale un échec partiel par erreur de nœud. | 26 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/dragRace/setRacerDial.lua`.*
