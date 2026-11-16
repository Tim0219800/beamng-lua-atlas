# `controller_tirePressureControl`

*Fichier : `lua/vehicle/controller/tirePressureControl.lua` · VM : Véhicule · 373 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** contrôleur `tirePressureControl` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`

Contrôleur auxiliaire de gonflage/dégonflage centralisé des pneus (CTIS, véhicules tout-terrain/militaires). Les roues sont regroupées en « groupes » (essieux, côtés…) ; le conducteur active/désactive des groupes, puis lance gonflage, dégonflage ou arrêt pour tous les groupes actifs. Le contrôleur modifie directement la pression des groupes de pression des roues (obj:setGroupPressure), égalise les pressions dans un groupe et publie la pression moyenne des groupes actifs et l'état actif de chaque groupe dans electrics. Enregistre un menu radial « Contrôle de pression des pneus ».

## Exemple

```lua
local tpc = controller.getController("tirePressureControl")
tpc.setGroupState("front", true)
tpc.startDeflateActiveGroups()
```

## Remarques

- Clés jbeam lues dans initSecondStage : mode ("manualControl", seul mode géré), inflateMaxFlow (10) et deflateMaxFlow (10) (variation de pression par seconde, unité de obj:getGroupPressure, Pa), activeGroupPressureElectricsName (<nom>_activeGroupPressure), wheelGroups (table d'en-tête : groupName, uiName, uiIcon, wheelNames, maxPressure, minPressure, groupEqualizeFlowLimit ; tous sauf uiIcon obligatoires).
- Electrics publiés : <nom>_activeGroupPressure (pression moyenne lissée des groupes actifs, Pa absolus) et <nom>_<groupe>_isActive (1 ou 0).
- La pression ne descend jamais sous obj:getEnvPressure(). Une roue cassée est ignorée dans la moyenne et dans l'égalisation.
- Les limites minPressure/maxPressure sont absolues : le gonflage (resp. dégonflage) d'une roue s'arrête à maxPressure (resp. minPressure) mais l'égalisation continue.
- Les groupes sont inactifs après reset ; les groupes inconnus donnent un log E dans setGroupState/toggleGroupState.
- init ne fait rien : toute l'initialisation est dans initSecondStage (appelé après l'init de tous les contrôleurs, car il lit wheels.*).
- reset met currentPressure à 0 pour toutes les roues jusqu'à la prochaine lecture dans updateGFX.
- Le menu radial est enregistré une seule fois par VM (hasRegisteredQuickAccess) ; il utilise controller.getControllerSafe(M.name).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `controller_tirePressureControl.getState()` | État sauvegardable : variation de pression active, état actif de chaque groupe et pression de chaque roue (clés préfixées par le nom du contrôleur). | 126 |
| `controller_tirePressureControl.init(jbeamData)` | Ne fait rien (voir initSecondStage). *(interne)* | 280 |
| `controller_tirePressureControl.initSecondStage(jbeamData)` | Construit les groupes de roues, lit débits et limites de pression et enregistre le menu radial. Appelé après l'init des autres contrôleurs. *(interne)* | 283 |
| `controller_tirePressureControl.reset(jbeamData)` | Désactive tous les groupes, arrête les changements de pression et remet le lisseur de l'electric à zéro. *(interne)* | 265 |
| `controller_tirePressureControl.setGroupState(groupName, state)` | Active ou désactive un groupe de roues et affiche un message. Un nom de groupe inconnu logue une erreur et ne fait rien. | 84 |
| `controller_tirePressureControl.setState(data)` | Restaure activations, variation de pression et pressions des roues (bornées entre pression ambiante et maxPressure, roues cassées ignorées). | 148 |
| `controller_tirePressureControl.startDeflateActiveGroups()` | Lance le dégonflage (variation = -deflateMaxFlow par seconde) des groupes actifs et affiche un message. | 116 |
| `controller_tirePressureControl.startInflateActiveGroups()` | Lance le gonflage (variation = +inflateMaxFlow par seconde) des groupes actifs et affiche un message. | 111 |
| `controller_tirePressureControl.stopActiveGroups()` | Arrête le gonflage/dégonflage en cours et affiche un message. | 121 |
| `controller_tirePressureControl.toggleGroupState(groupName)` | Bascule l'activation d'un groupe de roues. | 103 |
| `controller_tirePressureControl.updateGFX(dt)` | Chaque frame : lit les pressions, égalise entre roues d'un groupe, applique gonflage/dégonflage aux groupes actifs et publie les electrics. *(interne)* | 28 |

### Détail des paramètres

#### `controller_tirePressureControl.getState()`

État sauvegardable : variation de pression active, état actif de chaque groupe et pression de chaque roue (clés préfixées par le nom du contrôleur).

- **renvoie** : table Table d'état.

#### `controller_tirePressureControl.init(jbeamData)`

Ne fait rien (voir initSecondStage).

- `jbeamData` (*table*) : Données jbeam.

#### `controller_tirePressureControl.initSecondStage(jbeamData)`

Construit les groupes de roues, lit débits et limites de pression et enregistre le menu radial. Appelé après l'init des autres contrôleurs.

- `jbeamData` (*table*) : Données jbeam.

#### `controller_tirePressureControl.reset(jbeamData)`

Désactive tous les groupes, arrête les changements de pression et remet le lisseur de l'electric à zéro.

- `jbeamData` (*table*) : Données jbeam.

#### `controller_tirePressureControl.setGroupState(groupName, state)`

Active ou désactive un groupe de roues et affiche un message. Un nom de groupe inconnu logue une erreur et ne fait rien.

- `groupName` (*string*) : Nom du groupe (jbeam groupName).
- `state` (*boolean*) : Actif ?

#### `controller_tirePressureControl.setState(data)`

Restaure activations, variation de pression et pressions des roues (bornées entre pression ambiante et maxPressure, roues cassées ignorées).

- `data` (*table|nil*) : Table produite par getState.

#### `controller_tirePressureControl.toggleGroupState(groupName)`

Bascule l'activation d'un groupe de roues.

- `groupName` (*string*) : Nom du groupe.

#### `controller_tirePressureControl.updateGFX(dt)`

Chaque frame : lit les pressions, égalise entre roues d'un groupe, applique gonflage/dégonflage aux groupes actifs et publie les electrics.

- `dt` (*number*) : Pas de temps en secondes.

## Champs

| Champ | Type | Description |
|---|---|---|
| `type` | string | "auxiliary". |

## Appels vers le moteur (C++)

- `obj:` `getEnvPressure`, `getGroupPressure`, `setGroupPressure`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/controller/tirePressureControl.lua`.*
