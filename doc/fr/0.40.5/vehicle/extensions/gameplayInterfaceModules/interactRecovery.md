# `gameplayInterfaceModules_interactRecovery`

*Fichier : `lua/vehicle/extensions/gameplayInterfaceModules/interactRecovery.lua` · VM : Véhicule · 34 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplayInterfaceModules_interactRecovery` : `extensions.load (VM véhicule)("gameplayInterfaceModules_interactRecovery")`, puis la globale `gameplayInterfaceModules_interactRecovery`

Module de gameplayInterface donnant accès au système de récupération (recovery) : appel à distance d'une fonction sans argument du module recovery par son nom.

## Exemple

```lua
gameplayInterface.executeAction(0, 19, 'interactRecovery', 'startRecovering')
```

## Remarques

- Action 'interactRecovery'(methodName:string) : appelle recovery[methodName]() sans argument ; {failReason} si la fonction n'existe pas. Les noms valides dépendent du module recovery.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplayInterfaceModules_interactRecovery.onExtensionLoaded()` | Appelé au chargement : remplit moduleActions. *(interne)* *(hook)* | 26 |
| `gameplayInterfaceModules_interactRecovery.requestRegistration(gi)` | Enregistre les actions et lookups auprès de gameplayInterface. *(interne)* | 22 |

### Détail des paramètres

#### `gameplayInterfaceModules_interactRecovery.requestRegistration(gi)`

Enregistre les actions et lookups auprès de gameplayInterface.

- `gi` (*table*) : Le module gameplayInterface.

## Champs

| Champ | Type | Description |
|---|---|---|
| `moduleActions` | table<string, function> | Actions : interactRecovery. |
| `moduleLookups` | table<string, function> | Lookups : aucun. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/extensions/gameplayInterfaceModules/interactRecovery.lua`.*
