# `editor_api_iesImporter`

*File: `lua/ge/extensions/editor/api/iesImporter.lua` · VM: Game Engine (GE) · 1318 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_api_iesImporter`: `extensions.load("editor_api_iesImporter")`, then the global `editor_api_iesImporter`

Converter of IES photometric files (a luminaire's light distribution profile) into a PNG "cookie" texture for the editor's SpotLights. The module parses the IES header and data (vertical/horizontal angles, candela, tilt), samples the intensity, generates a square grayscale image (perspective or linear projection, rotation, recentering, edge softening), saves it as PNG and writes a companion `.cookie.json` file (name, photometry, spot angle, lumens, watts, color temperature). The practical entry point is `generateToFile`.

## Example

```lua
local ok, info = editor_api_iesImporter.generateToFile("/art/lights/mylamp.ies", "/art/lights/mylamp.color.png", {size = 512, autoCenter = true})
if ok then print(info.metadataPath) end
```

## Notes

- Angles are in degrees; theta = vertical angle from the axis, phi = horizontal angle, 0-360.
- generateCookie options: size (1024), projection "perspective"|"linear" (any other value = error), angle (max half-angle, default min(max vertical angle, 90)), rotate (degrees), centerTheta/centerPhi, edgeFeather (0 = sharp edge).
- saveImage options: percentile (100, normalizes by this percentile of the non-zero values), gamma (1), scale (1), invert (false), writeMetadata (false to not write the .cookie.json). Image saved as 8-bit grayscale PNG.
- In the companion JSON, `outerAngle` is the FULL spot angle (2 x half-angle, 0.01 to 180) and `innerAngle` is 90% of outerAngle.
- parseIES raises error() (to be protected with pcall) if no TILT= line is found or if the data is invalid.
- Paths without a leading slash are prefixed with "/" if the file/folder exists that way (normalizePath).
- `getPeakDirection` returns 5 values: theta, phi, max candela, horizontal index, vertical index (1-based).

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_api_iesImporter.buildCookieMetadata(ies, outPath, opts, saveInfo)` | Builds the metadata table (type "IESLightImport" version 1): source, names (cleaned suggestedObjectName), assets, SpotLight parameters (outerAngle, innerAngle, candela, lumens, watts, color temperature), photometry (peak, lumens, W, lm/W efficacy) and conversion parameters. | 1107 |
| `editor_api_iesImporter.generateCookie(ies, opts)` | Generates the cookie image: for each pixel of a size x size image, computes the light direction (perspective or linear projection, rotation, basis centered on centerTheta/centerPhi), samples the IES and applies a circular mask (with edgeFeather softening). | 663 |
| `editor_api_iesImporter.generateToFile(iesPath, outPath, opts)` | Full pipeline: parses the IES, (autoCenter: centers on the peak), generates the cookie, saves the PNG and the .cookie.json. | 1241 |
| `editor_api_iesImporter.getCookieMetadataPath(outPath)` | Gives the companion file path: replaces `.color.png` or `.png` with `.cookie.json`, otherwise appends `.cookie.json`. | 983 |
| `editor_api_iesImporter.getHeaderValue(meta, keys, fallback)` | Returns the first non-empty header value among a list of keys (case-insensitive). | 269 |
| `editor_api_iesImporter.getPeakDirection(ies)` | Finds the direction of maximum intensity in the IES data. | 458 |
| `editor_api_iesImporter.inferCookiePathFromIES(iesPath)` | Infers the default output path: same folder and same name as the IES with the `.color.png` extension. Returns "" if the path is empty or ends with /. | 1308 |
| `editor_api_iesImporter.parseHeaderMetadata(path)` | Reads the header of an IES file (before the TILT= line): version, [KEY] value entries, `map` table key -> value (keys in uppercase, multiple values joined by \n, [MORE] concatenates to the previous key) and `more` list. | 209 |
| `editor_api_iesImporter.parseIES(path)` | Parses a complete IES file: header, tilt, number of lamps, lumens, candela multiplier, photometric type, units, dimensions, angles and candela[ih][iv] array (multiplied by the multiplier and by the tilt factors if TILT=INCLUDE). | 332 |
| `editor_api_iesImporter.prepareHorizontalData(horizontalAngles, candela)` | Sorts the horizontal angles with their candela rows and, if the data covers more than 180° without reaching 360°, adds a 360° row copied from the first one for wrap-around. | 501 |
| `editor_api_iesImporter.printIESInfo(ies)` | Writes an IES summary to the log (number and range of angles, photometric type, watts, candela peak and its direction). | 484 |
| `editor_api_iesImporter.sampleIES(theta, phi, ies, prepared)` | Interpolates the intensity (candela) for a direction (theta, phi) taking horizontal symmetry into account. Returns 0 if theta is outside the vertical range or if the data is empty. | 563 |
| `editor_api_iesImporter.saveImage(img, outPath, opts)` | Normalizes the image (percentile, scale, gamma, optional inversion), writes it as PNG via GBitmap then, unless writeMetadata == false, writes the companion .cookie.json file. | 869 |
| `editor_api_iesImporter.writeCookieMetadata(ies, outPath, opts, saveInfo)` | Builds the metadata and writes it to the .cookie.json (jsonWriteFile). | 1230 |

### Parameter details

#### `editor_api_iesImporter.buildCookieMetadata(ies, outPath, opts, saveInfo)`

Builds the metadata table (type "IESLightImport" version 1): source, names (cleaned suggestedObjectName), assets, SpotLight parameters (outerAngle, innerAngle, candela, lumens, watts, color temperature), photometry (peak, lumens, W, lm/W efficacy) and conversion parameters.

- `ies` (*table*) : result of parseIES
- `outPath` (*string*) : path of the PNG
- `opts` (*table|nil*) : generation/save options
- `saveInfo` (*table|nil*) : saveInfo from saveImage
- **returns**: table metadata

#### `editor_api_iesImporter.generateCookie(ies, opts)`

Generates the cookie image: for each pixel of a size x size image, computes the light direction (perspective or linear projection, rotation, basis centered on centerTheta/centerPhi), samples the IES and applies a circular mask (with edgeFeather softening).

- `ies` (*table*) : result of parseIES
- `opts` (*table|nil*) : {size, projection, rotate, centerTheta, centerPhi, angle, edgeFeather}
- **returns**: table {width, height, data (raw values, index y*size+x+1), _ies, generation = {size, angle, projection, rotate, centerTheta, centerPhi, edgeFeather}}

#### `editor_api_iesImporter.generateToFile(iesPath, outPath, opts)`

Full pipeline: parses the IES, (autoCenter: centers on the peak), generates the cookie, saves the PNG and the .cookie.json.

- `iesPath` (*string*) : source .ies file
- `outPath` (*string*) : output PNG
- `opts` (*table|nil*) : {size, angle, projection, rotate, centerTheta, centerPhi, autoCenter, edgeFeather, percentile, gamma, scale, invert, writeMetadata, noInfo}
- **returns**: boolean true if the image is saved
- **returns**: table {imagePath, metadataPath, metadataWritten, saveInfo}

#### `editor_api_iesImporter.getCookieMetadataPath(outPath)`

Gives the companion file path: replaces `.color.png` or `.png` with `.cookie.json`, otherwise appends `.cookie.json`.

- `outPath` (*string*) : path of the PNG
- **returns**: string path of the .cookie.json

#### `editor_api_iesImporter.getHeaderValue(meta, keys, fallback)`

Returns the first non-empty header value among a list of keys (case-insensitive).

- `meta` (*table*) : result of parseHeaderMetadata
- `keys` (*string[]*) : keys to try in order (e.g. {"MANUFAC"})
- `fallback` (*string|nil*) : default value ("" otherwise)
- **returns**: string value found or fallback

#### `editor_api_iesImporter.getPeakDirection(ies)`

Finds the direction of maximum intensity in the IES data.

- `ies` (*table*) : result of parseIES
- **returns**: number peak theta (degrees)
- **returns**: number peak phi (degrees)
- **returns**: number candela at the peak
- **returns**: integer horizontal index
- **returns**: integer vertical index

#### `editor_api_iesImporter.inferCookiePathFromIES(iesPath)`

Infers the default output path: same folder and same name as the IES with the `.color.png` extension. Returns "" if the path is empty or ends with /.

- `iesPath` (*string*) : path of the .ies
- **returns**: string path of the PNG

#### `editor_api_iesImporter.parseHeaderMetadata(path)`

Reads the header of an IES file (before the TILT= line): version, [KEY] value entries, `map` table key -> value (keys in uppercase, multiple values joined by \n, [MORE] concatenates to the previous key) and `more` list.

- `path` (*string*) : path of the .ies file
- **returns**: table {version, entries = {{key, value}}, map, more}

#### `editor_api_iesImporter.parseIES(path)`

Parses a complete IES file: header, tilt, number of lamps, lumens, candela multiplier, photometric type, units, dimensions, angles and candela[ih][iv] array (multiplied by the multiplier and by the tilt factors if TILT=INCLUDE).

- `path` (*string*) : path of the .ies
- **returns**: table {path, metadata, tilt, verticalAngles, horizontalAngles, candela, numLamps, lumensPerLamp, candelaMultiplier, photometricType, unitsType, width, length, height, ballastFactor, futureUse, inputWatts}

#### `editor_api_iesImporter.prepareHorizontalData(horizontalAngles, candela)`

Sorts the horizontal angles with their candela rows and, if the data covers more than 180° without reaching 360°, adds a 360° row copied from the first one for wrap-around.

- `horizontalAngles` (*number[]*) : horizontal angles
- `candela` (*table*) : candela[ih][iv]
- **returns**: table {h = sorted angles, c = candela rows}

#### `editor_api_iesImporter.printIESInfo(ies)`

Writes an IES summary to the log (number and range of angles, photometric type, watts, candela peak and its direction).

- `ies` (*table*) : result of parseIES

#### `editor_api_iesImporter.sampleIES(theta, phi, ies, prepared)`

Interpolates the intensity (candela) for a direction (theta, phi) taking horizontal symmetry into account. Returns 0 if theta is outside the vertical range or if the data is empty.

- `theta` (*number*) : vertical angle in degrees
- `phi` (*number*) : horizontal angle in degrees
- `ies` (*table*) : result of parseIES
- `prepared` (*table|nil*) : result of prepareHorizontalData (computed if absent; provide it to speed up)
- **returns**: number interpolated intensity

#### `editor_api_iesImporter.saveImage(img, outPath, opts)`

Normalizes the image (percentile, scale, gamma, optional inversion), writes it as PNG via GBitmap then, unless writeMetadata == false, writes the companion .cookie.json file.

- `img` (*table*) : result of generateCookie
- `outPath` (*string*) : path of the PNG
- `opts` (*table|nil*) : {percentile, gamma, scale, invert, writeMetadata}
- **returns**: boolean true if the PNG was written
- **returns**: table saveInfo: path, width, height, format, percentile, gamma, scale, invert, maxValue, nonzeroPixels, normalizationValue, metadataWritten, metadataPath

#### `editor_api_iesImporter.writeCookieMetadata(ies, outPath, opts, saveInfo)`

Builds the metadata and writes it to the .cookie.json (jsonWriteFile).

- `ies` (*table*) : result of parseIES
- `outPath` (*string*) : path of the PNG
- `opts` (*table|nil*) : options
- `saveInfo` (*table|nil*) : saveInfo
- **returns**: boolean always true
- **returns**: string path of the .cookie.json
- **returns**: table metadata written

## Calls into the engine (C++)

- `FS:` `directoryExists`, `fileExists`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/api/iesImporter.lua`.*
