# `flowgraph_nodes_recording_startAutoReplay`

*Fichier : `lua/ge/extensions/flowgraph/nodes/recording/startAutoReplay.lua` · VM : Game Engine (GE) · 27 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/recording/startAutoReplay")` (fichier sous extensions/ mais pas une extension classique)

Noeud flowgraph 'Start Auto Replay'. Sur l'impulsion 'startNewRec', arrete l'enregistrement courant et en demarre un nouveau via le module missionReplay du gestionnaire ; si le module aiRecording existe, demarre aussi l'enregistrement et la relecture IA.

## Remarques

- Pas de C.category defini.
- work s'execute a chaque frame, sans tester l'impulsion d'entree 'startNewRec'.

## Classe `C`

Classe du noeud flowgraph (creee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.

| Méthode | Description | Ligne |
|---|---|---|
| `C:work()` | Appelle missionReplay:startNewRec() puis, si aiRecording existe, startAiRecording() et startAiReplay(). | 16 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/recording/startAutoReplay.lua`.*
