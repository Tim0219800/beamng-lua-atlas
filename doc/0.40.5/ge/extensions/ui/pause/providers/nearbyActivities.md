# `ui_pause_providers_nearbyActivities`

*File: `lua/ge/extensions/ui/pause/providers/nearbyActivities.lua` · VM: Game Engine (GE) · 278 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_pause_providers_nearbyActivities`: `extensions.load("ui_pause_providers_nearbyActivities")`, then the global `ui_pause_providers_nearbyActivities`

Pause menu provider for the "nearby activities" section. It reads the big map points of interest (freeroam_vueBigMap.getPoiData) and the level's raw POIs (gameplay_rawPois), computes the distance to the player (camera position, marker radius inferred), then keeps up to 6 items: 2 closest, 2 of medium distance and the rest at random, sorted by distance. Each item carries two buttons: view on the map and set a route.

## Notes

- POIs of type spawnPoint and playerVehicle are excluded; a POI without a bigmap marker or without a position is ignored.
- The "view" button opens the big map (freeroam_bigMapMode.enterBigMap, instant, routeTarget pause.bigmap) with autoSelectPoiId and a zoom of 0.75; it is disabled if context.isBigMapAllowed is false.
- The "route" button calls freeroam_bigMapMode.navigateToMission(poiId); it is disabled during a career test drive (career_modules_testDrive.isActive()).
- If no activity is found, getData returns a dummy item with id nearby.none.
- The selection uses math.random: the content changes on every call.

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_pause_providers_nearbyActivities.executeNearbyActivityAction(buttonId, payload)` | Executes the button (view/route) identified by buttonId. Returns false if buttonId is nil. | 88 |
| `ui_pause_providers_nearbyActivities.getData(context)` | Builds the section data: {mode, sections = {{id = "nearbyActivities", title, items}}}. Each item contains id, title, icon, description (translated POI type), actionLabel, poiType, distanceM (m, rounded) and actions {view, route}. | 250 |

### Parameter details

#### `ui_pause_providers_nearbyActivities.executeNearbyActivityAction(buttonId, payload)`

Executes the button (view/route) identified by buttonId. Returns false if buttonId is nil.

- `buttonId` (*any*) : buttonId present in items[].actions.view / .route.
- `payload` (*any*) : Data passed to the button's callback.
- **returns**: any Button result (true/false).

#### `ui_pause_providers_nearbyActivities.getData(context)`

Builds the section data: {mode, sections = {{id = "nearbyActivities", title, items}}}. Each item contains id, title, icon, description (translated POI type), actionLabel, poiType, distanceM (m, rounded) and actions {view, route}.

- `context` (*table|nil*) : Fields read: mode (default "freeroam") and isBigMapAllowed.
- **returns**: table Section data for the pause UI.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/pause/providers/nearbyActivities.lua`.*
