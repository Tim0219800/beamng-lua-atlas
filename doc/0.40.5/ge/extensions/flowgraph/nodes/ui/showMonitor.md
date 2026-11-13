# `flowgraph_nodes_ui_showMonitor`

*Fichier : `lua/ge/extensions/flowgraph/nodes/ui/showMonitor.lua` · VM : Game Engine (GE) · 35 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/ui/showMonitor")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Show Monitor » (catégorie once_instant, auteur BeamNG) : active le moniteur flowgraph (petite fenêtre) et cache l'éditeur. Entrées cachées : « showStates » (section États), « showLog » (section Journal).

## Remarques

- workOnce appelle dumpz(self.mgr.fgEditor, 1) avant et après (traces de debug).

## Classe `C`

Classe du nœud flowgraph (retournée par _flowgraph_createNode(C)).

| Méthode | Description | Ligne |
|---|---|---|
| `C:workOnce()` | Passe l'éditeur en petite fenêtre (switchToSmallWindow) et force l'ouverture des sections États/Journal. | 24 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/ui/showMonitor.lua`.*
