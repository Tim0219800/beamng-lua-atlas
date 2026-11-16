# `props`

*File: `lua/vehicle/props.lua` · VM: Vehicle · 141 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** global `props`

Drives the vehicle's animated props (jbeam "props" section: needles, steering wheel, articulated parts, prop lights). Every frame, each prop reads the value electrics.values[prop.func], converts it (multiplier, min, max, offset) and sends it to the engine via obj:propUpdate. Also handles hiding props when a break group (breakGroup) or deform group (deformGroup) is broken.

## Example

```lua
-- manually hide the props of a break group
props.hidePropsInBreakGroup('door_FL')
```

## Notes

- M.updateGFX is nop (empty function) as long as no prop exists; reset() replaces it with the real updateGFX function only if v.data.props contains at least one prop. If the props disappear after a reset, updateGFX stays on the old function (not set back to nop).
- Props are 0-indexed (props[0]…props[propEnd]).
- Value sent to the engine: clamp(val * multiplier, min, max) + offset; booleans are converted to 0/1. The prop is hidden if prop.hidden is true.
- Prop light jbeam keys (lightScaling): brightnessMinInput (default 0), brightnessMaxInput (1), flareScaleMinInput (0.6), flareScaleMaxInput (1), lightColorOffsetRed (0), lightColorOffsetGreen (60), lightColorOffsetBlue (80). They are only used if the prop also defines lightBrightness, flareScale and lightColor.
- breakGroup and deformGroup can be a string or a list of strings; empty strings are ignored.
- A group is processed only once: after hidePropsInBreakGroup / disablePropsInDeformGroup, the table entry is removed until the next reset.

## Functions

| Function | Description | Line |
|---|---|---|
| `props.disablePropsInDeformGroup(deformGroup)` | Disables and hides all props attached to the given deform group, then sets them back to 0 on the engine side. Called by damage handling (beamstate) when a group deforms. | 41 |
| `props.hidePropsInBreakGroup(breakGroup)` | Disables and hides all props attached to the given break group, then sets them back to 0 on the engine side. Called when a beam group breaks. | 54 |
| `props.init()` | Identical to reset() (M.init = reset). Reads v.data.props, builds the breakGroup/deformGroup tables, normalizes the lightScaling config. *(internal)* | 68 |
| `props.reset()` | Resets the state of each prop (disabled=false, hidden=false, lastVal=math.huge), rebuilds the group indexes and enables updateGFX if there are props. *(internal)* | 68 |

### Parameter details

#### `props.disablePropsInDeformGroup(deformGroup)`

Disables and hides all props attached to the given deform group, then sets them back to 0 on the engine side. Called by damage handling (beamstate) when a group deforms.

- `deformGroup` (*string*) : Deform group name.

#### `props.hidePropsInBreakGroup(breakGroup)`

Disables and hides all props attached to the given break group, then sets them back to 0 on the engine side. Called when a beam group breaks.

- `breakGroup` (*string*) : Break group name.

## Fields

| Field | Type | Description |
|---|---|---|
| `updateGFX` | function | nop by default; replaced by the props update during reset()/init() if the vehicle has props. ⚠ nop is defined elsewhere (game global). |

## Calls into the engine (C++)

- `obj:` `propUpdate`, `setPropLight`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/props.lua`.*
