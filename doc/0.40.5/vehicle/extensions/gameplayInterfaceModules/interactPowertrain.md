# `gameplayInterfaceModules_interactPowertrain`

*Fichier : `lua/vehicle/extensions/gameplayInterfaceModules/interactPowertrain.lua` · VM : Véhicule · 34 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplayInterfaceModules_interactPowertrain` : `extensions.load (VM véhicule)("gameplayInterfaceModules_interactPowertrain")`, puis la globale `gameplayInterfaceModules_interactPowertrain`

Module de gameplayInterface pour powertrain : lecture d'une propriété d'un périphérique du groupe motopropulseur par son nom.

## Exemple

```lua
gameplayInterface.getSystemData(0, 18, 'powertrainDevice', 'mainEngine', 'outputAV1')
```

## Remarques

- Lookup 'powertrainDevice'(deviceName:string, property:string) : renvoie {result = powertrain.getDevice(deviceName)[property]}.
- Anomalie : si le périphérique n'existe pas, powertrain.getDevice renvoie nil et l'indexation lève une erreur Lua (pas de {failReason}).
- Ce module n'expose aucune action.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplayInterfaceModules_interactPowertrain.onExtensionLoaded()` | Appelé au chargement : enregistre le lookup. *(interne)* *(hook)* | 26 |
| `gameplayInterfaceModules_interactPowertrain.requestRegistration(gi)` | Enregistre les actions et lookups auprès de gameplayInterface. *(interne)* | 22 |

### Détail des paramètres

#### `gameplayInterfaceModules_interactPowertrain.requestRegistration(gi)`

Enregistre les actions et lookups auprès de gameplayInterface.

- `gi` (*table*) : Le module gameplayInterface.

## Champs

| Champ | Type | Description |
|---|---|---|
| `moduleActions` | table<string, function> | Vide. |
| `moduleLookups` | table<string, function> | Lookups : powertrainDevice. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/extensions/gameplayInterfaceModules/interactPowertrain.lua`.*
