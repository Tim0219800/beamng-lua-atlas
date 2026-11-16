# `career_modules_tutorial_step09spmSignup`

*File: `lua/ge/extensions/career/modules/tutorial/step09spmSignup.lua` · VM: Game Engine (GE) · 320 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `career_modules_tutorial_step09spmSignup`: `extensions.load("career_modules_tutorial_step09spmSignup")`, then the global `career_modules_tutorial_step09spmSignup`

Career tutorial step 9 and last ("spmSignup"): the player accesses the garage computer, signs the hiring contract (contract popup, starting bonus of 10,000), opens the vehicle shop, chooses a seller, opens the purchase screen and buys their first vehicle. When it is added to the inventory, the v2/careerUnlocked popup is displayed, then career_modules_tutorial.endTutorial() is called. The tutorial vehicle is deleted when the purchase screen opens.

## Notes

- Phases (strings): waitComputer, waitApmPopup, waitMarketplaceOpen, waitSellerSelect, waitPurchaseMenu, waitVehicleAdded, waitCareerUnlocked.
- The STARTING_BONUS_MONEY = 10000 bonus is credited only once (tags tutorial/startingBonus), with a money sound; it is triggered when the contractSign popup closes or by onCareerTutorialRedeemedContractVoucher.
- Unlocked achievements: WELCOME_TO_APM (signing), FIRST_ROLLOUT (end), EXTRA_CREDIT if career_modules_tutorial.playedAdvancedTimeTrial is true (field set dynamically by step 4).
- The onVehicleShopping* and onVehicleAddedToInventory hooks are emitted by the career_modules_vehicleShopping module and the inventory.

## Functions

| Function | Description | Line |
|---|---|---|
| `career_modules_tutorial_step09spmSignup.cleanup()` | Removes the marker and money sound, clears zones, reset and task list. *(internal)* | 291 |
| `career_modules_tutorial_step09spmSignup.onCareerTutorialRedeemedContractVoucher()` | Hook emitted when the contract voucher is used: credits the starting bonus. *(internal)* *(hook)* | 202 |
| `career_modules_tutorial_step09spmSignup.onComputerMenuOpened()` | Hook emitted when the computer menu opens: validates the objective and opens the contract signing popup (user = current profile). *(internal)* *(hook)* | 171 |
| `career_modules_tutorial_step09spmSignup.onDebugMenu(im)` | Displays the phase and a "Skip Step 9" button (validates all objectives and opens the careerUnlocked popup). *(internal)* *(hook)* | 305 |
| `career_modules_tutorial_step09spmSignup.onGetRawPoiListForTutorial(elements)` | Adds the garage computer (servicestationGarageComputer facility) to the POI list during step 09spmSignup. *(internal)* *(hook)* | 283 |
| `career_modules_tutorial_step09spmSignup.onIntroPopupCareerClosed(id)` | Popup close hook: contractSign (bonus + achievement), v2/apmOnboarding (marketplace opening objective) and v2/careerUnlocked (achievement then end of the tutorial). *(internal)* *(hook)* | 207 |
| `career_modules_tutorial_step09spmSignup.onUpdate(dtReal, dtSim, dtRaw)` | Called every frame (waitComputer phase): hides the entrance marker within 3 m and clears the guidance path within 1 m of the walking start point. *(internal)* *(hook)* | 186 |
| `career_modules_tutorial_step09spmSignup.onVehicleAddedToInventory(data)` | Hook emitted when a vehicle is added to the inventory: deactivates zones and reset, validates the final objective and displays the v2/careerUnlocked popup. *(internal)* *(hook)* | 266 |
| `career_modules_tutorial_step09spmSignup.onVehicleShoppingMenuOpened(data)` | Hook emitted when the vehicle shop opens: validates the objective and asks to choose a seller. *(internal)* *(hook)* | 235 |
| `career_modules_tutorial_step09spmSignup.onVehicleShoppingPurchaseMenuOpened(data)` | Hook emitted when the purchase screen opens: deletes the tutorial vehicle and displays the v2/vehiclePurchaseAndInsurance popup. *(internal)* *(hook)* | 253 |
| `career_modules_tutorial_step09spmSignup.onVehicleShoppingSelectedSellerIdChanged(payload)` | Hook emitted when the selected seller changes: validates the objective and asks to open the purchase. *(internal)* *(hook)* | 244 |
| `career_modules_tutorial_step09spmSignup.setup(stepData)` | Called on activation: resets the objectives, activates the garageBounds zone, gets the garageInteriorWalkStart and garageEntranceMarker spots, displays the "access the computer" objective and the entrance marker. *(internal)* | 146 |

### Parameter details

#### `career_modules_tutorial_step09spmSignup.onDebugMenu(im)`

Displays the phase and a "Skip Step 9" button (validates all objectives and opens the careerUnlocked popup).

- `im` (*table*) : ui_imgui table.

#### `career_modules_tutorial_step09spmSignup.onGetRawPoiListForTutorial(elements)`

Adds the garage computer (servicestationGarageComputer facility) to the POI list during step 09spmSignup.

- `elements` (*table*) : POI list to complete.

#### `career_modules_tutorial_step09spmSignup.onIntroPopupCareerClosed(id)`

Popup close hook: contractSign (bonus + achievement), v2/apmOnboarding (marketplace opening objective) and v2/careerUnlocked (achievement then end of the tutorial).

- `id` (*string*) : Popup id.

#### `career_modules_tutorial_step09spmSignup.onUpdate(dtReal, dtSim, dtRaw)`

Called every frame (waitComputer phase): hides the entrance marker within 3 m and clears the guidance path within 1 m of the walking start point.

- `dtReal` (*number*) : Real time delta (s).
- `dtSim` (*number*) : Simulation delta (s).
- `dtRaw` (*number*) : Raw delta (s).

#### `career_modules_tutorial_step09spmSignup.onVehicleAddedToInventory(data)`

Hook emitted when a vehicle is added to the inventory: deactivates zones and reset, validates the final objective and displays the v2/careerUnlocked popup.

- `data` (*any*) : Data of the added vehicle (unused).

#### `career_modules_tutorial_step09spmSignup.onVehicleShoppingMenuOpened(data)`

Hook emitted when the vehicle shop opens: validates the objective and asks to choose a seller.

- `data` (*any*) : Menu data (unused).

#### `career_modules_tutorial_step09spmSignup.onVehicleShoppingPurchaseMenuOpened(data)`

Hook emitted when the purchase screen opens: deletes the tutorial vehicle and displays the v2/vehiclePurchaseAndInsurance popup.

- `data` (*any*) : Menu data (unused).

#### `career_modules_tutorial_step09spmSignup.onVehicleShoppingSelectedSellerIdChanged(payload)`

Hook emitted when the selected seller changes: validates the objective and asks to open the purchase.

- `payload` (*any*) : Change data (unused).

#### `career_modules_tutorial_step09spmSignup.setup(stepData)`

Called on activation: resets the objectives, activates the garageBounds zone, gets the garageInteriorWalkStart and garageEntranceMarker spots, displays the "access the computer" objective and the entrance marker.

- `stepData` (*any*) : Step data (unused).

**UI events (guihooks.trigger):** `ClearTasklist`, `careerStatusDataUpdated`

## Calls into the engine (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/career/modules/tutorial/step09spmSignup.lua`.*
