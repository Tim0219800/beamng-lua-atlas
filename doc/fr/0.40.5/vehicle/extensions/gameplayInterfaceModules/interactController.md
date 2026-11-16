# `gameplayInterfaceModules_interactController`

*Fichier : `lua/vehicle/extensions/gameplayInterfaceModules/interactController.lua` · VM : Véhicule · 77 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplayInterfaceModules_interactController` : `extensions.load (VM véhicule)("gameplayInterfaceModules_interactController")`, puis la globale `gameplayInterfaceModules_interactController`

Module de gameplayInterface pour le système de contrôleurs : envoyer un événement gameplay aux contrôleurs, geler le véhicule, changer le mode de boîte, passer un rapport et lire le mode de boîte ou l'état de gel.

## Exemple

```lua
gameplayInterface.executeAction(0, 7, 'shiftToGearIndex', 1)
gameplayInterface.executeAction(0, 8, 'setGearboxMode', 'arcade')
```

## Remarques

- Action 'controllerGameplayEvent'(eventName, ...) : appelle controller.onGameplayEvent(eventName, {autres paramètres}) ; aucun contrôle de type sur les paramètres.
- Action 'setFreeze'(freeze:boolean) : controller.setFreeze(1) ou (0).
- Action 'setGearboxMode'(mode:string) : controller.mainController.setGearboxMode(mode) (ex. 'arcade', 'realistic').
- Action 'shiftToGearIndex'(gearIndex:number) : controller.mainController.shiftToGearIndex(gearIndex).
- Lookup 'mainController'(dataKey:string) : 'gearboxMode' renvoie {result = mainController.gearboxBehavior} ; 'freezeState' renvoie {result = electrics.values.freezeState} ; autre clé renvoie {failReason = 'Invalid data key'}.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplayInterfaceModules_interactController.onExtensionLoaded()` | Appelé au chargement : remplit moduleActions et moduleLookups. *(interne)* *(hook)* | 65 |
| `gameplayInterfaceModules_interactController.requestRegistration(gi)` | Enregistre les actions et lookups auprès de gameplayInterface. *(interne)* | 61 |

### Détail des paramètres

#### `gameplayInterfaceModules_interactController.requestRegistration(gi)`

Enregistre les actions et lookups auprès de gameplayInterface.

- `gi` (*table*) : Le module gameplayInterface.

## Champs

| Champ | Type | Description |
|---|---|---|
| `moduleActions` | table<string, function> | Actions : controllerGameplayEvent, setFreeze, setGearboxMode, shiftToGearIndex. |
| `moduleLookups` | table<string, function> | Lookups : mainController. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/extensions/gameplayInterfaceModules/interactController.lua`.*
