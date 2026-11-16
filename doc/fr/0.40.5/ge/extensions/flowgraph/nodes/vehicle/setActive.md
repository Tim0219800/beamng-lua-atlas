# `flowgraph_nodes_vehicle_setActive`

*Fichier : `lua/ge/extensions/flowgraph/nodes/vehicle/setActive.lua` · VM : Game Engine (GE) · 34 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/vehicle/setActive")` (fichier sous extensions/ mais pas une extension classique)

Nœud « Set Vehicle Active » (catégorie `once_instant`). Rend un véhicule visible ou invisible (`obj:setActive(1 ou 0)`). Pins d'entrée : `vehId` (défaut : joueur), `active` (bool).

## Classe `C`

Classe du nœud flowgraph (renvoyée par `_flowgraph_createNode(C)`). Champs de définition : name, description, category, pinSchema, tags.

| Méthode | Description | Ligne |
|---|---|---|
| `C:workOnce()` | Applique `setActive` au véhicule selon le pin `active`. | 20 |

## Appels vers le moteur (C++)

- `obj:` `setActive`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/vehicle/setActive.lua`.*
