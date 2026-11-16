# `flowgraph_nodes_ui_imgui_elemental_imButton`

*Fichier : `lua/ge/extensions/flowgraph/nodes/ui/imgui/elemental/imButton.lua` · VM : Game Engine (GE) · 54 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/ui/imgui/elemental/imButton")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « im Button » (catégorie repeat_instant, tag imgui) : bouton imgui pleine largeur dans la fenêtre courante. Entrée « text ». Sorties : « down » (impulsion au clic), « hold » (maintenu, caché), « up » (relâché, caché).

## Remarques

- Les états ne sont détectés que lorsque la souris survole le bouton.

## Classe `C`

Classe du nœud flowgraph (retournée par _flowgraph_createNode(C)).

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` | Sorties à false. | 24 |
| `C:work()` | Dessine le bouton et met à jour down/hold/up selon la souris. | 30 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/ui/imgui/elemental/imButton.lua`.*
