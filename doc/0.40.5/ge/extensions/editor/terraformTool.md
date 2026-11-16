# `editor_terraformTool`

*File: `lua/ge/extensions/editor/terraformTool.lua` · VM: Game Engine (GE) · 100 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_terraformTool`: `extensions.load("editor_terraformTool")`, then the global `editor_terraformTool`

Facade of the world editor's Terraform tool. It stores five settings (domain of influence, margin, falloff, roughness, noise scale) as editor preferences, manages the polygon drawn by the user and triggers terrain terraforming (editor/terraform/terraform) from sources fetched by editor/terraform/fetchSources (roads, etc.) in a polygon or in the selection. A modder uses it to terraform by script or to read/modify the settings.

## Example

```lua
local t = extensions.editor_terraformTool
t.setDOI(150)
t.setMargin(6)
t.terraformSelection()
```

## Notes

- Default values from the code: DOI 100 m, margin 5.0 m, falloff 1.5 m, roughness 0.4, scale 0.5 (the last two in [0, 1]).
- Slider bounds: DOI 1 to 500 m, margin 0 to 20 m, falloff 1 to 5 m.
- Settings are read with editor.getPreference('terraformTool.general.<name>') and equal the default value if the preference is absent (nil or false).
- The terraforming functions actually modify the terrain; they assume the editor is initialized.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_terraformTool.clearPolygon()` | Clears the current polygon. | 49 |
| `editor_terraformTool.getDOI()` | Returns the terraforming domain of influence (in meters), read from the terraformTool.general.domainOfInfluence preference (default 100). | 29 |
| `editor_terraformTool.getFalloff()` | Returns the decay distance (falloff, in meters), preference terraformTool.general.falloff (default 1.5). | 31 |
| `editor_terraformTool.getMargin()` | Returns the lateral margin (in meters) around the sources, preference terraformTool.general.margin (default 5.0). | 30 |
| `editor_terraformTool.getPolygon()` | Returns the current polygon (delegates to editor/toolUtilities/polygon). | 43 |
| `editor_terraformTool.getRoughness()` | Returns the noise roughness, preference terraformTool.general.roughness (default 0.4, range [0, 1]). | 32 |
| `editor_terraformTool.getScale()` | Returns the noise scale, preference terraformTool.general.scale (default 0.5, range [0, 1]). | 33 |
| `editor_terraformTool.handleTerraformingPolygon()` | To be called every frame of the UI: handles the user's polygon drawing and launches terraformPolygon when they confirm. | 58 |
| `editor_terraformTool.isPolygonExist()` | Tells whether a valid polygon exists (poly.isPolygonValid). | 46 |
| `editor_terraformTool.onEditorRegisterPreferences(prefs)` | Editor hook: registers the terraformTool preference category and its general subcategory (domainOfInfluence as int, margin, falloff, roughness, scale as float) with their bounds. *(internal)* *(hook)* | 67 |
| `editor_terraformTool.setDOI(value)` | Saves the domain of influence in the editor preferences. | 36 |
| `editor_terraformTool.setFalloff(value)` | Saves the decay distance in the editor preferences. | 38 |
| `editor_terraformTool.setMargin(value)` | Saves the lateral margin in the editor preferences. | 37 |
| `editor_terraformTool.setRoughness(value)` | Saves the noise roughness in the editor preferences. | 39 |
| `editor_terraformTool.setScale(value)` | Saves the noise scale in the editor preferences. | 40 |
| `editor_terraformTool.terraformPolygon(polygon)` | Fetches all supported sources in the polygon (fetchSources.getAllSourcesInPolygon) then calls terraformToSources with the current settings (DOI, margin, falloff, roughness, scale). | 52 |
| `editor_terraformTool.terraformSelection()` | Fetches the supported objects of the editor selection (fetchSources.getAllSourcesInSelection) and terraforms the terrain around them with the current settings. | 61 |

### Parameter details

#### `editor_terraformTool.getDOI()`

Returns the terraforming domain of influence (in meters), read from the terraformTool.general.domainOfInfluence preference (default 100).

- **returns**: number Domain of influence in meters.

#### `editor_terraformTool.getFalloff()`

Returns the decay distance (falloff, in meters), preference terraformTool.general.falloff (default 1.5).

- **returns**: number Falloff in meters.

#### `editor_terraformTool.getMargin()`

Returns the lateral margin (in meters) around the sources, preference terraformTool.general.margin (default 5.0).

- **returns**: number Margin in meters.

#### `editor_terraformTool.getPolygon()`

Returns the current polygon (delegates to editor/toolUtilities/polygon).

- **returns**: table Current polygon (structure defined by the polygon module).

#### `editor_terraformTool.getRoughness()`

Returns the noise roughness, preference terraformTool.general.roughness (default 0.4, range [0, 1]).

- **returns**: number Roughness.

#### `editor_terraformTool.getScale()`

Returns the noise scale, preference terraformTool.general.scale (default 0.5, range [0, 1]).

- **returns**: number Noise scale.

#### `editor_terraformTool.isPolygonExist()`

Tells whether a valid polygon exists (poly.isPolygonValid).

- **returns**: boolean true if the polygon is valid.

#### `editor_terraformTool.onEditorRegisterPreferences(prefs)`

Editor hook: registers the terraformTool preference category and its general subcategory (domainOfInfluence as int, margin, falloff, roughness, scale as float) with their bounds.

- `prefs` (*table*) : Editor preferences registry.

#### `editor_terraformTool.setDOI(value)`

Saves the domain of influence in the editor preferences.

- `value` (*number*) : Domain of influence in meters.

#### `editor_terraformTool.setFalloff(value)`

Saves the decay distance in the editor preferences.

- `value` (*number*) : Falloff in meters.

#### `editor_terraformTool.setMargin(value)`

Saves the lateral margin in the editor preferences.

- `value` (*number*) : Margin in meters.

#### `editor_terraformTool.setRoughness(value)`

Saves the noise roughness in the editor preferences.

- `value` (*number*) : Roughness in [0, 1].

#### `editor_terraformTool.setScale(value)`

Saves the noise scale in the editor preferences.

- `value` (*number*) : Scale in [0, 1].

#### `editor_terraformTool.terraformPolygon(polygon)`

Fetches all supported sources in the polygon (fetchSources.getAllSourcesInPolygon) then calls terraformToSources with the current settings (DOI, margin, falloff, roughness, scale).

- `polygon` (*table*) : Polygon in which to search for sources (inferred from code).

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/terraformTool.lua`.*
