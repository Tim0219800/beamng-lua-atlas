# `career_modules_permissions`

*File: `lua/ge/extensions/career/modules/permissions.lua` · VM: Game Engine (GE) · 69 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `career_modules_permissions`: `extensions.load("career_modules_permissions")`, then the global `career_modules_permissions`

Career permissions system. An action (tag such as vehicleModification, vehicleSelling, interactRefuel, recoveryTowToRoad...) can be allowed, warning, forbidden or hidden. The module decides nothing itself: it emits the onCheckPermission(tags, permissions, additionalData) hook and keeps the most restrictive answer given by extensions (e.g. an activity in progress).

## Example

```lua
local st = career_modules_permissions.getStatusForTag({"vehicleSelling"})
if st.permission == "forbidden" then ... end
```

## Notes

- Priority: allowed < warning < forbidden < hidden.
- The allow field of the result is true only if the retained permission is "warning"; if no extension answers, the result is {permission = "allowed", allow = true}. For "allowed" returned by an extension, allow is therefore false (apparent inconsistency in the code).
- Extensions answer by inserting {permission, label, penalty} into the hook's permissions table.

## Functions

| Function | Description | Line |
|---|---|---|
| `career_modules_permissions.getStatusForTag(tags, additionalData)` | Queries the extensions via the onCheckPermission hook and returns the most restrictive permission for the given tags. | 41 |

### Parameter details

#### `career_modules_permissions.getStatusForTag(tags, additionalData)`

Queries the extensions via the onCheckPermission hook and returns the most restrictive permission for the given tags.

- `tags` (*string|string[]*) : A tag or a list of tags (a string is wrapped in a table).
- `additionalData` (*any*) : Data passed as is to the hook.
- **returns**: {allow: boolean, permission: string, label: any, type: string, penalty: any} Retained status; type is "text".

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onCheckPermission` — listened to by 2 module(s)

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/career/modules/permissions.lua`.*
