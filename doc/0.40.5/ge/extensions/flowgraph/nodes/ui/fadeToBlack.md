# `flowgraph_nodes_ui_fadeToBlack`

*Fichier : `lua/ge/extensions/flowgraph/nodes/ui/fadeToBlack.lua` · VM : Game Engine (GE) · 64 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/ui/fadeToBlack")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Fade To Black » (catégorie once_f_duration) : fait passer l'écran au noir. Entrée « duration » (0.75 s). Sortie de durée par setDurationState (flow « complete », ancien nom « done »). Passe directement à 'finished' si l'écran est déjà noir (ui_fadeScreen.isBlack).

## Remarques

- Met self.mgr.modules.ui.isFadeScreenActive = true pour que Fade From Black sache qu'un fondu est actif.

**Dépendances (chargées avant) :** `ui_fadeScreen`, `gameplay_missions_missionManager`

## Classe `C`

Classe du nœud flowgraph (retournée par _flowgraph_createNode(C)).

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStopped()` | Remet l'état 'inactive' et isFadeScreenActive = false. | 38 |
| `C:init()` | État de durée 'inactive'. | 28 |
| `C:onNodeReset()` | Remet l'état 'inactive'. | 44 |
| `C:onScreenFadeState(state)` | Hook : état 1 (noir atteint) -> terminé. | 58 |
| `C:postInit()` | Modèle de durée à 0.75. | 32 |
| `C:workOnce()` | Lance ui_fadeScreen.fadeToBlack (sauf si déjà noir). | 48 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/ui/fadeToBlack.lua`.*
