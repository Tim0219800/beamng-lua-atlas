# `editor_toolUtilities_siteBake`

*Fichier : `lua/ge/extensions/editor/toolUtilities/siteBake.lua` · VM : Game Engine (GE) · 289 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_toolUtilities_siteBake` : `extensions.load("editor_toolUtilities_siteBake")`, puis la globale `editor_toolUtilities_siteBake`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_toolUtilities_siteBake.bounds(parts, instances, ox, oy, oz)` | The extent of everything the bake places, so the placer can frame a site, pick it under the cursor and know how much room<br>it needs before it has loaded a single mesh. | 253 |
| `editor_toolUtilities_siteBake.groupInstances(instances, ox, oy, oz)` | The kit placements, grouped by the shape they place. One group per distinct mesh becomes one instanced draw at the far<br>end, so a square with two hundred identical bollards costs one shape and two hundred transforms rather than two hundred<br>of each. | 109 |
| `editor_toolUtilities_siteBake.harvestKit(list, out)` |  | 153 |
| `editor_toolUtilities_siteBake.instanceCount(groups)` | How many pieces a group list stands, for a readout that wants to say so before anything is written. | 183 |
| `editor_toolUtilities_siteBake.localFeatures(features, ox, oy, oz)` | The shapes a site asks the ground to be cut to, in its own frame. Terraform takes a feature one of two ways and every<br>producer in the tools emits one of them: a graded QUAD, whose four corners carry their own heights, or a set of RINGS<br>sharing one height. So this needs to know nothing about what any particular feature is FOR -- a tier floor, a flight's<br>rake, a retaining band -- which is the point: an editor works out what it wants from the terrain and the placer carves it<br>without either of them having to agree about anything but these two shapes.<br>Ring points go out flat, because a ring's height is the feature's and saying it per point is a second copy of the same<br>number. Whatever reads this back makes them vec3 again, which is what terraform tests polygons with. | 59 |
| `editor_toolUtilities_siteBake.localLamps(lights, ox, oy, oz)` | The lamps that go with the pieces, in the site's own frame like everything else here. | 190 |
| `editor_toolUtilities_siteBake.localPaint(coats, ox, oy)` | The terrain paint a site lays, in its own frame. Each coat is `{ m, ring }` or `{ m, xs, ys }` (cell by cell) from the<br>editor, and goes out named by layer, since an index is only good for the one terrain it was read off. | 87 |
| `editor_toolUtilities_siteBake.localPlants(anchors, ox, oy, oz)` | Planting travels as anchors rather than as scattered items, because the forest belongs to the level and not to the site:<br>whatever places this re-scatters them when it burns. | 211 |
| `editor_toolUtilities_siteBake.localPts(pts, ox, oy)` | A polyline the same way. Also does for the unit normals that go with one, called with a zero origin. | 34 |
| `editor_toolUtilities_siteBake.localRing(ring, ox, oy)` | One plan polygon, local to the bake origin. Nil for anything that is not a polygon, so a caller can collect the return<br>straight into a list and never has to check. | 26 |
| `editor_toolUtilities_siteBake.localRings(rings, ox, oy)` | A list of them, nil when nothing in it was a polygon: an absent key in the manifest reads as "this site has none of<br>these", which is what every reader of a ground plan already expects. | 42 |
| `editor_toolUtilities_siteBake.plantCount(anchors)` | How many plants a bake would carry, across every anchor. Only for the readout. | 242 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/toolUtilities/siteBake.lua`.*
