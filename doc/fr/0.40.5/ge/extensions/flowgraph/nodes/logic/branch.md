# `flowgraph_nodes_logic_branch`

*Fichier : `lua/ge/extensions/flowgraph/nodes/logic/branch.lua` · VM : Game Engine (GE) · 42 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/logic/branch")` (fichier sous extensions/ mais pas une extension classique)

Noeud flowgraph 'Branch' (categorie logic) : un 'if'. Si le flux d'entree est actif, laisse passer le flux par la sortie True ou False selon le pin bool 'condition'. Le pin de sortie 'flow' (cache) suit simplement l'entree. S'execute a chaque frame.

## Classe `C`

Classe du noeud flowgraph (creee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.

| Méthode | Description | Ligne |
|---|---|---|
| `C:work()` | Si flow est vrai : flow en sortie = flow, True = condition, False = not condition. Sinon toutes les sorties passent a false. | 24 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/logic/branch.lua`.*
