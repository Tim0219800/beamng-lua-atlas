---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/api/iesImporter.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Converter of IES photometric files (a luminaire's light distribution profile) into a PNG "cookie" texture for the editor's SpotLights. The module parses the IES header and data (vertical/horizontal angles, candela, tilt), samples the intensity, generates a square grayscale image (perspective or linear projection, rotation, recentering, edge softening), saves it as PNG and writes a companion `.cookie.json` file (name, photometry, spot angle, lumens, watts, color temperature). The practical entry point is `generateToFile`.
--- Access: extension `editor_api_iesImporter`: `extensions.load("editor_api_iesImporter")`, then the global `editor_api_iesImporter`
---@class editor_api_iesImporter
editor_api_iesImporter = {}

--- Builds the metadata table (type "IESLightImport" version 1): source, names (cleaned suggestedObjectName), assets, SpotLight parameters (outerAngle, innerAngle, candela, lumens, watts, color temperature), photometry (peak, lumens, W, lm/W efficacy) and conversion parameters.
---Source: lua/ge/extensions/editor/api/iesImporter.lua:1107
---@param ies table result of parseIES
---@param outPath string path of the PNG
---@param opts table|nil generation/save options
---@param saveInfo table|nil saveInfo from saveImage
---@return table  metadata
function editor_api_iesImporter.buildCookieMetadata(ies, outPath, opts, saveInfo) end

--- Generates the cookie image: for each pixel of a size x size image, computes the light direction (perspective or linear projection, rotation, basis centered on centerTheta/centerPhi), samples the IES and applies a circular mask (with edgeFeather softening).
---Source: lua/ge/extensions/editor/api/iesImporter.lua:663
---@param ies table result of parseIES
---@param opts table|nil {size, projection, rotate, centerTheta, centerPhi, angle, edgeFeather}
---@return table  {width, height, data (raw values, index y*size+x+1), _ies, generation = {size, angle, projection, rotate, centerTheta, centerPhi, edgeFeather}}
function editor_api_iesImporter.generateCookie(ies, opts) end

--- Full pipeline: parses the IES, (autoCenter: centers on the peak), generates the cookie, saves the PNG and the .cookie.json.
---Source: lua/ge/extensions/editor/api/iesImporter.lua:1241
---@param iesPath string source .ies file
---@param outPath string output PNG
---@param opts table|nil {size, angle, projection, rotate, centerTheta, centerPhi, autoCenter, edgeFeather, percentile, gamma, scale, invert, writeMetadata, noInfo}
---@return boolean  true if the image is saved
---@return table  {imagePath, metadataPath, metadataWritten, saveInfo}
function editor_api_iesImporter.generateToFile(iesPath, outPath, opts) end

--- Gives the companion file path: replaces `.color.png` or `.png` with `.cookie.json`, otherwise appends `.cookie.json`.
---Source: lua/ge/extensions/editor/api/iesImporter.lua:983
---@param outPath string path of the PNG
---@return string  path of the .cookie.json
function editor_api_iesImporter.getCookieMetadataPath(outPath) end

--- Returns the first non-empty header value among a list of keys (case-insensitive).
---Source: lua/ge/extensions/editor/api/iesImporter.lua:269
---@param meta table result of parseHeaderMetadata
---@param keys string[] keys to try in order (e.g. {"MANUFAC"})
---@param fallback string|nil default value ("" otherwise)
---@return string  value found or fallback
function editor_api_iesImporter.getHeaderValue(meta, keys, fallback) end

--- Finds the direction of maximum intensity in the IES data.
---Source: lua/ge/extensions/editor/api/iesImporter.lua:458
---@param ies table result of parseIES
---@return number  peak theta (degrees)
---@return number  peak phi (degrees)
---@return number  candela at the peak
---@return integer  horizontal index
---@return integer  vertical index
function editor_api_iesImporter.getPeakDirection(ies) end

--- Infers the default output path: same folder and same name as the IES with the `.color.png` extension. Returns "" if the path is empty or ends with /.
---Source: lua/ge/extensions/editor/api/iesImporter.lua:1308
---@param iesPath string path of the .ies
---@return string  path of the PNG
function editor_api_iesImporter.inferCookiePathFromIES(iesPath) end

--- Reads the header of an IES file (before the TILT= line): version, [KEY] value entries, `map` table key -> value (keys in uppercase, multiple values joined by \n, [MORE] concatenates to the previous key) and `more` list.
---Source: lua/ge/extensions/editor/api/iesImporter.lua:209
---@param path string path of the .ies file
---@return table  {version, entries = {{key, value}}, map, more}
function editor_api_iesImporter.parseHeaderMetadata(path) end

--- Parses a complete IES file: header, tilt, number of lamps, lumens, candela multiplier, photometric type, units, dimensions, angles and candela[ih][iv] array (multiplied by the multiplier and by the tilt factors if TILT=INCLUDE).
---Source: lua/ge/extensions/editor/api/iesImporter.lua:332
---@param path string path of the .ies
---@return table  {path, metadata, tilt, verticalAngles, horizontalAngles, candela, numLamps, lumensPerLamp, candelaMultiplier, photometricType, unitsType, width, length, height, ballastFactor, futureUse, inputWatts}
function editor_api_iesImporter.parseIES(path) end

--- Sorts the horizontal angles with their candela rows and, if the data covers more than 180° without reaching 360°, adds a 360° row copied from the first one for wrap-around.
---Source: lua/ge/extensions/editor/api/iesImporter.lua:501
---@param horizontalAngles number[] horizontal angles
---@param candela table candela[ih][iv]
---@return table  {h = sorted angles, c = candela rows}
function editor_api_iesImporter.prepareHorizontalData(horizontalAngles, candela) end

--- Writes an IES summary to the log (number and range of angles, photometric type, watts, candela peak and its direction).
---Source: lua/ge/extensions/editor/api/iesImporter.lua:484
---@param ies table result of parseIES
function editor_api_iesImporter.printIESInfo(ies) end

--- Interpolates the intensity (candela) for a direction (theta, phi) taking horizontal symmetry into account. Returns 0 if theta is outside the vertical range or if the data is empty.
---Source: lua/ge/extensions/editor/api/iesImporter.lua:563
---@param theta number vertical angle in degrees
---@param phi number horizontal angle in degrees
---@param ies table result of parseIES
---@param prepared table|nil result of prepareHorizontalData (computed if absent; provide it to speed up)
---@return number  interpolated intensity
function editor_api_iesImporter.sampleIES(theta, phi, ies, prepared) end

--- Normalizes the image (percentile, scale, gamma, optional inversion), writes it as PNG via GBitmap then, unless writeMetadata == false, writes the companion .cookie.json file.
---Source: lua/ge/extensions/editor/api/iesImporter.lua:869
---@param img table result of generateCookie
---@param outPath string path of the PNG
---@param opts table|nil {percentile, gamma, scale, invert, writeMetadata}
---@return boolean  true if the PNG was written
---@return table  saveInfo: path, width, height, format, percentile, gamma, scale, invert, maxValue, nonzeroPixels, normalizationValue, metadataWritten, metadataPath
function editor_api_iesImporter.saveImage(img, outPath, opts) end

--- Builds the metadata and writes it to the .cookie.json (jsonWriteFile).
---Source: lua/ge/extensions/editor/api/iesImporter.lua:1230
---@param ies table result of parseIES
---@param outPath string path of the PNG
---@param opts table|nil options
---@param saveInfo table|nil saveInfo
---@return boolean  always true
---@return string  path of the .cookie.json
---@return table  metadata written
function editor_api_iesImporter.writeCookieMetadata(ies, outPath, opts, saveInfo) end

