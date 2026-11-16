# `ui_photomode_speedCameraOverlay`

*File: `lua/ge/extensions/ui/photomode/speedCameraOverlay.lua` · VM: Game Engine (GE) · 153 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_photomode_speedCameraOverlay`: `extensions.load("ui_photomode_speedCameraOverlay")`, then the global `ui_photomode_speedCameraOverlay`

Provides the data displayed by the photo mode "radar / speed camera" overlay: current map, place name, level time, player vehicle license plate, speed limit of the nearest road and position. Everything is read-only with protected accesses (pcall): no value is modified.

## Example

```lua
local d = ui_photomode_speedCameraOverlay.getData()
print(d.mapName, d.locationName, d.speedLimit, d.licensePlate)
```

## Notes

- The position comes from player vehicle 0, otherwise from the camera (core_camera.getPosition or getPositionXYZ).
- The limit comes from the road graph (map.findClosestRoad within a 120 m radius); it is nil if <= 0, infinite or > 200 (graph edge unit, m/s according to the road graph code — not verified here).
- Texts (level title, zone name) go through _tr if it exists.

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_photomode_speedCameraOverlay.getData()` | Builds the overlay's data table. Missing strings are "", levelTime is {} if the time is unavailable, roadDistance/speedLimit/position are nil if unknown. | 129 |

### Parameter details

#### `ui_photomode_speedCameraOverlay.getData()`

Builds the overlay's data table. Missing strings are "", levelTime is {} if the time is unavailable, roadDistance/speedLimit/position are nil if unknown.

- **returns**: table {mapId=string, mapName=string, locationName=string (highest-priority gameplay_city zone, otherwise mapName), levelTime={time,year,month,day} from core_environment.getTimeOfDay, licensePlate=string, roadDistance=number|nil (distance to the nearest road), speedLimit=number|nil, position={x,y,z}|nil}.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/photomode/speedCameraOverlay.lua`.*
