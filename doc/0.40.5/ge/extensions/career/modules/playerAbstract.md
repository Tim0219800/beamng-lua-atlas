# `career_modules_playerAbstract`

*File: `lua/ge/extensions/career/modules/playerAbstract.lua` · VM: Game Engine (GE) · 68 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `career_modules_playerAbstract`: `extensions.load("career_modules_playerAbstract")`, then the global `career_modules_playerAbstract`

"Driver abstract" screen accessible from the garage computer in career. It adds an entry to the computer menu and provides the UI with the data computed by the insurance module (career_modules_insurance_insurance.getPlayerAbstractData).

## Notes

- The computer function is disabled until the starter vehicle is bought (reasons.hasBoughtStarterVehicle).
- The menu only opens via navigate if an originating computer id is provided.

## Functions

| Function | Description | Line |
|---|---|---|
| `career_modules_playerAbstract.closePlayerAbstractMenu()` | Returns to the originating computer's menu, or closes all career menus if there is none. | 31 |
| `career_modules_playerAbstract.getPlayerAbstractData()` | Returns the driver abstract data provided by the insurance module. | 40 |
| `career_modules_playerAbstract.onComputerAddFunctions(menuData, computerFunctions)` | Computer hook: adds the playerAbstract function (order 15, category general) if the facility allows it. *(internal)* *(hook)* | 14 |
| `career_modules_playerAbstract.onRouteLeave(context, toRoute, fromRoute, data)` | UI router lifecycle: forgets the originating computer when leaving the screen. *(internal)* *(hook)* | 51 |
| `career_modules_playerAbstract.onRouteMount(context, toRoute, fromRoute, data)` | UI router lifecycle: places the abstract data in data.playerAbstract. *(internal)* *(hook)* | 46 |
| `career_modules_playerAbstract.openPlayerAbstractMenu(_originComputerId)` | Remembers the originating computer and, if it exists, navigates to career.computer.playerAbstract then triggers the onComputerPlayerAbstract hook. | 6 |
| `career_modules_playerAbstract.sendPlayerAbstractDataToUI()` | Pushes fresh data to an already open screen (guihooks playerAbstractData), e.g. after a score reset. | 56 |

### Parameter details

#### `career_modules_playerAbstract.getPlayerAbstractData()`

Returns the driver abstract data provided by the insurance module.

- **returns**: table Abstract data.

#### `career_modules_playerAbstract.onComputerAddFunctions(menuData, computerFunctions)`

Computer hook: adds the playerAbstract function (order 15, category general) if the facility allows it.

- `menuData` (*table*) : Menu data (computerFacility, hasBoughtStarterVehicle).
- `computerFunctions` (*table*) : Function tables to fill.

#### `career_modules_playerAbstract.onRouteLeave(context, toRoute, fromRoute, data)`

UI router lifecycle: forgets the originating computer when leaving the screen.

- `context` (*any*) : Router context.
- `toRoute` (*any*) : Target route.
- `fromRoute` (*any*) : Route being left.
- `data` (*table*) : routeData.

#### `career_modules_playerAbstract.onRouteMount(context, toRoute, fromRoute, data)`

UI router lifecycle: places the abstract data in data.playerAbstract.

- `context` (*any*) : Router context.
- `toRoute` (*any*) : Target route.
- `fromRoute` (*any*) : Previous route.
- `data` (*table*) : routeData to fill.

#### `career_modules_playerAbstract.openPlayerAbstractMenu(_originComputerId)`

Remembers the originating computer and, if it exists, navigates to career.computer.playerAbstract then triggers the onComputerPlayerAbstract hook.

- `_originComputerId` (*string|nil*) : Garage computer id.

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onComputerPlayerAbstract`

**UI events (guihooks.trigger):** `playerAbstractData`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/career/modules/playerAbstract.lua`.*
