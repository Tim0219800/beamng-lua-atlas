# `flowgraph_nodes_debug_display`

*Fichier : `lua/ge/extensions/flowgraph/nodes/debug/display.lua` · VM : Game Engine (GE) · 35 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/debug/display")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Display Value » (type simple, catégorie repeat_instant, tag util). Affiche dans le corps du nœud la valeur reçue sur le pin d'entrée « value » (any) ; si c'est une table, un bouton « Dump » l'envoie dans la console (dump). Aucune sortie.

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:drawMiddle(builder, style)` | Éditeur : affiche la valeur (dumpsz, profondeur 2) et le bouton Dump pour les tables. | 23 |
| `C:work()` | Mémorise la dernière valeur reçue. | 19 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/debug/display.lua`.*
