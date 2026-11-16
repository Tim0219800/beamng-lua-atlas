# `dynoClient`

*File: `lua/vehicle/extensions/dynoClient.lua` · VM: Vehicle · 69 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `dynoClient`: `extensions.load (vehicle VM)("dynoClient")`, then the global `dynoClient`

Vehicle-side dynamometer (dyno) client: after initDyno, it sends every frame the engine speed, the engaged gear and the transmission ratios to an HTML texture (JUI) belonging to the dyno object, via queueJSUITexture executed in the GE Lua.

## Example

```lua
extensions.dynoClient.initDyno(dynoObjectID, 'dynoScreenTexture')
```

## Notes

- The JS calls are 'client_init' ({vehicle = vehicle folder name, id}) and 'client_data' ({rpm, gear, gearRatio, finalRatio}); the JSON quotes are replaced by \' to fit in the JS string.
- rpm comes from drivetrain.rpm (compatibility layer) and gear from electrics.values.gear_M. gearRatio = v.data.engine.gears[gear] (1 if 0 or absent), finalRatio = v.data.engine.differential (1 if 0 or absent): assumes the old jbeam engine format.
- Anomaly: initDyno computes frontAxis and rearAxis (Y positions of the wheels) but does not use them.
- If gear is nil or absent from the gears table, gearRatio is nil (sent as is).

## Functions

| Function | Description | Line |
|---|---|---|
| `dynoClient.initDyno(_dynoObjectID, _textureName)` | Stores the dyno object and its texture, then sends it a 'client_init' initialization message. Without an object identifier, does nothing. | 16 |
| `dynoClient.updateGFX(dt)` | Called every frame: sends 'client_data' to the dyno if initDyno has been called. *(internal)* | 36 |

### Parameter details

#### `dynoClient.initDyno(_dynoObjectID, _textureName)`

Stores the dyno object and its texture, then sends it a 'client_init' initialization message. Without an object identifier, does nothing.

- `_dynoObjectID` (*integer*) : Identifier of the dynamometer object.
- `_textureName` (*string*) : Name of the JUI texture on this object.

#### `dynoClient.updateGFX(dt)`

Called every frame: sends 'client_data' to the dyno if initDyno has been called.

- `dt` (*number*) : Time step in seconds (unused).

## Calls into the engine (C++)

- `obj:` `getId`, `queueGameEngineLua`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/extensions/dynoClient.lua`.*
