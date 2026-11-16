# `flowgraph_nodes_gameplay_recoveryPrompt_setRecoveryPromptButton`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/recoveryPrompt/setRecoveryPromptButton.lua` · VM : Game Engine (GE) · 25 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/recoveryPrompt/setRecoveryPromptButton")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Set Recovery Prompt Button » (catégorie once_instant). Crée ou modifie un bouton du recovery prompt via core_recoveryPrompt.addButton. Pins d'entrée : buttonId, label (défaut « Button »), order (laisser vide = ajouté à la fin), fadeActive (caché, défaut true : fondu d'écran), icon (id d'icône).

## Classe `C`

Classe du nœud flowgraph (créée via `_flowgraph_createNode(C)`).

| Méthode | Description | Ligne |
|---|---|---|
| `C:workOnce()` | Appelle core_recoveryPrompt.addButton avec buttonId, label, une fonction vide (nop), order, fadeActive et icon. | 20 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/recoveryPrompt/setRecoveryPromptButton.lua`.*
