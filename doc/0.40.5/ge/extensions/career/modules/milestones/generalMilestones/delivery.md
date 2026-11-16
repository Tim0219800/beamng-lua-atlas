# `career_modules_milestones_generalMilestones_delivery`

*File: `lua/ge/extensions/career/modules/milestones/generalMilestones/delivery.lua` · VM: Game Engine (GE) · 179 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `career_modules_milestones_generalMilestones_delivery`: `extensions.load("career_modules_milestones_generalMilestones_delivery")`, then the global `career_modules_milestones_generalMilestones_delivery`

Milestones related to career deliveries: parcels, vehicles, trailers, fluids and dry bulk delivered; on-time, delayed or late deliveries (parcelMods "timed"); number of facilities served (deliverToMilestone) or that received deliveries (deliverFromMilestone). Values come from career_modules_delivery_progress and career_modules_delivery_parcelMods.

## Notes

- Tiers: parcel {5,25,50,100,150,250}, vehicle and trailer {1,4,9,25,35,50}, fluid and dryBulk {100,1000,10000,100000}, timed {1,8,20,50}, supplier facilities {1,4,9,16,25}, recipients {1,4,9,16,25,35,45}.
- All milestones use minorLinear (100*(step+1)) and the delivery/gameplay filter.
- The labels of deliverToMilestone/deliverFromMilestone seem inverted relative to the key names (deliveredFromHere for deliverToMilestone): to verify in the translations.
- Unlike the other subsystems, the save data of these milestones is not created here (it is created by milestones/general.lua).

## Functions

| Function | Description | Line |
|---|---|---|
| `career_modules_milestones_generalMilestones_delivery.onDeliveryFacilityProgressStatsChanged()` | Hook called when the delivery facility progress statistics change: checks each milestone, notifies the reached tiers and advances notificationStep. *(internal)* *(hook)* | 165 |
| `career_modules_milestones_generalMilestones_delivery.onGeneralMilestonesCollect(milestonesList)` | Hook: builds the delivery milestone configurations and adds them to milestonesList. *(internal)* *(hook)* | 71 |
| `career_modules_milestones_generalMilestones_delivery.onGeneralMilestonesSetupCallbacks()` | Hook: sets the notification target of each delivery milestone. *(internal)* *(hook)* | 148 |
| `career_modules_milestones_generalMilestones_delivery.setNotificationTarget(milestoneConfig)` | Stores in milestoneConfig._target the target of the next tier to notify, unless all are notified. | 154 |

### Parameter details

#### `career_modules_milestones_generalMilestones_delivery.onGeneralMilestonesCollect(milestonesList)`

Hook: builds the delivery milestone configurations and adds them to milestonesList.

- `milestonesList` (*table[]*) : List to fill.

#### `career_modules_milestones_generalMilestones_delivery.setNotificationTarget(milestoneConfig)`

Stores in milestoneConfig._target the target of the next tier to notify, unless all are notified.

- `milestoneConfig` (*table*) : Milestone configuration.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/career/modules/milestones/generalMilestones/delivery.lua`.*
