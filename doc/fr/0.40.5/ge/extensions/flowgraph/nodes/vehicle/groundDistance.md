# `flowgraph_nodes_vehicle_groundDistance`

*Fichier : `lua/ge/extensions/flowgraph/nodes/vehicle/groundDistance.lua` · VM : Game Engine (GE) · 54 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/vehicle/groundDistance")` (fichier sous extensions/ mais pas une extension classique)

Nœud « Distance From Ground » (catégorie `repeat_instant`, tags gameplay/utils). Mesure la distance entre le point le plus bas de la boîte englobante orientée du véhicule (`getSpawnWorldOOBB`, 8 coins) et le terrain en dessous (`be:getSurfaceHeightBelow`). Pins d'entrée : `vehId`, `zOffset` (caché, défaut 10 : hauteur de départ du rayon). Sortie : `lowestDistance` (number, mètres). Option `data.drawDebug` pour afficher les valeurs.

## Remarques

- Si aucun rayon ne touche le sol, `lowestDistance` vaut `math.huge`.
- `vehId` est obligatoire (pas de repli sur le joueur).

## Classe `C`

Classe du nœud flowgraph (renvoyée par `_flowgraph_createNode(C)`). Champs de définition : name, description, category, pinSchema, tags.

| Méthode | Description | Ligne |
|---|---|---|
| `C:init()` | Constructeur ; `data.drawDebug = false`. | 25 |
| `C:work()` | Lance un rayon vers le bas depuis chaque coin de l'OOBB et met la plus petite distance au sol dans `lowestDistance`. | 29 |

## Appels vers le moteur (C++)

- `be:` `getSurfaceHeightBelow`
- `debugDrawer:` `drawTextAdvanced`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/vehicle/groundDistance.lua`.*
