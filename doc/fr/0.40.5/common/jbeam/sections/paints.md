# `jbeam_sections_paints`

*Fichier : `lua/common/jbeam/sections/paints.lua` · VM : Commun (GE + véhicule) · 41 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("jbeam/sections/paints")`

Applique les peintures du véhicule : vehicleConfig.paints (ou, à défaut, vehicleConfig.colors converti par convertVehicleColorsToPaints) donne jusqu'à trois peintures. Pour chacune, validateVehiclePaint la vérifie puis baseColor devient la couleur de l'objet (paints[1] -> color, paints[2] -> colorPalette0, paints[3] -> colorPalette1). Toute la liste est ensuite envoyée au moteur via setMetallicPaintData pour les paramètres métalliques/clearcoat.

## Remarques

- baseColor est un tableau {r, v, b, a}.
- convertVehicleColorsToPaints et validateVehiclePaint sont des fonctions globales définies ailleurs.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `jbeam_sections_paints.process(vehicleObj, vehicleConfig, vehicle)` | Applique les peintures du config à l'objet véhicule et transmet les données de peinture métallique. *(interne)* | 10 |

### Détail des paramètres

#### `jbeam_sections_paints.process(vehicleObj, vehicleConfig, vehicle)`

Applique les peintures du config à l'objet véhicule et transmet les données de peinture métallique.

- `vehicleObj` (*userdata*) : Objet véhicule moteur.
- `vehicleConfig` (*table*) : Configuration (paints ou colors).
- `vehicle` (*table*) : Données jbeam (non utilisé).

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/jbeam/sections/paints.lua`.*
