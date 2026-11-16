# `gameplayInterfaceModules_interactEnergyStorage`

*Fichier : `lua/vehicle/extensions/gameplayInterfaceModules/interactEnergyStorage.lua` · VM : Véhicule · 53 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplayInterfaceModules_interactEnergyStorage` : `extensions.load (VM véhicule)("gameplayInterfaceModules_interactEnergyStorage")`, puis la globale `gameplayInterfaceModules_interactEnergyStorage`

Module de gameplayInterface pour energyStorage : fixer l'énergie stockée d'un réservoir et lister tous les stockages avec leur énergie courante et maximale.

## Exemple

```lua
gameplayInterface.executeAction(0, 11, 'setEnergyStorageEnergy', 'mainTank', 1.0e8)
gameplayInterface.getSystemData(0, 12, 'energyStorage')
```

## Remarques

- Action 'setEnergyStorageEnergy'(name:string, energy:number) : écrit directement storage.storedEnergy (en joules) ; {failReason} si le stockage est introuvable. Aucun clamp à energyCapacity.
- Lookup 'energyStorage'() : renvoie une table contenant une liste {name, storageType, energyType, currentEnergy, maxEnergy} (currentEnergy = storedEnergy, maxEnergy = energyCapacity). La liste est englobée dans une table (le résultat est {liste}).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplayInterfaceModules_interactEnergyStorage.onExtensionLoaded()` | Appelé au chargement : remplit moduleActions et moduleLookups. *(interne)* *(hook)* | 44 |
| `gameplayInterfaceModules_interactEnergyStorage.requestRegistration(gi)` | Enregistre les actions et lookups auprès de gameplayInterface. *(interne)* | 40 |

### Détail des paramètres

#### `gameplayInterfaceModules_interactEnergyStorage.requestRegistration(gi)`

Enregistre les actions et lookups auprès de gameplayInterface.

- `gi` (*table*) : Le module gameplayInterface.

## Champs

| Champ | Type | Description |
|---|---|---|
| `moduleActions` | table<string, function> | Actions : setEnergyStorageEnergy. |
| `moduleLookups` | table<string, function> | Lookups : energyStorage. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/extensions/gameplayInterfaceModules/interactEnergyStorage.lua`.*
