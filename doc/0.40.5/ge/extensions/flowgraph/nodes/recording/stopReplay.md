# `flowgraph_nodes_recording_stopReplay`

*Fichier : `lua/ge/extensions/flowgraph/nodes/recording/stopReplay.lua` · VM : Game Engine (GE) · 23 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/recording/stopReplay")` (fichier sous extensions/ mais pas une extension classique)

Noeud flowgraph 'Stop Replay' (categorie repeat_instant). Arrete la relecture en cours : si core_replay.state.state vaut 'playback', appelle core_replay.stop(). Aucun pin.

## Classe `C`

Classe du noeud flowgraph (creee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.

| Méthode | Description | Ligne |
|---|---|---|
| `C:work()` | Arrete le replay s'il est en lecture. | 15 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/recording/stopReplay.lua`.*
