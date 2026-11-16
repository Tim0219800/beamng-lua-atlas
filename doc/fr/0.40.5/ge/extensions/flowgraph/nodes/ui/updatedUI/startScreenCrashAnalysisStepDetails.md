# `flowgraph_nodes_ui_updatedUI_startScreenCrashAnalysisStepDetails`

*Fichier : `lua/ge/extensions/flowgraph/nodes/ui/updatedUI/startScreenCrashAnalysisStepDetails.lua` · VM : Game Engine (GE) · 31 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/ui/updatedUI/startScreenCrashAnalysisStepDetails")` (fichier sous extensions/ mais pas une extension classique)

Nœud « Start Screen Crash Analysis Step Details » (repeat_instant, couleur ui). Ajoute à l'écran de démarrage simple un panneau de détails d'une étape d'analyse de crash. Entrées : flow, stepScoreData (table). Sortie : flow (chainFlow).

## Classe `C`

Classe du nœud flowgraph ; chaque instance représente un nœud dans un graphe.

| Méthode | Description | Ligne |
|---|---|---|
| `C:work()` | Recopie flow puis appelle modules.ui:addCrashAnalysisStepDetails({stepScoreData = ...}). | 22 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/ui/updatedUI/startScreenCrashAnalysisStepDetails.lua`.*
