# `gameplay_walk`

*File: `lua/ge/extensions/gameplay/walk.lua` · VM: Game Engine (GE) · 697 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_walk`: `extensions.load("gameplay_walk")`, then the global `gameplay_walk`

Player "walking" mode: leaving the vehicle spawns a special "unicycle" vehicle (the character) that the player controls on foot; getting back into a nearby vehicle deactivates it. Manages, per player (including multiseat/split screen), the unicycle, its face (face part) and its color, detects the nearest vehicle within 2 m (distance to the edges of its oriented box), shows the "walkingmode" message and exposes a vehicle blacklist. A modder uses it to teleport/place the player, force walking mode or forbid it.

## Example

```lua
gameplay_walk.setWalkingMode(true, vec3(x, y, z), quat(0, 0, 0, 1), true) -- forces walking mode at a position
if gameplay_walk.isWalking() then gameplay_walk.getInVehicle(veh) end
gameplay_walk.addVehicleToBlacklist(vehId) -- this vehicle will not be offered for entry
```

## Notes

- `player` is the player index (0 by default); most functions accept nil and use 0.
- The player is "on foot" when their current vehicle has the "unicycle" jbeam file (getCurrentUnicycle).
- Toggling: only possible if force, or (parking speed reached and toggling enabled, toggleWalkingMode action not blocked, replay not playing). Speed thresholds: < 5 km/h becomes "stationary", > 6 km/h becomes "moving" (hysteresis).
- Emitted hook: onBeforeWalkingModeToggled(enabled, vehId|nil, player) before the change; the UI "Message" (cameramode category) is cleared when entering walking mode.
- In multiplayer, toggleWalkingMode delegates to multiplayer_vehicleSync.requestWalkingMode.
- If gameplay_seatOccupants exists, entering a vehicle goes through requestEnterBestSeat and exiting through getSeatExitData.
- A debug dump(config) remains in the code: it writes the config to the logs every time a unicycle is created.
- The internal state `active[player]` is only updated by onVehicleSwitched and onDeserialize: setRot does nothing until the player has triggered a vehicle change.
- The restore hook is named onDeserialize (not onDeserialized) in this file, while serialization is named onSerialize: possible naming inconsistency depending on what the extension manager calls (not verified here).
- onClientEndMission clears the unicycle, face and paint memories; onClientStartMission clears the blacklist and re-enables toggling.

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_walk.addVehicleToBlacklist(vehId)` | Excludes a vehicle from the candidates for entry in walking mode. | 561 |
| `gameplay_walk.canSetWalkingMode(enabled, force, player)` | Like canToggleWalkingMode, but also requires the requested state to differ from the active state. | 306 |
| `gameplay_walk.canToggleWalkingMode(force, player)` | Returns whether the player can switch modes: force, or parking speed + toggling enabled + action not blocked + no replay playing. | 298 |
| `gameplay_walk.clearBlacklist()` | Clears the blacklist. | 573 |
| `gameplay_walk.enableToggling(enabled)` | Allows or forbids manual switching between vehicle and walking. | 553 |
| `gameplay_walk.getBlacklist()` | Returns the blacklist table (id -> true), not a copy. | 577 |
| `gameplay_walk.getCurrentUnicycle(player)` | Returns the unicycle the player is controlling right now, whether or not it is the one stored in unicycleIds. | 114 |
| `gameplay_walk.getDoorsidePosRot(veh)` | Computes a position near a vehicle's driver door (left or right side depending on the driving side), oriented toward the vehicle's center. | 215 |
| `gameplay_walk.getFacePart(player)` | Character face. Priority: unicycle part (parts selector), playerCharacterFace setting (per persona in split screen), last known face, random face. | 135 |
| `gameplay_walk.getInVehicle(vehicle, player)` | Makes the player enter a vehicle (be:enterVehicle), storing their current unicycle. | 252 |
| `gameplay_walk.getPaint(player)` | Character paint. Priority: persona paint (multiseat), unicycle paint (config menu), last known paint, saved playerCharacterColor color. | 150 |
| `gameplay_walk.getPosRot(player)` | Unicycle position and camera orientation of the on-foot player. | 530 |
| `gameplay_walk.getPosXYZ(player)` | Unicycle position as three numbers (no allocation). | 538 |
| `gameplay_walk.getRotXYZW(player)` | On-foot player's camera orientation as four numbers. | 546 |
| `gameplay_walk.getStoredUnicycleId(player)` | Id of the unicycle stored for this player (even if inactive, e.g. while they are driving). | 357 |
| `gameplay_walk.getVehicleInFront(player)` | Nearest vehicle (within 2 m) that the on-foot player can enter. | 510 |
| `gameplay_walk.isAtParkingSpeed(player)` | Returns whether the nearest vehicle (or the player's) is slow enough to allow switching to walking mode. | 181 |
| `gameplay_walk.isTogglingEnabled()` | Indicates whether switching is allowed. | 557 |
| `gameplay_walk.isVehicleBlacklisted(vehId)` | Tests whether a vehicle is in the blacklist. | 569 |
| `gameplay_walk.isWalking(player)` | Returns whether the player is currently controlling a unicycle. | 177 |
| `gameplay_walk.onCameraChanged(player, camName, vid)` | Hook called when a player's camera changes: hides the unicycle in the player's view when they use the unicycle camera, or when the big map transition moves away from them. *(internal)* *(hook)* | 598 |
| `gameplay_walk.onClientEndMission(levelPath)` | Hook called at the end of a level: forgets unicycles, faces and paints. *(internal)* *(hook)* | 586 |
| `gameplay_walk.onClientStartMission(levelPath)` | Hook called at the start of a level: clears the blacklist, re-enables toggling. *(internal)* *(hook)* | 581 |
| `gameplay_walk.onDeserialize(data)` | Restores the serialized state and recomputes which players are on foot. *(internal)* *(hook)* | 518 |
| `gameplay_walk.onSerialize()` | Save hook before extensions reload: toggling, blacklist, unicycles, faces, paints. *(internal)* *(hook)* | 514 |
| `gameplay_walk.onSplitScreenChanged(enabled, playerCount, layout, mode)` | Hook called when split screen changes: reconfigures the unicycle colors. *(internal)* *(hook)* | 593 |
| `gameplay_walk.onUpdate(dtReal, dtSim)` | Hook called every frame: for each player, looks for the nearby vehicle, updates the parking speed and shows/removes the "walkingmode" message. *(internal)* *(hook)* | 502 |
| `gameplay_walk.onVehicleColorChanged(vehId, index, paint)` | Hook called when a vehicle's color changes: if it is a player's unicycle (outside multiseat), saves the paint in the playerCharacterColor setting. *(internal)* *(hook)* | 628 |
| `gameplay_walk.onVehicleDestroyed(vehId)` | Hook called when a vehicle is destroyed: forgets the corresponding unicycle. *(internal)* *(hook)* | 654 |
| `gameplay_walk.onVehicleReplaced(vehId)` | Hook called when a vehicle is replaced: forgets the corresponding unicycle. *(internal)* *(hook)* | 650 |
| `gameplay_walk.onVehicleSwitched(oldId, newId, player)` | Hook called when a player switches vehicle: deactivates the previously stored unicycle and updates the active state. *(internal)* *(hook)* | 617 |
| `gameplay_walk.removeVehicleFromBlacklist(vehId)` | Removes a vehicle from the blacklist. | 565 |
| `gameplay_walk.setFacePart(player, facePart)` | Changes the face. If the player is on foot, their unicycle is reconfigured; otherwise the stored unicycle is deleted and will be recreated later. | 163 |
| `gameplay_walk.setRot(front, up, player)` | Orients the camera/on-foot character via the unicycle camera data. Has no effect if the player is not active in walking mode. | 287 |
| `gameplay_walk.setWalkingMode(enabled, pos, rot, force, player)` | Enables or disables walking mode. On enabling, spawns or reactivates the unicycle at pos (otherwise near the door or at the seat left) and places the player in it. On disabling, enters the nearby vehicle, or simply deactivates the unicycle. | 311 |
| `gameplay_walk.toggleWalkingMode(player)` | Toggles walking mode (called by the input action). Does nothing if the player is walking with no vehicle nearby; in multiplayer, goes through multiplayer_vehicleSync. | 361 |

### Parameter details

#### `gameplay_walk.addVehicleToBlacklist(vehId)`

Excludes a vehicle from the candidates for entry in walking mode.

- `vehId` (*integer*) : Vehicle id.

#### `gameplay_walk.canSetWalkingMode(enabled, force, player)`

Like canToggleWalkingMode, but also requires the requested state to differ from the active state.

- `enabled` (*boolean*) : Requested state.
- `force` (*boolean|nil*) : Ignores restrictions.
- `player` (*integer|nil*) : Player index.
- **returns**: boolean 

#### `gameplay_walk.canToggleWalkingMode(force, player)`

Returns whether the player can switch modes: force, or parking speed + toggling enabled + action not blocked + no replay playing.

- `force` (*boolean|nil*) : Ignores all restrictions.
- `player` (*integer|nil*) : Player index.
- **returns**: boolean 

#### `gameplay_walk.enableToggling(enabled)`

Allows or forbids manual switching between vehicle and walking.

- `enabled` (*boolean*) : true to allow.

#### `gameplay_walk.getBlacklist()`

Returns the blacklist table (id -> true), not a copy.

- **returns**: table<integer, boolean> 

#### `gameplay_walk.getCurrentUnicycle(player)`

Returns the unicycle the player is controlling right now, whether or not it is the one stored in unicycleIds.

- `player` (*integer|nil*) : Player index.
- **returns**: userdata|nil Unicycle vehicle object, nil otherwise.

#### `gameplay_walk.getDoorsidePosRot(veh)`

Computes a position near a vehicle's driver door (left or right side depending on the driving side), oriented toward the vehicle's center.

- `veh` (*userdata*) : Vehicle object.
- **returns**: vec3 Position.
- **returns**: vec3 Forward direction (z = 0).
- **returns**: vec3 Up vector (0,0,1).

#### `gameplay_walk.getFacePart(player)`

Character face. Priority: unicycle part (parts selector), playerCharacterFace setting (per persona in split screen), last known face, random face.

- `player` (*integer|nil*) : Player index.
- **returns**: string Name of the skin_character_face part.

#### `gameplay_walk.getInVehicle(vehicle, player)`

Makes the player enter a vehicle (be:enterVehicle), storing their current unicycle.

- `vehicle` (*userdata*) : Vehicle to enter.
- `player` (*integer|nil*) : Player index.

#### `gameplay_walk.getPaint(player)`

Character paint. Priority: persona paint (multiseat), unicycle paint (config menu), last known paint, saved playerCharacterColor color.

- `player` (*integer|nil*) : Player index.
- **returns**: table Vehicle paint.

#### `gameplay_walk.getPosRot(player)`

Unicycle position and camera orientation of the on-foot player.

- `player` (*integer|nil*) : Player index.
- **returns**: vec3|nil Position.
- **returns**: quat|nil Camera rotation.

#### `gameplay_walk.getPosXYZ(player)`

Unicycle position as three numbers (no allocation).

- `player` (*integer|nil*) : Player index.
- **returns**: number|nil x, y, z (nil if the player is not on foot).

#### `gameplay_walk.getRotXYZW(player)`

On-foot player's camera orientation as four numbers.

- `player` (*integer|nil*) : Player index.
- **returns**: number|nil x, y, z, w (nil if the player is not on foot).

#### `gameplay_walk.getStoredUnicycleId(player)`

Id of the unicycle stored for this player (even if inactive, e.g. while they are driving).

- `player` (*integer|nil*) : Player index.
- **returns**: integer|nil 

#### `gameplay_walk.getVehicleInFront(player)`

Nearest vehicle (within 2 m) that the on-foot player can enter.

- `player` (*integer|nil*) : Player index.
- **returns**: userdata|nil 

#### `gameplay_walk.isAtParkingSpeed(player)`

Returns whether the nearest vehicle (or the player's) is slow enough to allow switching to walking mode.

- `player` (*integer|nil*) : Player index.
- **returns**: boolean false only if the speed exceeded 6 km/h without dropping back below 5 km/h.

#### `gameplay_walk.isTogglingEnabled()`

Indicates whether switching is allowed.

- **returns**: boolean 

#### `gameplay_walk.isVehicleBlacklisted(vehId)`

Tests whether a vehicle is in the blacklist.

- `vehId` (*integer*) : Vehicle id.
- **returns**: boolean|nil true or nil.

#### `gameplay_walk.isWalking(player)`

Returns whether the player is currently controlling a unicycle.

- `player` (*integer|nil*) : Player index (0 by default).
- **returns**: boolean 

#### `gameplay_walk.onCameraChanged(player, camName, vid)`

Hook called when a player's camera changes: hides the unicycle in the player's view when they use the unicycle camera, or when the big map transition moves away from them.

- `player` (*integer*) : Player index.
- `camName` (*string*) : Camera mode name.
- `vid` (*integer|nil*) : Id of the tracked vehicle.

#### `gameplay_walk.onClientEndMission(levelPath)`

Hook called at the end of a level: forgets unicycles, faces and paints.

- `levelPath` (*string*) : Level path.

#### `gameplay_walk.onClientStartMission(levelPath)`

Hook called at the start of a level: clears the blacklist, re-enables toggling.

- `levelPath` (*string*) : Level path.

#### `gameplay_walk.onDeserialize(data)`

Restores the serialized state and recomputes which players are on foot.

- `data` (*table*) : onSerialize table.

#### `gameplay_walk.onSerialize()`

Save hook before extensions reload: toggling, blacklist, unicycles, faces, paints.

- **returns**: table {togglingEnabled, vehicleBlacklist, unicycleIds, faceParts, paints}

#### `gameplay_walk.onSplitScreenChanged(enabled, playerCount, layout, mode)`

Hook called when split screen changes: reconfigures the unicycle colors.

- `enabled` (*boolean*) : Split screen active.
- `playerCount` (*integer*) : Number of players.
- `layout` (*any*) : Layout.
- `mode` (*any*) : Mode.

#### `gameplay_walk.onUpdate(dtReal, dtSim)`

Hook called every frame: for each player, looks for the nearby vehicle, updates the parking speed and shows/removes the "walkingmode" message.

- `dtReal` (*number*) : Real time delta (s).
- `dtSim` (*number*) : Simulated time delta (s).

#### `gameplay_walk.onVehicleColorChanged(vehId, index, paint)`

Hook called when a vehicle's color changes: if it is a player's unicycle (outside multiseat), saves the paint in the playerCharacterColor setting.

- `vehId` (*integer*) : Vehicle id.
- `index` (*integer*) : Paint index (only 1 is taken into account).
- `paint` (*table*) : Paint.

#### `gameplay_walk.onVehicleDestroyed(vehId)`

Hook called when a vehicle is destroyed: forgets the corresponding unicycle.

- `vehId` (*integer*) : Vehicle id.

#### `gameplay_walk.onVehicleReplaced(vehId)`

Hook called when a vehicle is replaced: forgets the corresponding unicycle.

- `vehId` (*integer*) : Vehicle id.

#### `gameplay_walk.onVehicleSwitched(oldId, newId, player)`

Hook called when a player switches vehicle: deactivates the previously stored unicycle and updates the active state.

- `oldId` (*integer*) : Old vehicle.
- `newId` (*integer*) : New vehicle.
- `player` (*integer|nil*) : Player index.

#### `gameplay_walk.removeVehicleFromBlacklist(vehId)`

Removes a vehicle from the blacklist.

- `vehId` (*integer*) : Vehicle id.

#### `gameplay_walk.setFacePart(player, facePart)`

Changes the face. If the player is on foot, their unicycle is reconfigured; otherwise the stored unicycle is deleted and will be recreated later.

- `player` (*integer|nil*) : Player index.
- `facePart` (*string*) : Face part name.

#### `gameplay_walk.setRot(front, up, player)`

Orients the camera/on-foot character via the unicycle camera data. Has no effect if the player is not active in walking mode.

- `front` (*vec3*) : Forward direction.
- `up` (*vec3*) : Up direction.
- `player` (*integer|nil*) : Player index.

#### `gameplay_walk.setWalkingMode(enabled, pos, rot, force, player)`

Enables or disables walking mode. On enabling, spawns or reactivates the unicycle at pos (otherwise near the door or at the seat left) and places the player in it. On disabling, enters the nearby vehicle, or simply deactivates the unicycle.

- `enabled` (*boolean*) : true to walk.
- `pos` (*vec3|nil*) : Spawn position (optional).
- `rot` (*quat|nil*) : Starting orientation (optional).
- `force` (*boolean|nil*) : Ignores toggle restrictions.
- `player` (*integer|nil*) : Player index.
- **returns**: boolean true if the requested state is reached (false if blocked).
- **returns**: integer|nil Current unicycle id.

#### `gameplay_walk.toggleWalkingMode(player)`

Toggles walking mode (called by the input action). Does nothing if the player is walking with no vehicle nearby; in multiplayer, goes through multiplayer_vehicleSync.

- `player` (*integer|nil*) : Player index (ignored if negative).

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onBeforeWalkingModeToggled` — listened to by 2 module(s)

**UI events (guihooks.trigger):** `Message`

## Calls into the engine (C++)

- `be:` `enterVehicle`, `exitVehicle`, `getObjectOOBBCenterXYZ`, `getObjectOOBBHalfAxisXYZ`, `getObjectOOBBIsInitialized`, `getPlayerVehicleID`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/walk.lua`.*
