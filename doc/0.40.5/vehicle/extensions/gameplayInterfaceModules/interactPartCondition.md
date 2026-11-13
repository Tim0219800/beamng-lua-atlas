# `gameplayInterfaceModules_interactPartCondition`

*Fichier : `lua/vehicle/extensions/gameplayInterfaceModules/interactPartCondition.lua` · VM : Véhicule · 115 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplayInterfaceModules_interactPartCondition` : `extensions.load (VM véhicule)("gameplayInterfaceModules_interactPartCondition")`, puis la globale `gameplayInterfaceModules_interactPartCondition`

Module de gameplayInterface pour partCondition : initialiser ou lire les conditions des pièces (odomètre, intégrité, visuel, peintures par défaut), lire l'odomètre de la pièce racine et gérer les instantanés (snapshots) de condition, y compris celui utilisé au reset.

## Exemple

```lua
gameplayInterface.executeAction(0, 16, 'createPartConditionSnapshot', 'avantCourse')
gameplayInterface.executeAction(0, 17, 'applyPartConditionSnapshot', 'avantCourse')
```

## Remarques

- Action 'initPartConditions'(conditions?:table, fallbackOdometer?:number, fallbackIntegrityValue?:number, fallbackVisualValue?:number, defaultPaints?:table) : partCondition.initConditions(...).
- Action 'ensurePartConditionsInit'(fallbackOdometer, fallbackIntegrityValue, fallbackVisualValue : number) : partCondition.ensureConditionsInit(...).
- Action 'createPartConditionSnapshot'(key:string) : partCondition.createConditionSnapshot(key).
- Action 'applyPartConditionSnapshot'(key:string) : partCondition.applyConditionSnapshot(key).
- Action 'deletePartConditionSnapshots'() : partCondition.deleteConditionSnapshots().
- Action 'setPartConditionResetSnapshotKey'(key:string) : partCondition.setResetSnapshotKey(key).
- Action 'createAndSetPartConditionResetSnapshotKey'(key:string) : crée l'instantané puis le désigne comme instantané de reset.
- Lookup 'getPartConditions'() : renvoie {result = partCondition.getConditions()}. Lookup 'getRootPartOdometer'() : renvoie {result = partCondition.getRootPartOdometerValue()}.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplayInterfaceModules_interactPartCondition.onExtensionLoaded()` | Appelé au chargement : remplit moduleActions et moduleLookups. *(interne)* *(hook)* | 99 |
| `gameplayInterfaceModules_interactPartCondition.requestRegistration(gi)` | Enregistre les actions et lookups auprès de gameplayInterface. *(interne)* | 95 |

### Détail des paramètres

#### `gameplayInterfaceModules_interactPartCondition.requestRegistration(gi)`

Enregistre les actions et lookups auprès de gameplayInterface.

- `gi` (*table*) : Le module gameplayInterface.

## Champs

| Champ | Type | Description |
|---|---|---|
| `moduleActions` | table<string, function> | Actions : initPartConditions, ensurePartConditionsInit, createPartConditionSnapshot, applyPartConditionSnapshot, deletePartConditionSnapshots, setPartConditionResetSnapshotKey, createAndSetPartConditionResetSnapshotKey. |
| `moduleLookups` | table<string, function> | Lookups : getPartConditions, getRootPartOdometer. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/extensions/gameplayInterfaceModules/interactPartCondition.lua`.*
