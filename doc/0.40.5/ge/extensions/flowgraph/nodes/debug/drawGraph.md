# `flowgraph_nodes_debug_drawGraph`

*Fichier : `lua/ge/extensions/flowgraph/nodes/debug/drawGraph.lua` · VM : Game Engine (GE) · 123 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/debug/drawGraph")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Multi Graph » (catégorie repeat_instant, tags util/draw/table/data). Trace plusieurs courbes dans un même graphe dans le corps du nœud : un pin d'entrée number (value1, value2…) par courbe, leur nombre se règle par data.count. Garde les 400 dernières valeurs par courbe ; l'échelle (data.scaleMin/scaleMax) s'agrandit automatiquement avec les valeurs.

## Remarques

- Un commentaire du jeu signale « TODO: fix invalid C type error » sur l'appel à im.PlotMultiLines.
- Les séries sont indexées par l'ordre de pairs() sur les pins, donc l'ordre des courbes n'est pas garanti.

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_onDeserialized(data)` | Recrée les pins selon data.count. | 103 |
| `C:_onSerialize(res)` | Vide. | 100 |
| `C:drawMiddle(builder, style)` | Éditeur : synchronise le nombre de pins avec data.count et dessine les courbes (PlotMultiLines). | 107 |
| `C:init()` | Initialise tables de données, 400 points max, count = 1, échelle 0..1. | 21 |
| `C:onLink()` | Hook éditeur : réinitialise les données. | 92 |
| `C:onLinkDeleted()` | Hook éditeur : réinitialise les données. | 88 |
| `C:onUnlink()` | Hook éditeur : réinitialise les données. | 96 |
| `C:resetGraphData()` | Reconstruit étiquettes, couleurs arc-en-ciel et séries d'après les pins numériques connectés. | 48 |
| `C:updatePins(old, new)` | Ajoute ou retire des pins value<i> pour passer de old à new (supprime les liens des pins retirés), puis réinitialise les données. | 65 |
| `C:work()` | Ajoute la valeur numérique de chaque pin à sa série, étend l'échelle, supprime les valeurs les plus anciennes au-delà de la taille max. | 32 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/debug/drawGraph.lua`.*
