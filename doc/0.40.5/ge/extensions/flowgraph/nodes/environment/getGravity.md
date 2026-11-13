# `flowgraph_nodes_environment_getGravity`

*Fichier : `lua/ge/extensions/flowgraph/nodes/environment/getGravity.lua` · VM : Game Engine (GE) · 24 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/environment/getGravity")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Get Gravity » (catégorie provider, tag environment). Sort la gravité globale actuelle en m/s² (core_environment.getGravity) sur le pin « gravity ».

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:work()` | Chaque frame, écrit la gravité sur le pin de sortie. | 19 |

## Appels vers le moteur (C++)

- `core_environment.` `getGravity`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/environment/getGravity.lua`.*
