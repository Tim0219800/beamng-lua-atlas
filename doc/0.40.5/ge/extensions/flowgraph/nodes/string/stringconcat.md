# `flowgraph_nodes_string_stringconcat`

*Fichier : `lua/ge/extensions/flowgraph/nodes/string/stringconcat.lua` · VM : Game Engine (GE) · 123 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/string/stringconcat")` (fichier sous extensions/ mais pas une extension classique)

Noeud « Concat » (simple, OBSOLÈTE : « Use the Format String node instead »). Concatène toutes ses entrées (converties par tostring) en une chaîne. Un nouveau pin value<N+1> est ajouté automatiquement quand le dernier est lié et les pins vides en fin de liste sont retirés. Les valeurs nil ou false sont ignorées.

## Remarques

- Les valeurs false sont ignorées : les booléens doivent être convertis manuellement (todo du fichier).

## Classe `C`

Classe du noeud flowgraph (retournee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` | Vide le cache d'entrées. | 30 |
| `C:cleanupPins()` | Garde exactement un pin vide en fin de liste (en crée un ou supprime les surplus). | 85 |
| `C:drawMiddle(builder, style)` | Vide. | 119 |
| `C:init()` | Sortie à '', cache d'entrées vide, savePins = true. | 23 |
| `C:onLink(link)` | Hook : à la création d'un lien, nettoie les pins. | 72 |
| `C:onUnlink(link)` | Hook : à la suppression d'un lien, nettoie les pins. | 77 |
| `C:updateCache()` | Reconstruit le cache de chaînes depuis les pins d'entrée et indique s'il a changé. | 36 |
| `C:work()` | Recalcule la sortie par table.concat(cache) si le cache a changé. | 65 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/string/stringconcat.lua`.*
