# `flowgraph_nodes_gameplay_recoveryPrompt_setRecoveryPromptActive`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/recoveryPrompt/setRecoveryPromptActive.lua` · VM : Game Engine (GE) · 47 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/recoveryPrompt/setRecoveryPromptActive")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Set Recovery Prompt Active » (catégorie once_instant). Active ou désactive le système de récupération des missions (core_recoveryPrompt). À utiliser avec « Set Recovery Prompt Enabled » pour rendre les boutons sélectionnables. Pins d'entrée : active (défaut true), enableAll (obsolète, caché), flipMission, recoverMission (défaut true), submitMission, restartMission (défaut false). Dépend de gameplay_walk et bloque le reset gameplay (blocksOnResetGameplay).

**Dépendances (chargées avant) :** `gameplay_walk`

## Classe `C`

Classe du nœud flowgraph (créée via `_flowgraph_createNode(C)`).

| Méthode | Description | Ligne |
|---|---|---|
| `C:drawMiddle(builder, style)` | Dessine le contenu central du nœud dans l'éditeur flowgraph (ImGui). | 42 |
| `C:workOnce(args)` | Si active est vrai : appelle core_recoveryPrompt.setActive(true), désactive tous les boutons puis active ceux dont le pin n'est pas nil. Sinon appelle core_recoveryPrompt.setActive(false). | 25 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/recoveryPrompt/setRecoveryPromptActive.lua`.*
