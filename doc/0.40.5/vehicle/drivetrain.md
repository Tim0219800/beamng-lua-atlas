# `drivetrain`

*Fichier : `lua/vehicle/drivetrain.lua` · VM : Véhicule · 83 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** globale `drivetrain`

Couche de compatibilité ascendante : reproduit l'ancienne API `drivetrain` en lisant les périphériques du nouveau système `powertrain` ('mainEngine' et 'gearbox') à chaque frame. Un vieux mod ou script qui lit drivetrain.rpm, drivetrain.gear, drivetrain.torque… continue de fonctionner. Les nouveaux développements devraient utiliser powertrain directement.

## Exemple

```lua
local rpm = drivetrain.rpm
local gear = drivetrain.gear
drivetrain.shiftToGear(1)
```

## Remarques

- Les champs sont recalculés par updateProxy (updateGFX) à chaque frame depuis powertrain.getDevice('mainEngine') et ('gearbox'). rpm = outputAV1 du moteur * 9.5493 (rad/s vers tr/min).
- updateProxy écrit aussi electrics.values.gear_M = gearIndex de la boîte (clé lue par l'UI).
- Champs jamais mis à jour par updateProxy (restent à leur valeur initiale) : brake, fuelLeakRate, fuel, fuelCapacity, fuelUsage, shifterPosition, wheelCount, avgAV. M.shifterMode est forcé à 2 à chaque frame. M.esc est un tableau de fonctions nop.
- M.engineAV vaut nil si le moteur 'mainEngine' n'existe pas (les autres champs ont un repli à 0) ; init ne le remet pas à zéro.
- setShifterMode : seul le mode 2 donne 'arcade', tout autre mode donne 'realistic' (les modes 0, 1 et 3 ne sont pas distingués).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `drivetrain.init()` | Appelé à l'init et au reset : assigne M.wheels et remet rpm, engineDisabled, gear, torqueTransmission et engineLoad à zéro. *(interne)* | 66 |
| `drivetrain.reset()` | Identique à init. *(interne)* | 66 |
| `drivetrain.setShifterMode(v)` | Fixe le mode de boîte : mode 2 donne 'arcade', tout autre valeur 'realistic' (controller.mainController.setGearboxMode). | 49 |
| `drivetrain.shiftToGear(gear)` | Demande un rapport via controller.mainController.shiftToGearIndex. | 62 |
| `drivetrain.updateGFX()` | Appelé chaque frame (updateProxy) : recopie l'état du moteur principal et de la boîte dans les champs drivetrain. *(interne)* | 31 |

### Détail des paramètres

#### `drivetrain.setShifterMode(v)`

Fixe le mode de boîte : mode 2 donne 'arcade', tout autre valeur 'realistic' (controller.mainController.setGearboxMode).

- `v` (*integer*) : 0 manuel, 1 manuel embrayage auto, 2 arcade, 3 automatique réaliste (commentaire du code).

#### `drivetrain.shiftToGear(gear)`

Demande un rapport via controller.mainController.shiftToGearIndex.

- `gear` (*integer*) : Index de rapport voulu.

#### `drivetrain.updateGFX()`

Appelé chaque frame (updateProxy) : recopie l'état du moteur principal et de la boîte dans les champs drivetrain.


## Champs

| Champ | Type | Description |
|---|---|---|
| `avgAV` | number | Jamais mis à jour. |
| `brake` | number | Jamais mis à jour (reste à 0). |
| `engineAV` | number|nil | Vitesse angulaire du moteur (rad/s) ou nil sans moteur principal. |
| `engineDisabled` | boolean | isDisabled du moteur principal. |
| `engineLoad` | number | engineLoad du moteur principal. |
| `esc` | table | Faux objet ESC de compatibilité : update, updateGFX, toggleESCMode, getCarData valent nop, escPulse = 0. |
| `fuel` | number | Valeur par défaut 100, jamais mise à jour. |
| `fuelCapacity` | number | Valeur par défaut 100, jamais mise à jour. |
| `fuelLeakRate` | number | Débit de fuite de carburant (L/s) ; jamais mis à jour. |
| `fuelUsage` | number | Jamais mis à jour. |
| `gear` | integer | Index de rapport de la boîte ('gearbox'). |
| `rpm` | number | Régime moteur en tr/min. |
| `shifterMode` | integer | Toujours 2 (arcade) après updateGFX. |
| `shifterPosition` | number | Jamais mis à jour. |
| `throttle` | number | Copie de electrics.values.throttle. |
| `torque` | number | Couple de sortie du moteur principal (outputTorque1, N·m). |
| `torqueTransmission` | number | Couple de sortie de la boîte (N·m). |
| `wheelCount` | integer | Jamais mis à jour. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/drivetrain.lua`.*
