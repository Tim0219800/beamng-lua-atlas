---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/roadArchitect/tunnelMesh.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Generates the automatic tunnels of Road Architect: a procedural mesh (ProceduralMesh) shaped as a tube around the road, and it punches the terrain holemap so that the tunnel passes through the relief. When the tunnel is removed, it restores the original holemap. Called by roads.finalise (creation) and unfinalise/removeAll (removal).
--- Access: extension `editor_roadArchitect_tunnelMesh`: `extensions.load("editor_roadArchitect_tunnelMesh")`, then the global `editor_roadArchitect_tunnelMesh`
---@class editor_roadArchitect_tunnelMesh
editor_roadArchitect_tunnelMesh = {}

--- Creates the tunnel's procedural mesh from the road's renderData (center and lateral edges, circular section) and punches the terrain holemap along the tunnel.
---Source: lua/ge/extensions/editor/roadArchitect/tunnelMesh.lua:200
---@param roadIdx integer Index of the road in roads.
---@param name string Name of the tunnel (key in the meshes table).
---@param rData table renderData of the road.
---@param tunnel table Description of the tunnel (start index s and end index e, etc.).
---@param folder userdata Scene SimGroup that receives the mesh.
function editor_roadArchitect_tunnelMesh.createTunnel(roadIdx, name, rData, tunnel, folder) end

--- If the tunnel exists: restores the holemap, deletes the mesh object and forgets the entry.
---Source: lua/ge/extensions/editor/roadArchitect/tunnelMesh.lua:393
---@param roadIdx integer Index of the road.
---@param name string|nil Name of the tunnel; does nothing if nil.
function editor_roadArchitect_tunnelMesh.tryRemove(roadIdx, name) end

