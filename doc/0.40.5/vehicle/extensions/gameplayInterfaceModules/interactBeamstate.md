# `gameplayInterfaceModules_interactBeamstate`

*Fichier : `lua/vehicle/extensions/gameplayInterfaceModules/interactBeamstate.lua` · VM : Véhicule · 45 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplayInterfaceModules_interactBeamstate` : `extensions.load (VM véhicule)("gameplayInterfaceModules_interactBeamstate")`, puis la globale `gameplayInterfaceModules_interactBeamstate`

Module de gameplayInterface donnant accès à beamstate : appel à distance d'une fonction sans argument de beamstate par son nom, et lecture du décalage d'un coupleur. Les actions et lookups sont enregistrés auprès de gameplayInterface.

## Exemple

```lua
gameplayInterface.executeAction(0, 3, 'interactBeamstate', 'breakAllBreakgroups')
```

## Remarques

- Action 'interactBeamstate'(methodName:string) : appelle beamstate[methodName]() sans argument ; renvoie {failReason} si la fonction n'existe pas. N'importe quelle clé de beamstate non nulle est appelée telle quelle (une valeur non-fonction provoquerait une erreur Lua).
- Lookup 'couplerOffset'(couplerTag:string) : renvoie {result = beamstate.getCouplerOffset(couplerTag)}.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplayInterfaceModules_interactBeamstate.onExtensionLoaded()` | Appelé au chargement : remplit moduleActions et moduleLookups. *(interne)* *(hook)* | 36 |
| `gameplayInterfaceModules_interactBeamstate.requestRegistration(gi)` | Enregistre les actions et lookups auprès de gameplayInterface. *(interne)* | 32 |

### Détail des paramètres

#### `gameplayInterfaceModules_interactBeamstate.requestRegistration(gi)`

Enregistre les actions et lookups auprès de gameplayInterface.

- `gi` (*table*) : Le module gameplayInterface.

## Champs

| Champ | Type | Description |
|---|---|---|
| `moduleActions` | table<string, function> | Actions exposées : interactBeamstate. |
| `moduleLookups` | table<string, function> | Lookups exposés : couplerOffset. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/extensions/gameplayInterfaceModules/interactBeamstate.lua`.*
