# `flowgraph_nodes_util_ghost`

*Fichier : `lua/ge/extensions/flowgraph/nodes/util/ghost.lua` · VM : Game Engine (GE) · 49 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/util/ghost")` (fichier sous extensions/ mais pas une extension classique)

Nœud caché « GHOST » (catégorie logic, hidden=true). Sert de remplaçant quand un projet flowgraph référence un type de nœud qui n'existe plus : il garde les données d'origine (ghostData) pour ne pas les perdre à la sauvegarde, affiche le type d'origine et marque une erreur « Node ... doesn't exist! ». Ne fait rien à l'exécution.

## Remarques

- Le nom affiché est construit avec le motif %a+, il ne garde que le dernier groupe de lettres du type (les chiffres coupent le mot).

## Classe `C`

Classe du nœud flowgraph ; chaque instance représente un nœud dans un graphe.

| Méthode | Description | Ligne |
|---|---|---|
| `C:__onSerialize()` | Renvoie les données d'origine (ghostData) telles quelles pour que le nœud soit resauvegardé à l'identique. | 34 |
| `C:_onDeserialized(nodeData)` | Enregistre l'erreur, mémorise le type d'origine, renomme le nœud « [GHOST]<dernier mot du type> » et garde nodeData dans ghostData. | 38 |
| `C:drawMiddle(builder, style)` | Dessine le type de nœud d'origine et un bouton « Dump ghost data » qui affiche ghostData dans la console. | 26 |
| `C:init()` | Initialise formerNodeType à « NOT GHOST ». | 18 |
| `C:work()` | Ne fait rien. | 22 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/util/ghost.lua`.*
