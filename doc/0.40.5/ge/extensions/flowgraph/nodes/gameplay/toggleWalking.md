# `flowgraph_nodes_gameplay_toggleWalking`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/toggleWalking.lua` · VM : Game Engine (GE) · 47 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/toggleWalking")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Toggle Walking » (catégorie repeat_instant, dépend de gameplay_walk). Impulsions d'entrée enterWalking (passe en mode marche, avec pos/rot optionnels) et exitWalking (monte dans le véhicule le plus proche). Impulsions de sortie success / fail. En entrée en marche, le véhicule quitté est ajouté au module vehicle du flowgraph (ignoreReadyUp).

**Dépendances (chargées avant) :** `gameplay_walk`

## Classe `C`

Classe du nœud flowgraph (créée via `_flowgraph_createNode(C)`).

| Méthode | Description | Ligne |
|---|---|---|
| `C:work(args)` | Appelle gameplay_walk.setWalkingMode(true, pos, rot) ou (false) selon l'impulsion reçue, puis écrit success/fail. | 24 |

## Appels vers le moteur (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/toggleWalking.lua`.*
