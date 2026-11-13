# `jbeam_sections_licenseplatesSkins`

*Fichier : `lua/common/jbeam/sections/licenseplatesSkins.lua` · VM : Commun (GE + véhicule) · 75 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("jbeam/sections/licenseplatesSkins")`

Traite deux familles de pièces actives : plaques d'immatriculation et skins. Une pièce dont un slotType contient '_licenseplate' (ou ayant licenseplateFormat) active la plaque ; les formats utilisés sont collectés (défaut '30-15'). Une pièce de design de plaque (slotType contenant 'licenseplate_design') fournit licenseplate_path. Une pièce de skin (slotType contenant 'skin_' ou égal à 'paint_design') appelle vehicleObj:setSkin("<slot>.<nom du skin>") et peut imposer des couleurs par défaut. À la fin, si une plaque est utilisée, core_vehicles.setPlateText est appelé.

## Remarques

- Le nom du skin est part.skinName, sinon part.globalSkin, sinon chaîne vide ; le slot de skin est part.skinType (si chaîne non vide) sinon le slotType ; 'paint_design' ou un slotType non chaîne donne un préfixe vide.
- Les couleurs par défaut (part.default_color, default_color_2, default_color_3) sont envoyées via core_vehicle_manager.setVehicleColorsNames.
- Le texte de plaque vient de config.licenseName, sinon false (le gestionnaire génère le texte).
- slotType peut être une chaîne ou une table de chaînes.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `jbeam_sections_licenseplatesSkins.process(objID, vehicleObj, config, activePartsData)` | Parcourt les pièces actives pour configurer plaque d'immatriculation et skins du véhicule. *(interne)* | 11 |

### Détail des paramètres

#### `jbeam_sections_licenseplatesSkins.process(objID, vehicleObj, config, activePartsData)`

Parcourt les pièces actives pour configurer plaque d'immatriculation et skins du véhicule.

- `objID` (*integer*) : Identifiant du véhicule.
- `vehicleObj` (*userdata*) : Objet véhicule moteur.
- `config` (*table|nil*) : Configuration du véhicule (licenseName).
- `activePartsData` (*table<string, table>|nil*) : Pièces actives (nom -> données de pièce).

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/jbeam/sections/licenseplatesSkins.lua`.*
