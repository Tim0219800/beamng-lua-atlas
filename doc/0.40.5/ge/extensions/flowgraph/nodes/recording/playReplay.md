# `flowgraph_nodes_recording_playReplay`

*Fichier : `lua/ge/extensions/flowgraph/nodes/recording/playReplay.lua` · VM : Game Engine (GE) · 30 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/recording/playReplay")` (fichier sous extensions/ mais pas une extension classique)

Noeud flowgraph 'Play Replay' (categorie repeat_instant). Sur l'impulsion 'play', charge et lance un replay avec core_replay.loadFile. Le chemin est resolu relativement au projet flowgraph via mgr:getRelativeAbsolutePath({filename}).

## Remarques

- La description du pin 'filename' ('The prefix for the generated filename') est copiee du noeud Record Replay : ici c'est le nom du fichier a lire.

## Classe `C`

Classe du noeud flowgraph (creee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.

| Méthode | Description | Ligne |
|---|---|---|
| `C:work()` | Si 'play' est actif et que le chemin existe, appelle core_replay.loadFile(chemin). | 19 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/recording/playReplay.lua`.*
