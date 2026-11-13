# `flowgraph_nodes_gameplay_rally_setNoteSearch`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/rally/setNoteSearch.lua` · VM : Game Engine (GE) · 42 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/rally/setNoteSearch")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Rally Mode Set NoteSearch » (tag rally, pas de catégorie). Prévu pour chercher les pacenotes les plus proches plutôt que la suivante. Entrées : noteSearch (impulsion) et recoveredTo (table, point de recovery).

## Remarques

- Nœud inachevé : sur impulsion il logge seulement « setNoteSearch » et fait dump(recoveredTo) si fourni ; il ne modifie aucun état.

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:work()` | Sur impulsion noteSearch : dump de recoveredTo et log de debug, sans autre effet. | 31 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/rally/setNoteSearch.lua`.*
