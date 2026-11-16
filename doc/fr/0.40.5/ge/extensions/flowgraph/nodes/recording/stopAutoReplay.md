# `flowgraph_nodes_recording_stopAutoReplay`

*Fichier : `lua/ge/extensions/flowgraph/nodes/recording/stopAutoReplay.lua` · VM : Game Engine (GE) · 30 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/recording/stopAutoReplay")` (fichier sous extensions/ mais pas une extension classique)

Noeud flowgraph 'Stop Auto Replay'. Arrete l'enregistrement en cours s'il y en a un (module missionReplay). Si 'attemptNotCompleted' est vrai (tentative de mission non terminee), sauvegarde d'abord les meta-informations sans tentative.

## Remarques

- work s'execute a chaque frame, sans tester l'impulsion d'entree 'stopRec'.
- Pas de C.category defini.

## Classe `C`

Classe du noeud flowgraph (creee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.

| Méthode | Description | Ligne |
|---|---|---|
| `C:work()` | Si attemptNotCompleted : missionReplay:saveMetaInfoWithoutAttempt() ; puis missionReplay:stopIfRec(). | 20 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/recording/stopAutoReplay.lua`.*
