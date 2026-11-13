# `jbeam_sections_colors`

*Fichier : `lua/common/jbeam/sections/colors.lua` · VM : Commun (GE + véhicule) · 32 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("jbeam/sections/colors")`

Applique la couleur de carrosserie héritée de la configuration du véhicule (vehicleConfig.colors, ancien format) à l'objet véhicule : colors[1] -> vehicleObj.color, colors[2] -> colorPalette0, colors[3] -> colorPalette1. Chaque entrée est un tableau {r, v, b, a} converti en couleur linéaire. Remplacé par jbeam/sections/paints pour le format actuel (paints).

## Remarques

- Aucune validation : une entrée de moins de 4 composantes donnera des nil dans ColorF.
- Appelé dans loadBundle côté GE avant paints.process, qui peut écraser les mêmes propriétés.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `jbeam_sections_colors.process(vehicleObj, vehicleConfig, vehicle)` | Définit color, colorPalette0 et colorPalette1 de l'objet véhicule à partir de vehicleConfig.colors s'il existe. *(interne)* | 10 |

### Détail des paramètres

#### `jbeam_sections_colors.process(vehicleObj, vehicleConfig, vehicle)`

Définit color, colorPalette0 et colorPalette1 de l'objet véhicule à partir de vehicleConfig.colors s'il existe.

- `vehicleObj` (*userdata*) : Objet véhicule moteur.
- `vehicleConfig` (*table*) : Configuration du véhicule (champ colors).
- `vehicle` (*table*) : Données jbeam (non utilisé).

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/jbeam/sections/colors.lua`.*
