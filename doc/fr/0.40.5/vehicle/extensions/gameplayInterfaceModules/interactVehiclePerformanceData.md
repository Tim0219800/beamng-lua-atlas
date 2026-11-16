# `gameplayInterfaceModules_interactVehiclePerformanceData`

*Fichier : `lua/vehicle/extensions/gameplayInterfaceModules/interactVehiclePerformanceData.lua` · VM : Véhicule · 60 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplayInterfaceModules_interactVehiclePerformanceData` : `extensions.load (VM véhicule)("gameplayInterfaceModules_interactVehiclePerformanceData")`, puis la globale `gameplayInterfaceModules_interactVehiclePerformanceData`

Module de gameplayInterface relayant vers l'extension véhicule `vehiclePerformanceData` : démarrer/arrêter des enregistrements de performance (jusqu'à 5 types), lire les données enregistrées et les données statiques du véhicule.

## Exemple

```lua
gameplayInterface.executeAction(0, 21, 'startRecording', 'acceleration')
gameplayInterface.getSystemData(0, 22, 'getStaticData')
```

## Remarques

- Actions 'startRecording' et 'stopRecording'(type1:string, type2?:string, ... type5?:string) : appellent extensions.vehiclePerformanceData.startRecording/stopRecording({les 5 types}).
- Lookup 'getRecordingData'(type1:string, ... type5?:string) : renvoie directement le résultat de extensions.vehiclePerformanceData.getRecordingData.
- Lookup 'getStaticData'() : renvoie extensions.vehiclePerformanceData.getStaticData().
- Cette extension (vehiclePerformanceData) doit être chargée dans le VM véhicule, sinon l'appel lève une erreur. Elle n'est pas dans ce lot.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplayInterfaceModules_interactVehiclePerformanceData.onExtensionLoaded()` | Appelé au chargement : remplit moduleActions et moduleLookups. *(interne)* *(hook)* | 49 |
| `gameplayInterfaceModules_interactVehiclePerformanceData.requestRegistration(gi)` | Enregistre les actions et lookups auprès de gameplayInterface. *(interne)* | 45 |

### Détail des paramètres

#### `gameplayInterfaceModules_interactVehiclePerformanceData.requestRegistration(gi)`

Enregistre les actions et lookups auprès de gameplayInterface.

- `gi` (*table*) : Le module gameplayInterface.

## Champs

| Champ | Type | Description |
|---|---|---|
| `moduleActions` | table<string, function> | Actions : startRecording, stopRecording. |
| `moduleLookups` | table<string, function> | Lookups : getRecordingData, getStaticData. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/extensions/gameplayInterfaceModules/interactVehiclePerformanceData.lua`.*
