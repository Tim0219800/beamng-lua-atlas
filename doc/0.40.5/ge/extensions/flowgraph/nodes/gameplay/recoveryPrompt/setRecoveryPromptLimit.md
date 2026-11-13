# `flowgraph_nodes_gameplay_recoveryPrompt_setRecoveryPromptLimit`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/recoveryPrompt/setRecoveryPromptLimit.lua` · VM : Game Engine (GE) · 47 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/recoveryPrompt/setRecoveryPromptLimit")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Set Recovery Prompt Limits » (catégorie once_instant). Limite le nombre d'utilisations de chaque bouton du recovery prompt (-1 = illimité) ; sans utilisation restante le bouton n'est plus sélectionnable. Pins d'entrée number : flipMission (5), recoverMission (5), submitMission (-1), restartMission (-1) ; des pins number personnalisés sont autorisés et sauvegardés. Dépend de gameplay_walk.

**Dépendances (chargées avant) :** `gameplay_walk`

## Classe `C`

Classe du nœud flowgraph (créée via `_flowgraph_createNode(C)`).

| Méthode | Description | Ligne |
|---|---|---|
| `C:drawMiddle(builder, style)` | Dessine le contenu central du nœud dans l'éditeur flowgraph (ImGui). | 42 |
| `C:init()` | Initialise l'état interne du nœud à sa création (appelé par le moteur flowgraph). | 25 |
| `C:workOnce(args)` | Construit la table des limites à partir des pins number non nil, appelle core_recoveryPrompt.setButtonLimits(limits) puis resetButtonLimitCounters(counts) pour remettre les compteurs à zéro. | 29 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/recoveryPrompt/setRecoveryPromptLimit.lua`.*
