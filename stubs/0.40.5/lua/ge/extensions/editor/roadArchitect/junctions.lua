---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/roadArchitect/junctions.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_roadArchitect_junctions` : `extensions.load("editor_roadArchitect_junctions")`, puis la globale `editor_roadArchitect_junctions`
---@class editor_roadArchitect_junctions
---@field junctions table
editor_roadArchitect_junctions = {}

--- Adds a 4-way crossroads junction.
---Source : lua/ge/extensions/editor/roadArchitect/junctions.lua:8381
---@param isNew any
function editor_roadArchitect_junctions.addCrossroads(isNew) end

--- Adds a highway merge junction (merges eg 2 lanes -> 1 lane, 3 lanes -> lanes, etc).
---Source : lua/ge/extensions/editor/roadArchitect/junctions.lua:9056
---@param isNew any
function editor_roadArchitect_junctions.addHighwayMergeJunction(isNew) end

--- Adds a highway separator junction (splits a two-way highway into two one-way sections, for separate linking).
---Source : lua/ge/extensions/editor/roadArchitect/junctions.lua:9246
---@param isNew any
function editor_roadArchitect_junctions.addHighwaySeparatorJunction(isNew) end

--- Adds a highway slip junction.
---Source : lua/ge/extensions/editor/roadArchitect/junctions.lua:9429
---@param isNew any
function editor_roadArchitect_junctions.addHighwaySlipJunction(isNew) end

--- Adds a highway <-> urban transition junction (tapers the central reservation down to a centerline).
---Source : lua/ge/extensions/editor/roadArchitect/junctions.lua:9155
---@param isNew any
function editor_roadArchitect_junctions.addHighwayUrbanTransJunction(isNew) end

--- Adds a 2-way pedestrian crossing junction (ped x + traffic lights only).
---Source : lua/ge/extensions/editor/roadArchitect/junctions.lua:8280
---@param isNew any
function editor_roadArchitect_junctions.addPedXJunction(isNew) end

--- Adds a 4-way roundabout junction.
---Source : lua/ge/extensions/editor/roadArchitect/junctions.lua:8684
---@param isNew any
function editor_roadArchitect_junctions.addRoundaboutJunction(isNew) end

--- Adds an urban sidewalk/non-sidewalk transition junction.
---Source : lua/ge/extensions/editor/roadArchitect/junctions.lua:8785
---@param isNew any
function editor_roadArchitect_junctions.addRuralUrbanTransJunction(isNew) end

--- Adds a shoulder fade junction (tapers out the hard shoulder lane of a 1-way highway, to become a 1-way rural road).
---Source : lua/ge/extensions/editor/roadArchitect/junctions.lua:9330
---@param isNew any
function editor_roadArchitect_junctions.addShoulderFadeJunction(isNew) end

--- Adds a 3-way T-junction.
---Source : lua/ge/extensions/editor/roadArchitect/junctions.lua:8482
---@param isNew any
function editor_roadArchitect_junctions.addTJunction(isNew) end

--- Adds an urban merge junction (merges eg 2 lanes -> 1 lane, 3 lanes -> lanes, etc).
---Source : lua/ge/extensions/editor/roadArchitect/junctions.lua:8869
---@param isNew any
function editor_roadArchitect_junctions.addUrbanMergeJunction(isNew) end

--- Adds an urban separator junction.
---Source : lua/ge/extensions/editor/roadArchitect/junctions.lua:8970
---@param isNew any
function editor_roadArchitect_junctions.addUrbanSeparatorJunction(isNew) end

--- Adds a 3-way angled Y-junction.
---Source : lua/ge/extensions/editor/roadArchitect/junctions.lua:8583
---@param isNew any
function editor_roadArchitect_junctions.addYJunction(isNew) end

--- Chops all the given roads up to the given sphere (removes any nodes inside the sphere, and projects the corresponding start/end node onto the sphere).
---Source : lua/ge/extensions/editor/roadArchitect/junctions.lua:10076
---@param jNodes any
---@param jCen any
---@param jRad any
function editor_roadArchitect_junctions.chopRoadsToSphere(jNodes, jCen, jRad) end

--- Removes all junctions.
---Source : lua/ge/extensions/editor/roadArchitect/junctions.lua:9537
function editor_roadArchitect_junctions.clearAllJunctions() end

--- Computes the rotation angle (around Z-axis) at junction place. Filters by case.
---Source : lua/ge/extensions/editor/roadArchitect/junctions.lua:97
---@param jIdx any
function editor_roadArchitect_junctions.computeInitRot(jIdx) end

--- Deep copies the given junction.
---Source : lua/ge/extensions/editor/roadArchitect/junctions.lua:9672
---@param jct any
function editor_roadArchitect_junctions.copyJunction(jct) end

---Source : lua/ge/extensions/editor/roadArchitect/junctions.lua:10146
---@param jNodes any
---@param laneWidth any
---@param jctCen any
function editor_roadArchitect_junctions.createAutoJctOverlays(jNodes, laneWidth, jctCen) end

--- Deserialises the given junction.
---Source : lua/ge/extensions/editor/roadArchitect/junctions.lua:9788
---@param jSer any
function editor_roadArchitect_junctions.deserialiseJct(jSer) end

--- Finalises the junction with the given index.
---Source : lua/ge/extensions/editor/roadArchitect/junctions.lua:9651
---@param jIdx any
function editor_roadArchitect_junctions.finaliseJunction(jIdx) end

--- Compute the centroid of the junction with the given index. Filters by case.
---Source : lua/ge/extensions/editor/roadArchitect/junctions.lua:65
---@param jIdx any
function editor_roadArchitect_junctions.getJunctionCentroid(jIdx) end

--- Moves the camera above the junction with the given index, to highlight it to the user.
---Source : lua/ge/extensions/editor/roadArchitect/junctions.lua:9588
---@param jIdx any
function editor_roadArchitect_junctions.goToJunction(jIdx) end

--- Imports a road network from the L-System tool.
---Source : lua/ge/extensions/editor/roadArchitect/junctions.lua:10329
---@param roadNetwork any
---@param intersections any
---@param DOI any
---@param margin any
---@param doTerraform any
function editor_roadArchitect_junctions.importRoadsFromLSystem(roadNetwork, intersections, DOI, margin, doTerraform) end

--- Loads a junction from disk.
---Source : lua/ge/extensions/editor/roadArchitect/junctions.lua:9861
function editor_roadArchitect_junctions.loadJunction() end

--- Removes the junction with the given index.
---Source : lua/ge/extensions/editor/roadArchitect/junctions.lua:9528
---@param jIdx any
function editor_roadArchitect_junctions.removeJunction(jIdx) end

--- Rotates the junction with the given index, by the given angle.
---Source : lua/ge/extensions/editor/roadArchitect/junctions.lua:9557
---@param jIdx any
---@param cen any
---@param theta any
function editor_roadArchitect_junctions.rotateJunction(jIdx, cen, theta) end

--- Rotates the junction with the given index, by the given quaternion.
---Source : lua/ge/extensions/editor/roadArchitect/junctions.lua:9575
---@param jIdx any
---@param cen any
---@param q any
function editor_roadArchitect_junctions.rotateJunctionQuat(jIdx, cen, q) end

--- Saves the junction with the given id to disk.
---Source : lua/ge/extensions/editor/roadArchitect/junctions.lua:9846
---@param jIdx any
function editor_roadArchitect_junctions.saveJunction(jIdx) end

--- Serialises the given junction.
---Source : lua/ge/extensions/editor/roadArchitect/junctions.lua:9730
---@param jct any
function editor_roadArchitect_junctions.serialiseJct(jct) end

--- Sets all the roads in the junction with the given id, to use meshes/not use meshes.
---Source : lua/ge/extensions/editor/roadArchitect/junctions.lua:9629
---@param jIdx any
function editor_roadArchitect_junctions.setAllMeshProperty(jIdx) end

--- Translates the junction with the given index, by the given vector.
---Source : lua/ge/extensions/editor/roadArchitect/junctions.lua:9544
---@param jIdx any
---@param offset any
function editor_roadArchitect_junctions.translateJunction(jIdx, offset) end

--- Update the junction with the given id, after a parameter change.
---Source : lua/ge/extensions/editor/roadArchitect/junctions.lua:8244
---@param jIdx any
function editor_roadArchitect_junctions.updateJunctionAfterChange(jIdx) end

--- Updates the condition of the given junction.
---Source : lua/ge/extensions/editor/roadArchitect/junctions.lua:152
---@param jct any
function editor_roadArchitect_junctions.updateJunctionCondition(jct) end

--- Updates the junctions list (called after a road has been removed).
---Source : lua/ge/extensions/editor/roadArchitect/junctions.lua:9637
function editor_roadArchitect_junctions.updateJunctionsAfterRoadRemove() end

