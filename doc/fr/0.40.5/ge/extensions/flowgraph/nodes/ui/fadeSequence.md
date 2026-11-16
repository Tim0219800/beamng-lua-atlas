# `flowgraph_nodes_ui_fadeSequence`

*Fichier : `lua/ge/extensions/flowgraph/nodes/ui/fadeSequence.lua` · VM : Game Engine (GE) · 81 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/ui/fadeSequence")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Fade Sequence » (catégorie once_f_duration, obsolète) : enchaîne fondu au noir, pause et fondu depuis le noir via ui_fadeScreen.fadeSequence. Entrées : « startDuration » (0.75), « pauseDuration » (0), « endDuration » (0.75). Sortie « faded » (impulsion quand l'écran est noir). Le code recommande plutôt Fade To Black + Fade From Black.

## Remarques

- C.todo : « Obsolete; use Fade To Black and Fade From Black nodes instead. »

**Dépendances (chargées avant) :** `ui_fadeScreen`, `gameplay_missions_missionManager`

## Classe `C`

Classe du nœud flowgraph (retournée par _flowgraph_createNode(C)).

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStopped()` | Réinitialise l'état et le pin faded. | 47 |
| `C:init()` | État de durée 'inactive', fadedTriggered = false. | 33 |
| `C:onNodeReset()` | Réinitialise l'état et le pin faded. | 54 |
| `C:onScreenFadeState(state)` | Hook : état 1 -> faded = true ; état 3 -> terminé. | 73 |
| `C:postInit()` | Modèles de durée à 0.75 pour startDuration et endDuration. | 38 |
| `C:work()` | Transforme 'faded' en impulsion (remis à false à la frame suivante). | 65 |
| `C:workOnce()` | Démarre la séquence avec les trois durées (défauts 1, 0, 1 si nil). | 60 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/ui/fadeSequence.lua`.*
