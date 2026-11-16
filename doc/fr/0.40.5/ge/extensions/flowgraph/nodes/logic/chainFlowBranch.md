# `flowgraph_nodes_logic_chainFlowBranch`

*Fichier : `lua/ge/extensions/flowgraph/nodes/logic/chainFlowBranch.lua` · VM : Game Engine (GE) · 38 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/logic/chainFlowBranch")` (fichier sous extensions/ mais pas une extension classique)

Noeud flowgraph 'Chainflow Branch' (categorie logic). Variante de Branch pour le 'chain flow' (pins declares avec chainFlow=true) : envoie le flux sur True ou False selon le pin bool 'condition'. Pas de pin de sortie 'flow' general.

## Classe `C`

Classe du noeud flowgraph (creee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.

| Méthode | Description | Ligne |
|---|---|---|
| `C:work()` | Si flow est vrai : True = condition et False = not condition ; sinon True et False passent a false. | 22 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/logic/chainFlowBranch.lua`.*
