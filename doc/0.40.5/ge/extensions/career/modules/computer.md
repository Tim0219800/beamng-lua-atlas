# `career_modules_computer`

*File: `lua/ge/extensions/career/modules/computer.lua` · VM: Game Engine (GE) · 143 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `career_modules_computer`: `extensions.load("career_modules_computer")`, then the global `career_modules_computer`

Garage "computer" menu in career mode. openMenu builds the list of vehicles in the nearest garage, lets other modules add their buttons via the onComputerAddFunctions hook, starts a tether (the menu closes if the player moves away), then navigates to the 'career.computer' UI screen. A modder adds a button by implementing onComputerAddFunctions(menuData, computerFunctions) in their extension.

## Example

```lua
-- add a general button to the computer menu
M.onComputerAddFunctions = function(menuData, computerFunctions)
  computerFunctions.general.monBouton = {
    id = 'monBouton', label = 'Mon bouton', callback = function(computerId) print(computerId) end,
    disabled = false
  }
end
```

## Notes

- Depends on career_career (M.dependencies).
- computerFunctions has two sub-tables: general[buttonId] and vehicleSpecific[inventoryId][buttonId]; each entry has a callback(computerId).
- M.reasons contains ready-made reasons (tutorialActive, hasBoughtStarterVehicle, needsRepair); getComputerUIData translates their label via core_locales.
- Probable bug: in openMenu, the startSphereTether(computerPos, ...) fallback uses the variable computerPos, which is not defined (the line that computes it is commented out); it is nil if the facility has no door.
- Tether distances: 1 m (box, door) and 4 m (sphere).

**Dependencies (loaded first):** `career_career`

## Functions

| Function | Description | Line |
|---|---|---|
| `career_modules_computer.closeMenu()` | Closes all career menus (career_career.closeAllMenus). Also serves as the tether callback when the player moves away. | 111 |
| `career_modules_computer.computerButtonCallback(buttonId, inventoryId)` | Called by the UI on a click: finds the button (vehicleSpecific[inventoryId] if inventoryId is given, otherwise general) and runs its callback(computerId). | 57 |
| `career_modules_computer.getComputerUIData()` | Returns to the UI a copy of the menu data: computerFunctions (reason labels translated, inventoryId keys converted to strings), vehicles (with thumbnail and inventoryId as a string), facilityName, resetActiveVehicleIndex, computerId. Empty table if the menu has not been opened. | 68 |
| `career_modules_computer.onMenuClosed()` | Hook called when the menu closes; removes the tether (tether.remove = true). *(internal)* *(hook)* | 107 |
| `career_modules_computer.openComputerMenuById(computerId)` | Gets the 'computer' facility by its id via freeroam_facilities.getFacility, then calls openMenu. | 115 |
| `career_modules_computer.openMenu(computerFacility, resetActiveVehicleIndex, activityElement)` | Opens the computer menu for a facility: lists the vehicles in the nearest garage (name, repair need, dirt date), fires onComputerAddFunctions, starts the tether, navigates to 'career.computer', then fires onComputerMenuOpened. | 18 |

### Parameter details

#### `career_modules_computer.computerButtonCallback(buttonId, inventoryId)`

Called by the UI on a click: finds the button (vehicleSpecific[inventoryId] if inventoryId is given, otherwise general) and runs its callback(computerId).

- `buttonId` (*string*) : Button key in computerFunctions.
- `inventoryId` (*integer|nil*) : Inventory id of the vehicle for a vehicle-specific button.

#### `career_modules_computer.getComputerUIData()`

Returns to the UI a copy of the menu data: computerFunctions (reason labels translated, inventoryId keys converted to strings), vehicles (with thumbnail and inventoryId as a string), facilityName, resetActiveVehicleIndex, computerId. Empty table if the menu has not been opened.

- **returns**: table Data for the career.computer screen.

#### `career_modules_computer.openComputerMenuById(computerId)`

Gets the 'computer' facility by its id via freeroam_facilities.getFacility, then calls openMenu.

- `computerId` (*string*) : Computer facility identifier.

#### `career_modules_computer.openMenu(computerFacility, resetActiveVehicleIndex, activityElement)`

Opens the computer menu for a facility: lists the vehicles in the nearest garage (name, repair need, dirt date), fires onComputerAddFunctions, starts the tether, navigates to 'career.computer', then fires onComputerMenuOpened.

- `computerFacility` (*table*) : 'computer' facility (fields id, name, doors).
- `resetActiveVehicleIndex` (*boolean|nil*) : Passed to the UI in menuData.resetActiveVehicleIndex.
- `activityElement` (*any*) : Not used in the function.

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | string[] | {"career_career"}: extensions loaded before this module. |
| `reasons` | table<string, table> | Standard reasons for disabling a button: tutorialActive, hasBoughtStarterVehicle (type 'text') and needsRepair (type 'needsRepair'), each with a translation label. |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onComputerAddFunctions` — listened to by 11 module(s)
- `onComputerMenuOpened` — listened to by 1 module(s)

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/career/modules/computer.lua`.*
