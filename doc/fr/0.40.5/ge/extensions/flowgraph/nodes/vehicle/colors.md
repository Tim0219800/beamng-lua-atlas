# `flowgraph_nodes_vehicle_colors`

*Fichier : `lua/ge/extensions/flowgraph/nodes/vehicle/colors.lua` · VM : Game Engine (GE) · 72 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/vehicle/colors")` (fichier sous extensions/ mais pas une extension classique)

Nœud « Set Vehicle Colors » (catégorie `repeat_instant`, tags colors). Change les trois peintures du véhicule : `color1` (principale, `obj.color`), `color2` (`colorPalette0`), `color3` (`colorPalette1`). Chaque pin `color` est une table de 8 nombres : les 4 premiers = couleur de base (r,g,b,a), les 4 suivants = données métalliques passées à `createVehiclePaint`. Finit par `obj:setMetallicPaintData`. Pin `vehId` : si absent, véhicule joueur (`be:getPlayerVehicleID(0)`).

## Remarques

- Appelé à chaque frame tant que le flux est actif.
- Pas de test sur `obj` nil.
- La couleur est convertie en linéaire (`asLinear4F`) avant d'être posée.

## Classe `C`

Classe du nœud flowgraph (renvoyée par `_flowgraph_createNode(C)`). Champs de définition : name, description, category, pinSchema, tags.

| Méthode | Description | Ligne |
|---|---|---|
| `C:postInit()` | Marque les trois pins couleur avec `colorSetup = {vehicleColor = true}` (sélecteur de peinture véhicule dans l'éditeur). | 29 |
| `C:work()` | Crée une peinture par pin couleur non nil, l'applique à l'objet véhicule et envoie la liste des peintures avec `setMetallicPaintData`. | 43 |

## Appels vers le moteur (C++)

- `be:` `getPlayerVehicleID`
- `obj:` `setMetallicPaintData`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/vehicle/colors.lua`.*
