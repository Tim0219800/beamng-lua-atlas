# `gameplayInterfaceModules_interactSpecialLights`

*Fichier : `lua/vehicle/extensions/gameplayInterfaceModules/interactSpecialLights.lua` · VM : Véhicule · 45 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplayInterfaceModules_interactSpecialLights` : `extensions.load (VM véhicule)("gameplayInterfaceModules_interactSpecialLights")`, puis la globale `gameplayInterfaceModules_interactSpecialLights`

Module de gameplayInterface pour les feux spéciaux : lecture et fixation de l'état du feu de taxi via les contrôleurs 'lights/taxiLights'.

## Exemple

```lua
gameplayInterface.executeAction(0, 20, 'setTaxiLightState', 'on')
```

## Remarques

- Action 'setTaxiLightState'(state:string) : appelle setTaxiState(state) sur tous les contrôleurs de type lights/taxiLights.
- Lookup 'taxiLightState'() : renvoie {result = getTaxiState()} du premier contrôleur lights/taxiLights, ou nil s'il n'y en a pas.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplayInterfaceModules_interactSpecialLights.onExtensionLoaded()` | Appelé au chargement : remplit moduleActions et moduleLookups. *(interne)* *(hook)* | 36 |
| `gameplayInterfaceModules_interactSpecialLights.requestRegistration(gi)` | Enregistre les actions et lookups auprès de gameplayInterface. *(interne)* | 32 |

### Détail des paramètres

#### `gameplayInterfaceModules_interactSpecialLights.requestRegistration(gi)`

Enregistre les actions et lookups auprès de gameplayInterface.

- `gi` (*table*) : Le module gameplayInterface.

## Champs

| Champ | Type | Description |
|---|---|---|
| `moduleActions` | table<string, function> | Actions : setTaxiLightState. |
| `moduleLookups` | table<string, function> | Lookups : taxiLightState. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/extensions/gameplayInterfaceModules/interactSpecialLights.lua`.*
