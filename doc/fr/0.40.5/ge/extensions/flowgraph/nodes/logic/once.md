# `flowgraph_nodes_logic_once`

*Fichier : `lua/ge/extensions/flowgraph/nodes/logic/once.lua` · VM : Game Engine (GE) · 50 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/logic/once")` (fichier sous extensions/ mais pas une extension classique)

Noeud flowgraph 'Once' (categorie logic, behaviour once). Laisse passer le flux une seule fois (impulsion en sortie) ; le pin impulsion 'reset' le rearme. L'etat est reinitialise a l'arret de l'execution.

## Classe `C`

Classe du noeud flowgraph (creee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStopped()` | Rearme le noeud (ready = true). | 27 |
| `C:init(mgr, ...)` | ready = true. | 23 |
| `C:work(args)` | Si reset : rearme et sortie false. Sinon, si pret et flux d'entree : sortie true une fois puis ready=false ; dans tous les autres cas sortie false. | 31 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/logic/once.lua`.*
