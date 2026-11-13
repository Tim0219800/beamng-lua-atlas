# `flowgraph_nodes_gameplay_recoveryPrompt_setRecoveryPromptEnabled`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/recoveryPrompt/setRecoveryPromptEnabled.lua` · VM : Game Engine (GE) · 35 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/recoveryPrompt/setRecoveryPromptEnabled")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Set Recovery Prompt Enabled » (catégorie once_instant). Active ou désactive les boutons standard du recovery prompt ; un bouton désactivé reste visible mais non sélectionnable. Pins d'entrée : flipMission, recoverMission (défaut true), submitMission, restartMission (défaut false). Dépend de gameplay_walk.

**Dépendances (chargées avant) :** `gameplay_walk`

## Classe `C`

Classe du nœud flowgraph (créée via `_flowgraph_createNode(C)`).

| Méthode | Description | Ligne |
|---|---|---|
| `C:drawMiddle(builder, style)` | Dessine le contenu central du nœud dans l'éditeur flowgraph (ImGui). | 30 |
| `C:workOnce(args)` | Pour chaque bouton standard dont le pin n'est pas nil, appelle core_recoveryPrompt.setButtonEnabledById. | 22 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/recoveryPrompt/setRecoveryPromptEnabled.lua`.*
