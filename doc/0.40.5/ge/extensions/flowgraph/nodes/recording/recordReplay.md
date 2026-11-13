# `flowgraph_nodes_recording_recordReplay`

*Fichier : `lua/ge/extensions/flowgraph/nodes/recording/recordReplay.lua` · VM : Game Engine (GE) · 71 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/recording/recordReplay")` (fichier sous extensions/ mais pas une extension classique)

Noeud flowgraph 'Record Replay' (categorie repeat_f_duration). Doit enregistrer un replay du vehicule courant : l'impulsion 'start' puis 'stop' appellent core_replay.toggleRecording(false). Sortie 'filename' mise a jour par onReplayStateChanged quand l'etat devient 'recording'.

## Remarques

- Le champ C.todo du code signale que le systeme de replay ne permet pas de choisir d'autres vehicules.
- start et stop appellent tous deux toggleRecording(false) (basculement) ; le pin 'prefix' n'est utilise que dans saveFile qui n'est jamais appelee.

## Classe `C`

Classe du noeud flowgraph (creee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` | Etat de duree 'inactive'. | 28 |
| `C:drawMiddle(builder, style)` | Affiche l'etat de duree. | 63 |
| `C:init()` | state = 'none'. | 24 |
| `C:onReplayStateChanged(state)` | Hook appele par le systeme de replay quand son etat change ; en enregistrement, memorise le fichier charge dans 'filename'. | 32 |
| `C:saveFile()` | Construit un nom de fichier (prefix ou 'Recording_<id>' suivi d'un numero) mais ne l'utilise pas : la fonction ne fait rien d'utile. | 38 |
| `C:work()` | Etat inactive : 'start' lance toggleRecording et passe a 'started'. Etat started : 'stop' relance toggleRecording et passe a 'finished'. | 45 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/recording/recordReplay.lua`.*
