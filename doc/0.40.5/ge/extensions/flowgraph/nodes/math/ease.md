# `flowgraph_nodes_math_ease`

*Fichier : `lua/ge/extensions/flowgraph/nodes/math/ease.lua` · VM : Game Engine (GE) · 111 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/math/ease")` (fichier sous extensions/ mais pas une extension classique)

Noeud flowgraph 'Ease' (categorie simple). Applique une fonction d'easing a la valeur d'entree (normalement entre 0 et 1) : linear, in/out/inOut pour Quad, Cubic, Quart, Quint, Sin, Exp et Circ. La fonction se choisit dans les proprietes du noeud.

## Remarques

- La liste de l'UI (easeFuncNameList) n'inclut pas inCubic, outCubic, inOutCubic, bien que definies dans easeFunctions.

## Classe `C`

Classe du noeud flowgraph (creee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_onDeserialized(nodeData)` | Relit easeFuncName et la fonction associee. | 88 |
| `C:_onSerialize(res)` | Sauvegarde easeFuncName. | 84 |
| `C:drawCustomProperties()` | Liste deroulante des fonctions d'easing. | 69 |
| `C:drawMiddle(builder, style)` | Affiche le nom de la fonction. | 102 |
| `C:init()` | Fonction par defaut : linear. | 63 |
| `C:work()` | Si l'entree n'est pas nil/false, ecrit easeFunc(value) sur la sortie. | 96 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/math/ease.lua`.*
