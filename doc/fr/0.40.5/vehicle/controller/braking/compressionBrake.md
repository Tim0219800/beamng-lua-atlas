# `controller_braking_compressionBrake`

*Fichier : `lua/vehicle/controller/braking/compressionBrake.lua` · VM : Véhicule · 146 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** contrôleur `braking/compressionBrake` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`

Contrôleur auxiliaire de frein moteur à décompression (« Jake brake » de camion). Il maintient un coefficient de 0 à 1 et des niveaux préréglés, transmet au moteur `setCompressionBrakeCoef` quand l'accélérateur est relâché, et publie quatre electrics (réglage, valeur réelle, activé, index de niveau). Il force aussi l'agressivité de conduite du contrôleur principal à 1 pendant que le frein est actif.

## Exemple

```lua
local cb = controller.getControllerSafe("compressionBrake")
cb.changeCompressionBrakeLevel(1)
cb.toggleCompressionBrakeState()
```

## Remarques

- Clés jbeam lues par init : `controlledEngine` ("mainEngine"), `electricsNameActual`, `electricsNameSetting`, `electricsNameIsEnabled`, `electricsNameLevelIndex` (par défaut `<moteur>_compressionBrake_actual|setting|isEnabled|levelIndex`), `compressionBrakeLevels` ({0.33, 0.66, 1.0}), `clutchDisableElectricsName` ("clutchRatio").
- Valeur réelle = coefficient × (1 - sign(requestedThrottle)) : à 0 dès que l'accélérateur est demandé ; forcée à 0 aussi si l'electrics du débrayage est inférieur à 1.
- Si le moteur est introuvable, init log une erreur et remplace `updateGFX` par `nop`.
- Au démarrage, le niveau actif est le dernier (le plus fort) et le coefficient est à 0 (frein éteint).
- Ce contrôleur est déplacé : l'ancien nom `compressionBrake` est redirigé vers `braking/compressionBrake`.
- État sauvegardé sous les clés `<nom>Coef` et `<nom>LevelIndex`.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `controller_braking_compressionBrake.changeCompressionBrakeLevel(indexChange)` | Monte ou descend d'un nombre de niveaux (borné) et applique le coefficient du niveau. | 33 |
| `controller_braking_compressionBrake.getState()` | Renvoie le coefficient et l'index de niveau pour la sauvegarde d'état. | 79 |
| `controller_braking_compressionBrake.init(jbeamData)` | Retrouve le moteur contrôlé, les noms d'electrics et les niveaux depuis le jbeam. *(interne)* | 106 |
| `controller_braking_compressionBrake.reset(jbeamData)` | Force la prochaine transmission du coefficient au moteur. *(interne)* | 74 |
| `controller_braking_compressionBrake.setCompressionBrakeCoef(coef, silent)` | Fixe directement le coefficient du frein moteur (borné à 0..1) et affiche un message UI sauf si silent. | 26 |
| `controller_braking_compressionBrake.setCompressionBrakeLevel(level, silent)` | Choisit un niveau par son index (borné à 1..nombre de niveaux) et applique son coefficient. | 38 |
| `controller_braking_compressionBrake.setState(data)` | Restaure l'index de niveau et le coefficient (valeurs validées, silencieusement). | 87 |
| `controller_braking_compressionBrake.toggleCompressionBrakeState()` | Coupe le frein s'il est actif, sinon l'active au niveau mémorisé. | 43 |
| `controller_braking_compressionBrake.updateGFX(dt)` | Chaque frame : calcule le coefficient réel, le transmet au moteur quand il change, gère l'override d'agressivité du contrôleur principal et met à jour les electrics. *(interne)* | 51 |

### Détail des paramètres

#### `controller_braking_compressionBrake.changeCompressionBrakeLevel(indexChange)`

Monte ou descend d'un nombre de niveaux (borné) et applique le coefficient du niveau.

- `indexChange` (*integer*) : Variation d'index (+1, -1...).

#### `controller_braking_compressionBrake.getState()`

Renvoie le coefficient et l'index de niveau pour la sauvegarde d'état.

- **renvoie** : table Table d'état (clés `<nom>Coef`, `<nom>LevelIndex`).

#### `controller_braking_compressionBrake.init(jbeamData)`

Retrouve le moteur contrôlé, les noms d'electrics et les niveaux depuis le jbeam.

- `jbeamData` (*table*) : Données jbeam du contrôleur.

#### `controller_braking_compressionBrake.reset(jbeamData)`

Force la prochaine transmission du coefficient au moteur.

- `jbeamData` (*table*) : Données jbeam.

#### `controller_braking_compressionBrake.setCompressionBrakeCoef(coef, silent)`

Fixe directement le coefficient du frein moteur (borné à 0..1) et affiche un message UI sauf si silent.

- `coef` (*number*) : Coefficient 0 à 1.
- `silent` (*boolean|nil*) : true pour ne pas afficher de message.

#### `controller_braking_compressionBrake.setCompressionBrakeLevel(level, silent)`

Choisit un niveau par son index (borné à 1..nombre de niveaux) et applique son coefficient.

- `level` (*integer*) : Index de niveau (1 = premier).
- `silent` (*boolean|nil*) : true pour ne pas afficher de message.

#### `controller_braking_compressionBrake.setState(data)`

Restaure l'index de niveau et le coefficient (valeurs validées, silencieusement).

- `data` (*table|nil*) : Table d'état.

#### `controller_braking_compressionBrake.updateGFX(dt)`

Chaque frame : calcule le coefficient réel, le transmet au moteur quand il change, gère l'override d'agressivité du contrôleur principal et met à jour les electrics.

- `dt` (*number*) : Pas de temps en secondes.

## Champs

| Champ | Type | Description |
|---|---|---|
| `type` | string | "auxiliary". |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/controller/braking/compressionBrake.lua`.*
