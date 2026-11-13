# `flowgraph_nodes_logic_bundle`

*Fichier : `lua/ge/extensions/flowgraph/nodes/logic/bundle.lua` · VM : Game Engine (GE) · 26 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/logic/bundle")` (fichier sous extensions/ mais pas une extension classique)

Noeud flowgraph 'Bundle' (categorie logic). Recopie simplement le flux d'entree vers la sortie ; sert seulement a regrouper visuellement des liens pour la lisibilite du graphe.

## Remarques

- Utilise C.type = 'simple' (les autres noeuds utilisent C.category).

## Classe `C`

Classe du noeud flowgraph (creee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.

| Méthode | Description | Ligne |
|---|---|---|
| `C:work()` | pinOut.flow = pinIn.flow. | 21 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/logic/bundle.lua`.*
