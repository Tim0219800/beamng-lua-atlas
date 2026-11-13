# `flowgraph_nodes_gameplay_recoveryPrompt_setRecoveryPromptButtonEnabled`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/recoveryPrompt/setRecoveryPromptButtonEnabled.lua` · VM : Game Engine (GE) · 31 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/recoveryPrompt/setRecoveryPromptButtonEnabled")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Set Recovery Prompt Button Enabled » (catégorie once_instant). Active ou désactive un bouton du recovery prompt par id ; si le bouton était inactif et doit être activé, il est aussi activé. Pins d'entrée : id (modèles proposés : flipMission, recoverMission, submitMission, restartMission), enabled.

## Classe `C`

Classe du nœud flowgraph (créée via `_flowgraph_createNode(C)`).

| Méthode | Description | Ligne |
|---|---|---|
| `C:postInit()` | Définit les valeurs prédéfinies (hardTemplates) du pin id : les quatre boutons standard. | 21 |
| `C:workOnce()` | Appelle core_recoveryPrompt.setButtonEnabledById(id, enabled or false). | 17 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/recoveryPrompt/setRecoveryPromptButtonEnabled.lua`.*
