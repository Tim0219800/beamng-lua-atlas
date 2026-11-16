# `career_modules_reputation`

*File: `lua/ge/extensions/career/modules/reputation.lua` · VM: Game Engine (GE) · 160 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `career_modules_reputation`: `extensions.load("career_modules_reputation")`, then the global `career_modules_reputation`

Computation of the player's reputation with career organizations. Value between -50 and 700, converted to a level (-1 to 3 by default: questionable, neutral, reliable, preferred, partner) with, per level, the share withheld on loaned vehicles (loanerCut) and the delivery bonus (deliveryBonus). The raw value is the <orgId>Reputation attribute of playerAttributes.

## Notes

- Default thresholds (requiredValue): -50, -25, 40, 175, 400. Organizations can override via organization.reputationLevels.
- Events: returnLoanerDamaged = -20, discardDeliveryVehicle = -10.
- addReputationToOrg modifies the organization object: merges the defaults into reputationLevels, translates label/levelLabel and writes organization.reputation.
- The returned level is (found index - 2); addReputationToOrg therefore assumes reputationLevels starts at level -1.

## Functions

| Function | Description | Line |
|---|---|---|
| `career_modules_reputation.addReputationToOrg(organization)` | Computes the organization's reputation and attaches it as organization.reputation = {value, level, curLvlProgress, neededForNext, prevThreshold, nextThreshold}; also fills in the levels with the default values. | 101 |
| `career_modules_reputation.getLabel(lvl)` | Translated label of the default reputation level. | 139 |
| `career_modules_reputation.getMaximumValue()` | Maximum reputation value. | 149 |
| `career_modules_reputation.getMinimumValue()` | Minimum reputation value. | 145 |
| `career_modules_reputation.getValueForEvent(eventId)` | Reputation change associated with an event. | 78 |

### Parameter details

#### `career_modules_reputation.addReputationToOrg(organization)`

Computes the organization's reputation and attaches it as organization.reputation = {value, level, curLvlProgress, neededForNext, prevThreshold, nextThreshold}; also fills in the levels with the default values.

- `organization` (*table|nil*) : Organization (id, reputationLevels). Does nothing if nil.

#### `career_modules_reputation.getLabel(lvl)`

Translated label of the default reputation level.

- `lvl` (*integer*) : Level from -1 to 3.
- **returns**: string Label, or empty string if unknown.

#### `career_modules_reputation.getMaximumValue()`

Maximum reputation value.

- **returns**: number 700.

#### `career_modules_reputation.getMinimumValue()`

Minimum reputation value.

- **returns**: number -50.

#### `career_modules_reputation.getValueForEvent(eventId)`

Reputation change associated with an event.

- `eventId` (*string*) : returnLoanerDamaged or discardDeliveryVehicle.
- **returns**: number|nil Change (negative), nil if unknown.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/career/modules/reputation.lua`.*
