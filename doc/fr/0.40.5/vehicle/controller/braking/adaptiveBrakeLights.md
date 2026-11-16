# `controller_braking_adaptiveBrakeLights`

*Fichier : `lua/vehicle/controller/braking/adaptiveBrakeLights.lua` · VM : Véhicule · 177 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** contrôleur `braking/adaptiveBrakeLights` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`

Contrôleur auxiliaire qui calcule la valeur des feux stop (`electrics.values.brakelights` par défaut) en plus de la simple pédale de frein : clignotement pendant l'ABS, allumage lors d'une intervention de l'ESC au-dessus de 14 m/s, allumage quand la décélération (régénération « one pedal ») dépasse un seuil, ajout du freinage par récupération, et allumage automatique des feux de détresse après un freinage d'urgence jusqu'à l'arrêt. Ordre d'appel : `defaultOrder = 900` (tard).

## Remarques

- Clés jbeam lues par init : `electricsName` ("brakelights"), `indicateESCUsageWithBrakelights` (true), `activateHazardsAfterEmergencyBraking` (true), `hazardArmSpeed` (10 m/s), `hazardActivateSpeed` (3 m/s), `hazardDeactivateThrottle` (0.3), `hazardDeactivateSpeed` (3 m/s), `blinkOnTime` (0.1 s), `blinkOffTime` (0.1 s), `activateBrakeLightsFromDecel` (true), `decelThreshold` (1.3 m/s², seuil légal britannique d'après le commentaire).
- Electrics lus : brake, absActive, escActive, isYCBrakeActive (prioritaire sur escActive s'il existe), wheelspeed, throttle, regenFromOnePedal, regenFromBrake. Électrics écrit : la valeur de `electricsName`, arrondie au supérieur (0 ou 1).
- Le champ jbeam n'a pas d'accès sûr : updateGFX utilise `electrics.values.wheelspeed` et `electrics.values.brake` sans valeur par défaut dans certains calculs ; ils doivent exister.
- Les feux de détresse sont activés par `electrics.set_warn_signal(true)`, désactivés quand l'accélérateur dépasse le seuil à vitesse suffisante.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `controller_braking_adaptiveBrakeLights.init(jbeamData)` | Lit les paramètres jbeam et crée les lisseurs (ABS, ESC, accélération). *(interne)* | 139 |
| `controller_braking_adaptiveBrakeLights.reset()` | Éteint les feux de détresse déclenchés par ce contrôleur et remet à zéro les minuteurs, lisseurs et verrous. *(interne)* | 122 |
| `controller_braking_adaptiveBrakeLights.setParameters(parameters)` | Active ou désactive le comportement adaptatif ; désactivé, les feux suivent simplement le frein. | 165 |
| `controller_braking_adaptiveBrakeLights.updateGFX(dt)` | Chaque frame : calcule la valeur des feux stop (frein + ESC + décélération + récupération, limitée à 1), applique le clignotement ABS et gère les feux de détresse de freinage d'urgence. *(interne)* | 48 |

### Détail des paramètres

#### `controller_braking_adaptiveBrakeLights.init(jbeamData)`

Lit les paramètres jbeam et crée les lisseurs (ABS, ESC, accélération).

- `jbeamData` (*table*) : Données jbeam du contrôleur.

#### `controller_braking_adaptiveBrakeLights.setParameters(parameters)`

Active ou désactive le comportement adaptatif ; désactivé, les feux suivent simplement le frein.

- `parameters` (*table*) : Champ facultatif : isEnabled (boolean).

#### `controller_braking_adaptiveBrakeLights.updateGFX(dt)`

Chaque frame : calcule la valeur des feux stop (frein + ESC + décélération + récupération, limitée à 1), applique le clignotement ABS et gère les feux de détresse de freinage d'urgence.

- `dt` (*number*) : Pas de temps en secondes.

## Champs

| Champ | Type | Description |
|---|---|---|
| `defaultOrder` | number | 900 : rang d'appel par défaut, tard dans la liste triée. |
| `type` | string | "auxiliary". |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/controller/braking/adaptiveBrakeLights.lua`.*
