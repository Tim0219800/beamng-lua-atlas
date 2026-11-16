# `flowgraph_nodes_ui_fadeFromBlack`

*Fichier : `lua/ge/extensions/flowgraph/nodes/ui/fadeFromBlack.lua` · VM : Game Engine (GE) · 69 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/ui/fadeFromBlack")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Fade From Black » (catégorie once_f_duration) : fait apparaître l'écran depuis le noir. Entrée « duration » (0.75 s par défaut). Sortie de durée gérée par setDurationState (flow « complete », ancien nom « done »). Utilise ui_fadeScreen.fadeFromBlack, ou termine l'écran de chargement (server.fadeoutLoadingScreen) si le jeu est en chargement.

## Remarques

- Dépend de ui_fadeScreen et gameplay_missions_missionManager.
- Si l'écran est déjà non noir ou si le fondu a été arrêté, passe directement à l'état 'finished'.
- L'état 'finished' arrive aussi par le hook onScreenFadeState(3).

**Dépendances (chargées avant) :** `ui_fadeScreen`, `gameplay_missions_missionManager`

## Classe `C`

Classe du nœud flowgraph (retournée par _flowgraph_createNode(C)).

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStopped()` | Remet l'état 'inactive' et isFadeScreenActive = false. | 38 |
| `C:init()` | État de durée 'inactive'. | 28 |
| `C:onNodeReset()` | Remet l'état 'inactive'. | 44 |
| `C:onScreenFadeState(state)` | Hook appelé par ui_fadeScreen avec l'état du fondu ; l'état 3 termine le nœud. | 63 |
| `C:postInit()` | Modèle de la durée : 0.75 (durée par défaut des fondus de mission). | 32 |
| `C:workOnce()` | Lance le fondu depuis le noir (ou termine le chargement) et met à jour l'état de durée. | 48 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/ui/fadeFromBlack.lua`.*
