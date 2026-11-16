# `flowgraph_nodes_ui_imgui_elemental_imText`

*Fichier : `lua/ge/extensions/flowgraph/nodes/ui/imgui/elemental/imText.lua` · VM : Game Engine (GE) · 35 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/ui/imgui/elemental/imText")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « im Text » (catégorie repeat_instant, tag imgui) : affiche un texte avec retour à la ligne automatique dans la fenêtre imgui courante. Entrée « text » (any, converti avec tostring).

## Classe `C`

Classe du nœud flowgraph (retournée par _flowgraph_createNode(C)).

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` | Vide effectif (aucune sortie). | 21 |
| `C:work()` | Affiche le texte (TextWrapped). | 27 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/ui/imgui/elemental/imText.lua`.*
