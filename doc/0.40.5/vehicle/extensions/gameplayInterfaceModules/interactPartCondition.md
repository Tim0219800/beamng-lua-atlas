# `gameplayInterfaceModules_interactPartCondition`

*File: `lua/vehicle/extensions/gameplayInterfaceModules/interactPartCondition.lua` · VM: Vehicle · 115 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplayInterfaceModules_interactPartCondition`: `extensions.load (vehicle VM)("gameplayInterfaceModules_interactPartCondition")`, then the global `gameplayInterfaceModules_interactPartCondition`

gameplayInterface module for partCondition: initializes or reads part conditions (odometer, integrity, visual, default paints), reads the root part's odometer and manages condition snapshots, including the one used on reset.

## Example

```lua
gameplayInterface.executeAction(0, 16, 'createPartConditionSnapshot', 'avantCourse')
gameplayInterface.executeAction(0, 17, 'applyPartConditionSnapshot', 'avantCourse')
```

## Notes

- Action 'initPartConditions'(conditions?:table, fallbackOdometer?:number, fallbackIntegrityValue?:number, fallbackVisualValue?:number, defaultPaints?:table): partCondition.initConditions(...).
- Action 'ensurePartConditionsInit'(fallbackOdometer, fallbackIntegrityValue, fallbackVisualValue : number): partCondition.ensureConditionsInit(...).
- Action 'createPartConditionSnapshot'(key:string): partCondition.createConditionSnapshot(key).
- Action 'applyPartConditionSnapshot'(key:string): partCondition.applyConditionSnapshot(key).
- Action 'deletePartConditionSnapshots'(): partCondition.deleteConditionSnapshots().
- Action 'setPartConditionResetSnapshotKey'(key:string): partCondition.setResetSnapshotKey(key).
- Action 'createAndSetPartConditionResetSnapshotKey'(key:string): creates the snapshot, then designates it as the reset snapshot.
- Lookup 'getPartConditions'(): returns {result = partCondition.getConditions()}. Lookup 'getRootPartOdometer'(): returns {result = partCondition.getRootPartOdometerValue()}.

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplayInterfaceModules_interactPartCondition.onExtensionLoaded()` | Called at load: fills moduleActions and moduleLookups. *(internal)* *(hook)* | 99 |
| `gameplayInterfaceModules_interactPartCondition.requestRegistration(gi)` | Registers the actions and lookups with gameplayInterface. *(internal)* | 95 |

### Parameter details

#### `gameplayInterfaceModules_interactPartCondition.requestRegistration(gi)`

Registers the actions and lookups with gameplayInterface.

- `gi` (*table*) : The gameplayInterface module.

## Fields

| Field | Type | Description |
|---|---|---|
| `moduleActions` | table<string, function> | Actions: initPartConditions, ensurePartConditionsInit, createPartConditionSnapshot, applyPartConditionSnapshot, deletePartConditionSnapshots, setPartConditionResetSnapshotKey, createAndSetPartConditionResetSnapshotKey. |
| `moduleLookups` | table<string, function> | Lookups: getPartConditions, getRootPartOdometer. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/extensions/gameplayInterfaceModules/interactPartCondition.lua`.*
