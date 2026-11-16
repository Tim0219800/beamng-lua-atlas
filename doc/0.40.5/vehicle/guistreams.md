# `streams`

*File: `lua/vehicle/guistreams.lua` · VM: Vehicle · 169 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** global `streams`

Data streams sent to the UI (HUD apps) at high frequency. Each stream has a name (wheelInfo, engineInfo, stats, electrics, sensors, environment, genericGraphAdvanced…); the UI indicates which ones it needs via setRequiredStreams, and only those are computed then queued with guihooks.queueStream. Accessible as the global `streams` (main.lua: streams = require('guistreams')). guihooks.lua calls streams.update() when sending.

## Example

```lua
if streams.willSend('myStream') then
  guihooks.queueStream('myStream', {value = 42})
end
streams.drawGraph('speed', electrics.values.wheelspeed)
```

## Notes

- willSend(name) is true only if guihooks.updateStreams (computed in main.lua:onGraphicsStep = active streams AND obj's UI refresh flag) is true and the stream is requested: useful to avoid building data needlessly.
- hasActiveStreams() returns true as long as setRequiredStreams has never been called (as a precaution at startup), then only if at least one stream remains requested.
- wheelInfo: per wheel, numerically indexed array: [1] name, [2] radius, [3] wheelDir, [4] angular velocity, [5] propulsionTorque, [6] lastSlip, [7] 0 (obsolete), [8] downForce, [9] brakingTorque, [10] brakeTorque, [11..13] static wheel center x,y,z, [14] offset along the axis, [15] rotatorType ('wheel' by default), [16] parkingTorque. The per-wheel tables are reused (cache).
- sensors: gx, gy, gz, gx2, gy2, gz2, forceAtWheelNorm, forceAtDriverNorm, curForceLimitNorm, torqueCurrent (hydros), position {x,y,z}, roll, pitch, yaw, gravity. environment: temperature (K), pressure (obj:getEnvPressure). stats: obj:calcBeamStats() + tri_count + collidable_tri_count. engineInfo: controller.mainController.engineInfo. electrics: electrics.values.
- The streamsHandlers table (one function per stream) is local and is not exported in M; only reset, update, setRequiredStreams, willSend, hasActiveStreams and drawGraph are.
- drawGraph sends the 'genericGraphAdvanced' stream with a frame counter _fidx that increments on each call and the value of each key k.

## Functions

| Function | Description | Line |
|---|---|---|
| `streams.drawGraph(k, val)` | Adds a value to the UI's advanced generic graph ('genericGraphAdvanced' stream), if this stream is requested. | 151 |
| `streams.hasActiveStreams()` | Indicates whether at least one stream is requested (or whether the list has never been set). Used by main.lua:onGraphicsStep. *(internal)* | 146 |
| `streams.reset()` | Clears the requested streams and the cache of static wheel positions. *(internal)* | 21 |
| `streams.setRequiredStreams(state)` | Sets the list of streams requested by the UI (replaces the previous one). Called by the engine/the UI. *(internal)* | 137 |
| `streams.update()` | Called by guihooks when sending the streams: runs the handler of each requested stream (those of streamsHandlers), which queues its data. *(internal)* | 128 |
| `streams.willSend(name)` | Indicates whether a stream must be sent this frame (stream requested by the UI and sending active). | 17 |

### Parameter details

#### `streams.drawGraph(k, val)`

Adds a value to the UI's advanced generic graph ('genericGraphAdvanced' stream), if this stream is requested.

- `k` (*string*) : Series name.
- `val` (*number*) : Current value.

#### `streams.hasActiveStreams()`

Indicates whether at least one stream is requested (or whether the list has never been set). Used by main.lua:onGraphicsStep.

- **returns**: boolean true if streams are active.

#### `streams.setRequiredStreams(state)`

Sets the list of streams requested by the UI (replaces the previous one). Called by the engine/the UI.

- `state` (*string[]*) : List of stream names.

#### `streams.willSend(name)`

Indicates whether a stream must be sent this frame (stream requested by the UI and sending active).

- `name` (*string*) : Stream name.
- **returns**: boolean|nil True if the stream must be produced (may return nil/false otherwise).

## Class `streamsHandlers`

Local (non-exported) table of stream handlers, one argument-less function per stream name; update() calls them.

| Method | Description | Line |
|---|---|---|
| `streamsHandlers.electrics()` | Queues electrics.values. | 100 |
| `streamsHandlers.engineInfo()` | Queues controller.mainController.engineInfo. | 89 |
| `streamsHandlers.environment()` | Queues ambient temperature and pressure. | 122 |
| `streamsHandlers.sensors()` | Queues accelerations, steering wheel forces, position, roll/pitch/yaw and gravity. | 104 |
| `streamsHandlers.stats()` | Queues obj:calcBeamStats() completed with tri_count and collidable_tri_count. | 93 |
| `streamsHandlers.wheelInfo()` | Builds and queues the 'wheelInfo' stream (see notes for the per-wheel format). | 26 |

## Calls into the engine (C++)

- `obj:` `calcBeamStats`, `getCollidableTriangleCount`, `getEnvPressure`, `getEnvTemperature`, `getGravity`, `getPositionXYZ`, `getRollPitchYaw`, `getTriangleCount`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/guistreams.lua`.*
