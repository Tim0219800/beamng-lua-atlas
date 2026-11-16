# `flowgraph_nodes_environment_pauseGame`

*Fichier : `lua/ge/extensions/flowgraph/nodes/environment/pauseGame.lua` · VM : Game Engine (GE) · 42 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/environment/pauseGame")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Pause Game » (catégorie once_p_duration, auteur BeamNG, tags pause/freeze/halt/stop/interrupt). Met la simulation en pause via simTimeAuthority.pause. L'action est différée à _afterTrigger (après le déclenchement de tous les nœuds de la frame).

## Remarques

- Bug : le pin d'entrée « value » (« si le jeu doit être en pause ») n'est jamais lu. workOnce met toujours _pauseGame à true, donc le nœud ne fait que mettre en pause, jamais reprendre.

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_afterTrigger()` | Si demandé et si le jeu n'est pas déjà en pause, appelle simTimeAuthority.pause(true), puis remet le drapeau à faux. | 31 |
| `C:_executionStarted()` | Remet le drapeau interne à faux. | 23 |
| `C:workOnce()` | Demande la pause (drapeau à true). | 27 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/environment/pauseGame.lua`.*
