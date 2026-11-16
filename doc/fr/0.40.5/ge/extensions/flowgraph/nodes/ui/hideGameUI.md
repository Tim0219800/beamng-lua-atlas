# `flowgraph_nodes_ui_hideGameUI`

*Fichier : `lua/ge/extensions/flowgraph/nodes/ui/hideGameUI.lua` · VM : Game Engine (GE) · 29 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/ui/hideGameUI")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Hide Game UI » (catégorie repeat_instant, auteur BeamNG) : affiche ou masque l'UI normale du jeu (apps, etc.) avec extensions.ui_visibility.setCef(not value). Entrée « value » (vrai = masquer).

## Classe `C`

Classe du nœud flowgraph (retournée par _flowgraph_createNode(C)).

| Méthode | Description | Ligne |
|---|---|---|
| `C:work()` | Appelle ui_visibility.setCef(not value) à chaque frame. | 23 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/ui/hideGameUI.lua`.*
