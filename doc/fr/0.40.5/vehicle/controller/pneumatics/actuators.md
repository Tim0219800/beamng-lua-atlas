# `controller_pneumatics_actuators`

*Fichier : `lua/vehicle/controller/pneumatics/actuators.lua` · VM : Véhicule · 750 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** contrôleur `pneumatics/actuators` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`

Contrôleur auxiliaire (type "auxiliary", defaultOrder 50) de vérins pneumatiques avec physique de gaz simplifiée : un réservoir d'air (energyStorage) alimente, via des vannes, des « tampons virtuels » (cross-flow groups) puis les poutres pressurées d'un groupe. Les débits dépendent des différences de pression et des sections de passage, l'énergie de l'air est conservée (PV = e) et la consommation d'air vide le réservoir. Une vanne par groupe (valveState -1..1) ouvre l'admission (> 0) ou l'échappement ; elle peut être lue depuis une valeur electrics. Il joue aussi des sons selon le débit.

## Exemple

```lua
local a = controller.getControllerSafe('pneumatics/actuators')
a.setBeamGroupValveState('liftAxle', 1)    -- admission
local p = a.getAveragePressure('liftAxle') -- en Pa absolus
```

## Remarques

- Unités : pressions en pascals (absolues), débits en m³/s, rayons en m. Une valeur electrics <nomContrôleur>_<groupe>_pressure_avg reçoit la pression moyenne relative (moyenne - pression ambiante).
- Clés jbeam du contrôleur (défaut) : airTankName ("mainAirTank"), pressuredBeams (nom de table v.data avec beamName, groupName, crossFlowTag (défaut = groupName), supplyHoseRadius, supplyValveRadius, maxSupplyPressure, maxSupplyPressurePSI, valveStateElectricsName, disableAirConsumption, debug), crossFlowGroups (nom de table avec crossFlowTag, virtualBufferCapacity, debug), supplyHoseRadius (0.0075 m), supplyValveRadius (0.2 * supplyHoseRadius), maxSupplyPressure (infini), maxSupplyPressurePSI (converti en pression absolue + 101325 Pa), virtualBufferCapacity (0.005 m³), pressureDumpFlowRate (0.01 m³/s), crossFlowBetweenBeams (booléen), debug (booléen), groupSounds (nom de table avec groupName, node, volume/volumeIncrease/volumeDecrease, soundIncrease, soundDecrease, startFlowRateThreshold…, stopFlowRateThreshold…, flowRateVolumeFactor…).
- Champs de poutre lus : name, pressure (pression par défaut), maxPressure, beamSpring, beamDamp, surface (section en m²), lengthOffset.
- Si le réservoir est introuvable, une erreur est journalisée et updateFixedStep devient nop ; mais updateGFX reste actif et lit des données non initialisées (déduit du code : à éviter).
- valveState > 0 : le tampon est alimenté par le réservoir (limité par maxSupplyPressure) ; valveState <= 0 : le tampon se vide vers l'atmosphère. Si valveState = 0 (et pas de crossFlowBetweenBeams) aucun échange avec les poutres.
- Un cross-flow group implicite est créé (avec un avertissement) si un crossFlowTag n'est pas déclaré dans crossFlowGroups.
- Le calcul est exécuté à chaque pas physique (updateFixedStep) et peut être coûteux.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `controller_pneumatics_actuators.getAverageFlowRate(groupName)` | Renvoie le débit moyen vers les poutres d'un groupe (m³/s ; 0 si introuvable). | 210 |
| `controller_pneumatics_actuators.getAveragePressure(groupName)` | Renvoie la pression moyenne des poutres d'un groupe (Pa absolus ; 0 si introuvable). | 219 |
| `controller_pneumatics_actuators.getBeamGroupsAverageFlowRate(groupNames)` | Renvoie la moyenne des débits moyens de plusieurs groupes. | 228 |
| `controller_pneumatics_actuators.getValveState(groupName)` | Renvoie l'état de la vanne d'un groupe (0 si introuvable). | 201 |
| `controller_pneumatics_actuators.init(jbeamData)` | Construit groupes de poutres, tampons virtuels et paramètres de débit à partir du jbeam et retrouve le réservoir d'air. *(interne)* | 528 |
| `controller_pneumatics_actuators.initSounds(jbeamData)` | Crée les sources sonores d'augmentation/diminution de débit pour chaque groupe. Appelé par le gestionnaire de contrôleurs. *(interne)* | 683 |
| `controller_pneumatics_actuators.reset()` | Remet pressions, énergies stockées, vannes et tampons virtuels à leur état initial. *(interne)* | 500 |
| `controller_pneumatics_actuators.resetSounds()` | Coupe le volume des sons et réinitialise leur état. *(interne)* | 717 |
| `controller_pneumatics_actuators.setBeamGroupCrossFlowTag(groupName, crossFlowTag)` | Change le tampon virtuel (cross-flow group) auquel un groupe est relié ; réinitialise le tampon si le groupe est le premier à l'utiliser. | 169 |
| `controller_pneumatics_actuators.setBeamGroupMaximumSupplyPressure(groupName, maxSupplyPressure)` | Fixe la pression d'alimentation maximale d'un groupe. | 154 |
| `controller_pneumatics_actuators.setBeamGroupValveState(groupName, valveState)` | Fixe l'état de la vanne d'un groupe. | 122 |
| `controller_pneumatics_actuators.setBeamGroupsMaximumSupplyPressure(groupNames, maxSupplyPressure)` | Même chose pour plusieurs groupes. | 163 |
| `controller_pneumatics_actuators.setBeamGroupsValveState(groupNames, valveState)` | Même chose pour plusieurs groupes. | 131 |
| `controller_pneumatics_actuators.toggleBeamGroupValveState(groupName)` | Bascule la vanne entre 1 (admission) et -1 (échappement) : si l'état courant est < 0 elle passe à 1, sinon à -1. | 137 |
| `controller_pneumatics_actuators.toggleBeamGroupsValveState(groupNames)` | Même chose pour plusieurs groupes. | 148 |
| `controller_pneumatics_actuators.updateFixedStep(dt)` | Chaque pas physique : calcule les débits réservoir -> tampons -> poutres, met à jour pressions et énergie du réservoir, applique les pressions aux poutres. *(interne)* | 243 |
| `controller_pneumatics_actuators.updateGFX(dt)` | Chaque image : gère les sons selon le débit, remet à zéro les énergies par tick, écrit la pression moyenne relative dans electrics et trace les graphes de debug. *(interne)* | 415 |

### Détail des paramètres

#### `controller_pneumatics_actuators.getAverageFlowRate(groupName)`

Renvoie le débit moyen vers les poutres d'un groupe (m³/s ; 0 si introuvable).

- `groupName` (*string*) : Nom du groupe.
- **renvoie** : number Débit moyen.

#### `controller_pneumatics_actuators.getAveragePressure(groupName)`

Renvoie la pression moyenne des poutres d'un groupe (Pa absolus ; 0 si introuvable).

- `groupName` (*string*) : Nom du groupe.
- **renvoie** : number Pression moyenne.

#### `controller_pneumatics_actuators.getBeamGroupsAverageFlowRate(groupNames)`

Renvoie la moyenne des débits moyens de plusieurs groupes.

- `groupNames` (*string[]*) : Noms de groupes.
- **renvoie** : number Débit moyen (0 si liste vide).

#### `controller_pneumatics_actuators.getValveState(groupName)`

Renvoie l'état de la vanne d'un groupe (0 si introuvable).

- `groupName` (*string*) : Nom du groupe.
- **renvoie** : number État de vanne -1..1.

#### `controller_pneumatics_actuators.init(jbeamData)`

Construit groupes de poutres, tampons virtuels et paramètres de débit à partir du jbeam et retrouve le réservoir d'air.

- `jbeamData` (*table*) : Données jbeam du contrôleur.

#### `controller_pneumatics_actuators.initSounds(jbeamData)`

Crée les sources sonores d'augmentation/diminution de débit pour chaque groupe. Appelé par le gestionnaire de contrôleurs.

- `jbeamData` (*table*) : Données jbeam du contrôleur.

#### `controller_pneumatics_actuators.setBeamGroupCrossFlowTag(groupName, crossFlowTag)`

Change le tampon virtuel (cross-flow group) auquel un groupe est relié ; réinitialise le tampon si le groupe est le premier à l'utiliser.

- `groupName` (*string*) : Nom du groupe.
- `crossFlowTag` (*string*) : Nom du tampon virtuel.

#### `controller_pneumatics_actuators.setBeamGroupMaximumSupplyPressure(groupName, maxSupplyPressure)`

Fixe la pression d'alimentation maximale d'un groupe.

- `groupName` (*string*) : Nom du groupe.
- `maxSupplyPressure` (*number*) : Pression absolue maximale (Pa).

#### `controller_pneumatics_actuators.setBeamGroupValveState(groupName, valveState)`

Fixe l'état de la vanne d'un groupe.

- `groupName` (*string*) : Nom du groupe.
- `valveState` (*number*) : -1..1 ; > 0 admission, <= 0 échappement ; la valeur absolue règle l'ouverture.

#### `controller_pneumatics_actuators.setBeamGroupsMaximumSupplyPressure(groupNames, maxSupplyPressure)`

Même chose pour plusieurs groupes.

- `groupNames` (*string[]*) : Noms de groupes.
- `maxSupplyPressure` (*number*) : Pression absolue maximale (Pa).

#### `controller_pneumatics_actuators.setBeamGroupsValveState(groupNames, valveState)`

Même chose pour plusieurs groupes.

- `groupNames` (*string[]*) : Noms de groupes.
- `valveState` (*number*) : -1..1.

#### `controller_pneumatics_actuators.toggleBeamGroupValveState(groupName)`

Bascule la vanne entre 1 (admission) et -1 (échappement) : si l'état courant est < 0 elle passe à 1, sinon à -1.

- `groupName` (*string*) : Nom du groupe.

#### `controller_pneumatics_actuators.toggleBeamGroupsValveState(groupNames)`

Même chose pour plusieurs groupes.

- `groupNames` (*string[]*) : Noms de groupes.

#### `controller_pneumatics_actuators.updateFixedStep(dt)`

Chaque pas physique : calcule les débits réservoir -> tampons -> poutres, met à jour pressions et énergie du réservoir, applique les pressions aux poutres.

- `dt` (*number*) : Pas de temps (s).

#### `controller_pneumatics_actuators.updateGFX(dt)`

Chaque image : gère les sons selon le débit, remet à zéro les énergies par tick, écrit la pression moyenne relative dans electrics et trace les graphes de debug.

- `dt` (*number*) : Pas de temps (s).

## Champs

| Champ | Type | Description |
|---|---|---|
| `defaultOrder` | number | 50. |
| `type` | string | "auxiliary". |

## Appels vers le moteur (C++)

- `obj:` `createSFXSource2`, `cutSFX`, `getBeamLength`, `playSFX`, `setBeamPressureRel`, `setVolume`, `stopSFX`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/controller/pneumatics/actuators.lua`.*
