# `flowgraph_nodes_gameplay_rally_loop_getCurrentRacePath`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/rally/loop/getCurrentRacePath.lua` · VM : Game Engine (GE) · 46 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/rally/loop/getCurrentRacePath")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Rally Get Current Race Path » (catégorie once_instant, tag rally). Lit rm:getCurrentRacePath() du gestionnaire de la boucle rally et le place dans la pin racePath (string) : chemin du fichier de course de la mission courante du planning, ou chaîne vide si indisponible.

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:workOnce()` | Écrit le chemin de course courant (ou '') dans racePath. | 28 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/rally/loop/getCurrentRacePath.lua`.*
