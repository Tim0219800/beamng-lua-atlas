# `flowgraph_nodes_scene_getObjectField`

*Fichier : `lua/ge/extensions/flowgraph/nodes/scene/getObjectField.lua` · VM : Game Engine (GE) · 37 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/scene/getObjectField")` (fichier sous extensions/ mais pas une extension classique)

Noeud flowgraph « Get Object Field » (repeat_instant). Lit un champ d'un objet de la scene (scenetree.findObjectById). Entrees : objectId, fieldName, fieldArrayNum (optionnel, 0 par defaut, cache). Sortie : value (any). Utilise getField si le champ est declare, sinon getDynDataFieldbyName (champ dynamique).

## Remarques

- Rien n'est ecrit si l'objet est introuvable : la sortie garde l'ancienne valeur.
- getField renvoie en general une chaine.

## Classe `C`

Classe du noeud flowgraph (retournee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.

| Méthode | Description | Ligne |
|---|---|---|
| `C:work()` | Trouve l'objet, puis ecrit value avec obj:getField(nom, index) si le nom est dans obj:getFields(), sinon avec obj:getDynDataFieldbyName. | 24 |

## Appels vers le moteur (C++)

- `obj:` `getDynDataFieldbyName`, `getField`, `getFields`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/scene/getObjectField.lua`.*
