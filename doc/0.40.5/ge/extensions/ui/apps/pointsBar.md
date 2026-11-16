# `ui_apps_pointsBar`

*File: `lua/ge/extensions/ui/apps/pointsBar.lua` · VM: Game Engine (GE) · 101 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_apps_pointsBar`: `extensions.load("ui_apps_pointsBar")`, then the global `ui_apps_pointsBar`

Feeds the pointsBar interface app (points bar with thresholds). It keeps the point count and the thresholds (100, 200, 300 by default) and publishes in the 'pointsBar' stream the fill percentage, the label, the thresholds reached and the position of the thresholds as a percentage.

## Example

```lua
ui_apps_pointsBar.setThresholds({500, 1000, 2000})
ui_apps_pointsBar.setPoints(750, '750 pts')
```

## Notes

- The bar is sized on the last threshold + 10%: fillPercent = points / (lastThreshold * 1.1), as a fraction (0 to ~0.91), whereas thresholdPercentages is expressed as a percentage (0 to 100).
- setPoints does not check that the thresholds exist: an empty threshold list causes an error (nil index).
- In clearData, setPoints(0) has no label: the internal pointsLabel becomes nil (the stream then uses '0').
- The extension stays loaded permanently (manual unload).

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_apps_pointsBar.clearData()` | Resets the default thresholds {100, 200, 300} and the points to 0. | 55 |
| `ui_apps_pointsBar.onInit()` | Initialization hook: sets the extension to manual unload. *(internal)* *(hook)* | 6 |
| `ui_apps_pointsBar.requestAllData()` | Republishes thresholds and current points (useful when the app mounts). | 60 |
| `ui_apps_pointsBar.setPoints(points, pointsLabel)` | Updates the current points and the label, recomputes fill and thresholds reached, then publishes in the 'pointsBar' stream. | 26 |
| `ui_apps_pointsBar.setThresholds(thresholds)` | Sets the threshold list (if provided), recomputes their position as a percentage and publishes in the stream. | 41 |

### Parameter details

#### `ui_apps_pointsBar.setPoints(points, pointsLabel)`

Updates the current points and the label, recomputes fill and thresholds reached, then publishes in the 'pointsBar' stream.

- `points` (*number*) : Current points.
- `pointsLabel` (*string|nil*) : Displayed text; defaults to tostring(points).

#### `ui_apps_pointsBar.setThresholds(thresholds)`

Sets the threshold list (if provided), recomputes their position as a percentage and publishes in the stream.

- `thresholds` (*table<integer, number>|nil*) : Increasing thresholds; the last one sets the scale.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/apps/pointsBar.lua`.*
