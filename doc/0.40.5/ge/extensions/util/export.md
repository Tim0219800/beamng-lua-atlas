# `util_export`

*File: `lua/ge/extensions/util/export.lua` · VM: Game Engine (GE) · 1311 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `util_export`: `extensions.load("util_export")`, then the global `util_export`

Exports the player's vehicle in glTF 2.0 format (.gltf with JSON or binary .glb), or a keyframe sequence. It fetches the vehicle's GPU mesh (GPUMesh.bng_getGPUMesh) then writes the buffers (vertices, normals, tangents, UVs, colors, indices), the flexbodies and props, the JBeam part tree (as a hierarchy of glTF nodes), the materials (textures converted to PNG, BeamNG material data in extras.bngMaterial) and, if exportBeams is true, the nodes and beams of each part (BNG_JBeamData extension). The vehicle direction is written in the BNG_Direction extension. Coordinates are converted to {x, z, -y}. The export is asynchronous: it happens in updateGFX when the GPU data is ready. Useful to import a BeamNG vehicle into Blender or another 3D tool.

## Example

```lua
extensions.util_export.gltfBinaryFormat = false
extensions.util_export.exportFile('vehicle.gltf')
```

## Notes

- The export takes player vehicle 0 in its current state (deformations included: current node positions for the beams).
- export(handler): if an export is already in progress (lastMeshInfo not nil), the handler is called with nil and nothing else is done.
- startRecording writes a first frame then keeps exporting every frame until stopRecording; the times are stored in a glTF animation. The output logs each frame.
- suggestFilename looks for export_001 to export_100 in the vehicle's folder, with the .glb or .gltf extension depending on gltfBinaryFormat; if all exist, returns the last name tested.
- Bug: in _addTimeBuffers, the keyframe number buffer uses the variable bufferID (undefined, so nil) instead of bufferIDKeyframes, and the max time bound uses keyFrameTimes[#keyFrameTimes - 1]. Animation recording is therefore probably incorrect.
- Bug: in _convertType, `dumps(value)" to "` (missing .. operator) is a function call on a string and would cause a Lua error in conversion error cases.
- Bug: _isTextureCookerFilepath tests `not string.sub(filepath, -4) == ".png"`, an expression that is always false in practice (precedence of the not operator); the extension test is therefore not done.
- After an export, the GUI hook ThreeDExported is triggered and a "GLTF Vehicle exported" message is displayed for 5 s.

## Functions

| Function | Description | Line |
|---|---|---|
| `util_export.export(handler)` | Starts the player vehicle export and calls handler(gltfRoot) with the built glTF table when the GPU data is ready (in updateGFX). | 1124 |
| `util_export.exportFile(filename)` | Exports the player vehicle to a glTF file (JSON or binary depending on gltfBinaryFormat). Resets the image cache and displays an interface message. | 1140 |
| `util_export.getGeInfo()` | Returns the export settings useful to the interface (currently only gltfBinaryFormat). | 1284 |
| `util_export.startRecording(filename)` | Exports a first frame to the file then keeps exporting every frame (animation) until stopRecording is called. | 1248 |
| `util_export.stopRecording()` | Stops the animation recording started by startRecording. | 1253 |
| `util_export.suggestFilename()` | Suggests a free file name export_NNN.glb or .gltf in the player vehicle's folder (for the interface). | 1263 |
| `util_export.updateGFX(dt)` | Hook called every frame: if the mesh GPU data is ready, finishes the export in progress (processExport). *(internal)* | 1257 |

### Parameter details

#### `util_export.export(handler)`

Starts the player vehicle export and calls handler(gltfRoot) with the built glTF table when the GPU data is ready (in updateGFX).

- `handler` (*function*) : Function receiving the root glTF table (or nil if an export is already in progress)

#### `util_export.exportFile(filename)`

Exports the player vehicle to a glTF file (JSON or binary depending on gltfBinaryFormat). Resets the image cache and displays an interface message.

- `filename` (*string*) : Output file path (.gltf or .glb)

#### `util_export.getGeInfo()`

Returns the export settings useful to the interface (currently only gltfBinaryFormat).

- **returns**: table {gltfBinaryFormat = boolean}

#### `util_export.startRecording(filename)`

Exports a first frame to the file then keeps exporting every frame (animation) until stopRecording is called.

- `filename` (*string*) : Output file path

#### `util_export.suggestFilename()`

Suggests a free file name export_NNN.glb or .gltf in the player vehicle's folder (for the interface).

- **returns**: string Suggested path, or empty string if there is no player vehicle

#### `util_export.updateGFX(dt)`

Hook called every frame: if the mesh GPU data is ready, finishes the export in progress (processExport).

- `dt` (*number*) : Time delta (unused)

## Fields

| Field | Type | Description |
|---|---|---|
| `embedBuffers` | boolean | true (default): buffers embedded in base64 in the JSON; false: external .bin files (<name>_buffer_NNN_<type>.bin). Ignored in binary format. |
| `exportBeams` | boolean | Exports the nodes and beams per part in extras (default true) |
| `exportColors` | boolean | Exports vertex colors (default false) |
| `exportNormals` | boolean | Exports normals (default true) |
| `exportTangents` | boolean | Exports tangents (default false) |
| `exportTexCoords` | boolean | Exports both texture coordinate sets (default false) |
| `gltfBinaryFormat` | boolean | true (default): writes a .glb; false: writes a JSON .gltf |

**UI events (guihooks.trigger):** `ThreeDExported`

## Calls into the engine (C++)

- `FS:` `fileExists`, `findFiles`
- `be:` `getPlayerVehicleID`
- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/util/export.lua`.*
