# `inputTests`

*Fichier : `lua/vehicle/extensions/inputTests.lua` · VM : Véhicule · 480 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `inputTests` : `extensions.load (VM véhicule)("inputTests")`, puis la globale `inputTests`

Banc de test de latence et de précision du retour de force (FFB) des volants : mesure la latence matérielle USB, la résolution et la fréquence de mise à jour du volant, la latence du moteur de simulation et celle du véhicule, ainsi que les oscillations de la direction. Les tests tournent dans une coroutine appelée par hydros via hydros.testHook ; les résultats (statistiques, histogrammes en 30 classes) sont envoyés au GE par le hook onInputTestStats, et la fin par onInputTestStatus.

## Exemple

```lua
extensions.inputTests.start('systemTest')
-- tests : systemTest, simulationTest, vehicleTest, vehicleOscillationTest
```

## Remarques

- Tests disponibles (30 mesures chacun) : 'systemTest' (résultats systemFrequencyTest, systemResolutionTest, systemLatencyTest : mesures directes du volant via hydros.getAngleFunction / getForceFeedbackFunction), 'simulationTest' (engineLatencyTest : impulsion FFB jusqu'au mouvement du volant simulé, calcul FFB désactivé), 'vehicleTest' (vehicleLatencyTest : impulsion de torsion des nœuds de bande de roulement des roues dont le nom commence par 'F'), 'vehicleOscillationTest' (oscillationTest et vehicleFrequencyTest, avec force FFB réduite à 10 %).
- start(testId) exige un identifiant FFB valide (hydros.getFFBID() >= 0), sinon envoie des statistiques vides avec un message d'erreur.
- Les statistiques envoyées contiennent : testId, sampleCount, unit, value (mode par demi-échantillon, ou maximum pour systemResolutionTest), modeError / modeErrorLow / modeErrorHigh, buckets (count, min, max), bucketPeakCount et éventuellement message. Les latences sont converties en ms.
- Les chronométrages utilisent l'horloge murale (os.clockhp), pas le temps de simulation.
- Constantes : timeout de latence 0,5 s, volant considéré arrêté après 0,15 s (timeout 7 s), force de torsion de bande de roulement 5000 sur les 5 nœuds les plus bas.
- Une erreur interne de la coroutine est journalisée, désactive hydros.testHook et envoie un message d'échec au GE.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `inputTests.onExtensionUnloaded()` | Appelé au déchargement : retire hydros.testHook. *(interne)* *(hook)* | 478 |
| `inputTests.start(testId)` | Démarre un test : récupère l'identifiant FFB, crée la coroutine et installe M.update dans hydros.testHook. | 463 |
| `inputTests.update(dtSim, simWheelPos, hydroPos)` | Appelé par hydros à chaque pas FFB via testHook : reprend la coroutine du test avec le dt réel (horloge murale) et les positions de volant simulé et matériel. Renvoie si le calcul FFB normal doit être exécuté et la position matérielle suivante. *(interne)* | 34 |

### Détail des paramètres

#### `inputTests.start(testId)`

Démarre un test : récupère l'identifiant FFB, crée la coroutine et installe M.update dans hydros.testHook.

- `testId` (*string*) : 'systemTest', 'simulationTest', 'vehicleTest' ou 'vehicleOscillationTest'.

#### `inputTests.update(dtSim, simWheelPos, hydroPos)`

Appelé par hydros à chaque pas FFB via testHook : reprend la coroutine du test avec le dt réel (horloge murale) et les positions de volant simulé et matériel. Renvoie si le calcul FFB normal doit être exécuté et la position matérielle suivante.

- `dtSim` (*number*) : Pas de temps de simulation (utilisé seulement au premier appel).
- `simWheelPos` (*number*) : Position du volant simulé (normalisée, -1 à 1 déduit du code).
- `hydroPos` (*number*) : Position cible du volant matériel.
- **renvoie** : boolean true pour exécuter le calcul FFB du véhicule ce pas.
- **renvoie** : number Position matérielle à appliquer ensuite.

## Appels vers le moteur (C++)

- `obj:` `applyForceVector`, `getNodePosition`, `queueGameEngineLua`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/extensions/inputTests.lua`.*
