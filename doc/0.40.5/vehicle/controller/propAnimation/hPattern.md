# `controller_propAnimation_hPattern`

*File: `lua/vehicle/controller/propAnimation/hPattern.lua` · VM: Vehicle · 229 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** controller `propAnimation/hPattern` declared in the jbeam (`controller`), reachable with `controller.getController("name")`

Auxiliary H-pattern gear lever animation controller (manual gearbox). Follows the engaged gear of the "gearbox" device and moves a virtual lever on two axes (electrics hPatternAxisX / hPatternAxisY) through the gate: on engagement, it moves first in X then in Y; on disengagement, first in Y then in X. Plays an engagement and disengagement sound with the shift aggression. Rapid gear changes are queued (dequeue) to be animated one after the other.

## Notes

- jbeam keys read: gearCoordinates (header table with columns gearIndex, x, y), electricsNameXAxis ("hPatternAxisX"), electricsNameYAxis ("hPatternAxisY"), supportedGearboxTypes ({"manualGearbox"}), relevantGearboxName ("gearbox"), shiftSoundNode_nodes (first element = sound node, otherwise 0 + log W), shiftSoundEventHPatternGearIn ("event:>Vehicle>Interior>Gearshift>manual_modern_01_in"), shiftSoundEventHPatternGearOut ("..._01_out"), shiftSoundVolumeHPatternGearIn / GearOut (0.5), demoMode (false).
- Reads controller.mainController.shiftingAggression (animation speed between 0.3 and 1 times the base speed) and electrics.values.isShifting.
- If the device is not found or of an unsupported type, log E and updateGFX becomes nop; demoMode reactivates updateGFX and cycles through the gears automatically (demonstration).
- In neutral, after the shift ends, X is recentered on the coordinate of gear 0.

## Functions

| Function | Description | Line |
|---|---|---|
| `controller_propAnimation_hPattern.init(jbeamData)` | Reads the H-pattern gate coordinates, checks the gearbox device and initializes sounds and the gear queue. *(internal)* | 159 |
| `controller_propAnimation_hPattern.reset(jbeamData)` | Resets the lever to (0, 0), clears the gear queue and resets smoothers and demo. *(internal)* | 142 |
| `controller_propAnimation_hPattern.updateGFX(dt)` | Every frame: queues the gear changes, moves the lever in X/Y, plays the sounds and publishes the electrics. *(internal)* | 72 |

### Parameter details

#### `controller_propAnimation_hPattern.init(jbeamData)`

Reads the H-pattern gate coordinates, checks the gearbox device and initializes sounds and the gear queue.

- `jbeamData` (*table*) : Controller jbeam data.

#### `controller_propAnimation_hPattern.reset(jbeamData)`

Resets the lever to (0, 0), clears the gear queue and resets smoothers and demo.

- `jbeamData` (*table*) : Jbeam data.

#### `controller_propAnimation_hPattern.updateGFX(dt)`

Every frame: queues the gear changes, moves the lever in X/Y, plays the sounds and publishes the electrics.

- `dt` (*number*) : Time step in seconds.

## Fields

| Field | Type | Description |
|---|---|---|
| `type` | string | "auxiliary". |

## Calls into the engine (C++)

- `obj:` `playSFXOnceCT`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/controller/propAnimation/hPattern.lua`.*
