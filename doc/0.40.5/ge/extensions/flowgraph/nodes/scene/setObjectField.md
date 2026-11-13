# `flowgraph_nodes_scene_setObjectField`

*Fichier : `lua/ge/extensions/flowgraph/nodes/scene/setObjectField.lua` · VM : Game Engine (GE) · 44 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/scene/setObjectField")` (fichier sous extensions/ mais pas une extension classique)

Noeud flowgraph « Set Object Field » (repeat_instant). Modifie un champ d'un objet de la scène par id. Entrées : objectId, fieldName, fieldArrayNum (caché, 0), value (any ; une table est convertie en chaîne séparée par des espaces). Sortie : objectFound. Utilise setField si le champ est déclaré, sinon setDynDataFieldbyName, puis updateInstanceRenderData si dispo.

## Remarques

- Ne fait rien si value est nil ou false (test `not value`) : impossible d'écrire false avec ce noeud.
- Les tables sont concaténées par table.concat : seulement valable pour des listes de nombres/chaînes.

## Classe `C`

Classe du noeud flowgraph (retournee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.

| Méthode | Description | Ligne |
|---|---|---|
| `C:work()` | Cherche l'objet, convertit la valeur et l'écrit dans le champ (déclaré ou dynamique). | 24 |

## Appels vers le moteur (C++)

- `obj:` `getFields`, `setDynDataFieldbyName`, `setField`, `updateInstanceRenderData`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/scene/setObjectField.lua`.*
