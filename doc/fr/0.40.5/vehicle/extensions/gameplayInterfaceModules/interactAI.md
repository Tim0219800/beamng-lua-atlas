# `gameplayInterfaceModules_interactAI`

*Fichier : `lua/vehicle/extensions/gameplayInterfaceModules/interactAI.lua` · VM : Véhicule · 82 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplayInterfaceModules_interactAI` : `extensions.load (VM véhicule)("gameplayInterfaceModules_interactAI")`, puis la globale `gameplayInterfaceModules_interactAI`

Module de gameplayInterface pour l'IA : lit ou fixe le mode d'IA du véhicule courant et peut commander l'IA de tous les autres véhicules en les faisant fuir, suivre, poursuivre, se déplacer au hasard ou s'arrêter. Déclare ses actions et lookups à gameplayInterface au chargement (requestRegistration).

## Exemple

```lua
-- depuis le VM véhicule
gameplayInterface.executeAction(0, 1, 'setAIMode', 'span')
gameplayInterface.getSystemData(0, 2, 'aiMode')
```

## Remarques

- Action 'setAIMode'(mode:string) : appelle ai.setMode(mode) du véhicule courant.
- Action 'setOtherVehiclesAIMode'(mode:string) : mode parmi 'stop', 'random', 'flee', 'chase', 'follow' ; tout autre mode écrit un avertissement. Pour 'random', 'flee', 'chase', 'follow' : tous les autres véhicules (sauf celui-ci) reçoivent ai.setSpeedMode('off'), ai.driveInLane('off'), ai.setState({mode, targetObjectID = ce véhicule}) et ai.setRacing(false). 'stop' met ai.setMode('stop') sur TOUS les véhicules (celui-ci inclus), désactive gameplay_traffic et ai.setRacing(false) sur les autres.
- Lookup 'aiMode'() : renvoie {aiMode = ai.mode}.
- Chaque requête valide ses paramètres avec checkTableDataTypes et renvoie {failReason = ...} si le type est incorrect.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplayInterfaceModules_interactAI.onExtensionLoaded()` | Appelé au chargement de l'extension : remplit moduleActions et moduleLookups. *(interne)* *(hook)* | 72 |
| `gameplayInterfaceModules_interactAI.requestRegistration(gi)` | Appelé par gameplayInterface au démarrage : enregistre les actions et lookups du module. *(interne)* | 68 |

### Détail des paramètres

#### `gameplayInterfaceModules_interactAI.requestRegistration(gi)`

Appelé par gameplayInterface au démarrage : enregistre les actions et lookups du module.

- `gi` (*table*) : Le module gameplayInterface.

## Champs

| Champ | Type | Description |
|---|---|---|
| `moduleActions` | table<string, function> | Actions exposées : setAIMode, setOtherVehiclesAIMode (remplie à onExtensionLoaded). |
| `moduleLookups` | table<string, function> | Lookups exposés : aiMode. |

## Appels vers le moteur (C++)

- `BeamEngine:` `queueAllObjectLua`, `queueAllObjectLuaExcept`
- `obj:` `queueGameEngineLua`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/extensions/gameplayInterfaceModules/interactAI.lua`.*
