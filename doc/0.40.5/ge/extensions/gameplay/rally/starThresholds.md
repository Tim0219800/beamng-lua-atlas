# `gameplay_rally_starThresholds`

*File: `lua/ge/extensions/gameplay/rally/starThresholds.lua` · VM: Game Engine (GE) · 51 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_rally_starThresholds`: `extensions.load("gameplay_rally_starThresholds")`, then the global `gameplay_rally_starThresholds`

Computes the star time thresholds (gold, silver, bronze) of a rally special stage from a hand-made reference time (baseline) and the stage length. Gold = baseline x 1.03 (tight pace, no margin for resets). Silver and bronze = baseline x pace multiplier + an additive margin that forgives a certain number of resets per km.

## Example

```lua
local t = gameplay_rally_starThresholds.compute(600, 12.5)
-- t.gold, t.silver, t.bronze in seconds (rounded to the tenth)
```

## Notes

- Formulas: gold = base*goldMult; silver = base*silverPaceMult + silverResetsPerKm*lengthKm*perResetSeconds; bronze = base*bronzePaceMult + bronzeResetsPerKm*lengthKm*perResetSeconds.
- If the length is absent or zero, the reset margin is 0 (pace thresholds only).

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_rally_starThresholds.compute(baselineSeconds, lengthKm)` | Computes the gold/silver/bronze thresholds in seconds, rounded to the tenth. | 39 |

### Parameter details

#### `gameplay_rally_starThresholds.compute(baselineSeconds, lengthKm)`

Computes the gold/silver/bronze thresholds in seconds, rounded to the tenth.

- `baselineSeconds` (*number|string*) : Stage reference time in seconds (converted by tonumber, 0 if invalid)
- `lengthKm` (*number|string*) : Stage length in km (0 if invalid)
- **returns**: table {gold=number, silver=number, bronze=number} in seconds

## Fields

| Field | Type | Description |
|---|---|---|
| `bronzePaceMult` | number | Bronze pace multiplier (1.23). |
| `bronzeResetsPerKm` | number | Resets per km forgiven for bronze (2.233, i.e. ~5 resets on the shortest special stages). |
| `goldMult` | number | Gold pace multiplier (1.03), deliberately tight. |
| `perResetSeconds` | number | Seconds added per reset in the margin: timer penalty (~5 s) plus loss of momentum (~3.5 s), i.e. 8.5. |
| `silverPaceMult` | number | Silver pace multiplier (1.13). |
| `silverResetsPerKm` | number | Resets per km forgiven for silver (0.9, i.e. ~2 resets on the shortest special stages of about 2.2 km). |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/rally/starThresholds.lua`.*
