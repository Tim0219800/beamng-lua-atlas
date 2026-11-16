# `flowgraph_nodes_gameplay_rally_raceEditorPath`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/rally/raceEditorPath.lua` · VM : Game Engine (GE) · 64 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/rally/raceEditorPath")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Rally Mode Race Editor Path » (catégorie once_instant, tag rally). Renvoie le nom de fichier de course à utiliser dans la pin fname : 'race.race.json' (source « Mission ») si un identifiant de mission du Mission Manager est détecté, sinon le fichier ouvert dans editor_raceEditor (source « Editor ») s'il n'est pas un fichier vierge (/gameplay/races/new.path.json ou NewRace.race.json). Dans l'éditeur, affiche la source et le fichier.

## Remarques

- Si editor_raceEditor existe mais que le fichier ouvert est vierge, loadCurrentRaceFileState ne renvoie rien (nil) ; fname est alors nil.

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:drawCustomProperties()` | Affiche le fichier de course et sa source dans le panneau de propriétés. | 50 |
| `C:drawMiddle(builder, style)` | Affiche « Source: … » dans le corps du nœud. | 44 |
| `C:workOnce()` | Détermine le fichier de course, le logge (niveau D) et l'écrit dans la pin fname. | 57 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/rally/raceEditorPath.lua`.*
