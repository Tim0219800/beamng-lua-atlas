# `controller_pneumatics_autoLevelSuspension`

*Fichier : `lua/vehicle/controller/pneumatics/autoLevelSuspension.lua` · VM : Véhicule · 344 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** contrôleur `pneumatics/autoLevelSuspension` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`

Contrôleur auxiliaire de suspension pneumatique à mise à niveau automatique (defaultOrder 80). Pour chaque « groupe de contrôle » (une poutre de mesure + un ou plusieurs groupes de poutres d'airbags), il compare la longueur mesurée de la poutre à une longueur cible et ouvre/ferme les vannes de l'actuateur (contrôleur « airbags » par défaut) en proportion de l'écart. Un moddeur l'utilise pour régler la hauteur de caisse (setTargetLength), la monter/descendre manuellement (setAdjustmentRate) ou suspendre temporairement la régulation.

## Exemple

```lua
local als = controller.getController("autoLevelSuspension")
als.setAdjustmentRate("front", 1) -- monte
als.stopAdjusting("front", true) -- fige la nouvelle hauteur comme cible
```

## Remarques

- Clés jbeam lues dans init : actuatorGroups (nom d'une section jbeam, liste de lignes {controlBeamName, controlGroupName (défaut = controlBeamName), beamGroup, defaultTargetLength, debug}), actuationStartDistance (0.01 m), actuationEndDistance (0.06 m), actuationDelay (0 s), minValveOpenAmount (0.15). initSecondStage lit actuatorName ("airbags").
- Longueurs en mètres. L'actuation interpole linéairement entre minValveOpenAmount (écart = actuationStartDistance) et 1 (écart = actuationEndDistance) ; sous actuationStartDistance, la vanne est fermée.
- Sans defaultTargetLength, le groupe passe 1.5 s en calibration après le reset/init puis prend la longueur courante comme cible.
- Les paramètres groupNames des fonctions acceptent un nom de groupe ou une liste de noms ; un nom inconnu logue un avertissement (W) et est ignoré.
- Si le contrôleur actuateur est introuvable, updateFixedStep est remplacé par nop (log E « suspension.init »).
- L'état (getState/setState) utilise des clés <nom du contrôleur>_<groupe>_targetLength et ..._adjustmentRate.
- Bug probable : reset met commitNewHeight à 0 (nombre) alors que partout ailleurs c'est un booléen. En Lua 0 est vrai, donc au premier pas après un reset (hors calibration, sans ajustement manuel) `if controlGroup.commitNewHeight` est vrai et la cible est écrasée par la longueur courante (même avec defaultTargetLength).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `controller_pneumatics_autoLevelSuspension.getAverageFlowRate(groupName)` | Débit moyen d'air dans les groupes de poutres de l'actuateur pour ce groupe. | 113 |
| `controller_pneumatics_autoLevelSuspension.getCurrentLength(groupName)` | Renvoie la dernière longueur mesurée de la poutre de contrôle (0 et log E si inconnu). | 104 |
| `controller_pneumatics_autoLevelSuspension.getState()` | État sauvegardable : longueur cible et taux d'ajustement de chaque groupe (clés préfixées par le nom du contrôleur). | 294 |
| `controller_pneumatics_autoLevelSuspension.getTargetLength(groupName)` | Renvoie la longueur cible d'un groupe (0 et log E si inconnu). | 95 |
| `controller_pneumatics_autoLevelSuspension.init(jbeamData)` | Construit les groupes de contrôle à partir de la section jbeam actuatorGroups et lit les paramètres d'actuation. *(interne)* | 213 |
| `controller_pneumatics_autoLevelSuspension.initSecondStage(jbeamData)` | Récupère le contrôleur d'actuateur (jbeam actuatorName, « airbags » par défaut). Appelé après l'init de tous les contrôleurs. *(interne)* | 282 |
| `controller_pneumatics_autoLevelSuspension.isCalibrating(groupName)` | Vrai tant que le groupe est en calibration initiale (1.5 s). | 131 |
| `controller_pneumatics_autoLevelSuspension.isMoving(groupName)` | Vrai si la valeur absolue du débit moyen dépasse 1e-4. | 122 |
| `controller_pneumatics_autoLevelSuspension.reset()` | Remet cibles, longueurs, timers et vitesses d'ajustement à zéro ; relance la calibration des groupes sans defaultTargetLength. *(interne)* | 196 |
| `controller_pneumatics_autoLevelSuspension.setAdjustmentRate(groupNames, rate)` | Force un ajustement manuel de la hauteur : l'état de vanne est imposé à rate (-1 descend, 1 monte). | 53 |
| `controller_pneumatics_autoLevelSuspension.setMomentaryDecrease(groupNames, decrease)` | Obsolète (log W) : équivaut à setAdjustmentRate(groupes, -1) puis stopAdjusting(groupes, true). | 76 |
| `controller_pneumatics_autoLevelSuspension.setMomentaryIncrease(groupNames, increase)` | Obsolète (log W) : équivaut à setAdjustmentRate(groupes, 1) puis stopAdjusting(groupes, true). | 67 |
| `controller_pneumatics_autoLevelSuspension.setState(data)` | Restaure cibles et taux d'ajustement (valeurs NaN ou non numériques ignorées). | 302 |
| `controller_pneumatics_autoLevelSuspension.setTargetLength(groupNames, targetLength, immediate)` | Fixe la longueur cible (m) des groupes ; avec immediate vrai, la régulation démarre sans attendre actuationDelay. | 85 |
| `controller_pneumatics_autoLevelSuspension.setTemporarilyDisabled(groupNames, disabled)` | Suspend (true) ou reprend (false) la régulation automatique des groupes ; vannes fermées pendant la suspension. | 47 |
| `controller_pneumatics_autoLevelSuspension.stopAdjusting(groupNames, commitNewHeight)` | Arrête l'ajustement manuel ; avec commitNewHeight vrai la longueur courante devient la nouvelle cible. | 60 |
| `controller_pneumatics_autoLevelSuspension.updateFixedStep(dt)` | Pas physique : pour chaque groupe, calibre, applique un ajustement manuel ou régule vers la longueur cible via actuator.setBeamGroupsValveState. *(interne)* | 140 |

### Détail des paramètres

#### `controller_pneumatics_autoLevelSuspension.getAverageFlowRate(groupName)`

Débit moyen d'air dans les groupes de poutres de l'actuateur pour ce groupe.

- `groupName` (*string*) : Nom du groupe.
- **renvoie** : number Débit moyen (unité de l'actuateur).

#### `controller_pneumatics_autoLevelSuspension.getCurrentLength(groupName)`

Renvoie la dernière longueur mesurée de la poutre de contrôle (0 et log E si inconnu).

- `groupName` (*string*) : Nom du groupe.
- **renvoie** : number Longueur en m.

#### `controller_pneumatics_autoLevelSuspension.getState()`

État sauvegardable : longueur cible et taux d'ajustement de chaque groupe (clés préfixées par le nom du contrôleur).

- **renvoie** : table Table d'état (réutilisée entre appels).

#### `controller_pneumatics_autoLevelSuspension.getTargetLength(groupName)`

Renvoie la longueur cible d'un groupe (0 et log E si inconnu).

- `groupName` (*string*) : Nom du groupe.
- **renvoie** : number Longueur cible en m.

#### `controller_pneumatics_autoLevelSuspension.init(jbeamData)`

Construit les groupes de contrôle à partir de la section jbeam actuatorGroups et lit les paramètres d'actuation.

- `jbeamData` (*table*) : Données jbeam du contrôleur.

#### `controller_pneumatics_autoLevelSuspension.initSecondStage(jbeamData)`

Récupère le contrôleur d'actuateur (jbeam actuatorName, « airbags » par défaut). Appelé après l'init de tous les contrôleurs.

- `jbeamData` (*table*) : Données jbeam.

#### `controller_pneumatics_autoLevelSuspension.isCalibrating(groupName)`

Vrai tant que le groupe est en calibration initiale (1.5 s).

- `groupName` (*string*) : Nom du groupe.
- **renvoie** : boolean En calibration ?

#### `controller_pneumatics_autoLevelSuspension.isMoving(groupName)`

Vrai si la valeur absolue du débit moyen dépasse 1e-4.

- `groupName` (*string*) : Nom du groupe.
- **renvoie** : boolean Le groupe bouge ?

#### `controller_pneumatics_autoLevelSuspension.setAdjustmentRate(groupNames, rate)`

Force un ajustement manuel de la hauteur : l'état de vanne est imposé à rate (-1 descend, 1 monte).

- `groupNames` (*string|table<integer, string>*) : Groupe(s) de contrôle.
- `rate` (*number*) : Taux -1..1 (borné).

#### `controller_pneumatics_autoLevelSuspension.setMomentaryDecrease(groupNames, decrease)`

Obsolète (log W) : équivaut à setAdjustmentRate(groupes, -1) puis stopAdjusting(groupes, true).

- `groupNames` (*string|table<integer, string>*) : Groupe(s).
- `decrease` (*boolean*) : Descendre (true) ou arrêter (false).

#### `controller_pneumatics_autoLevelSuspension.setMomentaryIncrease(groupNames, increase)`

Obsolète (log W) : équivaut à setAdjustmentRate(groupes, 1) puis stopAdjusting(groupes, true).

- `groupNames` (*string|table<integer, string>*) : Groupe(s).
- `increase` (*boolean*) : Monter (true) ou arrêter (false).

#### `controller_pneumatics_autoLevelSuspension.setState(data)`

Restaure cibles et taux d'ajustement (valeurs NaN ou non numériques ignorées).

- `data` (*table|nil*) : Table produite par getState.

#### `controller_pneumatics_autoLevelSuspension.setTargetLength(groupNames, targetLength, immediate)`

Fixe la longueur cible (m) des groupes ; avec immediate vrai, la régulation démarre sans attendre actuationDelay.

- `groupNames` (*string|table<integer, string>*) : Groupe(s) de contrôle.
- `targetLength` (*number*) : Longueur cible de la poutre de mesure en m.
- `immediate` (*boolean|nil*) : Contourner le délai d'actuation.

#### `controller_pneumatics_autoLevelSuspension.setTemporarilyDisabled(groupNames, disabled)`

Suspend (true) ou reprend (false) la régulation automatique des groupes ; vannes fermées pendant la suspension.

- `groupNames` (*string|table<integer, string>*) : Groupe(s) de contrôle.
- `disabled` (*boolean*) : Suspendre ?

#### `controller_pneumatics_autoLevelSuspension.stopAdjusting(groupNames, commitNewHeight)`

Arrête l'ajustement manuel ; avec commitNewHeight vrai la longueur courante devient la nouvelle cible.

- `groupNames` (*string|table<integer, string>*) : Groupe(s) de contrôle.
- `commitNewHeight` (*boolean|nil*) : Mémoriser la hauteur atteinte comme cible.

#### `controller_pneumatics_autoLevelSuspension.updateFixedStep(dt)`

Pas physique : pour chaque groupe, calibre, applique un ajustement manuel ou régule vers la longueur cible via actuator.setBeamGroupsValveState.

- `dt` (*number*) : Pas physique en secondes.

## Champs

| Champ | Type | Description |
|---|---|---|
| `defaultOrder` | number | Ordre d'exécution (80). |
| `type` | string | "auxiliary". |

## Appels vers le moteur (C++)

- `obj:` `getBeamLength`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/controller/pneumatics/autoLevelSuspension.lua`.*
