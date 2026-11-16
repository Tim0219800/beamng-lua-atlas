# `career_modules_milestones_generalMilestones_insurance`

*File: `lua/ge/extensions/career/modules/milestones/generalMilestones/insurance.lua` · VM: Game Engine (GE) · 44 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `career_modules_milestones_generalMilestones_insurance`: `extensions.load("career_modules_milestones_generalMilestones_insurance")`, then the global `career_modules_milestones_generalMilestones_insurance`

Milestone on the number of insurance repair claims (id insurance_repair_claims). Tiers: 1, 5, 10, 20, 50 claims (career_modules_insurance_history.getInsuranceClaimsCount), minorLinear reward.

## Notes

- onInsuranceRepairClaim does not call setNotificationTarget: it directly compares the counter with the next tier's target (notificationStep + 1).
- The hook may be called before onGeneralMilestonesCollect; in that case currMilestone is empty and getTarget does not exist (unguarded).

## Functions

| Function | Description | Line |
|---|---|---|
| `career_modules_milestones_generalMilestones_insurance.onGeneralMilestonesCollect(milestonesList)` | Hook: creates the milestone configuration, its save data if absent, and adds it to milestonesList. *(internal)* *(hook)* | 10 |
| `career_modules_milestones_generalMilestones_insurance.onInsuranceRepairClaim()` | Hook called on each insurance repair claim: if the counter reaches the next tier's target, notifies the milestone and advances notificationStep. *(internal)* *(hook)* | 32 |

### Parameter details

#### `career_modules_milestones_generalMilestones_insurance.onGeneralMilestonesCollect(milestonesList)`

Hook: creates the milestone configuration, its save data if absent, and adds it to milestonesList.

- `milestonesList` (*table[]*) : List to fill.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/career/modules/milestones/generalMilestones/insurance.lua`.*
