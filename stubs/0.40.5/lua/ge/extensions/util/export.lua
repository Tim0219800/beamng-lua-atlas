---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/export.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Exports the player's vehicle in glTF 2.0 format (.gltf with JSON or binary .glb), or a keyframe sequence. It fetches the vehicle's GPU mesh (GPUMesh.bng_getGPUMesh) then writes the buffers (vertices, normals, tangents, UVs, colors, indices), the flexbodies and props, the JBeam part tree (as a hierarchy of glTF nodes), the materials (textures converted to PNG, BeamNG material data in extras.bngMaterial) and, if exportBeams is true, the nodes and beams of each part (BNG_JBeamData extension). The vehicle direction is written in the BNG_Direction extension. Coordinates are converted to {x, z, -y}. The export is asynchronous: it happens in updateGFX when the GPU data is ready. Useful to import a BeamNG vehicle into Blender or another 3D tool.
--- Access: extension `util_export`: `extensions.load("util_export")`, then the global `util_export`
---@class util_export
---@field embedBuffers boolean true (default): buffers embedded in base64 in the JSON; false: external .bin files (<name>_buffer_NNN_<type>.bin). Ignored in binary format.
---@field exportBeams boolean Exports the nodes and beams per part in extras (default true)
---@field exportColors boolean Exports vertex colors (default false)
---@field exportNormals boolean Exports normals (default true)
---@field exportTangents boolean Exports tangents (default false)
---@field exportTexCoords boolean Exports both texture coordinate sets (default false)
---@field gltfBinaryFormat boolean true (default): writes a .glb; false: writes a JSON .gltf
util_export = {}

--- Starts the player vehicle export and calls handler(gltfRoot) with the built glTF table when the GPU data is ready (in updateGFX).
---Source: lua/ge/extensions/util/export.lua:1124
---@param handler function Function receiving the root glTF table (or nil if an export is already in progress)
function util_export.export(handler) end

--- Exports the player vehicle to a glTF file (JSON or binary depending on gltfBinaryFormat). Resets the image cache and displays an interface message.
---Source: lua/ge/extensions/util/export.lua:1140
---@param filename string Output file path (.gltf or .glb)
function util_export.exportFile(filename) end

--- Returns the export settings useful to the interface (currently only gltfBinaryFormat).
---Source: lua/ge/extensions/util/export.lua:1284
---@return table  {gltfBinaryFormat = boolean}
function util_export.getGeInfo() end

--- Exports a first frame to the file then keeps exporting every frame (animation) until stopRecording is called.
---Source: lua/ge/extensions/util/export.lua:1248
---@param filename string Output file path
function util_export.startRecording(filename) end

--- Stops the animation recording started by startRecording.
---Source: lua/ge/extensions/util/export.lua:1253
function util_export.stopRecording() end

--- Suggests a free file name export_NNN.glb or .gltf in the player vehicle's folder (for the interface).
---Source: lua/ge/extensions/util/export.lua:1263
---@return string  Suggested path, or empty string if there is no player vehicle
function util_export.suggestFilename() end

--- Hook called every frame: if the mesh GPU data is ready, finishes the export in progress (processExport).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/export.lua:1257
---@param dt number Time delta (unused)
function util_export.updateGFX(dt) end

