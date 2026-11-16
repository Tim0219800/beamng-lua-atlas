# `telemetry_hardwareAudio.test`

*File: `lua/ge/extensions/telemetry/hardwareAudio.test.lua` · VM: Game Engine (GE) · 55 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `telemetry_hardwareAudio.test`: `extensions.load("telemetry_hardwareAudio.test")`, then the global `telemetry_hardwareAudio.test`

Unit tests of telemetry/hardwareAudio (runTestFiles("hardwareAudio")).

## Functions

| Function | Description | Line |
|---|---|---|
| `telemetry_hardwareAudio.test.testClassifiesKnownOutputTypes(ctx)` | Checks the classification of headphones, display/TV, speakers and virtual device from typical names. *(internal)* | 25 |
| `telemetry_hardwareAudio.test.testMissingDeviceIsNotReported(ctx)` | Checks that fromDeviceInfo(nil) returns nil. *(internal)* | 50 |
| `telemetry_hardwareAudio.test.testRawDeviceNameIsRemoved(ctx)` | Checks that the raw name and the diagnostic fields do not enter the telemetry, while sampleRateHz, speakerMode and channels are kept. *(internal)* | 36 |
| `telemetry_hardwareAudio.test.testUnknownNamesStayUnknown(ctx)` | Checks that a name without a keyword (e.g. 'WH-1000XM5') gives the category 'unknown'. *(internal)* | 32 |

### Parameter details

#### `telemetry_hardwareAudio.test.testClassifiesKnownOutputTypes(ctx)`

Checks the classification of headphones, display/TV, speakers and virtual device from typical names.

- `ctx` (*table*) : Test framework context.

#### `telemetry_hardwareAudio.test.testMissingDeviceIsNotReported(ctx)`

Checks that fromDeviceInfo(nil) returns nil.

- `ctx` (*table*) : Test framework context.

#### `telemetry_hardwareAudio.test.testRawDeviceNameIsRemoved(ctx)`

Checks that the raw name and the diagnostic fields do not enter the telemetry, while sampleRateHz, speakerMode and channels are kept.

- `ctx` (*table*) : Test framework context.

#### `telemetry_hardwareAudio.test.testUnknownNamesStayUnknown(ctx)`

Checks that a name without a keyword (e.g. 'WH-1000XM5') gives the category 'unknown'.

- `ctx` (*table*) : Test framework context.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/telemetry/hardwareAudio.test.lua`.*
