# `flowgraph_nodes_macro_getForeach`

*Fichier : `lua/ge/extensions/flowgraph/nodes/macro/getForeach.lua` · VM : Game Engine (GE) · 40 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/macro/getForeach")` (fichier sous extensions/ mais pas une extension classique)

Noeud flowgraph 'Get Foreach' (categorie provider). Dans un flowgraph cree par un noeud Foreach, expose la cle (key) et la valeur (value) de l'element courant, lues dans self.mgr.modules.foreach.

## Remarques

- C.tags est defini deux fois ; la seconde definition ecrase la premiere.

## Classe `C`

Classe du noeud flowgraph (creee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` | Copie mgr.modules.foreach.key et .value vers les pins de sortie. | 32 |
| `C:init(mgr, ...)` | Vide. | 24 |
| `C:postInit()` | Vide. | 28 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/macro/getForeach.lua`.*
