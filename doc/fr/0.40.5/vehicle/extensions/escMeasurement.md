# `escMeasurement`

*Fichier : `lua/vehicle/extensions/escMeasurement.lua` · VM : Véhicule · 558 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `escMeasurement` : `extensions.load (VM véhicule)("escMeasurement")`, puis la globale `escMeasurement`

Outil interne de mesure/calibration automatique de l'ESC (contrôleur drivingDynamics/CMU), piloté depuis le GE par util_calibrateESC. Une coroutine de travail lance un test de rigidité de dérive (skew stiffness) en balayant vitesses (30 à 150 km/h, pas de 2 m/s) et angles de braquage (0,5° à 20°), puis écrit le résultat dans vehicles/<modèle>/drivingDynamics/<config>.stat.json. Un second test (STM, mesures de lacet à 200 km/h) existe mais est désactivé dans performTests.

## Exemple

```lua
-- appelé par le GE : extensions.escMeasurement.performTests('vivace', 'base')
```

## Remarques

- performTests(vehicleName, configName) crée une coroutine reprise à chaque updateGFX ; à sa fin (état Testend) elle écrit les fichiers, arrête le test, puis le VM appelle util_calibrateESC.vehicleDone() (killswitch) côté GE. updateGFX envoie aussi util_calibrateESC.heartbeat() à chaque frame (watchdog).
- Nécessite exactement un contrôleur 'drivingDynamics/CMU' ; sinon log d'erreur et état Testend.
- États : Idling, Initialization (mesure l'angle de roue maximal en braquant à fond 2 x 2 s), Settling (régulateur interne vers la vitesse cible, braquage lissé), Measuring (moyenne sur 100 mesures de rigidité avant/arrière), Finished, Testend.
- Le régulateur de vitesse interne (updateCC) écrit electrics.values.throttleOverride, limite l'accélération transversale à environ 1,6 g et impose setAggressionOverride(1) au vehicleController.
- Sortie : skewStiffnessFront/Rear arrondies au millier inférieur (N/rad, déduit du code) dans le .stat.json ; STMMeasurements.csv (vitesse, angle de roue, lacet moyen) si des mesures STM existent.
- Pendant le test, be:setPhysicsSpeedFactor(2) est demandé au GE ; remis à 0 à la fin.
- Anomalie : startSkewStiffnessTest enregistre M.updateFixedStepCallback via M.* ; si le module est rechargé, la référence peut changer. Le test STM (startSTMMeasurementsTest) n'est pas exporté.
- Anomalie : dans stopSkewStiffnessTest, setState(finishedState) ne produit plus de sortie fichier ; l'écriture est faite par combineTestData appelé avant dans la coroutine.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `escMeasurement.onInit()` | Hook d'initialisation : remet état, compteurs, mesures et vitesse physique à zéro (état Idling). *(interne)* *(hook)* | 442 |
| `escMeasurement.onReset()` | Même fonction que onInit. *(interne)* *(hook)* | 442 |
| `escMeasurement.performTests(vehicleName, configName)` | Lance la séquence complète de calibration dans une coroutine et mémorise modèle/config pour le nom du fichier de sortie. | 507 |
| `escMeasurement.startSkewStiffnessTest()` | Démarre le test de rigidité de dérive : récupère le CMU, enregistre le callback de pas fixe, désactive les systèmes ESC pour la calibration et passe en Initialization. | 457 |
| `escMeasurement.stopSkewStiffnessTest()` | Arrête le test : coupe le régulateur interne, remet la vitesse physique normale, état Finished. | 499 |
| `escMeasurement.updateFixedStepCallback(dt)` | Callback appelé par le CMU à pas de physique fixe : exécute la logique du test de rigidité de dérive. *(interne)* | 390 |
| `escMeasurement.updateGFX(dt)` | Appelé chaque frame : reprend la coroutine de travail, envoie le heartbeat au GE et déclenche le killswitch quand elle est terminée. *(interne)* | 115 |
| `escMeasurement.updateGFXCallback(dt)` | Callback GFX du CMU ; vide. *(interne)* | 394 |

### Détail des paramètres

#### `escMeasurement.performTests(vehicleName, configName)`

Lance la séquence complète de calibration dans une coroutine et mémorise modèle/config pour le nom du fichier de sortie.

- `vehicleName` (*string*) : Nom du modèle (dossier vehicles/).
- `configName` (*string*) : Nom de la configuration.

#### `escMeasurement.updateFixedStepCallback(dt)`

Callback appelé par le CMU à pas de physique fixe : exécute la logique du test de rigidité de dérive.

- `dt` (*number*) : Pas de temps en secondes.

#### `escMeasurement.updateGFX(dt)`

Appelé chaque frame : reprend la coroutine de travail, envoie le heartbeat au GE et déclenche le killswitch quand elle est terminée.

- `dt` (*number*) : Pas de temps en secondes (non utilisé).

#### `escMeasurement.updateGFXCallback(dt)`

Callback GFX du CMU ; vide.

- `dt` (*number*) : Pas de temps en secondes.

**Évènements UI (guihooks.trigger) :** `ESCSkewStiffnessChange`

## Appels vers le moteur (C++)

- `obj:` `getDirectionVector`, `getGravity`, `getVelocity`, `queueGameEngineLua`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/extensions/escMeasurement.lua`.*
