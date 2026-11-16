# `telemetry_hardwareInput`

*File: `lua/ge/extensions/telemetry/hardwareInput.lua` · VM: Game Engine (GE) · 92 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `telemetry_hardwareInput`: `extensions.load("telemetry_hardwareInput")`, then the global `telemetry_hardwareInput`

Hardware telemetry utility module (loaded by require): turns the game controllers' information into telemetry data. For all devices: type, productName, vidpid, forceFeedback. For wheels (type 'wheel') it adds the official English name, GUID, force feedback axes, FFB sampling periods, hardware/firmware revisions, controls and their count by type.

## Notes

- A wheel's English name only comes from an official table /settings/inputmaps/<lowercase vidpid>.json (isOfficialContentVPath): a mod table cannot provide the name.
- A vidpid of 8 hexadecimal digits is uppercased (the first two groups of 4 give productId then vendorId); a symbolic identifier (e.g. 'XIDevice') keeps its case.
- maxRawFfbUpdateRateHz = 1000000 / ff_sample_period; if the period is not a positive number, ffbSamplePeriodMicroseconds and the rate stay absent.

## Functions

| Function | Description | Line |
|---|---|---|
| `telemetry_hardwareInput.collect(controllerInfo)` | Applies fromControllerInfo to each controller (looking up the official English name of wheels). | 77 |
| `telemetry_hardwareInput.fromControllerInfo(info, englishName)` | Converts a controller's info into a telemetry table. Non-wheels only keep type, productName, vidpid and forceFeedback; wheels additionally receive reportedName, deviceName, guid, hidSupported, ffbAxes, FFB periods, revisions, controls, controlCounts, productId, vendorId and maxRawFfbUpdateRateHz. | 38 |
| `telemetry_hardwareInput.officialEnglishName(pidVid)` | Reads /settings/inputmaps/<pidVid>.json and returns displayName or name, only if this file belongs to the game's official content. | 12 |

### Parameter details

#### `telemetry_hardwareInput.collect(controllerInfo)`

Applies fromControllerInfo to each controller (looking up the official English name of wheels).

- `controllerInfo` (*table[]|nil*) : List of controllers.
- **returns**: table[] List of telemetry tables.

#### `telemetry_hardwareInput.fromControllerInfo(info, englishName)`

Converts a controller's info into a telemetry table. Non-wheels only keep type, productName, vidpid and forceFeedback; wheels additionally receive reportedName, deviceName, guid, hidSupported, ffbAxes, FFB periods, revisions, controls, controlCounts, productId, vendorId and maxRawFfbUpdateRateHz.

- `info` (*table*) : Controller info (type, name, productName, vidpid, guid, ffbAxes, ff_sample_period, controls...).
- `englishName` (*string|nil*) : Official English name of the wheel, if known.
- **returns**: table Controller telemetry data.

#### `telemetry_hardwareInput.officialEnglishName(pidVid)`

Reads /settings/inputmaps/<pidVid>.json and returns displayName or name, only if this file belongs to the game's official content.

- `pidVid` (*string|nil*) : Identifier of 8 hexadecimal digits.
- **returns**: string|nil Official English name, or nil.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/telemetry/hardwareInput.lua`.*
