# `simTimeAuthority`

*File: `lua/ge/simTimeAuthority.lua` · VM: Game Engine (GE) · 325 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** global `simTimeAuthority`

Authority over the simulation time speed: pause, slow motion (bullet time) and resume, with smoothing. A modder uses it to pause the game, set a slow motion (0.001 to 1) or stack pause requests (pushPauseRequest/popPauseRequest). It synchronizes the C++ engine (be:setSimulationTimeScale, be:setEnabled) and the replay (core_replay), and notifies the UI (bullettime messages).

## Example

```lua
simTimeAuthority.set(0.25)        -- slow motion at quarter speed (smoothed)
simTimeAuthority.pause(true)      -- pause
simTimeAuthority.pushPauseRequest('monMod')
-- ... later
simTimeAuthority.popPauseRequest('monMod')
```

## Notes

- Speed values are limited to [0.001, 1] by setTargetSpeed (clamp): there is no accelerated speed > 1 despite the '2=fastmotion' comments in the code.
- The original comments of get/getReal/set/setInstant are shifted in the automatic page: get() returns the REQUESTED (desired) speed, getReal() the ACTUAL speed (after smoothing), set() changes the speed with gradual smoothing, setInstant() also changes the smoothed value immediately.
- During replay playback (core_replay.state.state == 'playback'), pause/pauseSmooth/togglePause/selectPreset delegate to the replay instead of the engine.
- pause() does nothing if no level is loaded (getCurrentLevelIdentifier() nil); pause() sets be:setEnabled and the speed right away, whereas pauseSmooth() goes through a smoothed transition down to speed 0.
- Pause stack: pushPauseRequest/popPauseRequest count by identifier (the same id is counted only once). On the last release, the simulation resumes only if it was not already paused before the first push. Both functions have no effect if core_intapi.debug_isPauseAllowed() returns false.
- The 12 slow-motion notches (selectionSlot) are 1/1000, 1/500, 1/200, 1/100, 1/50, 1/32, 1/16, 1/8, 1/4, 1/2, 3/4 and 1; the instant slow-motion notch and the 'toggle' notch are notch 8 (1/8).
- At module load, simulationSpeed is read from the engine (be:getSimulationTimeScale()) to stay in sync after a GE Lua reload; selectionSlot is chosen as the closest notch.
- onSerialize/onDeserialized have a TODO in the code ('verify this is working'); onDeserialized also empties the pause stack.

## Functions

| Function | Description | Line |
|---|---|---|
| `simTimeAuthority.clearPauseStack()` | Empties all pause requests and resumes the simulation (pause(false)). | 269 |
| `simTimeAuthority.get()` | Returns the requested simulation speed (target, not necessarily reached). | 152 |
| `simTimeAuthority.getInitialTimeScale()` | Returns the speed saved before the last pause: this is the one that will be restored on resume. | 292 |
| `simTimeAuthority.getPause()` | Indicates whether time is paused: replay pause state during playback, otherwise not be:getEnabled(). | 34 |
| `simTimeAuthority.getReal()` | Returns the speed actually applied to the engine (accounts for smoothing). | 148 |
| `simTimeAuthority.onDeserialized(data)` | Hook called after a GE Lua reload: restores simulationSpeed and the initial speed, then empties the pause stack. *(internal)* *(hook)* | 284 |
| `simTimeAuthority.onSerialize()` | Hook called before a GE Lua reload: returns the requested speed and the initial speed. *(internal)* *(hook)* | 279 |
| `simTimeAuthority.onUIInitialised()` | Hook called when the UI is initialized: empties the pause stack (clearPauseStack). *(internal)* *(hook)* | 275 |
| `simTimeAuthority.pause(paused, playPauseSound)` | Pauses or resumes instantly. Broadcasts the onSimTimePauseCalled(paused) hook. When pausing: saves the current speed, speed 0, be:setEnabled(false). On resume: restores the saved speed with smoothing. No effect if the requested state is already the current one or if no level is loaded. | 170 |
| `simTimeAuthority.pauseSmooth(paused, rateLimit, startAccel, stopAccel, playPauseSound)` | Pauses or resumes with a smoothed speed transition (gradual slowdown to 0, or speed-up). Emits the hook simTimePauseCalled(paused). The rates are given by the caller and apply only to this transition. | 199 |
| `simTimeAuthority.popPauseRequest(id)` | Removes an identified pause request. When the counter drops back to 0 and the game was not paused before the first request, the simulation resumes. | 256 |
| `simTimeAuthority.pushPauseRequest(id)` | Adds an identified pause request and pauses. Remembers whether the game was already paused at the first request. A given id is counted only once. | 242 |
| `simTimeAuthority.reportSpeed(speed, simplified)` | Displays a speed message on screen (guihooks 'Message', category bullettime): fast-forward, real time, slow motion (simplified) or slow motion by a factor computed with the current option. | 64 |
| `simTimeAuthority.requestValue()` | Sends the current requested speed to the UI (guihooks 'BullettimeValueChanged'). | 166 |
| `simTimeAuthority.selectPreset(val)` | Selects a slow-motion notch with direction keys. During a replay, drives the replay speed instead. | 122 |
| `simTimeAuthority.set(val)` | Changes the requested simulation speed (progressive smoothing to the new value) and displays the simplified speed message. The value is clamped to [0.001, 1]. A non-numeric value is rejected with a logged error. | 156 |
| `simTimeAuthority.setInstant(val)` | Like set, but also forces the smoothed value: the speed is applied without transition. Shows no message. | 161 |
| `simTimeAuthority.togglePause(playPauseSound)` | Toggles pause/resume. Emits the hook onTogglePause; during a replay calls core_replay.togglePlay(). | 229 |
| `simTimeAuthority.update(...)` | Update function registered with the extension system: on each call applies the ongoing speed smoothing (sends the speed to the engine via be:setSimulationTimeScale and physicsEngineEvent) and deactivates itself at the end of the transition. It serves as a wrapper because a registered function pointer cannot be replaced by nop. *(internal)* | 297 |

### Parameter details

#### `simTimeAuthority.get()`

Returns the requested simulation speed (target, not necessarily reached).

- **returns**: number 1 = real time, 0.5 = slow motion, 0 = pause.

#### `simTimeAuthority.getInitialTimeScale()`

Returns the speed saved before the last pause: this is the one that will be restored on resume.

- **returns**: number Speed to restore.

#### `simTimeAuthority.getPause()`

Indicates whether time is paused: replay pause state during playback, otherwise not be:getEnabled().

- **returns**: boolean true if paused.

#### `simTimeAuthority.getReal()`

Returns the speed actually applied to the engine (accounts for smoothing).

- **returns**: number Actual speed.

#### `simTimeAuthority.onDeserialized(data)`

Hook called after a GE Lua reload: restores simulationSpeed and the initial speed, then empties the pause stack.

- `data` (*table*) : Table returned by onSerialize: {simulationSpeed, initialTimeScale}.

#### `simTimeAuthority.onSerialize()`

Hook called before a GE Lua reload: returns the requested speed and the initial speed.

- **returns**: table {simulationSpeed = number, initialTimeScale = number}.

#### `simTimeAuthority.pause(paused, playPauseSound)`

Pauses or resumes instantly. Broadcasts the onSimTimePauseCalled(paused) hook. When pausing: saves the current speed, speed 0, be:setEnabled(false). On resume: restores the saved speed with smoothing. No effect if the requested state is already the current one or if no level is loaded.

- `paused` (*boolean*) : true to pause, false to resume.
- `playPauseSound` (*boolean|nil*) : true to play the pause sound (event:>UI>Main>Pause) when entering pause.

#### `simTimeAuthority.pauseSmooth(paused, rateLimit, startAccel, stopAccel, playPauseSound)`

Pauses or resumes with a smoothed speed transition (gradual slowdown to 0, or speed-up). Emits the hook simTimePauseCalled(paused). The rates are given by the caller and apply only to this transition.

- `paused` (*boolean*) : true to pause, false to resume.
- `rateLimit` (*number|nil*) : Maximum rate of speed change (20 by default if nil).
- `startAccel` (*number|nil*) : Acceleration at the start of the transition (10 by default).
- `stopAccel` (*number|nil*) : Deceleration at the end of the transition (3 by default).
- `playPauseSound` (*boolean|nil*) : true to play the pause sound.

#### `simTimeAuthority.popPauseRequest(id)`

Removes an identified pause request. When the counter drops back to 0 and the game was not paused before the first request, the simulation resumes.

- `id` (*string*) : Request identifier (the same as for pushPauseRequest).

#### `simTimeAuthority.pushPauseRequest(id)`

Adds an identified pause request and pauses. Remembers whether the game was already paused at the first request. A given id is counted only once.

- `id` (*string*) : Unique identifier of the caller.

#### `simTimeAuthority.reportSpeed(speed, simplified)`

Displays a speed message on screen (guihooks 'Message', category bullettime): fast-forward, real time, slow motion (simplified) or slow motion by a factor computed with the current option.

- `speed` (*number*) : Speed to announce.
- `simplified` (*boolean*) : true: generic slow-motion message with no factor or notch index.

#### `simTimeAuthority.selectPreset(val)`

Selects a slow-motion notch with direction keys. During a replay, drives the replay speed instead.

- `val` (*string*) : '^': toggles between real time and the last slow-motion notch; 'v': instant slow-motion notch (1/8); '<': slower notch; '>': faster notch.

#### `simTimeAuthority.set(val)`

Changes the requested simulation speed (progressive smoothing to the new value) and displays the simplified speed message. The value is clamped to [0.001, 1]. A non-numeric value is rejected with a logged error.

- `val` (*number*) : New speed (1 = real time, 0.5 = half).

#### `simTimeAuthority.setInstant(val)`

Like set, but also forces the smoothed value: the speed is applied without transition. Shows no message.

- `val` (*number*) : New speed (clamped to [0.001, 1]).

#### `simTimeAuthority.togglePause(playPauseSound)`

Toggles pause/resume. Emits the hook onTogglePause; during a replay calls core_replay.togglePlay().

- `playPauseSound` (*boolean|nil*) : true to play the pause sound.

#### `simTimeAuthority.update(...)`

Update function registered with the extension system: on each call applies the ongoing speed smoothing (sends the speed to the engine via be:setSimulationTimeScale and physicsEngineEvent) and deactivates itself at the end of the transition. It serves as a wrapper because a registered function pointer cannot be replaced by nop.

- `...` (*any*) : Update arguments; the first is dt (s).

## Fields

| Field | Type | Description |
|---|---|---|
| `selectionSlot` | integer | Index (1 to 12) of the selected slow-motion notch in the internal notch table (12 = real time). |
| `simulationSpeed` | number | Requested (target) simulation speed, 1 = real time, 0 = pause, 0.001 minimum outside pause. Initialized from be:getSimulationTimeScale(). |
| `simulationSpeedReal` | number | Speed currently applied to the engine after smoothing (updated by the update function). |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onSimTimePauseCalled`
- `onTogglePause` — listened to by 1 module(s)
- `simTimePauseCalled`

**UI events (guihooks.trigger):** `BullettimeValueChanged`, `Message`

## Calls into the engine (C++)

- `be:` `getEnabled`, `getSimulationTimeScale`, `setEnabled`, `setSimulationTimeScale`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/simTimeAuthority.lua`.*
