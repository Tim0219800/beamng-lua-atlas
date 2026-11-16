# `freeroam_organizations`

*File: `lua/ge/extensions/freeroam/organizations.lua` · VM: Game Engine (GE) · 104 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `freeroam_organizations`: `extensions.load("freeroam_organizations")`, then the global `freeroam_organizations`

Registry of organizations (career mode factions with reputation), loaded from the `gameplay/organizations/*.organizations.json` files and enriched with the career's reputation data. Also provides UI-ready data. Global: freeroam_organizations.

## Notes

- Depends on the career modules (career_modules_reputation, career_career, career_modules_delivery_generator): getOrganizations calls addAdditionalInfoToOrg which uses career_modules_reputation without a nil test, so outside career these globals must exist.
- Each organization receives: id (file key), visible, attributeKey (= id .. 'Reputation') and the reputation fields.
- getOrganizationIdOrderAndIcon always returns 7000 and 'peopleOutline' (reserved order 7000-8000).
- getUIDataForOrg: deepcopy then reputation max/min/label, offersDeliveries, hasUnlocks, associatedFacilities, and for each reputation level label and level (= index - 2). It dereferences organization.reputation without a test: an unknown org returns nil (error log in getOrganization).

## Functions

| Function | Description | Line |
|---|---|---|
| `freeroam_organizations.getOrganization(id)` | Returns an organization by id (refreshing its reputation) or nil with an error log. | 36 |
| `freeroam_organizations.getOrganizationIdOrderAndIcon(id)` | Display order and icon: constants (7000, 'peopleOutline'). | 47 |
| `freeroam_organizations.getOrganizations()` | Loads (once, cached) all the organizations. | 15 |
| `freeroam_organizations.getUIData()` | List of the organizations in UI format (getUIDataForOrg), sorted by translated name. | 87 |
| `freeroam_organizations.getUIDataForOrg(orgId)` | Enriched copy of an organization for the UI. | 70 |

### Parameter details

#### `freeroam_organizations.getOrganization(id)`

Returns an organization by id (refreshing its reputation) or nil with an error log.

- `id` (*string*) : Organization id.
- **returns**: table|nil Organization.

#### `freeroam_organizations.getOrganizationIdOrderAndIcon(id)`

Display order and icon: constants (7000, 'peopleOutline').

- `id` (*string*) : Not used.
- **returns**: integer 7000
- **returns**: string 'peopleOutline'

#### `freeroam_organizations.getOrganizations()`

Loads (once, cached) all the organizations.

- **returns**: table<string, table> Organizations keyed by id.

#### `freeroam_organizations.getUIData()`

List of the organizations in UI format (getUIDataForOrg), sorted by translated name.

- **returns**: table[] UI data.

#### `freeroam_organizations.getUIDataForOrg(orgId)`

Enriched copy of an organization for the UI.

- `orgId` (*string*) : Organization id.
- **returns**: table|nil UI data.

## Calls into the engine (C++)

- `FS:` `findFiles`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/freeroam/organizations.lua`.*
