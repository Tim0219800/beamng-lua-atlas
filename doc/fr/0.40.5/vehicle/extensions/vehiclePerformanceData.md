# `vehiclePerformanceData`

*Fichier : `lua/vehicle/extensions/vehiclePerformanceData.lua` · VM : Véhicule · 363 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `vehiclePerformanceData` : `extensions.load (VM véhicule)("vehiclePerformanceData")`, puis la globale `vehiclePerformanceData`

Collecte des données de performance du véhicule, surtout utilisée par l'UI/le jeu pour les fiches techniques et certifications. Deux volets : des données statiques (poids, répartition des roues motrices, type de boîte, carburants, type d'admission) via getStaticData, et des enregistrements dynamiques (pic de puissance, de couple, d'accélération longitudinale et latérale) démarrés par startRecording et lus par getRecordingData. L'extension n'active son updateGFX que pendant un enregistrement.

## Exemple

```lua
local T = vehiclePerformanceData.recordingTypes
vehiclePerformanceData.startRecording({T.power, T.torque})
-- ... accélérer ...
local d = vehiclePerformanceData.getRecordingData({T.power})
local power = d.power.propulsionPowerCombined
vehiclePerformanceData.stopRecording({T.power, T.torque})
```

## Remarques

- recordingTypes valides : power, torque, speed (ne fait rien), longitudinalAcceleration, lateralAcceleration. Les clés sont égales aux valeurs (chaînes du même nom).
- Résultats : power -> recordingData.power.propulsionPowerCombined = pic de somme (combustionTorque ou outputTorque1) x outputAV1 sur les dispositifs de roues motrices (W si N·m x rad/s) ; torque -> propulsionTorqueCombined (pic, N·m) ; accélérations -> maxAcceleration = pic de |sensors.gy2| (longitudinal) ou |sensors.gx2| (latéral), en m/s² d'après le nom des capteurs (déduit).
- Bug apparent : l'accélération longitudinale utilise sensors.gy2 et la latérale sensors.gx2 ; c'est cohérent avec le repère véhicule (Y avant) mais à confirmer côté capteurs.
- getStaticData renvoie : weight (obj:calcBeamStats().total_weight), powertrainLayout {poweredWheelsFront, poweredWheelsRear}, transmissionStyle (table type de boîte -> true), propulsionType (toujours nil : fonction vide), fuelType (table "fuelTank:<energyType>", "electricBattery" ou type de stockage -> true, n2oTank ignoré), inductionType (naturalAspiration / turbocharger / supercharger / N2O -> true).
- startRecording remplace les données du type demandé (recordingData[type] = {}). stopRecording ne supprime pas les données, on peut les lire ensuite avec getRecordingData.
- M.updateGFX est nil par défaut ; startRecording l'affecte et appelle extensions.hookUpdate('updateGFX') pour que le hook soit pris en compte, stopRecording le remet à nil quand plus rien n'est actif. C'est pourquoi `updateGFX` est listé comme champ nil.
- Les fonctions de mesure dépendent de powertrain.getAllWheelPropulsionDevices() et d'un moteur à combustion (turbocharger/supercharger/nitrousOxideInjection doivent exister dans getInductionType).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `vehiclePerformanceData.getRecordingData(recordingTypes)` | Renvoie les données collectées pour les types demandés. | 262 |
| `vehiclePerformanceData.getStaticData()` | Calcule et renvoie les données statiques du véhicule (poids, layout, boîte, carburants, admission). | 270 |
| `vehiclePerformanceData.onExtensionLoaded()` | Hook de chargement : initialise les tables d'enregistrement et associe chaque type à ses routines start/stop/update. *(interne)* *(hook)* | 281 |
| `vehiclePerformanceData.startRecording(recordingTypes)` | Démarre les enregistrements demandés (initialise leurs données, appelle leur routine de démarrage) et active le hook updateGFX si nécessaire. | 233 |
| `vehiclePerformanceData.stopRecording(recordingTypes)` | Arrête les enregistrements demandés ; désactive updateGFX si plus aucun n'est actif. Les données restent lisibles. | 248 |

### Détail des paramètres

#### `vehiclePerformanceData.getRecordingData(recordingTypes)`

Renvoie les données collectées pour les types demandés.

- `recordingTypes` (*string[]*) : Liste de valeurs de recordingTypes.
- **renvoie** : table<string, table> Table type -> données (nil pour un type jamais démarré).

#### `vehiclePerformanceData.getStaticData()`

Calcule et renvoie les données statiques du véhicule (poids, layout, boîte, carburants, admission).

- **renvoie** : table Table avec les clés de staticTypes.

#### `vehiclePerformanceData.startRecording(recordingTypes)`

Démarre les enregistrements demandés (initialise leurs données, appelle leur routine de démarrage) et active le hook updateGFX si nécessaire.

- `recordingTypes` (*string[]*) : Liste de valeurs de recordingTypes.

#### `vehiclePerformanceData.stopRecording(recordingTypes)`

Arrête les enregistrements demandés ; désactive updateGFX si plus aucun n'est actif. Les données restent lisibles.

- `recordingTypes` (*string[]*) : Liste de valeurs de recordingTypes.

## Champs

| Champ | Type | Description |
|---|---|---|
| `recordingTypes` | table<string, string> | Types d'enregistrement dynamique : power, torque, speed, longitudinalAcceleration, lateralAcceleration. |
| `staticTypes` | table<string, string> | Noms des données statiques : weight, powertrainLayout, transmissionStyle, propulsionType, fuelType, inductionType. |
| `updateGFX` | function|nil | nil au repos ; défini par startRecording tant qu'un enregistrement est actif. |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `updateGFX`

## Appels vers le moteur (C++)

- `obj:` `calcBeamStats`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/extensions/vehiclePerformanceData.lua`.*
