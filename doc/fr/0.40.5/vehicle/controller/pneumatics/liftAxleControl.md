# `controller_pneumatics_liftAxleControl`

*Fichier : `lua/vehicle/controller/pneumatics/liftAxleControl.lua` · VM : Véhicule · 163 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** contrôleur `pneumatics/liftAxleControl` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`

Contrôleur auxiliaire de relevage d'essieu pneumatique (remorques/camions). Deux modes : « lift » (essieu relevé : airbags de levage gonflés, airbags principaux vidés) et « drop » (essieu posé : l'inverse), pilotés via deux contrôleurs d'actuateurs (airbags). En mode drop, la pression d'alimentation maximale des airbags principaux peut être changée dynamiquement (charge portée par l'essieu). Publie les pressions moyennes relatives et le mode dans electrics.values.

## Exemple

```lua
local lac = controller.getController("liftAxleControl")
lac.toggleMode()
lac.setMaximumSupplyPressure(500000) -- Pa absolus
```

## Remarques

- Clés jbeam lues : defaultMaximumSupplyPressure (0), liftAirbagsGroupName, mainAirbagsGroupName, minimumSupplyPressure (0), maximumSupplyPressure (1000000), maximumSupplyPressureChangeRate (1000 Pa/s), mainAirbagsPressureEletricsName, liftAirbagsPressureEletricsName, liftAxleControlModeEletricsName (noms par défaut dérivés de M.name : _main_airbags_pressure_avg, _lift_airbags_pressure_avg, _lift_axle_mode), actuatorsControllerNameLift et actuatorsControllerNameMain (lus dans initLastStage).
- Le mode initial est « lift » (setMode appelé en initLastStage). electrics ...lift_axle_mode vaut 1 en mode drop, 0 en lift.
- La pression d'alimentation maximale évolue chaque frame de maximumSupplyPressureChangeRate*dt, bornée entre max(pression ambiante, minimumSupplyPressure) et maximumSupplyPressure (jbeam).
- Si un des contrôleurs d'actuateurs est introuvable, log E et updateGFX devient nop.
- reset met maximumSupplyPressureChangeRate à 0 (et non à la valeur jbeam) : après un reset la pression ne bouge plus tant qu'on n'appelle pas setMaximumSupplyPressureChangeRate. Incohérence probable avec init (valeur 1000 par défaut).
- Note de source : M.initSecondStage n'existe pas ici malgré un commentaire dans le code ; la fonction réellement exportée est initLastStage.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `controller_pneumatics_liftAxleControl.getState()` | État sauvegardable : mode, pression maximale d'alimentation, taux de variation (clés préfixées par le nom du contrôleur). | 115 |
| `controller_pneumatics_liftAxleControl.init(jbeamData)` | Lit les clés jbeam, noms de groupes d'airbags et noms d'electrics. *(interne)* | 77 |
| `controller_pneumatics_liftAxleControl.initLastStage(jbeamData)` | Récupère les deux contrôleurs d'actuateurs puis passe en mode « lift ». *(interne)* | 95 |
| `controller_pneumatics_liftAxleControl.reset(jbeamData)` | Met le taux de variation de pression d'alimentation à 0. *(interne)* | 73 |
| `controller_pneumatics_liftAxleControl.setMaximumSupplyPressure(maxSupplyPressure)` | Fixe la pression maximale d'alimentation des airbags principaux (Pa absolus), appliquée en mode drop. | 65 |
| `controller_pneumatics_liftAxleControl.setMaximumSupplyPressureChangeRate(maxSupplyPressureChangeRate)` | Fixe la vitesse de variation de cette pression maximale (Pa/s, signée). | 69 |
| `controller_pneumatics_liftAxleControl.setMode(mode)` | Choisit le mode « lift » ou « drop » et ouvre/ferme les vannes des deux groupes d'airbags en conséquence. | 46 |
| `controller_pneumatics_liftAxleControl.setState(data)` | Restaure pression, taux et mode (valeurs NaN ignorées). | 122 |
| `controller_pneumatics_liftAxleControl.toggleMode()` | Bascule entre drop et lift. | 57 |
| `controller_pneumatics_liftAxleControl.updateGFX(dt)` | Chaque frame : applique la pression d'alimentation maximale en mode drop, la fait évoluer et met à jour les electrics de pressions et de mode. *(interne)* | 32 |

### Détail des paramètres

#### `controller_pneumatics_liftAxleControl.getState()`

État sauvegardable : mode, pression maximale d'alimentation, taux de variation (clés préfixées par le nom du contrôleur).

- **renvoie** : table Table d'état.

#### `controller_pneumatics_liftAxleControl.init(jbeamData)`

Lit les clés jbeam, noms de groupes d'airbags et noms d'electrics.

- `jbeamData` (*table*) : Données jbeam du contrôleur.

#### `controller_pneumatics_liftAxleControl.initLastStage(jbeamData)`

Récupère les deux contrôleurs d'actuateurs puis passe en mode « lift ».

- `jbeamData` (*table*) : Données jbeam.

#### `controller_pneumatics_liftAxleControl.reset(jbeamData)`

Met le taux de variation de pression d'alimentation à 0.

- `jbeamData` (*table*) : Données jbeam.

#### `controller_pneumatics_liftAxleControl.setMaximumSupplyPressure(maxSupplyPressure)`

Fixe la pression maximale d'alimentation des airbags principaux (Pa absolus), appliquée en mode drop.

- `maxSupplyPressure` (*number*) : Pression en Pa.

#### `controller_pneumatics_liftAxleControl.setMaximumSupplyPressureChangeRate(maxSupplyPressureChangeRate)`

Fixe la vitesse de variation de cette pression maximale (Pa/s, signée).

- `maxSupplyPressureChangeRate` (*number*) : Variation en Pa/s.

#### `controller_pneumatics_liftAxleControl.setMode(mode)`

Choisit le mode « lift » ou « drop » et ouvre/ferme les vannes des deux groupes d'airbags en conséquence.

- `mode` (*string*) : "lift" ou "drop".

#### `controller_pneumatics_liftAxleControl.setState(data)`

Restaure pression, taux et mode (valeurs NaN ignorées).

- `data` (*table|nil*) : Table produite par getState.

#### `controller_pneumatics_liftAxleControl.updateGFX(dt)`

Chaque frame : applique la pression d'alimentation maximale en mode drop, la fait évoluer et met à jour les electrics de pressions et de mode.

- `dt` (*number*) : Pas de temps en secondes.

## Champs

| Champ | Type | Description |
|---|---|---|
| `type` | string | "auxiliary". |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/controller/pneumatics/liftAxleControl.lua`.*
