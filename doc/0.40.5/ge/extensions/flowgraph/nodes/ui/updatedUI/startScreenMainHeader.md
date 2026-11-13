# `flowgraph_nodes_ui_updatedUI_startScreenMainHeader`

*Fichier : `lua/ge/extensions/flowgraph/nodes/ui/updatedUI/startScreenMainHeader.lua` · VM : Game Engine (GE) · 29 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/ui/updatedUI/startScreenMainHeader")` (fichier sous extensions/ mais pas une extension classique)

Nœud « Screen Main Header » (repeat_instant, couleur ui). Ajoute un grand en-tête à l'écran (en général le nom de la mission). Entrées : flow, header (string), preHeader (string, par ex. le type de mission). Sortie : flow (chainFlow).

## Remarques

- Le pin preHeader a « Header » comme valeur par défaut (même que header).

## Classe `C`

Classe du nœud flowgraph ; chaque instance représente un nœud dans un graphe.

| Méthode | Description | Ligne |
|---|---|---|
| `C:work()` | Recopie flow puis appelle modules.ui:addHeader({header=..., preHeader=...}). | 23 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/ui/updatedUI/startScreenMainHeader.lua`.*
