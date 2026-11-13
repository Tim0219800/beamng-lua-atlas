# `gameplayInterfaceModules_interactFire`

*Fichier : `lua/vehicle/extensions/gameplayInterfaceModules/interactFire.lua` · VM : Véhicule · 34 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplayInterfaceModules_interactFire` : `extensions.load (VM véhicule)("gameplayInterfaceModules_interactFire")`, puis la globale `gameplayInterfaceModules_interactFire`

Module de gameplayInterface donnant accès au système d'incendie : appel à distance d'une fonction sans argument du module fire par son nom.

## Exemple

```lua
gameplayInterface.executeAction(0, 13, 'interactFire', 'igniteVehicle')
```

## Remarques

- Action 'interactFire'(methodName:string) : appelle fire[methodName]() sans argument ; {failReason} si la fonction n'existe pas. Le nom exact des méthodes valides dépend du module fire (voir sa page).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplayInterfaceModules_interactFire.onExtensionLoaded()` | Appelé au chargement : remplit moduleActions. *(interne)* *(hook)* | 26 |
| `gameplayInterfaceModules_interactFire.requestRegistration(gi)` | Enregistre les actions et lookups auprès de gameplayInterface. *(interne)* | 22 |

### Détail des paramètres

#### `gameplayInterfaceModules_interactFire.requestRegistration(gi)`

Enregistre les actions et lookups auprès de gameplayInterface.

- `gi` (*table*) : Le module gameplayInterface.

## Champs

| Champ | Type | Description |
|---|---|---|
| `moduleActions` | table<string, function> | Actions : interactFire. |
| `moduleLookups` | table<string, function> | Lookups : aucun. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/extensions/gameplayInterfaceModules/interactFire.lua`.*
