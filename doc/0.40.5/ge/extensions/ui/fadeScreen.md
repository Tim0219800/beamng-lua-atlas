# `ui_fadeScreen`

*File: `lua/ge/extensions/ui/fadeScreen.lua` · VM: Game Engine (GE) · 104 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_fadeScreen`: `extensions.load("ui_fadeScreen")`, then the global `ui_fadeScreen`

Screen fade to black driven from Lua. Sends the UI event "LoadingScreen" (active + fadeIn/pause/fadeOut/data parameters), sets the global FMOD audio parameters g_FadeTimeMS and g_GameLoading, and notifies the other extensions via the hook onScreenFadeState when the UI signals that the screen is black (1), that the pause is over (2) or that the fade back is finished (3). Used for level loads, teleports and transitions.

## Example

```lua
ui_fadeScreen.cycle(0.5, 0.2, 0.5)  -- black, pause, back
-- or: ui_fadeScreen.start(1, {title='Loading'}) ... ui_fadeScreen.stop(1)
```

## Notes

- Durations in seconds.
- start/stop/cycle are aliases of fadeToBlack/fadeFromBlack/fadeSequence.
- onScreenFadeState: 1 = screen fully black, 2 = end of pause, 3 = fade back finished. State 1 is only broadcast after delayFrames (3) onGuiUpdate frames to be sure the screen is black; isBlack() only becomes true at that point, if black was requested.
- In headless mode (headless_mode), there is no UI: fadeToBlack sets isBlack to true and broadcasts state 1 immediately, fadeFromBlack broadcasts state 3.
- fadeSequence enforces a minimum pause of 0.05 s (a TODO says that a zero pause breaks things).
- A sequence's fade automatically switches to fadeFromBlack at state 2; a lone fadeToBlack stays on black (pause -1) until fadeFromBlack.

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_fadeScreen.cycle(fadeIn, pause, fadeOut, screenData, args)` | Alias of fadeSequence. | 61 |
| `ui_fadeScreen.fadeFromBlack(fade, args)` | Comes back from black (LoadingScreen active=false with fadeOut), resets g_GameLoading to 0. Alias: stop. | 42 |
| `ui_fadeScreen.fadeSequence(fadeIn, pause, fadeOut, screenData, args)` | Full fade: to black, pause, then back. Alias: cycle. | 61 |
| `ui_fadeScreen.fadeToBlack(fade, screenData, args)` | Starts a fade to black and stays there. screenData is displayed during the pause. Also sets the global audio parameters (unless useGlobalAudioFade == false). Alias: start. | 15 |
| `ui_fadeScreen.isBlack()` | Indicates whether the screen is confirmed black (after the delay of delayFrames frames). | 97 |
| `ui_fadeScreen.onGuiUpdate()` | GUI per-frame hook: once the delay has elapsed, broadcasts the pending states via extensions.hook('onScreenFadeState', state) and chains the fadeFromBlack of a sequence at state 2. *(internal)* *(hook)* | 75 |
| `ui_fadeScreen.onScreenFadeStateDelayed(state)` | Called by the UI/engine when the fade state changes (1, 2 or 3): queues the state and restarts the frame counter; onGuiUpdate then broadcasts it via onScreenFadeState. *(internal)* *(hook)* | 70 |
| `ui_fadeScreen.start(fade, screenData, args)` | Alias of fadeToBlack. | 15 |
| `ui_fadeScreen.stop(fade, args)` | Alias of fadeFromBlack. | 42 |

### Parameter details

#### `ui_fadeScreen.cycle(fadeIn, pause, fadeOut, screenData, args)`

Alias of fadeSequence.

- `fadeIn` (*number|nil*) : Duration of the fade to black.
- `pause` (*number|nil*) : Duration of the pause.
- `fadeOut` (*number|nil*) : Duration of the fade back.
- `screenData` (*table|nil*) : Content displayed during the pause.
- `args` (*table|nil*) : Options.

#### `ui_fadeScreen.fadeFromBlack(fade, args)`

Comes back from black (LoadingScreen active=false with fadeOut), resets g_GameLoading to 0. Alias: stop.

- `fade` (*number|nil*) : Fade-back duration in seconds (default 1).
- `args` (*table|nil*) : Options; useGlobalAudioFade=false to leave the global audio alone.

#### `ui_fadeScreen.fadeSequence(fadeIn, pause, fadeOut, screenData, args)`

Full fade: to black, pause, then back. Alias: cycle.

- `fadeIn` (*number|nil*) : Duration of the fade to black (default 1).
- `pause` (*number|nil*) : Duration of the pause on black (minimum 0.05 s).
- `fadeOut` (*number|nil*) : Duration of the fade back (default fadeIn).
- `screenData` (*table|nil*) : Content displayed during the pause: {image, title, text}.
- `args` (*table|nil*) : Options passed to the fades (useGlobalAudioFade).

#### `ui_fadeScreen.fadeToBlack(fade, screenData, args)`

Starts a fade to black and stays there. screenData is displayed during the pause. Also sets the global audio parameters (unless useGlobalAudioFade == false). Alias: start.

- `fade` (*number|nil*) : Fade duration in seconds (default 1).
- `screenData` (*table|nil*) : Content displayed during the pause: {image, title, text}.
- `args` (*table|nil*) : Options; useGlobalAudioFade=false to leave the global audio alone.

#### `ui_fadeScreen.isBlack()`

Indicates whether the screen is confirmed black (after the delay of delayFrames frames).

- **returns**: boolean true if the screen is black.

#### `ui_fadeScreen.onScreenFadeStateDelayed(state)`

Called by the UI/engine when the fade state changes (1, 2 or 3): queues the state and restarts the frame counter; onGuiUpdate then broadcasts it via onScreenFadeState.

- `state` (*integer*) : 1 = black reached, 2 = end of pause, 3 = fade back finished.

#### `ui_fadeScreen.start(fade, screenData, args)`

Alias of fadeToBlack.

- `fade` (*number|nil*) : Fade duration in seconds.
- `screenData` (*table|nil*) : Content {image, title, text} displayed during the pause.
- `args` (*table|nil*) : Options.

#### `ui_fadeScreen.stop(fade, args)`

Alias of fadeFromBlack.

- `fade` (*number|nil*) : Fade-back duration in seconds.
- `args` (*table|nil*) : Options.

## Fields

| Field | Type | Description |
|---|---|---|
| `delayFrames` | number | Number of frames to wait before broadcasting onScreenFadeState (3 by default). |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onScreenFadeState` — listened to by 10 module(s)

**UI events (guihooks.trigger):** `LoadingScreen`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/fadeScreen.lua`.*
