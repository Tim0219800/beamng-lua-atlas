# `flowgraph_nodes_gameplay_recoveryPrompt_getRecoveryPromptButtonLimitAndCount`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/recoveryPrompt/getRecoveryPromptButtonLimitAndCount.lua` · VM : Game Engine (GE) · 44 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/recoveryPrompt/getRecoveryPromptButtonLimitAndCount")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Get Recovery Prompt Button Limit and Count » (catégorie once_instant, couleur/icône recoveryPrompt, dépend de gameplay_walk). Lit core_recoveryPrompt.getButtonLimitsAndCounts() et renvoie pour le bouton choisi (pin id) sa limite (limit) et son compteur d'utilisations (count). Valeurs -1 si absentes des données du bouton, nil si l'id est inconnu. Dans l'éditeur, la pin id propose les valeurs flipMission, recoverMission, submitMission et restartMission.

**Dépendances (chargées avant) :** `gameplay_walk`

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:drawMiddle(builder, style)` | Appelle builder:Middle() sans rien dessiner. | 39 |
| `C:postInit()` | Définit les valeurs prédéfinies (hardTemplates) de la pin id. | 20 |
| `C:workOnce(args)` | Lit les limites/compteurs et remplit limit et count pour l'id donné. | 29 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/recoveryPrompt/getRecoveryPromptButtonLimitAndCount.lua`.*
