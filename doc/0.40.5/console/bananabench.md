# `bananabench`

*Fichier : `lua/console/bananabench.lua` · VM : Console · 239 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("bananabench")`

Banc d'essai « bananabench » de la physique des véhicules (version 0.5), exécuté dans la VM console (BeamNG sans interface). Il initialise un moteur de physique (initBeamEngine à 2000 Hz), charge un véhicule (jbeam/loader), le fait apparaître en 1 à N exemplaires et mesure, sur 200 itérations de 100 pas physiques, le débit en millions de poutres par seconde (MBeams/s) et le pourcentage de temps réel. Il imprime un tableau et renvoie les résultats. C'est la base utilisée par bananabench-json, bananabench-csv, bananabench-xml et bananabench-print.

## Exemple

```lua
local bench = require('lua/console/bananabench')
local res = bench.physics({'pickup'}, 1, 4)
print(res.tests.pickup.maxMbeams)
```

## Remarques

- Constantes internes : physicsFPS = 2000, physicsSteps = 100 (ne pas dépasser), gfxSteps = 200, véhicule par défaut {'pickup'}, nombre de véhicules par défaut 40 (globale VehiclesToTest si définie).
- Au chargement, le fichier appelle require('jit') et lua/console/console-lib.initConsole() (qui crée des globales factices) et initBeamEngine ; il crée donc un moteur à l'import.
- Chaque véhicule est placé en (300*i, 300*i, 1) et on désactive son sommeil (setSleepingEnabled(false)). Un tour d'échauffement de 5 pas précède chaque mesure ; le GC est arrêté et le JIT coupé (sous pcall, car il peut être absent sur certaines plateformes) pendant la mesure.
- Résultat de benchPhysics : {hw, physicsFPS, physicsSteps, gfxSteps, version, tests = {[véhicule] = {maxMbeams, maxMbeamsNum, maxRealtimeVehicles, version = 2, time, tests = {{vehicles, res = {Mbeamspersec, percentRealtime, time, spawntime}, msg}}}}, vehicleMax, vehicleMin, time}.
- Globales créées : benchLog (collecteur de logs non utilisé ensuite), benchPhysics, myBenchStep. Utilise les API moteur BeamEngine:spawnObject2/deleteAllObjects/instabilityDetected/setDynamicCollisionEnabled, obj:getNodeCount/getBeamCount/queueLuaCommand, FS:findFiles, setPowerPlanMaxPerformance/restorePowerPlan.
- `benchPhysics` renvoie nil (après un log d'erreur) si le moteur n'a pas pu être créé ; un véhicule dont le nombre de poutres ou de nœuds est nil est ignoré.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `bananabench.beam()` | Renvoie l'objet moteur BeamEngine créé par ce module, pour le piloter directement (par ex. setThreadingLayout pour un balayage du nombre de threads). | 234 |
| `bananabench.getAllVehicles()` | Liste les sous-dossiers de /vehicles (hors /vehicles/common) sous forme de noms. | 84 |
| `bananabench.physics(vehicles, vehicleMin, vehicleMax)` | Lance le benchmark de physique (alias de benchPhysics). Pour chaque véhicule de la liste, mesure de vehicleMin à vehicleMax exemplaires et imprime un tableau MBeams/s et % temps réel. | 94 |

### Détail des paramètres

#### `bananabench.beam()`

Renvoie l'objet moteur BeamEngine créé par ce module, pour le piloter directement (par ex. setThreadingLayout pour un balayage du nombre de threads).

- **renvoie** : userdata Système BeamNG natif.

#### `bananabench.getAllVehicles()`

Liste les sous-dossiers de /vehicles (hors /vehicles/common) sous forme de noms.

- **renvoie** : string[] Noms de véhicules.

#### `bananabench.physics(vehicles, vehicleMin, vehicleMax)`

Lance le benchmark de physique (alias de benchPhysics). Pour chaque véhicule de la liste, mesure de vehicleMin à vehicleMax exemplaires et imprime un tableau MBeams/s et % temps réel.

- `vehicles` (*string[]|nil*) : Noms de dossiers sous /vehicles ; défaut {'pickup'}.
- `vehicleMin` (*integer|nil*) : Nombre minimal de véhicules simultanés (défaut 1).
- `vehicleMax` (*integer|nil*) : Nombre maximal (défaut VehiclesToTest ou 40).
- **renvoie** : table|nil Résultats du benchmark (voir notes), nil si le moteur est indisponible.

## Fonctions globales définies ici

| Fonction | Description | Ligne |
|---|---|---|
| `benchLog(level, origin, msg, newline)` |  | 71 |
| `benchPhysics(vehicles, vehicleMin, vehicleMax)` |  | 94 |
| `myBenchStep(testVehicle, vehLPackData, n, steps)` |  | 33 |

## Appels vers le moteur (C++)

- `BeamEngine:` `deleteAllObjects`, `instabilityDetected`, `setDynamicCollisionEnabled`, `spawnObject2`
- `FS:` `findFiles`
- `obj:` `getBeamCount`, `getNodeCount`, `queueLuaCommand`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/console/bananabench.lua`.*
