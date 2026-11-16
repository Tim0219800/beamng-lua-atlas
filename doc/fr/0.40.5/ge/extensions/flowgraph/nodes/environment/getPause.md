# `flowgraph_nodes_environment_getPause`

*Fichier : `lua/ge/extensions/flowgraph/nodes/environment/getPause.lua` · VM : Game Engine (GE) · 29 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/environment/getPause")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Get Pause » (catégorie provider, auteur BeamNG, tags pause/freeze/halt/stop/interrupt). Sort un bool « value » indiquant si la simulation est en pause (simTimeAuthority.getPause()).

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:work()` | Chaque frame, écrit l'état de pause sur la sortie value. | 23 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/environment/getPause.lua`.*
