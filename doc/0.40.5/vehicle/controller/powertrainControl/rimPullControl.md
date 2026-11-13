# `controller_powertrainControl_rimPullControl`

*Fichier : `lua/vehicle/controller/powertrainControl/rimPullControl.lua` · VM : Véhicule · 48 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** contrôleur `powertrainControl/rimPullControl` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`

Contrôleur auxiliaire de « rim pull » (commande de traction sur jante, ex. engins ferroviaires/tracteurs) : un axe d'entrée input.rimPull (0..1) réduit progressivement l'embrayage de la turbine du convertisseur de couple (de 1 à 0.2 entre 0 et 0.5) puis ajoute du frein (de 0 à 1 entre 0.5 et 1). Il s'exécute avant vehicleController (defaultOrder 40) pour modifier input.brake avant son utilisation.

## Remarques

- Clé jbeam lue : torqueConverterName ("torqueConverter").
- Si le convertisseur est introuvable, log D et updateGFX devient nop.
- input.rimPull est lu mais aucune action d'entrée dans ce fichier ne l'alimente ; il doit venir des actions/bindings.
- Le contrôleur modifie input.brake (max avec la sortie frein) et relevantTorqueConverter.impellerClutchCoef.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `controller_powertrainControl_rimPullControl.init(jbeamData)` | Récupère le convertisseur de couple (jbeam torqueConverterName). *(interne)* | 34 |
| `controller_powertrainControl_rimPullControl.reset(jbeamData)` | Ne fait rien. *(interne)* | 31 |
| `controller_powertrainControl_rimPullControl.updateGFX(dt)` | Chaque frame : convertit input.rimPull en consigne d'embrayage de turbine et en frein additionnel. *(interne)* | 16 |

### Détail des paramètres

#### `controller_powertrainControl_rimPullControl.init(jbeamData)`

Récupère le convertisseur de couple (jbeam torqueConverterName).

- `jbeamData` (*table*) : Données jbeam du contrôleur.

#### `controller_powertrainControl_rimPullControl.reset(jbeamData)`

Ne fait rien.

- `jbeamData` (*table*) : Données jbeam.

#### `controller_powertrainControl_rimPullControl.updateGFX(dt)`

Chaque frame : convertit input.rimPull en consigne d'embrayage de turbine et en frein additionnel.

- `dt` (*number*) : Pas de temps en secondes.

## Champs

| Champ | Type | Description |
|---|---|---|
| `defaultOrder` | number | Ordre d'exécution (40). |
| `type` | string | "auxiliary". |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/controller/powertrainControl/rimPullControl.lua`.*
