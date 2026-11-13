# `flowgraph_nodes_career_onTestDriveChanged`

*Fichier : `lua/ge/extensions/flowgraph/nodes/career/onTestDriveChanged.lua` · VM : Game Engine (GE) · 41 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/career/onTestDriveChanged")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « On Testdrive Changed » (catégorie repeat_instant, couleur/icône ui). Détecte le début (hook onTestDriveStarted) et la fin après fondu (onTestDriveEndedAfterFade) d'un essai de véhicule en carrière. Sorties en impulsion : started et ended.

## Remarques

- La description du nœud est « TBD » et celle du pin ended est copiée de started (« when the vehicle is spawned »).
- work() ne remet à faux que started ; ended reste à vrai après un évènement.

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:init()` | Crée la table de drapeaux. | 21 |
| `C:onTestDriveEndedAfterFade(data)` | Hook : lève ended. | 37 |
| `C:onTestDriveStarted(data)` | Hook : lève started. | 33 |
| `C:work(args)` | Chaque frame : started à faux, applique puis efface les drapeaux. | 25 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/career/onTestDriveChanged.lua`.*
