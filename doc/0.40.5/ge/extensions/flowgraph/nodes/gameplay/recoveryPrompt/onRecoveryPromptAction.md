# `flowgraph_nodes_gameplay_recoveryPrompt_onRecoveryPromptAction`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/recoveryPrompt/onRecoveryPromptAction.lua` · VM : Game Engine (GE) · 60 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/recoveryPrompt/onRecoveryPromptAction")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « On Recovery Prompt Action » (catégorie logic). Laisse passer le flux quand un bouton du menu de récupération (recovery prompt) a été pressé. Pins : entrée flow ; sorties flow, flipMission, recoverMission, submitMission, restartMission (chacune vraie une fois quand le bouton correspondant est pressé). Les pins de sortie flow personnalisés sont autorisés (allowCustomOutPins) et sauvegardés. Reçoit l'événement via le hook onRecoveryPromptButtonPressed.

## Classe `C`

Classe du nœud flowgraph (créée via `_flowgraph_createNode(C)`).

| Méthode | Description | Ligne |
|---|---|---|
| `C:_afterTrigger()` | Vide self.flags après le déclenchement du nœud. | 43 |
| `C:_executionStarted()` | Crée la table self.flags vide au démarrage de l'exécution. | 51 |
| `C:drawMiddle(builder, style)` | Dessine le contenu central du nœud dans l'éditeur flowgraph (ImGui). | 47 |
| `C:init()` | Initialise l'état interne du nœud à sa création (appelé par le moteur flowgraph). | 26 |
| `C:onRecoveryPromptButtonPressed(id)` | Hook appelé quand un bouton du recovery prompt est pressé ; mémorise l'identifiant dans self.flags pour le prochain work. | 55 |
| `C:work(args)` | Remet toutes les sorties à false, recopie l'entrée flow sur la sortie flow, puis active les sorties dont l'identifiant de bouton figure dans self.flags, et vide les flags. | 30 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/recoveryPrompt/onRecoveryPromptAction.lua`.*
