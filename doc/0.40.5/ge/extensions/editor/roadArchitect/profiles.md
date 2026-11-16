# `editor_roadArchitect_profiles`

*File: `lua/ge/extensions/editor/roadArchitect/profiles.lua` · VM: Game Engine (GE) · 3505 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_roadArchitect_profiles`: `extensions.load("editor_roadArchitect_profiles")`, then the global `editor_roadArchitect_profiles`

Management of the lateral profiles (cross sections) of Road Architect roads. A profile is a table keyed by lane number: negative keys (-1 to -20) are the left lanes, positive keys (1 to 20) the right ones, there is no key 0. Each lane has a type ('road_lane', 'sidewalk', 'shoulder', 'island'), a width and heights (fields width, heightL, heightR, which are ImGui pointers to read with [0]). The profile also carries style parameters (wear condition, paint line materials, edge fades, gutter...) and a layers array of layers (paint, decals, wear). The module loads the predefined profile templates (roadArchitect/profiles/*.json files: Rural, Urban, Hwy, Tracks, Barrier_Only, Lamps_Only...), builds the junction profiles, automatically adds the paint, wear and edge fade layers, and serializes/deserializes profiles to JSON.

## Notes

- The public table M.profiles (array of loaded profiles) is filled by populateProfileTemplates(). Each profile has a name field (32-character ImGui ArrayChar) and isDeletable (false for predefined templates).
- For profile or layer fields, most values are ImGui pointers (im.FloatPtr, im.IntPtr, im.BoolPtr, im.ArrayChar): read with [0] or ffi.string for names.
- isProfileValidForMidJctPerfect returns nil (return with no value) if the profile is not symmetric, false for the other refusals and true if valid: testing with 'not' works in both cases.
- getIdFromName compares name directly with == against the name fields of the profiles, which are ImGui ArrayChars; the code does not convert them to a string (behavior of the string/ArrayChar comparison not verified here). roads.createRoadFromTemplate nevertheless passes a string to createProfileFromTemplate.
- getNumRoadLanesLR counts 'road_lane' and 'shoulder' lanes (not sidewalks or islands) whereas getNumLanesLR counts all lanes.
- The createProfileForJctRoad* functions produce the profiles used by the generated junctions (crossroads, T, Y, roundabouts, highway junctions). They fill the default style fields (condition 0.2, seed 41226, 10 patches) and call autoPaintLines and/or autoEdgeBlending.
- load() and save() go through editor_fileDialog (.json filter); the file contains { profile = ... }. loadPrefabProfile (internal) strips the extension from the name.
- updateCondition tracks the non-persistent layers: any layer whose doNotDelete[0] is false is deleted before regeneration, then the wear layers (tread, cracks, damage, patches, potholes, depending on prof.class 'urban'/'highway' or other) are recreated with math.randomseed(prof.conditionSeed[0]), so reproducibly.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_roadArchitect_profiles.addCenterline(p, isPaint)` | Adds to the profile a centerline layer (material p.centerlineMat, width 0.4) for each section of two-way road lanes (one-way sections do not get one). | 134 |
| `editor_roadArchitect_profiles.addEdgeLines(p, latOffL, latOffR, isLeft, isRight, isPaint)` | Adds the road edge lines (width 0.25) on the left and/or right of each section of road lanes, with the materials p.edgeMatL and p.edgeMatR. | 172 |
| `editor_roadArchitect_profiles.addEndLine(p, isStart, isEnd)` | Adds stop lines (width 0.4, materials p.endStopMatS and p.endStopMatE) at the end of the section for road lanes. Only the isEnd case is handled in the code read; the left and right lanes get separate layers (Stop line A and B). | 297 |
| `editor_roadArchitect_profiles.addLane(selectedProfileIdx, selectedLaneIdx, side, rel)` | Adds a 'road_lane' lane (3.5 m, height 0.01) to the profile, at the chosen position, shifting the existing lanes. Limited to 20 lanes per side. | 2903 |
| `editor_roadArchitect_profiles.addLaneDivisionLines(p, isPaint)` | Adds a lane separation line (material p.laneMarkingsMat) between each pair of adjacent road lanes of the same direction. | 252 |
| `editor_roadArchitect_profiles.addLayer(p, i, dir)` | Inserts a new empty layer ('new layer') into the profile, above or below index i. | 989 |
| `editor_roadArchitect_profiles.addLightTreadToLanes(p, fadeS, fadeE, lMin, lMax)` | Adds to each 'road_lane' or 'shoulder' lane between lMin and lMax a light tire tracks layer (material m_tread_marks_clean) over the whole length. | 455 |
| `editor_roadArchitect_profiles.applyMasterWidth(profile, mWidth)` | Gives the width mWidth to all 'road_lane' type lanes of the profile (overwrites the cross-section widths). | 2938 |
| `editor_roadArchitect_profiles.areSidewalksPresent(p)` | Indicates whether the profile contains at least one 'sidewalk' type lane. | 1153 |
| `editor_roadArchitect_profiles.autoEdgeBlending(prof, isLeft, isRight, mat)` | Adds edge fade layers (width 2.0, texture length 18, offset 0.5 m) for each road or shoulder section whose side is not occupied by another lane other than an island. | 383 |
| `editor_roadArchitect_profiles.autoPaintLines(prof)` | Resets prof.layers then automatically creates centerline, edge lines, end stop line and lane separation lines from the profile parameters (conditionEdgesL/R, conditionEndStopE, edgeLineGapL/R, continueLinesToEnd). | 374 |
| `editor_roadArchitect_profiles.computeLaneKeys(profile)` | Returns the existing lane keys, from smallest to largest, plus the separate lists of left and right keys. | 1050 |
| `editor_roadArchitect_profiles.computeSectionsByType(profile, laneType1, laneType2)` | Splits the profile from left to right into contiguous sections of lanes of one or two given types. Each section is { s, e, isOneWay, lanesL, lanesR }: start and end keys, true if the section is entirely on one side, number of lanes on the left and on the right. | 100 |
| `editor_roadArchitect_profiles.copyProfile(template)` | Deep-copies a profile (new ImGui pointers, lanes and layers); the name is kept as is (same object). | 2768 |
| `editor_roadArchitect_profiles.createBridgeProfile(width, depth)` | Creates the profile of a simple bridge: two road lanes of width width whose heights heightL and heightR equal depth. | 1510 |
| `editor_roadArchitect_profiles.createCustomImportProfile(lanes)` | Creates a profile for OpenDRIVE import: each lane of lanes gets the matching native type (driving, shoulder, parking, stop, median, entry/exit, ramps, slipLane... -> road_lane; walking -> sidewalk; restricted and none -> island; other -> road_lane) with a default width of 3.5 m (the real widths are added afterwards node by node). Adds the automatic paint lines. | 1217 |
| `editor_roadArchitect_profiles.createOverlayProfile(width)` | Creates the profile of the junction overlay roads (see overlays.lua), with no layer. | 1444 |
| `editor_roadArchitect_profiles.createProfileForJctRoad(numLeftLanes, numRightLanes, width, sidewalkWidth, sidewalkHeight, isSidewalk, mat)` | Creates the profile of a two-way junction road: numLeftLanes lanes on the left, numRightLanes on the right, plus optionally a sidewalk on each side. Adds paint and edge fades (the fades are only created if there are no sidewalks). | 1581 |
| `editor_roadArchitect_profiles.createProfileForJctRoad1Way(numLanes, width, sidewalkWidth, sidewalkHeight, isSidewalk, mat)` | Creates the profile of a one-way junction road with numLanes lanes, with optional sidewalks. | 1752 |
| `editor_roadArchitect_profiles.createProfileForJctRoadHwyCap(numLanes, laneWidth, cResWidth, hardWidth, mat)` | Creates the profile of the end sections (start and end) of a highway junction: road lanes on each side, two shoulders and a central reservation (island of width cResWidth). | 2060 |
| `editor_roadArchitect_profiles.createProfileForJctRoadHwyCap1W(numLanes, laneWidth, hardWidth, mat)` | Creates the end profile of a one-way highway junction (without central reservation). | 2390 |
| `editor_roadArchitect_profiles.createProfileForJctRoadHwyCapUrban(numLanes, laneWidth, isSidewalk, sidewalkWidth, sidewalkHeight, isOneWay, mat)` | Creates the profile of the urban part of a highway-urban transition junction (lanes, optional sidewalks, one-way or two-way). | 2161 |
| `editor_roadArchitect_profiles.createProfileForJctRoadHwyExit(laneWidth, hardWidth, mat)` | Creates the profile of the one-way exit roads of a highway junction (two road lanes, at positions 1 and 2). | 2693 |
| `editor_roadArchitect_profiles.createProfileForJctRoadHwyS2(numLanes, laneWidth, cResWidth, hardWidth, mat)` | Creates the profile of section 2 of a highway junction (shoulders shifted by one lane: extreme keys at -numLanes-3 and numLanes+3). | 2467 |
| `editor_roadArchitect_profiles.createProfileForJctRoadHwyS3(numLanes, laneWidth, cResWidth, hardWidth, mat)` | Creates the profile of section 3 of a highway junction. | 2568 |
| `editor_roadArchitect_profiles.createProfileForJctRoadHwyUrbanTrans(numLanes, laneWidth, cResWidth, hardWidth, isOneWay, mat)` | Creates the profile of the transition (flaring) sections of a highway-urban junction, one-way or two-way. | 2273 |
| `editor_roadArchitect_profiles.createProfileForJctRoadYSpecial(numLeftLanes, numRightLanes, width, sidewalkWidth, sidewalkHeight, isSidewalk, isFlipKerb, mat)` | Creates the profile of the tight connecting road of Y junctions (left and right lanes plus a sidewalk on the right, whose curb side can be reversed). | 1669 |
| `editor_roadArchitect_profiles.createProfileForJctRoad_SW(numLeftLanes, numRightLanes, width, sidewalkWidth, sidewalkHeight, isLeftSide, mat)` | Creates the profile of a junction road with a single sidewalk, on the left or right side. | 1833 |
| `editor_roadArchitect_profiles.createProfileFromDecalData(numLeftLanes, numRightLanes)` | Creates a simple urban profile (road lanes of 3.5 m, height 0.01) from the metadata of a decal road created with other tools, with automatic paint. | 1369 |
| `editor_roadArchitect_profiles.createProfileFromTemplate(templateName, newName)` | Copies the profile template templateName to a new profile (style parameters, lanes and layers deep-copied). | 1297 |
| `editor_roadArchitect_profiles.createRoundaboutProfile(numRBLanes, laneWidthRB, mat)` | Creates the profile of the circular roads of a roundabout (numRBLanes lanes of width laneWidthRB). | 1992 |
| `editor_roadArchitect_profiles.createSidewalkOnlyProfile(sidewalkWidth, sidewalkHeight, isFlipKerb)` | Creates a profile made of a single sidewalk lane at position 1. | 1922 |
| `editor_roadArchitect_profiles.createTemplateOnRequest(p)` | Adds to M.profiles a copy of profile p named 'New Template' (template creation requested by the user). | 3396 |
| `editor_roadArchitect_profiles.cycleLaneType(t)` | Moves to the next lane type: road_lane -> sidewalk -> shoulder -> island -> road_lane. Any other type is returned unchanged. | 1032 |
| `editor_roadArchitect_profiles.cycleLaneTypeBack(t)` | Moves to the previous lane type (reverse order of cycleLaneType). | 1041 |
| `editor_roadArchitect_profiles.deserialiseProfile(pSer)` | Rebuilds a profile from its serialized version (default values for missing fields: name 'New Profile', class 'urban'). Returns nil if the data is nil. | 3247 |
| `editor_roadArchitect_profiles.getIdFromName(name)` | Returns the index of the profile in M.profiles whose name field equals name (== comparison), or nil. | 834 |
| `editor_roadArchitect_profiles.getLaneFlags()` | Returns the state of the module's lane flags: { isCustom, isSidewalk } (see updateLaneFlags). | 1210 |
| `editor_roadArchitect_profiles.getMinMaxLaneKeys(profile)` | Returns the smallest and largest existing lane key of a profile (scan from -20 to 20). | 88 |
| `editor_roadArchitect_profiles.getNumLanesLR(profile)` | Counts the left and right lanes (all types combined). | 1081 |
| `editor_roadArchitect_profiles.getNumRoadLanesLR(profile)` | Counts only the left and right lanes of type 'road_lane' or 'shoulder'. | 1097 |
| `editor_roadArchitect_profiles.getOrderedLanes(profile)` | Returns the lane keys sorted from smallest to largest and their total count. | 1069 |
| `editor_roadArchitect_profiles.getProfileFromName(name)` | Returns the profile whose name matches name (see getIdFromName), or nil. | 842 |
| `editor_roadArchitect_profiles.getWAndHByKey(profile)` | Returns three tables keyed by lane key: widths, left heights and right heights, each as ImGui pointers (im.FloatPtr) ready to be edited. | 1164 |
| `editor_roadArchitect_profiles.getWidth(profile)` | Sum of the widths of all lanes of the profile. | 1176 |
| `editor_roadArchitect_profiles.goToOldView()` | Returns the camera to the pose stored before the profile view (if it exists) and leaves the profile view. | 2852 |
| `editor_roadArchitect_profiles.goToProfileView(timer, time)` | Stores the camera pose, switches to free camera and places it at the profile editing pose. Does nothing if already in profile view (the time is then returned unchanged). | 2840 |
| `editor_roadArchitect_profiles.isProfileValidForMidJctPerfect(profile)` | Indicates whether the profile is suitable for a perfectly fitted automatic junction (road drawn into the middle of another): as many lanes on the left as on the right, no island, 0 or exactly 2 sidewalks placed at the edges and adjacent to a road lane. | 1113 |
| `editor_roadArchitect_profiles.layerChangePriority(p, i, dir)` | Swaps layer i with its neighbor: with dir == 'raise' it moves up (index i - 1), otherwise it moves down (index i + 1). | 945 |
| `editor_roadArchitect_profiles.load()` | Opens a JSON file selector, reads the serialized profile and adds it to M.profiles. | 3373 |
| `editor_roadArchitect_profiles.populateProfileTemplates()` | Loads the predefined profile templates (roadArchitect/profiles/*.json files) into M.profiles, marked non-deletable. Does nothing if M.profiles already contains profiles. | 3413 |
| `editor_roadArchitect_profiles.removeAllTempCurrentProfiles()` | Removes from M.profiles all temporary profiles named 'Current Profile'. | 3387 |
| `editor_roadArchitect_profiles.removeLane(selectedProfileIdx, selectedLaneIdx, side)` | Removes a lane from the profile at index selectedProfileIdx in M.profiles, shifts the following lanes so as not to leave a gap, then removes the layers that reference nonexistent lanes. | 2878 |
| `editor_roadArchitect_profiles.removeLayer(p, i)` | Removes the layer at index i from the profile (table.remove on p.layers). | 131 |
| `editor_roadArchitect_profiles.resetTemplates()` | Empties M.profiles then reloads all the predefined templates. | 3424 |
| `editor_roadArchitect_profiles.save(p)` | Opens a save dialog and writes the serialized profile to a JSON file { profile = ... }; the profile name becomes the file name. | 3358 |
| `editor_roadArchitect_profiles.serialiseProfile(p)` | Converts a profile to a JSON-serializable table (ImGui pointers replaced by their values, name as a string). | 3142 |
| `editor_roadArchitect_profiles.updateCondition(r)` | Regenerates the wear/condition layers of road r from the profile parameters (condition, seed, number of patches and potholes, tire tracks, cracks, asphalt damage or dirt ground depending on the class). Returns without doing anything if the road has fewer than 2 nodes or no renderData, and without regenerating if no 'road_lane' lane exists (after deleting the non-persistent layers). | 2948 |
| `editor_roadArchitect_profiles.updateLaneFlags(p)` | Updates the module flags (isCustom: a 'mesh' type lane exists, isSidewalk: a 'sidewalk' lane exists), used by the UI to know which static meshes are present. | 845 |
| `editor_roadArchitect_profiles.updateToNewTemplate(road, templateName)` | Empties the road's profile and replaces it with a copy of the templateName template, keeping its original name. | 859 |

### Parameter details

#### `editor_roadArchitect_profiles.addCenterline(p, isPaint)`

Adds to the profile a centerline layer (material p.centerlineMat, width 0.4) for each section of two-way road lanes (one-way sections do not get one).

- `p` (*table*) : Profile.
- `isPaint` (*boolean*) : If true, the layer is not marked as paint (isPaint = not isPaint); receives prof.continueLinesToEnd[0] from autoPaintLines.

#### `editor_roadArchitect_profiles.addEdgeLines(p, latOffL, latOffR, isLeft, isRight, isPaint)`

Adds the road edge lines (width 0.25) on the left and/or right of each section of road lanes, with the materials p.edgeMatL and p.edgeMatR.

- `p` (*table*) : Profile.
- `latOffL` (*number*) : Lateral offset of the left edge line (m).
- `latOffR` (*number*) : Lateral offset of the right edge line (m).
- `isLeft` (*boolean*) : Create the left edge lines.
- `isRight` (*boolean*) : Create the right edge lines.
- `isPaint` (*boolean*) : Same meaning as for addCenterline.

#### `editor_roadArchitect_profiles.addEndLine(p, isStart, isEnd)`

Adds stop lines (width 0.4, materials p.endStopMatS and p.endStopMatE) at the end of the section for road lanes. Only the isEnd case is handled in the code read; the left and right lanes get separate layers (Stop line A and B).

- `p` (*table*) : Profile.
- `isStart` (*boolean*) : Stop line at the start of the road.
- `isEnd` (*boolean*) : Stop line at the end of the road.

#### `editor_roadArchitect_profiles.addLane(selectedProfileIdx, selectedLaneIdx, side, rel)`

Adds a 'road_lane' lane (3.5 m, height 0.01) to the profile, at the chosen position, shifting the existing lanes. Limited to 20 lanes per side.

- `selectedProfileIdx` (*integer*) : Index of the profile in profiles.
- `selectedLaneIdx` (*integer*) : Reference lane key.
- `side` (*string*) : 'left' or 'right'.
- `rel` (*string*) : Relative position: 'above' (left side: before the lane) or 'below' (right side: after the lane).

#### `editor_roadArchitect_profiles.addLaneDivisionLines(p, isPaint)`

Adds a lane separation line (material p.laneMarkingsMat) between each pair of adjacent road lanes of the same direction.

- `p` (*table*) : Profile.
- `isPaint` (*boolean*) : Same meaning as for addCenterline.

#### `editor_roadArchitect_profiles.addLayer(p, i, dir)`

Inserts a new empty layer ('new layer') into the profile, above or below index i.

- `p` (*table*) : Profile.
- `i` (*integer*) : Reference index.
- `dir` (*string*) : 'above' to insert before index i, otherwise after (inferred from code).

#### `editor_roadArchitect_profiles.addLightTreadToLanes(p, fadeS, fadeE, lMin, lMax)`

Adds to each 'road_lane' or 'shoulder' lane between lMin and lMax a light tire tracks layer (material m_tread_marks_clean) over the whole length.

- `p` (*table*) : Profile.
- `fadeS` (*number*) : Fade length at the start (m).
- `fadeE` (*number*) : Fade length at the end (m).
- `lMin` (*integer*) : First lane key.
- `lMax` (*integer*) : Last lane key.

#### `editor_roadArchitect_profiles.applyMasterWidth(profile, mWidth)`

Gives the width mWidth to all 'road_lane' type lanes of the profile (overwrites the cross-section widths).

- `profile` (*table*) : Profile.
- `mWidth` (*number*) : Single width (m).

#### `editor_roadArchitect_profiles.areSidewalksPresent(p)`

Indicates whether the profile contains at least one 'sidewalk' type lane.

- `p` (*table*) : Profile.
- **returns**: boolean true if a sidewalk exists.

#### `editor_roadArchitect_profiles.autoEdgeBlending(prof, isLeft, isRight, mat)`

Adds edge fade layers (width 2.0, texture length 18, offset 0.5 m) for each road or shoulder section whose side is not occupied by another lane other than an island.

- `prof` (*table*) : Profile.
- `isLeft` (*boolean*) : Create the left-side fades.
- `isRight` (*boolean*) : Create the right-side fades.
- `mat` (*string|nil*) : Material (default m_road_asphalt_edge).

#### `editor_roadArchitect_profiles.autoPaintLines(prof)`

Resets prof.layers then automatically creates centerline, edge lines, end stop line and lane separation lines from the profile parameters (conditionEdgesL/R, conditionEndStopE, edgeLineGapL/R, continueLinesToEnd).

- `prof` (*table*) : Profile whose layers are recreated.

#### `editor_roadArchitect_profiles.computeLaneKeys(profile)`

Returns the existing lane keys, from smallest to largest, plus the separate lists of left and right keys.

- `profile` (*table*) : Profile.
- **returns**: integer[] All keys, sorted.
- **returns**: integer[] Left keys.
- **returns**: integer[] Right keys.

#### `editor_roadArchitect_profiles.computeSectionsByType(profile, laneType1, laneType2)`

Splits the profile from left to right into contiguous sections of lanes of one or two given types. Each section is { s, e, isOneWay, lanesL, lanesR }: start and end keys, true if the section is entirely on one side, number of lanes on the left and on the right.

- `profile` (*table*) : Road profile.
- `laneType1` (*string*) : First accepted lane type ('road_lane', 'sidewalk', 'shoulder', 'island').
- `laneType2` (*string|nil*) : Second accepted lane type, optional.
- **returns**: table[] Array of sections { s, e, isOneWay, lanesL, lanesR }.

#### `editor_roadArchitect_profiles.copyProfile(template)`

Deep-copies a profile (new ImGui pointers, lanes and layers); the name is kept as is (same object).

- `template` (*table*) : Profile to copy.
- **returns**: table Copy of the profile.

#### `editor_roadArchitect_profiles.createBridgeProfile(width, depth)`

Creates the profile of a simple bridge: two road lanes of width width whose heights heightL and heightR equal depth.

- `width` (*number*) : Width of each lane (m).
- `depth` (*number*) : Deck thickness/height (m).
- **returns**: table Profile created.

#### `editor_roadArchitect_profiles.createCustomImportProfile(lanes)`

Creates a profile for OpenDRIVE import: each lane of lanes gets the matching native type (driving, shoulder, parking, stop, median, entry/exit, ramps, slipLane... -> road_lane; walking -> sidewalk; restricted and none -> island; other -> road_lane) with a default width of 3.5 m (the real widths are added afterwards node by node). Adds the automatic paint lines.

- `lanes` (*table*) : Table lane key -> { type = OpenDRIVE type (string) }.
- **returns**: table The created profile.
- **returns**: table Table lane key -> native type.

#### `editor_roadArchitect_profiles.createOverlayProfile(width)`

Creates the profile of the junction overlay roads (see overlays.lua), with no layer.

- `width` (*number*) : Lane width (m).
- **returns**: table Profile created.

#### `editor_roadArchitect_profiles.createProfileForJctRoad(numLeftLanes, numRightLanes, width, sidewalkWidth, sidewalkHeight, isSidewalk, mat)`

Creates the profile of a two-way junction road: numLeftLanes lanes on the left, numRightLanes on the right, plus optionally a sidewalk on each side. Adds paint and edge fades (the fades are only created if there are no sidewalks).

- `numLeftLanes` (*integer*) : Lanes on the left.
- `numRightLanes` (*integer*) : Lanes on the right.
- `width` (*number*) : Lane width (m).
- `sidewalkWidth` (*number*) : Sidewalk width (m).
- `sidewalkHeight` (*number*) : Sidewalk height (m).
- `isSidewalk` (*boolean*) : Add the sidewalks.
- `mat` (*string|nil*) : Edge fade material.
- **returns**: table Profile created.

#### `editor_roadArchitect_profiles.createProfileForJctRoad1Way(numLanes, width, sidewalkWidth, sidewalkHeight, isSidewalk, mat)`

Creates the profile of a one-way junction road with numLanes lanes, with optional sidewalks.

- `numLanes` (*integer*) : Number of lanes.
- `width` (*number*) : Lane width (m).
- `sidewalkWidth` (*number*) : Sidewalk width (m).
- `sidewalkHeight` (*number*) : Sidewalk height (m).
- `isSidewalk` (*boolean*) : Add the sidewalks.
- `mat` (*string|nil*) : Edge fade material.
- **returns**: table Profile created.

#### `editor_roadArchitect_profiles.createProfileForJctRoadHwyCap(numLanes, laneWidth, cResWidth, hardWidth, mat)`

Creates the profile of the end sections (start and end) of a highway junction: road lanes on each side, two shoulders and a central reservation (island of width cResWidth).

- `numLanes` (*integer*) : Number of lanes per direction.
- `laneWidth` (*number*) : Width of one lane (m).
- `cResWidth` (*number*) : Width of the central reservation (m).
- `hardWidth` (*number*) : Width of the emergency lane (m).
- `mat` (*string|nil*) : Edge fade material.
- **returns**: table Profile created.

#### `editor_roadArchitect_profiles.createProfileForJctRoadHwyCap1W(numLanes, laneWidth, hardWidth, mat)`

Creates the end profile of a one-way highway junction (without central reservation).

- `numLanes` (*integer*) : Number of lanes.
- `laneWidth` (*number*) : Width of one lane (m).
- `hardWidth` (*number*) : Width of the emergency lane (m).
- `mat` (*string|nil*) : Edge fade material.
- **returns**: table Profile created.

#### `editor_roadArchitect_profiles.createProfileForJctRoadHwyCapUrban(numLanes, laneWidth, isSidewalk, sidewalkWidth, sidewalkHeight, isOneWay, mat)`

Creates the profile of the urban part of a highway-urban transition junction (lanes, optional sidewalks, one-way or two-way).

- `numLanes` (*integer*) : Number of lanes.
- `laneWidth` (*number*) : Width of one lane (m).
- `isSidewalk` (*boolean*) : Add sidewalks.
- `sidewalkWidth` (*number*) : Sidewalk width (m).
- `sidewalkHeight` (*number*) : Sidewalk height (m).
- `isOneWay` (*boolean*) : One-way road.
- `mat` (*string|nil*) : Edge fade material.
- **returns**: table Profile created.

#### `editor_roadArchitect_profiles.createProfileForJctRoadHwyExit(laneWidth, hardWidth, mat)`

Creates the profile of the one-way exit roads of a highway junction (two road lanes, at positions 1 and 2).

- `laneWidth` (*number*) : Width of one lane (m).
- `hardWidth` (*number*) : Width of the emergency lane (m).
- `mat` (*string|nil*) : Edge fade material.
- **returns**: table Profile created.

#### `editor_roadArchitect_profiles.createProfileForJctRoadHwyS2(numLanes, laneWidth, cResWidth, hardWidth, mat)`

Creates the profile of section 2 of a highway junction (shoulders shifted by one lane: extreme keys at -numLanes-3 and numLanes+3).

- `numLanes` (*integer*) : Number of lanes.
- `laneWidth` (*number*) : Width of one lane (m).
- `cResWidth` (*number*) : Width of the central reservation (m).
- `hardWidth` (*number*) : Width of the emergency lane (m).
- `mat` (*string|nil*) : Edge fade material.
- **returns**: table Profile created.

#### `editor_roadArchitect_profiles.createProfileForJctRoadHwyS3(numLanes, laneWidth, cResWidth, hardWidth, mat)`

Creates the profile of section 3 of a highway junction.

- `numLanes` (*integer*) : Number of lanes.
- `laneWidth` (*number*) : Width of one lane (m).
- `cResWidth` (*number*) : Width of the central reservation (m).
- `hardWidth` (*number*) : Width of the emergency lane (m).
- `mat` (*string|nil*) : Edge fade material.
- **returns**: table Profile created.

#### `editor_roadArchitect_profiles.createProfileForJctRoadHwyUrbanTrans(numLanes, laneWidth, cResWidth, hardWidth, isOneWay, mat)`

Creates the profile of the transition (flaring) sections of a highway-urban junction, one-way or two-way.

- `numLanes` (*integer*) : Number of lanes.
- `laneWidth` (*number*) : Width of one lane (m).
- `cResWidth` (*number*) : Width of the central reservation (m).
- `hardWidth` (*number*) : Width of the emergency lane (m).
- `isOneWay` (*boolean*) : One-way road.
- `mat` (*string|nil*) : Edge fade material.
- **returns**: table Profile created.

#### `editor_roadArchitect_profiles.createProfileForJctRoadYSpecial(numLeftLanes, numRightLanes, width, sidewalkWidth, sidewalkHeight, isSidewalk, isFlipKerb, mat)`

Creates the profile of the tight connecting road of Y junctions (left and right lanes plus a sidewalk on the right, whose curb side can be reversed).

- `numLeftLanes` (*integer*) : Lanes on the left.
- `numRightLanes` (*integer*) : Lanes on the right.
- `width` (*number*) : Lane width (m).
- `sidewalkWidth` (*number*) : Sidewalk width (m).
- `sidewalkHeight` (*number*) : Sidewalk height (m).
- `isSidewalk` (*boolean*) : Add the sidewalk.
- `isFlipKerb` (*boolean*) : Reverse the curb side of the sidewalk (isLeftSide).
- `mat` (*string|nil*) : Edge fade material.
- **returns**: table Profile created.

#### `editor_roadArchitect_profiles.createProfileForJctRoad_SW(numLeftLanes, numRightLanes, width, sidewalkWidth, sidewalkHeight, isLeftSide, mat)`

Creates the profile of a junction road with a single sidewalk, on the left or right side.

- `numLeftLanes` (*integer*) : Lanes on the left.
- `numRightLanes` (*integer*) : Lanes on the right.
- `width` (*number*) : Lane width (m).
- `sidewalkWidth` (*number*) : Sidewalk width (m).
- `sidewalkHeight` (*number*) : Sidewalk height (m).
- `isLeftSide` (*boolean*) : Sidewalk on the left side if true, otherwise on the right.
- `mat` (*string|nil*) : Edge fade material.
- **returns**: table Profile created.

#### `editor_roadArchitect_profiles.createProfileFromDecalData(numLeftLanes, numRightLanes)`

Creates a simple urban profile (road lanes of 3.5 m, height 0.01) from the metadata of a decal road created with other tools, with automatic paint.

- `numLeftLanes` (*integer*) : Number of lanes on the left.
- `numRightLanes` (*integer*) : Number of lanes on the right.
- **returns**: table Profile created.

#### `editor_roadArchitect_profiles.createProfileFromTemplate(templateName, newName)`

Copies the profile template templateName to a new profile (style parameters, lanes and layers deep-copied).

- `templateName` (*any*) : Name of the template to copy (see getProfileFromName).
- `newName` (*any|nil*) : Name of the new profile (default an ArrayChar 'New Profile').
- **returns**: table New profile.

#### `editor_roadArchitect_profiles.createRoundaboutProfile(numRBLanes, laneWidthRB, mat)`

Creates the profile of the circular roads of a roundabout (numRBLanes lanes of width laneWidthRB).

- `numRBLanes` (*integer*) : Number of lanes of the ring.
- `laneWidthRB` (*number*) : Width of one lane (m).
- `mat` (*string|nil*) : Edge fade material.
- **returns**: table Profile created.

#### `editor_roadArchitect_profiles.createSidewalkOnlyProfile(sidewalkWidth, sidewalkHeight, isFlipKerb)`

Creates a profile made of a single sidewalk lane at position 1.

- `sidewalkWidth` (*number*) : Width (m).
- `sidewalkHeight` (*number*) : Height (m).
- `isFlipKerb` (*boolean|nil*) : Reverses the curb side (false by default).
- **returns**: table Profile created.

#### `editor_roadArchitect_profiles.createTemplateOnRequest(p)`

Adds to M.profiles a copy of profile p named 'New Template' (template creation requested by the user).

- `p` (*table*) : Profile to copy.

#### `editor_roadArchitect_profiles.cycleLaneType(t)`

Moves to the next lane type: road_lane -> sidewalk -> shoulder -> island -> road_lane. Any other type is returned unchanged.

- `t` (*string*) : Current lane type.
- **returns**: string Next type.

#### `editor_roadArchitect_profiles.cycleLaneTypeBack(t)`

Moves to the previous lane type (reverse order of cycleLaneType).

- `t` (*string*) : Current lane type.
- **returns**: string Previous type.

#### `editor_roadArchitect_profiles.deserialiseProfile(pSer)`

Rebuilds a profile from its serialized version (default values for missing fields: name 'New Profile', class 'urban'). Returns nil if the data is nil.

- `pSer` (*table|nil*) : Serialized profile.
- **returns**: table|nil Rebuilt profile.

#### `editor_roadArchitect_profiles.getIdFromName(name)`

Returns the index of the profile in M.profiles whose name field equals name (== comparison), or nil.

- `name` (*any*) : Name searched, compared as is against the profiles' name field.
- **returns**: integer|nil Index in profiles.

#### `editor_roadArchitect_profiles.getLaneFlags()`

Returns the state of the module's lane flags: { isCustom, isSidewalk } (see updateLaneFlags).

- **returns**: table { isCustom = boolean, isSidewalk = boolean }.

#### `editor_roadArchitect_profiles.getMinMaxLaneKeys(profile)`

Returns the smallest and largest existing lane key of a profile (scan from -20 to 20).

- `profile` (*table*) : Road profile.
- **returns**: integer Minimum key (100 if the profile is empty).
- **returns**: integer Maximum key (-100 if the profile is empty).

#### `editor_roadArchitect_profiles.getNumLanesLR(profile)`

Counts the left and right lanes (all types combined).

- `profile` (*table*) : Profile.
- **returns**: integer Lanes on the left.
- **returns**: integer Lanes on the right.

#### `editor_roadArchitect_profiles.getNumRoadLanesLR(profile)`

Counts only the left and right lanes of type 'road_lane' or 'shoulder'.

- `profile` (*table*) : Profile.
- **returns**: integer Road lanes on the left.
- **returns**: integer Road lanes on the right.

#### `editor_roadArchitect_profiles.getOrderedLanes(profile)`

Returns the lane keys sorted from smallest to largest and their total count.

- `profile` (*table*) : Profile.
- **returns**: integer[] Sorted keys.
- **returns**: integer Number of lanes.

#### `editor_roadArchitect_profiles.getProfileFromName(name)`

Returns the profile whose name matches name (see getIdFromName), or nil.

- `name` (*any*) : Profile name.
- **returns**: table|nil Profile found.

#### `editor_roadArchitect_profiles.getWAndHByKey(profile)`

Returns three tables keyed by lane key: widths, left heights and right heights, each as ImGui pointers (im.FloatPtr) ready to be edited.

- `profile` (*table*) : Profile.
- **returns**: table<integer, cdata> Widths.
- **returns**: table<integer, cdata> Left heights (heightL).
- **returns**: table<integer, cdata> Right heights (heightR).

#### `editor_roadArchitect_profiles.getWidth(profile)`

Sum of the widths of all lanes of the profile.

- `profile` (*table*) : Profile.
- **returns**: number Total width in meters.

#### `editor_roadArchitect_profiles.goToProfileView(timer, time)`

Stores the camera pose, switches to free camera and places it at the profile editing pose. Does nothing if already in profile view (the time is then returned unchanged).

- `timer` (*table*) : Timer (object with stopAndReset) reset to zero.
- `time` (*number*) : Current animation time.
- **returns**: number 0.0 if the view has just been activated, otherwise time.

#### `editor_roadArchitect_profiles.isProfileValidForMidJctPerfect(profile)`

Indicates whether the profile is suitable for a perfectly fitted automatic junction (road drawn into the middle of another): as many lanes on the left as on the right, no island, 0 or exactly 2 sidewalks placed at the edges and adjacent to a road lane.

- `profile` (*table*) : Profile tested.
- **returns**: boolean|nil true if valid, false or nil otherwise (nil if asymmetric).

#### `editor_roadArchitect_profiles.layerChangePriority(p, i, dir)`

Swaps layer i with its neighbor: with dir == 'raise' it moves up (index i - 1), otherwise it moves down (index i + 1).

- `p` (*table*) : Profile.
- `i` (*integer*) : Layer index.
- `dir` (*string*) : 'raise' or any other value to move down.

#### `editor_roadArchitect_profiles.removeLane(selectedProfileIdx, selectedLaneIdx, side)`

Removes a lane from the profile at index selectedProfileIdx in M.profiles, shifts the following lanes so as not to leave a gap, then removes the layers that reference nonexistent lanes.

- `selectedProfileIdx` (*integer*) : Index of the profile in profiles.
- `selectedLaneIdx` (*integer*) : Key of the lane to remove.
- `side` (*string*) : 'left' or 'right'.

#### `editor_roadArchitect_profiles.removeLayer(p, i)`

Removes the layer at index i from the profile (table.remove on p.layers).

- `p` (*table*) : Profile.
- `i` (*integer*) : Layer index.

#### `editor_roadArchitect_profiles.save(p)`

Opens a save dialog and writes the serialized profile to a JSON file { profile = ... }; the profile name becomes the file name.

- `p` (*table*) : Profile to save.

#### `editor_roadArchitect_profiles.serialiseProfile(p)`

Converts a profile to a JSON-serializable table (ImGui pointers replaced by their values, name as a string).

- `p` (*table*) : Profile.
- **returns**: table Serialized data.

#### `editor_roadArchitect_profiles.updateCondition(r)`

Regenerates the wear/condition layers of road r from the profile parameters (condition, seed, number of patches and potholes, tire tracks, cracks, asphalt damage or dirt ground depending on the class). Returns without doing anything if the road has fewer than 2 nodes or no renderData, and without regenerating if no 'road_lane' lane exists (after deleting the non-persistent layers).

- `r` (*table*) : Road Architect road.

#### `editor_roadArchitect_profiles.updateLaneFlags(p)`

Updates the module flags (isCustom: a 'mesh' type lane exists, isSidewalk: a 'sidewalk' lane exists), used by the UI to know which static meshes are present.

- `p` (*table*) : Profile examined.

#### `editor_roadArchitect_profiles.updateToNewTemplate(road, templateName)`

Empties the road's profile and replaces it with a copy of the templateName template, keeping its original name.

- `road` (*table*) : Road whose profile is replaced.
- `templateName` (*any*) : Template name (see getProfileFromName).

## Fields

| Field | Type | Description |
|---|---|---|
| `profiles` | table[] | Array of the profiles currently present in the editor (predefined templates, then profiles created or loaded by the user). |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/roadArchitect/profiles.lua`.*
