# `gameplayInterfaceModules_interactElectrics`

*Fichier : `lua/vehicle/extensions/gameplayInterfaceModules/interactElectrics.lua` · VM : Véhicule · 62 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplayInterfaceModules_interactElectrics` : `extensions.load (VM véhicule)("gameplayInterfaceModules_interactElectrics")`, puis la globale `gameplayInterfaceModules_interactElectrics`

Module de gameplayInterface pour electrics : fixer le niveau d'allumage, le mode de la barre lumineuse et l'état des phares, et lire n'importe quelle valeur de electrics.values.

## Exemple

```lua
gameplayInterface.executeAction(0, 9, 'setIgnitionLevel', 2)
gameplayInterface.getSystemData(0, 10, 'electricsValue', 'rpm')
```

## Remarques

- Action 'setIgnitionLevel'(level:number) : electrics.setIgnitionLevel(level) (0 à 3).
- Action 'setLightbarMode'(mode:number) : electrics.set_lightbar_signal(mode).
- Action 'setLightMode'(mode:number) : electrics.setLightsState(mode) (0 éteint, 1 croisement, 2 route).
- Lookup 'electricsValue'(key:string) : renvoie {result = electrics.values[key]} (nil si la clé n'existe pas).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplayInterfaceModules_interactElectrics.onExtensionLoaded()` | Appelé au chargement : remplit moduleActions et moduleLookups. *(interne)* *(hook)* | 51 |
| `gameplayInterfaceModules_interactElectrics.requestRegistration(gi)` | Enregistre les actions et lookups auprès de gameplayInterface. *(interne)* | 47 |

### Détail des paramètres

#### `gameplayInterfaceModules_interactElectrics.requestRegistration(gi)`

Enregistre les actions et lookups auprès de gameplayInterface.

- `gi` (*table*) : Le module gameplayInterface.

## Champs

| Champ | Type | Description |
|---|---|---|
| `moduleActions` | table<string, function> | Actions : setIgnitionLevel, setLightbarMode, setLightMode. |
| `moduleLookups` | table<string, function> | Lookups : electricsValue. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/extensions/gameplayInterfaceModules/interactElectrics.lua`.*
