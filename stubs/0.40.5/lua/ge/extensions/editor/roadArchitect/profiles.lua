---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/roadArchitect/profiles.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Management of the lateral profiles (cross sections) of Road Architect roads. A profile is a table keyed by lane number: negative keys (-1 to -20) are the left lanes, positive keys (1 to 20) the right ones, there is no key 0. Each lane has a type ('road_lane', 'sidewalk', 'shoulder', 'island'), a width and heights (fields width, heightL, heightR, which are ImGui pointers to read with [0]). The profile also carries style parameters (wear condition, paint line materials, edge fades, gutter...) and a layers array of layers (paint, decals, wear). The module loads the predefined profile templates (roadArchitect/profiles/*.json files: Rural, Urban, Hwy, Tracks, Barrier_Only, Lamps_Only...), builds the junction profiles, automatically adds the paint, wear and edge fade layers, and serializes/deserializes profiles to JSON.
--- Access: extension `editor_roadArchitect_profiles`: `extensions.load("editor_roadArchitect_profiles")`, then the global `editor_roadArchitect_profiles`
---@class editor_roadArchitect_profiles
---@field profiles table[] Array of the profiles currently present in the editor (predefined templates, then profiles created or loaded by the user).
editor_roadArchitect_profiles = {}

--- Adds to the profile a centerline layer (material p.centerlineMat, width 0.4) for each section of two-way road lanes (one-way sections do not get one).
---Source: lua/ge/extensions/editor/roadArchitect/profiles.lua:134
---@param p table Profile.
---@param isPaint boolean If true, the layer is not marked as paint (isPaint = not isPaint); receives prof.continueLinesToEnd[0] from autoPaintLines.
function editor_roadArchitect_profiles.addCenterline(p, isPaint) end

--- Adds the road edge lines (width 0.25) on the left and/or right of each section of road lanes, with the materials p.edgeMatL and p.edgeMatR.
---Source: lua/ge/extensions/editor/roadArchitect/profiles.lua:172
---@param p table Profile.
---@param latOffL number Lateral offset of the left edge line (m).
---@param latOffR number Lateral offset of the right edge line (m).
---@param isLeft boolean Create the left edge lines.
---@param isRight boolean Create the right edge lines.
---@param isPaint boolean Same meaning as for addCenterline.
function editor_roadArchitect_profiles.addEdgeLines(p, latOffL, latOffR, isLeft, isRight, isPaint) end

--- Adds stop lines (width 0.4, materials p.endStopMatS and p.endStopMatE) at the end of the section for road lanes. Only the isEnd case is handled in the code read; the left and right lanes get separate layers (Stop line A and B).
---Source: lua/ge/extensions/editor/roadArchitect/profiles.lua:297
---@param p table Profile.
---@param isStart boolean Stop line at the start of the road.
---@param isEnd boolean Stop line at the end of the road.
function editor_roadArchitect_profiles.addEndLine(p, isStart, isEnd) end

--- Adds a 'road_lane' lane (3.5 m, height 0.01) to the profile, at the chosen position, shifting the existing lanes. Limited to 20 lanes per side.
---Source: lua/ge/extensions/editor/roadArchitect/profiles.lua:2903
---@param selectedProfileIdx integer Index of the profile in profiles.
---@param selectedLaneIdx integer Reference lane key.
---@param side string 'left' or 'right'.
---@param rel string Relative position: 'above' (left side: before the lane) or 'below' (right side: after the lane).
function editor_roadArchitect_profiles.addLane(selectedProfileIdx, selectedLaneIdx, side, rel) end

--- Adds a lane separation line (material p.laneMarkingsMat) between each pair of adjacent road lanes of the same direction.
---Source: lua/ge/extensions/editor/roadArchitect/profiles.lua:252
---@param p table Profile.
---@param isPaint boolean Same meaning as for addCenterline.
function editor_roadArchitect_profiles.addLaneDivisionLines(p, isPaint) end

--- Inserts a new empty layer ('new layer') into the profile, above or below index i.
---Source: lua/ge/extensions/editor/roadArchitect/profiles.lua:989
---@param p table Profile.
---@param i integer Reference index.
---@param dir string 'above' to insert before index i, otherwise after (inferred from code).
function editor_roadArchitect_profiles.addLayer(p, i, dir) end

--- Adds to each 'road_lane' or 'shoulder' lane between lMin and lMax a light tire tracks layer (material m_tread_marks_clean) over the whole length.
---Source: lua/ge/extensions/editor/roadArchitect/profiles.lua:455
---@param p table Profile.
---@param fadeS number Fade length at the start (m).
---@param fadeE number Fade length at the end (m).
---@param lMin integer First lane key.
---@param lMax integer Last lane key.
function editor_roadArchitect_profiles.addLightTreadToLanes(p, fadeS, fadeE, lMin, lMax) end

--- Gives the width mWidth to all 'road_lane' type lanes of the profile (overwrites the cross-section widths).
---Source: lua/ge/extensions/editor/roadArchitect/profiles.lua:2938
---@param profile table Profile.
---@param mWidth number Single width (m).
function editor_roadArchitect_profiles.applyMasterWidth(profile, mWidth) end

--- Indicates whether the profile contains at least one 'sidewalk' type lane.
---Source: lua/ge/extensions/editor/roadArchitect/profiles.lua:1153
---@param p table Profile.
---@return boolean  true if a sidewalk exists.
function editor_roadArchitect_profiles.areSidewalksPresent(p) end

--- Adds edge fade layers (width 2.0, texture length 18, offset 0.5 m) for each road or shoulder section whose side is not occupied by another lane other than an island.
---Source: lua/ge/extensions/editor/roadArchitect/profiles.lua:383
---@param prof table Profile.
---@param isLeft boolean Create the left-side fades.
---@param isRight boolean Create the right-side fades.
---@param mat string|nil Material (default m_road_asphalt_edge).
function editor_roadArchitect_profiles.autoEdgeBlending(prof, isLeft, isRight, mat) end

--- Resets prof.layers then automatically creates centerline, edge lines, end stop line and lane separation lines from the profile parameters (conditionEdgesL/R, conditionEndStopE, edgeLineGapL/R, continueLinesToEnd).
---Source: lua/ge/extensions/editor/roadArchitect/profiles.lua:374
---@param prof table Profile whose layers are recreated.
function editor_roadArchitect_profiles.autoPaintLines(prof) end

--- Returns the existing lane keys, from smallest to largest, plus the separate lists of left and right keys.
---Source: lua/ge/extensions/editor/roadArchitect/profiles.lua:1050
---@param profile table Profile.
---@return integer[]  All keys, sorted.
---@return integer[]  Left keys.
---@return integer[]  Right keys.
function editor_roadArchitect_profiles.computeLaneKeys(profile) end

--- Splits the profile from left to right into contiguous sections of lanes of one or two given types. Each section is { s, e, isOneWay, lanesL, lanesR }: start and end keys, true if the section is entirely on one side, number of lanes on the left and on the right.
---Source: lua/ge/extensions/editor/roadArchitect/profiles.lua:100
---@param profile table Road profile.
---@param laneType1 string First accepted lane type ('road_lane', 'sidewalk', 'shoulder', 'island').
---@param laneType2 string|nil Second accepted lane type, optional.
---@return table[]  Array of sections { s, e, isOneWay, lanesL, lanesR }.
function editor_roadArchitect_profiles.computeSectionsByType(profile, laneType1, laneType2) end

--- Deep-copies a profile (new ImGui pointers, lanes and layers); the name is kept as is (same object).
---Source: lua/ge/extensions/editor/roadArchitect/profiles.lua:2768
---@param template table Profile to copy.
---@return table  Copy of the profile.
function editor_roadArchitect_profiles.copyProfile(template) end

--- Creates the profile of a simple bridge: two road lanes of width width whose heights heightL and heightR equal depth.
---Source: lua/ge/extensions/editor/roadArchitect/profiles.lua:1510
---@param width number Width of each lane (m).
---@param depth number Deck thickness/height (m).
---@return table  Profile created.
function editor_roadArchitect_profiles.createBridgeProfile(width, depth) end

--- Creates a profile for OpenDRIVE import: each lane of lanes gets the matching native type (driving, shoulder, parking, stop, median, entry/exit, ramps, slipLane... -> road_lane; walking -> sidewalk; restricted and none -> island; other -> road_lane) with a default width of 3.5 m (the real widths are added afterwards node by node). Adds the automatic paint lines.
---Source: lua/ge/extensions/editor/roadArchitect/profiles.lua:1217
---@param lanes table Table lane key -> { type = OpenDRIVE type (string) }.
---@return table  The created profile.
---@return table  Table lane key -> native type.
function editor_roadArchitect_profiles.createCustomImportProfile(lanes) end

--- Creates the profile of the junction overlay roads (see overlays.lua), with no layer.
---Source: lua/ge/extensions/editor/roadArchitect/profiles.lua:1444
---@param width number Lane width (m).
---@return table  Profile created.
function editor_roadArchitect_profiles.createOverlayProfile(width) end

--- Creates the profile of a two-way junction road: numLeftLanes lanes on the left, numRightLanes on the right, plus optionally a sidewalk on each side. Adds paint and edge fades (the fades are only created if there are no sidewalks).
---Source: lua/ge/extensions/editor/roadArchitect/profiles.lua:1581
---@param numLeftLanes integer Lanes on the left.
---@param numRightLanes integer Lanes on the right.
---@param width number Lane width (m).
---@param sidewalkWidth number Sidewalk width (m).
---@param sidewalkHeight number Sidewalk height (m).
---@param isSidewalk boolean Add the sidewalks.
---@param mat string|nil Edge fade material.
---@return table  Profile created.
function editor_roadArchitect_profiles.createProfileForJctRoad(numLeftLanes, numRightLanes, width, sidewalkWidth, sidewalkHeight, isSidewalk, mat) end

--- Creates the profile of a one-way junction road with numLanes lanes, with optional sidewalks.
---Source: lua/ge/extensions/editor/roadArchitect/profiles.lua:1752
---@param numLanes integer Number of lanes.
---@param width number Lane width (m).
---@param sidewalkWidth number Sidewalk width (m).
---@param sidewalkHeight number Sidewalk height (m).
---@param isSidewalk boolean Add the sidewalks.
---@param mat string|nil Edge fade material.
---@return table  Profile created.
function editor_roadArchitect_profiles.createProfileForJctRoad1Way(numLanes, width, sidewalkWidth, sidewalkHeight, isSidewalk, mat) end

--- Creates the profile of the end sections (start and end) of a highway junction: road lanes on each side, two shoulders and a central reservation (island of width cResWidth).
---Source: lua/ge/extensions/editor/roadArchitect/profiles.lua:2060
---@param numLanes integer Number of lanes per direction.
---@param laneWidth number Width of one lane (m).
---@param cResWidth number Width of the central reservation (m).
---@param hardWidth number Width of the emergency lane (m).
---@param mat string|nil Edge fade material.
---@return table  Profile created.
function editor_roadArchitect_profiles.createProfileForJctRoadHwyCap(numLanes, laneWidth, cResWidth, hardWidth, mat) end

--- Creates the end profile of a one-way highway junction (without central reservation).
---Source: lua/ge/extensions/editor/roadArchitect/profiles.lua:2390
---@param numLanes integer Number of lanes.
---@param laneWidth number Width of one lane (m).
---@param hardWidth number Width of the emergency lane (m).
---@param mat string|nil Edge fade material.
---@return table  Profile created.
function editor_roadArchitect_profiles.createProfileForJctRoadHwyCap1W(numLanes, laneWidth, hardWidth, mat) end

--- Creates the profile of the urban part of a highway-urban transition junction (lanes, optional sidewalks, one-way or two-way).
---Source: lua/ge/extensions/editor/roadArchitect/profiles.lua:2161
---@param numLanes integer Number of lanes.
---@param laneWidth number Width of one lane (m).
---@param isSidewalk boolean Add sidewalks.
---@param sidewalkWidth number Sidewalk width (m).
---@param sidewalkHeight number Sidewalk height (m).
---@param isOneWay boolean One-way road.
---@param mat string|nil Edge fade material.
---@return table  Profile created.
function editor_roadArchitect_profiles.createProfileForJctRoadHwyCapUrban(numLanes, laneWidth, isSidewalk, sidewalkWidth, sidewalkHeight, isOneWay, mat) end

--- Creates the profile of the one-way exit roads of a highway junction (two road lanes, at positions 1 and 2).
---Source: lua/ge/extensions/editor/roadArchitect/profiles.lua:2693
---@param laneWidth number Width of one lane (m).
---@param hardWidth number Width of the emergency lane (m).
---@param mat string|nil Edge fade material.
---@return table  Profile created.
function editor_roadArchitect_profiles.createProfileForJctRoadHwyExit(laneWidth, hardWidth, mat) end

--- Creates the profile of section 2 of a highway junction (shoulders shifted by one lane: extreme keys at -numLanes-3 and numLanes+3).
---Source: lua/ge/extensions/editor/roadArchitect/profiles.lua:2467
---@param numLanes integer Number of lanes.
---@param laneWidth number Width of one lane (m).
---@param cResWidth number Width of the central reservation (m).
---@param hardWidth number Width of the emergency lane (m).
---@param mat string|nil Edge fade material.
---@return table  Profile created.
function editor_roadArchitect_profiles.createProfileForJctRoadHwyS2(numLanes, laneWidth, cResWidth, hardWidth, mat) end

--- Creates the profile of section 3 of a highway junction.
---Source: lua/ge/extensions/editor/roadArchitect/profiles.lua:2568
---@param numLanes integer Number of lanes.
---@param laneWidth number Width of one lane (m).
---@param cResWidth number Width of the central reservation (m).
---@param hardWidth number Width of the emergency lane (m).
---@param mat string|nil Edge fade material.
---@return table  Profile created.
function editor_roadArchitect_profiles.createProfileForJctRoadHwyS3(numLanes, laneWidth, cResWidth, hardWidth, mat) end

--- Creates the profile of the transition (flaring) sections of a highway-urban junction, one-way or two-way.
---Source: lua/ge/extensions/editor/roadArchitect/profiles.lua:2273
---@param numLanes integer Number of lanes.
---@param laneWidth number Width of one lane (m).
---@param cResWidth number Width of the central reservation (m).
---@param hardWidth number Width of the emergency lane (m).
---@param isOneWay boolean One-way road.
---@param mat string|nil Edge fade material.
---@return table  Profile created.
function editor_roadArchitect_profiles.createProfileForJctRoadHwyUrbanTrans(numLanes, laneWidth, cResWidth, hardWidth, isOneWay, mat) end

--- Creates the profile of the tight connecting road of Y junctions (left and right lanes plus a sidewalk on the right, whose curb side can be reversed).
---Source: lua/ge/extensions/editor/roadArchitect/profiles.lua:1669
---@param numLeftLanes integer Lanes on the left.
---@param numRightLanes integer Lanes on the right.
---@param width number Lane width (m).
---@param sidewalkWidth number Sidewalk width (m).
---@param sidewalkHeight number Sidewalk height (m).
---@param isSidewalk boolean Add the sidewalk.
---@param isFlipKerb boolean Reverse the curb side of the sidewalk (isLeftSide).
---@param mat string|nil Edge fade material.
---@return table  Profile created.
function editor_roadArchitect_profiles.createProfileForJctRoadYSpecial(numLeftLanes, numRightLanes, width, sidewalkWidth, sidewalkHeight, isSidewalk, isFlipKerb, mat) end

--- Creates the profile of a junction road with a single sidewalk, on the left or right side.
---Source: lua/ge/extensions/editor/roadArchitect/profiles.lua:1833
---@param numLeftLanes integer Lanes on the left.
---@param numRightLanes integer Lanes on the right.
---@param width number Lane width (m).
---@param sidewalkWidth number Sidewalk width (m).
---@param sidewalkHeight number Sidewalk height (m).
---@param isLeftSide boolean Sidewalk on the left side if true, otherwise on the right.
---@param mat string|nil Edge fade material.
---@return table  Profile created.
function editor_roadArchitect_profiles.createProfileForJctRoad_SW(numLeftLanes, numRightLanes, width, sidewalkWidth, sidewalkHeight, isLeftSide, mat) end

--- Creates a simple urban profile (road lanes of 3.5 m, height 0.01) from the metadata of a decal road created with other tools, with automatic paint.
---Source: lua/ge/extensions/editor/roadArchitect/profiles.lua:1369
---@param numLeftLanes integer Number of lanes on the left.
---@param numRightLanes integer Number of lanes on the right.
---@return table  Profile created.
function editor_roadArchitect_profiles.createProfileFromDecalData(numLeftLanes, numRightLanes) end

--- Copies the profile template templateName to a new profile (style parameters, lanes and layers deep-copied).
---Source: lua/ge/extensions/editor/roadArchitect/profiles.lua:1297
---@param templateName any Name of the template to copy (see getProfileFromName).
---@param newName any|nil Name of the new profile (default an ArrayChar 'New Profile').
---@return table  New profile.
function editor_roadArchitect_profiles.createProfileFromTemplate(templateName, newName) end

--- Creates the profile of the circular roads of a roundabout (numRBLanes lanes of width laneWidthRB).
---Source: lua/ge/extensions/editor/roadArchitect/profiles.lua:1992
---@param numRBLanes integer Number of lanes of the ring.
---@param laneWidthRB number Width of one lane (m).
---@param mat string|nil Edge fade material.
---@return table  Profile created.
function editor_roadArchitect_profiles.createRoundaboutProfile(numRBLanes, laneWidthRB, mat) end

--- Creates a profile made of a single sidewalk lane at position 1.
---Source: lua/ge/extensions/editor/roadArchitect/profiles.lua:1922
---@param sidewalkWidth number Width (m).
---@param sidewalkHeight number Height (m).
---@param isFlipKerb boolean|nil Reverses the curb side (false by default).
---@return table  Profile created.
function editor_roadArchitect_profiles.createSidewalkOnlyProfile(sidewalkWidth, sidewalkHeight, isFlipKerb) end

--- Adds to M.profiles a copy of profile p named 'New Template' (template creation requested by the user).
---Source: lua/ge/extensions/editor/roadArchitect/profiles.lua:3396
---@param p table Profile to copy.
function editor_roadArchitect_profiles.createTemplateOnRequest(p) end

--- Moves to the next lane type: road_lane -> sidewalk -> shoulder -> island -> road_lane. Any other type is returned unchanged.
---Source: lua/ge/extensions/editor/roadArchitect/profiles.lua:1032
---@param t string Current lane type.
---@return string  Next type.
function editor_roadArchitect_profiles.cycleLaneType(t) end

--- Moves to the previous lane type (reverse order of cycleLaneType).
---Source: lua/ge/extensions/editor/roadArchitect/profiles.lua:1041
---@param t string Current lane type.
---@return string  Previous type.
function editor_roadArchitect_profiles.cycleLaneTypeBack(t) end

--- Rebuilds a profile from its serialized version (default values for missing fields: name 'New Profile', class 'urban'). Returns nil if the data is nil.
---Source: lua/ge/extensions/editor/roadArchitect/profiles.lua:3247
---@param pSer table|nil Serialized profile.
---@return table|nil  Rebuilt profile.
function editor_roadArchitect_profiles.deserialiseProfile(pSer) end

--- Returns the index of the profile in M.profiles whose name field equals name (== comparison), or nil.
---Source: lua/ge/extensions/editor/roadArchitect/profiles.lua:834
---@param name any Name searched, compared as is against the profiles' name field.
---@return integer|nil  Index in profiles.
function editor_roadArchitect_profiles.getIdFromName(name) end

--- Returns the state of the module's lane flags: { isCustom, isSidewalk } (see updateLaneFlags).
---Source: lua/ge/extensions/editor/roadArchitect/profiles.lua:1210
---@return table  { isCustom = boolean, isSidewalk = boolean }.
function editor_roadArchitect_profiles.getLaneFlags() end

--- Returns the smallest and largest existing lane key of a profile (scan from -20 to 20).
---Source: lua/ge/extensions/editor/roadArchitect/profiles.lua:88
---@param profile table Road profile.
---@return integer  Minimum key (100 if the profile is empty).
---@return integer  Maximum key (-100 if the profile is empty).
function editor_roadArchitect_profiles.getMinMaxLaneKeys(profile) end

--- Counts the left and right lanes (all types combined).
---Source: lua/ge/extensions/editor/roadArchitect/profiles.lua:1081
---@param profile table Profile.
---@return integer  Lanes on the left.
---@return integer  Lanes on the right.
function editor_roadArchitect_profiles.getNumLanesLR(profile) end

--- Counts only the left and right lanes of type 'road_lane' or 'shoulder'.
---Source: lua/ge/extensions/editor/roadArchitect/profiles.lua:1097
---@param profile table Profile.
---@return integer  Road lanes on the left.
---@return integer  Road lanes on the right.
function editor_roadArchitect_profiles.getNumRoadLanesLR(profile) end

--- Returns the lane keys sorted from smallest to largest and their total count.
---Source: lua/ge/extensions/editor/roadArchitect/profiles.lua:1069
---@param profile table Profile.
---@return integer[]  Sorted keys.
---@return integer  Number of lanes.
function editor_roadArchitect_profiles.getOrderedLanes(profile) end

--- Returns the profile whose name matches name (see getIdFromName), or nil.
---Source: lua/ge/extensions/editor/roadArchitect/profiles.lua:842
---@param name any Profile name.
---@return table|nil  Profile found.
function editor_roadArchitect_profiles.getProfileFromName(name) end

--- Returns three tables keyed by lane key: widths, left heights and right heights, each as ImGui pointers (im.FloatPtr) ready to be edited.
---Source: lua/ge/extensions/editor/roadArchitect/profiles.lua:1164
---@param profile table Profile.
---@return table<integer, cdata>  Widths.
---@return table<integer, cdata>  Left heights (heightL).
---@return table<integer, cdata>  Right heights (heightR).
function editor_roadArchitect_profiles.getWAndHByKey(profile) end

--- Sum of the widths of all lanes of the profile.
---Source: lua/ge/extensions/editor/roadArchitect/profiles.lua:1176
---@param profile table Profile.
---@return number  Total width in meters.
function editor_roadArchitect_profiles.getWidth(profile) end

--- Returns the camera to the pose stored before the profile view (if it exists) and leaves the profile view.
---Source: lua/ge/extensions/editor/roadArchitect/profiles.lua:2852
function editor_roadArchitect_profiles.goToOldView() end

--- Stores the camera pose, switches to free camera and places it at the profile editing pose. Does nothing if already in profile view (the time is then returned unchanged).
---Source: lua/ge/extensions/editor/roadArchitect/profiles.lua:2840
---@param timer table Timer (object with stopAndReset) reset to zero.
---@param time number Current animation time.
---@return number  0.0 if the view has just been activated, otherwise time.
function editor_roadArchitect_profiles.goToProfileView(timer, time) end

--- Indicates whether the profile is suitable for a perfectly fitted automatic junction (road drawn into the middle of another): as many lanes on the left as on the right, no island, 0 or exactly 2 sidewalks placed at the edges and adjacent to a road lane.
---Source: lua/ge/extensions/editor/roadArchitect/profiles.lua:1113
---@param profile table Profile tested.
---@return boolean|nil  true if valid, false or nil otherwise (nil if asymmetric).
function editor_roadArchitect_profiles.isProfileValidForMidJctPerfect(profile) end

--- Swaps layer i with its neighbor: with dir == 'raise' it moves up (index i - 1), otherwise it moves down (index i + 1).
---Source: lua/ge/extensions/editor/roadArchitect/profiles.lua:945
---@param p table Profile.
---@param i integer Layer index.
---@param dir string 'raise' or any other value to move down.
function editor_roadArchitect_profiles.layerChangePriority(p, i, dir) end

--- Opens a JSON file selector, reads the serialized profile and adds it to M.profiles.
---Source: lua/ge/extensions/editor/roadArchitect/profiles.lua:3373
function editor_roadArchitect_profiles.load() end

--- Loads the predefined profile templates (roadArchitect/profiles/*.json files) into M.profiles, marked non-deletable. Does nothing if M.profiles already contains profiles.
---Source: lua/ge/extensions/editor/roadArchitect/profiles.lua:3413
function editor_roadArchitect_profiles.populateProfileTemplates() end

--- Removes from M.profiles all temporary profiles named 'Current Profile'.
---Source: lua/ge/extensions/editor/roadArchitect/profiles.lua:3387
function editor_roadArchitect_profiles.removeAllTempCurrentProfiles() end

--- Removes a lane from the profile at index selectedProfileIdx in M.profiles, shifts the following lanes so as not to leave a gap, then removes the layers that reference nonexistent lanes.
---Source: lua/ge/extensions/editor/roadArchitect/profiles.lua:2878
---@param selectedProfileIdx integer Index of the profile in profiles.
---@param selectedLaneIdx integer Key of the lane to remove.
---@param side string 'left' or 'right'.
function editor_roadArchitect_profiles.removeLane(selectedProfileIdx, selectedLaneIdx, side) end

--- Removes the layer at index i from the profile (table.remove on p.layers).
---Source: lua/ge/extensions/editor/roadArchitect/profiles.lua:131
---@param p table Profile.
---@param i integer Layer index.
function editor_roadArchitect_profiles.removeLayer(p, i) end

--- Empties M.profiles then reloads all the predefined templates.
---Source: lua/ge/extensions/editor/roadArchitect/profiles.lua:3424
function editor_roadArchitect_profiles.resetTemplates() end

--- Opens a save dialog and writes the serialized profile to a JSON file { profile = ... }; the profile name becomes the file name.
---Source: lua/ge/extensions/editor/roadArchitect/profiles.lua:3358
---@param p table Profile to save.
function editor_roadArchitect_profiles.save(p) end

--- Converts a profile to a JSON-serializable table (ImGui pointers replaced by their values, name as a string).
---Source: lua/ge/extensions/editor/roadArchitect/profiles.lua:3142
---@param p table Profile.
---@return table  Serialized data.
function editor_roadArchitect_profiles.serialiseProfile(p) end

--- Regenerates the wear/condition layers of road r from the profile parameters (condition, seed, number of patches and potholes, tire tracks, cracks, asphalt damage or dirt ground depending on the class). Returns without doing anything if the road has fewer than 2 nodes or no renderData, and without regenerating if no 'road_lane' lane exists (after deleting the non-persistent layers).
---Source: lua/ge/extensions/editor/roadArchitect/profiles.lua:2948
---@param r table Road Architect road.
function editor_roadArchitect_profiles.updateCondition(r) end

--- Updates the module flags (isCustom: a 'mesh' type lane exists, isSidewalk: a 'sidewalk' lane exists), used by the UI to know which static meshes are present.
---Source: lua/ge/extensions/editor/roadArchitect/profiles.lua:845
---@param p table Profile examined.
function editor_roadArchitect_profiles.updateLaneFlags(p) end

--- Empties the road's profile and replaces it with a copy of the templateName template, keeping its original name.
---Source: lua/ge/extensions/editor/roadArchitect/profiles.lua:859
---@param road table Road whose profile is replaced.
---@param templateName any Template name (see getProfileFromName).
function editor_roadArchitect_profiles.updateToNewTemplate(road, templateName) end

