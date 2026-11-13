# `editor_roadArchitect_profiles`

*Fichier : `lua/ge/extensions/editor/roadArchitect/profiles.lua` · VM : Game Engine (GE) · 3505 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_roadArchitect_profiles` : `extensions.load("editor_roadArchitect_profiles")`, puis la globale `editor_roadArchitect_profiles`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_roadArchitect_profiles.addCenterline(p, isPaint)` | Adds the road centerline to the given road, which is based on the stored styling parameters. | 134 |
| `editor_roadArchitect_profiles.addEdgeLines(p, latOffL, latOffR, isLeft, isRight, isPaint)` | Adds the road edge lines to the given road, which are based on the stored styling parameters. | 172 |
| `editor_roadArchitect_profiles.addEndLine(p, isStart, isEnd)` | Adds the lane end/stop lines to the given road, which is based on the stored styling parameters. | 297 |
| `editor_roadArchitect_profiles.addLane(selectedProfileIdx, selectedLaneIdx, side, rel)` | Adds a lane to the selected profile, at the chosen position. | 2903 |
| `editor_roadArchitect_profiles.addLaneDivisionLines(p, isPaint)` | Adds the lane division lines to the given road, which are based on the stored styling parameters. | 252 |
| `editor_roadArchitect_profiles.addLayer(p, i, dir)` | Adds a new layer above/below the given layer index, in the given profile. | 989 |
| `editor_roadArchitect_profiles.addLightTreadToLanes(p, fadeS, fadeE, lMin, lMax)` | Adds light tread to every road lane in the profile, across the full length of the road. | 455 |
| `editor_roadArchitect_profiles.applyMasterWidth(profile, mWidth)` | Sets all road lanes to the given master width.<br> [This over-writes the data in the lateral road profile]. | 2938 |
| `editor_roadArchitect_profiles.areSidewalksPresent(p)` | Determines if the given profile contains sidewalks, or not. | 1153 |
| `editor_roadArchitect_profiles.autoEdgeBlending(prof, isLeft, isRight, mat)` | Automatically adds edge blending layers to the given profile (used for junctions). | 383 |
| `editor_roadArchitect_profiles.autoPaintLines(prof)` | Automatically adds paint line marking layers to the given profile (used for junctions). | 374 |
| `editor_roadArchitect_profiles.computeLaneKeys(profile)` | Computes an array of valid lane keys for a road, ordered from smallest to largest. | 1050 |
| `editor_roadArchitect_profiles.computeSectionsByType(profile, laneType1, laneType2)` | Compute the road sections from a given road.<br> [This is an array of contiguous sections of road lanes, with start and end lane indices]. | 100 |
| `editor_roadArchitect_profiles.copyProfile(template)` | Deep copies a profile. | 2768 |
| `editor_roadArchitect_profiles.createBridgeProfile(width, depth)` | Creates a profile to be used for simple bridges. | 1510 |
| `editor_roadArchitect_profiles.createCustomImportProfile(lanes)` | Creates a custom profile for use when importing from OpenDRIVE. | 1217 |
| `editor_roadArchitect_profiles.createOverlayProfile(width)` | Creates a profile to be used for overlay roads. | 1444 |
| `editor_roadArchitect_profiles.createProfileForJctRoad(numLeftLanes, numRightLanes, width, sidewalkWidth, sidewalkHeight, isSidewalk, mat)` | Creates a profile from number of lanes and sidewalk data. For symmetric, two-way roads. | 1581 |
| `editor_roadArchitect_profiles.createProfileForJctRoad1Way(numLanes, width, sidewalkWidth, sidewalkHeight, isSidewalk, mat)` | Creates a profile from number of lanes and sidewalk data. For one-way roads. | 1752 |
| `editor_roadArchitect_profiles.createProfileForJctRoadHwyCap(numLanes, laneWidth, cResWidth, hardWidth, mat)` | Creates a highway junction profile (start and end cap sections). | 2060 |
| `editor_roadArchitect_profiles.createProfileForJctRoadHwyCap1W(numLanes, laneWidth, hardWidth, mat)` | Creates a one-way highway junction profile.<br> [Does not have a central reservation lane]. | 2390 |
| `editor_roadArchitect_profiles.createProfileForJctRoadHwyCapUrban(numLanes, laneWidth, isSidewalk, sidewalkWidth, sidewalkHeight, isOneWay, mat)` | Creates a highway-urban transition junction profile (urban section). | 2161 |
| `editor_roadArchitect_profiles.createProfileForJctRoadHwyExit(laneWidth, hardWidth, mat)` | Creates a highway junction profile (for the one-way exit roads). | 2693 |
| `editor_roadArchitect_profiles.createProfileForJctRoadHwyS2(numLanes, laneWidth, cResWidth, hardWidth, mat)` | Creates a highway junction profile (section 2). | 2467 |
| `editor_roadArchitect_profiles.createProfileForJctRoadHwyS3(numLanes, laneWidth, cResWidth, hardWidth, mat)` | Creates a highway junction profile (section 3). | 2568 |
| `editor_roadArchitect_profiles.createProfileForJctRoadHwyUrbanTrans(numLanes, laneWidth, cResWidth, hardWidth, isOneWay, mat)` | Creates a highway-urban transition junction profile (transition/taper sections). | 2273 |
| `editor_roadArchitect_profiles.createProfileForJctRoadYSpecial(numLeftLanes, numRightLanes, width, sidewalkWidth, sidewalkHeight, isSidewalk, isFlipKerb, mat)` | Creates a profile for the tight join road used in Y-junctions. | 1669 |
| `editor_roadArchitect_profiles.createProfileForJctRoad_SW(numLeftLanes, numRightLanes, width, sidewalkWidth, sidewalkHeight, isLeftSide, mat)` | Creates a profile from number of lanes. Contains a left-sided sidewalk lane. | 1833 |
| `editor_roadArchitect_profiles.createProfileFromDecalData(numLeftLanes, numRightLanes)` | Creates a profile from decal road metadata (eg from decal roads in the scene tree, made with other tools). | 1369 |
| `editor_roadArchitect_profiles.createProfileFromTemplate(templateName, newName)` | Copies a profile template to a new profile. | 1297 |
| `editor_roadArchitect_profiles.createRoundaboutProfile(numRBLanes, laneWidthRB, mat)` | Create a profile for roundabout circular roads. | 1992 |
| `editor_roadArchitect_profiles.createSidewalkOnlyProfile(sidewalkWidth, sidewalkHeight, isFlipKerb)` | Creates a profile with only one sidewalk lane in position 1. | 1922 |
| `editor_roadArchitect_profiles.createTemplateOnRequest(p)` | Creates a new template upon user request. | 3396 |
| `editor_roadArchitect_profiles.cycleLaneType(t)` | Cycles forward through the supported lane types. | 1032 |
| `editor_roadArchitect_profiles.cycleLaneTypeBack(t)` | Cycles back through the supported lane types. | 1041 |
| `editor_roadArchitect_profiles.deserialiseProfile(pSer)` | De-serialises a profile. | 3247 |
| `editor_roadArchitect_profiles.getIdFromName(name)` | Gets the current profile index from a given profile name. | 834 |
| `editor_roadArchitect_profiles.getLaneFlags()` | Returns the current state of the lane flags. | 1210 |
| `editor_roadArchitect_profiles.getMinMaxLaneKeys(profile)` | Gets the minimum and maximum lane key values, from a given collection of lanes. | 88 |
| `editor_roadArchitect_profiles.getNumLanesLR(profile)` | Computes the number of left and right lanes (all types of lane). | 1081 |
| `editor_roadArchitect_profiles.getNumRoadLanesLR(profile)` | Computes the number of left and right (road lanes only). | 1097 |
| `editor_roadArchitect_profiles.getOrderedLanes(profile)` | Computes an ordered array of lane indices, from smallest to largest.<br> [Also returns the total number of lanes]. | 1069 |
| `editor_roadArchitect_profiles.getProfileFromName(name)` | Gets the profile with the given name. | 842 |
| `editor_roadArchitect_profiles.getWAndHByKey(profile)` | Computes tables of profile widths and heights (left and right), by lane key.<br> [Data is returned in imgui float ptr format]. | 1164 |
| `editor_roadArchitect_profiles.getWidth(profile)` | Computes the width of the given profile. | 1176 |
| `editor_roadArchitect_profiles.goToOldView()` | Returns the camera to the stored old view. | 2852 |
| `editor_roadArchitect_profiles.goToProfileView(timer, time)` | Moves the camera to the profile edit pose.<br> [Also adjusts the timing parameters respectively]. | 2840 |
| `editor_roadArchitect_profiles.isProfileValidForMidJctPerfect(profile)` | Determines if the given profile is valid for creating an percectly-matched auto junction (when dragging road start/end to middle of other road). | 1113 |
| `editor_roadArchitect_profiles.layerChangePriority(p, i, dir)` | Raise/lower the priority of the given layer, in the given profile. | 945 |
| `editor_roadArchitect_profiles.load()` | Loads a profile from disk. | 3373 |
| `editor_roadArchitect_profiles.populateProfileTemplates()` | Gets the collection of default lateral road profile templates. | 3413 |
| `editor_roadArchitect_profiles.removeAllTempCurrentProfiles()` | Removes all the temporary 'Current Profile' profiles from the profiles table. | 3387 |
| `editor_roadArchitect_profiles.removeLane(selectedProfileIdx, selectedLaneIdx, side)` | Removes the selected lane from the selected profile. | 2878 |
| `editor_roadArchitect_profiles.removeLayer(p, i)` | Removes the layer with the given index. | 131 |
| `editor_roadArchitect_profiles.resetTemplates()` | Reset all profile templates. | 3424 |
| `editor_roadArchitect_profiles.save(p)` | Saves the given profile to disk. | 3358 |
| `editor_roadArchitect_profiles.serialiseProfile(p)` | Serialises a profile. | 3142 |
| `editor_roadArchitect_profiles.updateCondition(r)` | Updates the road condition details for the given road, based on the stored parameters. | 2948 |
| `editor_roadArchitect_profiles.updateLaneFlags(p)` | Updates the module lane flags (used for UI - when displaying which static meshes are present). | 845 |
| `editor_roadArchitect_profiles.updateToNewTemplate(road, templateName)` | Copies a profile template to an existing profile. | 859 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `profiles` | table | Public interface. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/roadArchitect/profiles.lua`.*
