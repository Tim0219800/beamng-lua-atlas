# `flowgraph_nodes_debug_debugText`

*Fichier : `lua/ge/extensions/flowgraph/nodes/debug/debugText.lua` · VM : Game Engine (GE) · 41 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/debug/debugText")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Debug Text » (catégorie repeat_instant, tags util/draw). Dessine chaque frame un texte en 3D à une position (debugDrawer:drawTextAdvanced). Entrées : pos (vec3), text (any, converti par tostring), colorText (caché, blanc par défaut), colorBG (caché, noir semi-transparent {0,0,0,0.75} par défaut).

## Remarques

- Pas de test sur pos : vec3(nil) est construit si le pin est vide.
- Les couleurs sont lues avec 4 composantes sans valeur par défaut pour l'alpha.

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:init()` | Vide. | 24 |
| `C:work()` | Construit les couleurs (ColorF texte, ColorI fond *255) et dessine le texte. | 27 |

## Appels vers le moteur (C++)

- `debugDrawer:` `drawTextAdvanced`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/debug/debugText.lua`.*
