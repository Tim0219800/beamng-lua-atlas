# `editor_roadArchitect_tunnelMesh`

*File: `lua/ge/extensions/editor/roadArchitect/tunnelMesh.lua` · VM: Game Engine (GE) · 410 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_roadArchitect_tunnelMesh`: `extensions.load("editor_roadArchitect_tunnelMesh")`, then the global `editor_roadArchitect_tunnelMesh`

Generates the automatic tunnels of Road Architect: a procedural mesh (ProceduralMesh) shaped as a tube around the road, and it punches the terrain holemap so that the tunnel passes through the relief. When the tunnel is removed, it restores the original holemap. Called by roads.finalise (creation) and unfinalise/removeAll (removal).

## Notes

- The meshes are stored by road index then by tunnel name; the API is therefore based on the road index (and not on the name).
- createTunnel modifies the terrain holemap (editHolemap); tryRemove restores it (recoverHolemap): always delete the tunnel with tryRemove so as not to leave holes.
- The tunnel parameters come from the road: radGran, radOffset, thickness, zOffsetFromRoad, protrudeS/E, extraS/E.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_roadArchitect_tunnelMesh.createTunnel(roadIdx, name, rData, tunnel, folder)` | Creates the tunnel's procedural mesh from the road's renderData (center and lateral edges, circular section) and punches the terrain holemap along the tunnel. | 200 |
| `editor_roadArchitect_tunnelMesh.tryRemove(roadIdx, name)` | If the tunnel exists: restores the holemap, deletes the mesh object and forgets the entry. | 393 |

### Parameter details

#### `editor_roadArchitect_tunnelMesh.createTunnel(roadIdx, name, rData, tunnel, folder)`

Creates the tunnel's procedural mesh from the road's renderData (center and lateral edges, circular section) and punches the terrain holemap along the tunnel.

- `roadIdx` (*integer*) : Index of the road in roads.
- `name` (*string*) : Name of the tunnel (key in the meshes table).
- `rData` (*table*) : renderData of the road.
- `tunnel` (*table*) : Description of the tunnel (start index s and end index e, etc.).
- `folder` (*userdata*) : Scene SimGroup that receives the mesh.

#### `editor_roadArchitect_tunnelMesh.tryRemove(roadIdx, name)`

If the tunnel exists: restores the holemap, deletes the mesh object and forgets the entry.

- `roadIdx` (*integer*) : Index of the road.
- `name` (*string|nil*) : Name of the tunnel; does nothing if nil.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/roadArchitect/tunnelMesh.lua`.*
