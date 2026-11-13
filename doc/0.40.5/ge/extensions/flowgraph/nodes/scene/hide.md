# `flowgraph_nodes_scene_hide`

*Fichier : `lua/ge/extensions/flowgraph/nodes/scene/hide.lua` · VM : Game Engine (GE) · 44 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/scene/hide")` (fichier sous extensions/ mais pas une extension classique)

Noeud flowgraph « Show/Hide Object » (repeat_instant). Cache ou montre un objet de la scene. Entrees : objID (number), hide (bool, true = cacher). Met obj.hidden puis appelle updateInstanceRenderData si l'objet l'a.

## Remarques

- Si l'id ne correspond a aucun objet, obj est nil et l'affectation obj.hidden provoque une erreur Lua (pas de garde).

## Classe `C`

Classe du noeud flowgraph (retournee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.

| Méthode | Description | Ligne |
|---|---|---|
| `C:init()` | Rien a initialiser. | 23 |
| `C:work()` | Trouve l'objet par id et applique hidden ; signale l'erreur « objID must be set » si le pin est vide. | 27 |

## Appels vers le moteur (C++)

- `obj:` `updateInstanceRenderData`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/scene/hide.lua`.*
