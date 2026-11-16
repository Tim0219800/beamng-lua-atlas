# `gameplay_rally_compositors_helpers_styleValidator`

*File: `lua/ge/extensions/gameplay/rally/compositors/helpers/styleValidator.lua` · VM: Game Engine (GE) · 539 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_rally_compositors_helpers_styleValidator`: `extensions.load("gameplay_rally_compositors_helpers_styleValidator")`, then the global `gameplay_rally_compositors_helpers_styleValidator`

Checks the internal consistency of a rally note compositor style (file under compositors/styles/). It checks the distance table (callsEnabled, links with increasing thresholds, base/large/point units, rounding, max), the componentTypes components (corner with numbering/intensity/lengths/direction, caution, modifiers, modifierAliases) and the system notes via notebook/systemPacenotes. It enforces no common schema between styles: each style can define its own types. Each error is logged (log 'E', tag styleValidator) and validation stops at the first error.

## Notes

- Intensity/length ranges must be explicit {min, max} tables (not {a, b}), contiguous from 0: each min equals the previous max; max may be missing only on the last range and must be greater than min.
- distance.links must be a non-empty array of {threshold = number, text = string|nil} with strictly increasing thresholds.
- Allowed top-level keys of componentTypes are: corner, caution, modifiers, modifierAliases; any other key is rejected (atomic modifiers go in componentTypes.modifiers).

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_rally_compositors_helpers_styleValidator.validate(style, name)` | Validates a style. Called by textCompositor:load after applying the calibrations; on failure the style is not loaded. | 495 |

### Parameter details

#### `gameplay_rally_compositors_helpers_styleValidator.validate(style, name)`

Validates a style. Called by textCompositor:load after applying the calibrations; on failure the style is not loaded.

- `style` (*table*) : Style table (distance, componentTypes, system...).
- `name` (*string|nil*) : Style name for error messages ('?' by default).
- **returns**: boolean true if the style is valid.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/rally/compositors/helpers/styleValidator.lua`.*
