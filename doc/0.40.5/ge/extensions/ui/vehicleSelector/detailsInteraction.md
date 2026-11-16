# `ui_vehicleSelector_detailsInteraction`

*File: `lua/ge/extensions/ui/vehicleSelector/detailsInteraction.lua` · VM: Game Engine (GE) · 84 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_vehicleSelector_detailsInteraction`: `extensions.load("ui_vehicleSelector_detailsInteraction")`, then the global `ui_vehicleSelector_detailsInteraction`

Facade of the vehicle selector's details panel. It assembles the specifications (ui_vehicleSelector_vehicleSpecifications) and the action buttons (ui_vehicleSelector_vehicleOperations) of an item, and exposes a few actions (open a folder, go to a mod's page). A custom buttons mode lets other systems (challenge mode) replace the freeroam buttons.

## Notes

- If customDetailsButtons is not empty, the standard buttons are replaced: each button calls button.callback(modelKey, configKey, additionalData). Without additional data, the default paints (paint, paint2, paint3) of the config, or failing that of the model, are pre-filled.
- The managementButtonsEnabled field of this module is not read here; setManagementButtonsEnabled delegates to vehicleOperations.

**Dependencies (loaded first):** `ui_vehicleSelector_vehicleOperations`, `ui_vehicleSelector_vehicleSpecifications`

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_vehicleSelector_detailsInteraction.executeButton(...)` | Delegates to ui_vehicleSelector_vehicleOperations.executeButton with the same arguments. | 79 |
| `ui_vehicleSelector_detailsInteraction.executeDoubleClick(...)` | Delegates to ui_vehicleSelector_vehicleOperations.executeDoubleClick with the same arguments. | 80 |
| `ui_vehicleSelector_detailsInteraction.exploreFolder(path)` | Opens a folder in the system file explorer (Engine.Platform.exploreFolder). | 65 |
| `ui_vehicleSelector_detailsInteraction.getDetails(itemDetails)` | Returns the details of an item (specifications from vehicleSpecifications) completed with `buttonInfo`: custom buttons if defined, otherwise the standard launch buttons of vehicleOperations. | 13 |
| `ui_vehicleSelector_detailsInteraction.getManagementDetails()` | Returns the details of the management buttons provided by vehicleOperations.getManagementDetails(). | 55 |
| `ui_vehicleSelector_detailsInteraction.goToMod(modId)` | Navigates to a mod's details page in the interface (route 'menu.mods.details'). | 70 |
| `ui_vehicleSelector_detailsInteraction.setCustomDetailsButtons(buttons)` | Sets the list of custom buttons that replace the standard buttons in getDetails. | 83 |
| `ui_vehicleSelector_detailsInteraction.setDetailsButtonForFreeroam(...)` | Delegates to ui_vehicleSelector_vehicleOperations.setDetailsButtonForFreeroam. | 82 |
| `ui_vehicleSelector_detailsInteraction.setExitCallback(callback)` | Sets the function called on exit; nop if nil. | 59 |
| `ui_vehicleSelector_detailsInteraction.setManagementButtonsEnabled(...)` | Delegates to ui_vehicleSelector_vehicleOperations.setManagementButtonsEnabled. | 81 |

### Parameter details

#### `ui_vehicleSelector_detailsInteraction.executeButton(...)`

Delegates to ui_vehicleSelector_vehicleOperations.executeButton with the same arguments.

- `...` (*any*) : Arguments passed as is.
- **returns**: any Result of vehicleOperations.executeButton.

#### `ui_vehicleSelector_detailsInteraction.executeDoubleClick(...)`

Delegates to ui_vehicleSelector_vehicleOperations.executeDoubleClick with the same arguments.

- `...` (*any*) : Arguments passed as is.
- **returns**: any Result of vehicleOperations.executeDoubleClick.

#### `ui_vehicleSelector_detailsInteraction.exploreFolder(path)`

Opens a folder in the system file explorer (Engine.Platform.exploreFolder).

- `path` (*string*) : Folder path.

#### `ui_vehicleSelector_detailsInteraction.getDetails(itemDetails)`

Returns the details of an item (specifications from vehicleSpecifications) completed with `buttonInfo`: custom buttons if defined, otherwise the standard launch buttons of vehicleOperations.

- `itemDetails` (*table*) : Selected item (passed to vehicleSpecifications.getDetails).
- **returns**: table Details with a buttonInfo field.

#### `ui_vehicleSelector_detailsInteraction.getManagementDetails()`

Returns the details of the management buttons provided by vehicleOperations.getManagementDetails().

- **returns**: table Management information (inferred from code).

#### `ui_vehicleSelector_detailsInteraction.goToMod(modId)`

Navigates to a mod's details page in the interface (route 'menu.mods.details').

- `modId` (*string*) : Mod identifier.

#### `ui_vehicleSelector_detailsInteraction.setCustomDetailsButtons(buttons)`

Sets the list of custom buttons that replace the standard buttons in getDetails.

- `buttons` (*table*) : List of {callback, meta} objects.

#### `ui_vehicleSelector_detailsInteraction.setDetailsButtonForFreeroam(...)`

Delegates to ui_vehicleSelector_vehicleOperations.setDetailsButtonForFreeroam.

- `...` (*any*) : Arguments passed as is.

#### `ui_vehicleSelector_detailsInteraction.setExitCallback(callback)`

Sets the function called on exit; nop if nil.

- `callback` (*function|nil*) : Exit callback.

#### `ui_vehicleSelector_detailsInteraction.setManagementButtonsEnabled(...)`

Delegates to ui_vehicleSelector_vehicleOperations.setManagementButtonsEnabled.

- `...` (*any*) : Arguments passed as is.

## Fields

| Field | Type | Description |
|---|---|---|
| `customDetailsButtons` | table | Custom buttons ({callback, meta}); empty by default. |
| `dependencies` | string[] | ui_vehicleSelector_vehicleOperations, ui_vehicleSelector_vehicleSpecifications. |
| `exitCallback` | function | Exit callback, nop by default; modified by setExitCallback. |
| `managementButtonsEnabled` | boolean | Initial value true (configuration). |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/vehicleSelector/detailsInteraction.lua`.*
