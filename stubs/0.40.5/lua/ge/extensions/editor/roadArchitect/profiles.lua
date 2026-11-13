---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/roadArchitect/profiles.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_roadArchitect_profiles` : `extensions.load("editor_roadArchitect_profiles")`, puis la globale `editor_roadArchitect_profiles`
---@class editor_roadArchitect_profiles
---@field profiles table
editor_roadArchitect_profiles = {}

--- Adds the road centerline to the given road, which is based on the stored styling parameters.
---Source : lua/ge/extensions/editor/roadArchitect/profiles.lua:134
---@param p any
---@param isPaint any
function editor_roadArchitect_profiles.addCenterline(p, isPaint) end

--- Adds the road edge lines to the given road, which are based on the stored styling parameters.
---Source : lua/ge/extensions/editor/roadArchitect/profiles.lua:172
---@param p any
---@param latOffL any
---@param latOffR any
---@param isLeft any
---@param isRight any
---@param isPaint any
function editor_roadArchitect_profiles.addEdgeLines(p, latOffL, latOffR, isLeft, isRight, isPaint) end

--- Adds the lane end/stop lines to the given road, which is based on the stored styling parameters.
---Source : lua/ge/extensions/editor/roadArchitect/profiles.lua:297
---@param p any
---@param isStart any
---@param isEnd any
function editor_roadArchitect_profiles.addEndLine(p, isStart, isEnd) end

--- Adds a lane to the selected profile, at the chosen position.
---Source : lua/ge/extensions/editor/roadArchitect/profiles.lua:2903
---@param selectedProfileIdx any
---@param selectedLaneIdx any
---@param side any
---@param rel any
function editor_roadArchitect_profiles.addLane(selectedProfileIdx, selectedLaneIdx, side, rel) end

--- Adds the lane division lines to the given road, which are based on the stored styling parameters.
---Source : lua/ge/extensions/editor/roadArchitect/profiles.lua:252
---@param p any
---@param isPaint any
function editor_roadArchitect_profiles.addLaneDivisionLines(p, isPaint) end

--- Adds a new layer above/below the given layer index, in the given profile.
---Source : lua/ge/extensions/editor/roadArchitect/profiles.lua:989
---@param p any
---@param i any
---@param dir any
function editor_roadArchitect_profiles.addLayer(p, i, dir) end

--- Adds light tread to every road lane in the profile, across the full length of the road.
---Source : lua/ge/extensions/editor/roadArchitect/profiles.lua:455
---@param p any
---@param fadeS any
---@param fadeE any
---@param lMin any
---@param lMax any
function editor_roadArchitect_profiles.addLightTreadToLanes(p, fadeS, fadeE, lMin, lMax) end

--- Sets all road lanes to the given master width.
---  [This over-writes the data in the lateral road profile].
---Source : lua/ge/extensions/editor/roadArchitect/profiles.lua:2938
---@param profile any
---@param mWidth any
function editor_roadArchitect_profiles.applyMasterWidth(profile, mWidth) end

--- Determines if the given profile contains sidewalks, or not.
---Source : lua/ge/extensions/editor/roadArchitect/profiles.lua:1153
---@param p any
function editor_roadArchitect_profiles.areSidewalksPresent(p) end

--- Automatically adds edge blending layers to the given profile (used for junctions).
---Source : lua/ge/extensions/editor/roadArchitect/profiles.lua:383
---@param prof any
---@param isLeft any
---@param isRight any
---@param mat any
function editor_roadArchitect_profiles.autoEdgeBlending(prof, isLeft, isRight, mat) end

--- Automatically adds paint line marking layers to the given profile (used for junctions).
---Source : lua/ge/extensions/editor/roadArchitect/profiles.lua:374
---@param prof any
function editor_roadArchitect_profiles.autoPaintLines(prof) end

--- Computes an array of valid lane keys for a road, ordered from smallest to largest.
---Source : lua/ge/extensions/editor/roadArchitect/profiles.lua:1050
---@param profile any
function editor_roadArchitect_profiles.computeLaneKeys(profile) end

--- Compute the road sections from a given road.
---  [This is an array of contiguous sections of road lanes, with start and end lane indices].
---Source : lua/ge/extensions/editor/roadArchitect/profiles.lua:100
---@param profile any
---@param laneType1 any
---@param laneType2 any
function editor_roadArchitect_profiles.computeSectionsByType(profile, laneType1, laneType2) end

--- Deep copies a profile.
---Source : lua/ge/extensions/editor/roadArchitect/profiles.lua:2768
---@param template any
function editor_roadArchitect_profiles.copyProfile(template) end

--- Creates a profile to be used for simple bridges.
---Source : lua/ge/extensions/editor/roadArchitect/profiles.lua:1510
---@param width any
---@param depth any
function editor_roadArchitect_profiles.createBridgeProfile(width, depth) end

--- Creates a custom profile for use when importing from OpenDRIVE.
---Source : lua/ge/extensions/editor/roadArchitect/profiles.lua:1217
---@param lanes any
function editor_roadArchitect_profiles.createCustomImportProfile(lanes) end

--- Creates a profile to be used for overlay roads.
---Source : lua/ge/extensions/editor/roadArchitect/profiles.lua:1444
---@param width any
function editor_roadArchitect_profiles.createOverlayProfile(width) end

--- Creates a profile from number of lanes and sidewalk data. For symmetric, two-way roads.
---Source : lua/ge/extensions/editor/roadArchitect/profiles.lua:1581
---@param numLeftLanes any
---@param numRightLanes any
---@param width any
---@param sidewalkWidth any
---@param sidewalkHeight any
---@param isSidewalk any
---@param mat any
function editor_roadArchitect_profiles.createProfileForJctRoad(numLeftLanes, numRightLanes, width, sidewalkWidth, sidewalkHeight, isSidewalk, mat) end

--- Creates a profile from number of lanes and sidewalk data. For one-way roads.
---Source : lua/ge/extensions/editor/roadArchitect/profiles.lua:1752
---@param numLanes any
---@param width any
---@param sidewalkWidth any
---@param sidewalkHeight any
---@param isSidewalk any
---@param mat any
function editor_roadArchitect_profiles.createProfileForJctRoad1Way(numLanes, width, sidewalkWidth, sidewalkHeight, isSidewalk, mat) end

--- Creates a highway junction profile (start and end cap sections).
---Source : lua/ge/extensions/editor/roadArchitect/profiles.lua:2060
---@param numLanes any
---@param laneWidth any
---@param cResWidth any
---@param hardWidth any
---@param mat any
function editor_roadArchitect_profiles.createProfileForJctRoadHwyCap(numLanes, laneWidth, cResWidth, hardWidth, mat) end

--- Creates a one-way highway junction profile.
---  [Does not have a central reservation lane].
---Source : lua/ge/extensions/editor/roadArchitect/profiles.lua:2390
---@param numLanes any
---@param laneWidth any
---@param hardWidth any
---@param mat any
function editor_roadArchitect_profiles.createProfileForJctRoadHwyCap1W(numLanes, laneWidth, hardWidth, mat) end

--- Creates a highway-urban transition junction profile (urban section).
---Source : lua/ge/extensions/editor/roadArchitect/profiles.lua:2161
---@param numLanes any
---@param laneWidth any
---@param isSidewalk any
---@param sidewalkWidth any
---@param sidewalkHeight any
---@param isOneWay any
---@param mat any
function editor_roadArchitect_profiles.createProfileForJctRoadHwyCapUrban(numLanes, laneWidth, isSidewalk, sidewalkWidth, sidewalkHeight, isOneWay, mat) end

--- Creates a highway junction profile (for the one-way exit roads).
---Source : lua/ge/extensions/editor/roadArchitect/profiles.lua:2693
---@param laneWidth any
---@param hardWidth any
---@param mat any
function editor_roadArchitect_profiles.createProfileForJctRoadHwyExit(laneWidth, hardWidth, mat) end

--- Creates a highway junction profile (section 2).
---Source : lua/ge/extensions/editor/roadArchitect/profiles.lua:2467
---@param numLanes any
---@param laneWidth any
---@param cResWidth any
---@param hardWidth any
---@param mat any
function editor_roadArchitect_profiles.createProfileForJctRoadHwyS2(numLanes, laneWidth, cResWidth, hardWidth, mat) end

--- Creates a highway junction profile (section 3).
---Source : lua/ge/extensions/editor/roadArchitect/profiles.lua:2568
---@param numLanes any
---@param laneWidth any
---@param cResWidth any
---@param hardWidth any
---@param mat any
function editor_roadArchitect_profiles.createProfileForJctRoadHwyS3(numLanes, laneWidth, cResWidth, hardWidth, mat) end

--- Creates a highway-urban transition junction profile (transition/taper sections).
---Source : lua/ge/extensions/editor/roadArchitect/profiles.lua:2273
---@param numLanes any
---@param laneWidth any
---@param cResWidth any
---@param hardWidth any
---@param isOneWay any
---@param mat any
function editor_roadArchitect_profiles.createProfileForJctRoadHwyUrbanTrans(numLanes, laneWidth, cResWidth, hardWidth, isOneWay, mat) end

--- Creates a profile for the tight join road used in Y-junctions.
---Source : lua/ge/extensions/editor/roadArchitect/profiles.lua:1669
---@param numLeftLanes any
---@param numRightLanes any
---@param width any
---@param sidewalkWidth any
---@param sidewalkHeight any
---@param isSidewalk any
---@param isFlipKerb any
---@param mat any
function editor_roadArchitect_profiles.createProfileForJctRoadYSpecial(numLeftLanes, numRightLanes, width, sidewalkWidth, sidewalkHeight, isSidewalk, isFlipKerb, mat) end

--- Creates a profile from number of lanes. Contains a left-sided sidewalk lane.
---Source : lua/ge/extensions/editor/roadArchitect/profiles.lua:1833
---@param numLeftLanes any
---@param numRightLanes any
---@param width any
---@param sidewalkWidth any
---@param sidewalkHeight any
---@param isLeftSide any
---@param mat any
function editor_roadArchitect_profiles.createProfileForJctRoad_SW(numLeftLanes, numRightLanes, width, sidewalkWidth, sidewalkHeight, isLeftSide, mat) end

--- Creates a profile from decal road metadata (eg from decal roads in the scene tree, made with other tools).
---Source : lua/ge/extensions/editor/roadArchitect/profiles.lua:1369
---@param numLeftLanes any
---@param numRightLanes any
function editor_roadArchitect_profiles.createProfileFromDecalData(numLeftLanes, numRightLanes) end

--- Copies a profile template to a new profile.
---Source : lua/ge/extensions/editor/roadArchitect/profiles.lua:1297
---@param templateName any
---@param newName any
function editor_roadArchitect_profiles.createProfileFromTemplate(templateName, newName) end

--- Create a profile for roundabout circular roads.
---Source : lua/ge/extensions/editor/roadArchitect/profiles.lua:1992
---@param numRBLanes any
---@param laneWidthRB any
---@param mat any
function editor_roadArchitect_profiles.createRoundaboutProfile(numRBLanes, laneWidthRB, mat) end

--- Creates a profile with only one sidewalk lane in position 1.
---Source : lua/ge/extensions/editor/roadArchitect/profiles.lua:1922
---@param sidewalkWidth any
---@param sidewalkHeight any
---@param isFlipKerb any
function editor_roadArchitect_profiles.createSidewalkOnlyProfile(sidewalkWidth, sidewalkHeight, isFlipKerb) end

--- Creates a new template upon user request.
---Source : lua/ge/extensions/editor/roadArchitect/profiles.lua:3396
---@param p any
function editor_roadArchitect_profiles.createTemplateOnRequest(p) end

--- Cycles forward through the supported lane types.
---Source : lua/ge/extensions/editor/roadArchitect/profiles.lua:1032
---@param t any
function editor_roadArchitect_profiles.cycleLaneType(t) end

--- Cycles back through the supported lane types.
---Source : lua/ge/extensions/editor/roadArchitect/profiles.lua:1041
---@param t any
function editor_roadArchitect_profiles.cycleLaneTypeBack(t) end

--- De-serialises a profile.
---Source : lua/ge/extensions/editor/roadArchitect/profiles.lua:3247
---@param pSer any
function editor_roadArchitect_profiles.deserialiseProfile(pSer) end

--- Gets the current profile index from a given profile name.
---Source : lua/ge/extensions/editor/roadArchitect/profiles.lua:834
---@param name any
function editor_roadArchitect_profiles.getIdFromName(name) end

--- Returns the current state of the lane flags.
---Source : lua/ge/extensions/editor/roadArchitect/profiles.lua:1210
function editor_roadArchitect_profiles.getLaneFlags() end

--- Gets the minimum and maximum lane key values, from a given collection of lanes.
---Source : lua/ge/extensions/editor/roadArchitect/profiles.lua:88
---@param profile any
function editor_roadArchitect_profiles.getMinMaxLaneKeys(profile) end

--- Computes the number of left and right lanes (all types of lane).
---Source : lua/ge/extensions/editor/roadArchitect/profiles.lua:1081
---@param profile any
function editor_roadArchitect_profiles.getNumLanesLR(profile) end

--- Computes the number of left and right (road lanes only).
---Source : lua/ge/extensions/editor/roadArchitect/profiles.lua:1097
---@param profile any
function editor_roadArchitect_profiles.getNumRoadLanesLR(profile) end

--- Computes an ordered array of lane indices, from smallest to largest.
---  [Also returns the total number of lanes].
---Source : lua/ge/extensions/editor/roadArchitect/profiles.lua:1069
---@param profile any
function editor_roadArchitect_profiles.getOrderedLanes(profile) end

--- Gets the profile with the given name.
---Source : lua/ge/extensions/editor/roadArchitect/profiles.lua:842
---@param name any
function editor_roadArchitect_profiles.getProfileFromName(name) end

--- Computes tables of profile widths and heights (left and right), by lane key.
---  [Data is returned in imgui float ptr format].
---Source : lua/ge/extensions/editor/roadArchitect/profiles.lua:1164
---@param profile any
function editor_roadArchitect_profiles.getWAndHByKey(profile) end

--- Computes the width of the given profile.
---Source : lua/ge/extensions/editor/roadArchitect/profiles.lua:1176
---@param profile any
function editor_roadArchitect_profiles.getWidth(profile) end

--- Returns the camera to the stored old view.
---Source : lua/ge/extensions/editor/roadArchitect/profiles.lua:2852
function editor_roadArchitect_profiles.goToOldView() end

--- Moves the camera to the profile edit pose.
---  [Also adjusts the timing parameters respectively].
---Source : lua/ge/extensions/editor/roadArchitect/profiles.lua:2840
---@param timer any
---@param time any
function editor_roadArchitect_profiles.goToProfileView(timer, time) end

--- Determines if the given profile is valid for creating an percectly-matched auto junction (when dragging road start/end to middle of other road).
---Source : lua/ge/extensions/editor/roadArchitect/profiles.lua:1113
---@param profile any
function editor_roadArchitect_profiles.isProfileValidForMidJctPerfect(profile) end

--- Raise/lower the priority of the given layer, in the given profile.
---Source : lua/ge/extensions/editor/roadArchitect/profiles.lua:945
---@param p any
---@param i any
---@param dir any
function editor_roadArchitect_profiles.layerChangePriority(p, i, dir) end

--- Loads a profile from disk.
---Source : lua/ge/extensions/editor/roadArchitect/profiles.lua:3373
function editor_roadArchitect_profiles.load() end

--- Gets the collection of default lateral road profile templates.
---Source : lua/ge/extensions/editor/roadArchitect/profiles.lua:3413
function editor_roadArchitect_profiles.populateProfileTemplates() end

--- Removes all the temporary 'Current Profile' profiles from the profiles table.
---Source : lua/ge/extensions/editor/roadArchitect/profiles.lua:3387
function editor_roadArchitect_profiles.removeAllTempCurrentProfiles() end

--- Removes the selected lane from the selected profile.
---Source : lua/ge/extensions/editor/roadArchitect/profiles.lua:2878
---@param selectedProfileIdx any
---@param selectedLaneIdx any
---@param side any
function editor_roadArchitect_profiles.removeLane(selectedProfileIdx, selectedLaneIdx, side) end

--- Removes the layer with the given index.
---Source : lua/ge/extensions/editor/roadArchitect/profiles.lua:131
---@param p any
---@param i any
function editor_roadArchitect_profiles.removeLayer(p, i) end

--- Reset all profile templates.
---Source : lua/ge/extensions/editor/roadArchitect/profiles.lua:3424
function editor_roadArchitect_profiles.resetTemplates() end

--- Saves the given profile to disk.
---Source : lua/ge/extensions/editor/roadArchitect/profiles.lua:3358
---@param p any
function editor_roadArchitect_profiles.save(p) end

--- Serialises a profile.
---Source : lua/ge/extensions/editor/roadArchitect/profiles.lua:3142
---@param p any
function editor_roadArchitect_profiles.serialiseProfile(p) end

--- Updates the road condition details for the given road, based on the stored parameters.
---Source : lua/ge/extensions/editor/roadArchitect/profiles.lua:2948
---@param r any
function editor_roadArchitect_profiles.updateCondition(r) end

--- Updates the module lane flags (used for UI - when displaying which static meshes are present).
---Source : lua/ge/extensions/editor/roadArchitect/profiles.lua:845
---@param p any
function editor_roadArchitect_profiles.updateLaneFlags(p) end

--- Copies a profile template to an existing profile.
---Source : lua/ge/extensions/editor/roadArchitect/profiles.lua:859
---@param road any
---@param templateName any
function editor_roadArchitect_profiles.updateToNewTemplate(road, templateName) end

