# `ui_legal`

*File: `lua/ge/extensions/ui/legal.lua` · VM: Game Engine (GE) · 46 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_legal`: `extensions.load("ui_legal")`, then the global `ui_legal`

Checks whether the user has answered the online consent wizard (settings `onlineFeatures` and `telemetry`, value "ask" = not answered yet). Used by the UI router to prevent leaving the consent screen until it is validated.

## Notes

- In simple menu (Engine.UI.isSimpleMenu()), if consent is not given, the module automatically enables onlineFeatures and telemetry ("enable"), requests saving the settings and considers consent as given (the terms are assumed accepted).

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_legal.canLeaveOnlineConsent(route)` | Returns whether navigating away from the current route is allowed: always true inside the `legal.*` route tree (to finish the wizard), otherwise depends on isOnlineConsentSet(). | 35 |
| `ui_legal.isOnlineConsentSet()` | Returns true if telemetry and onlineFeatures are both different from "ask". Side effect in simple menu: enables both settings and saves. | 18 |

### Parameter details

#### `ui_legal.canLeaveOnlineConsent(route)`

Returns whether navigating away from the current route is allowed: always true inside the `legal.*` route tree (to finish the wizard), otherwise depends on isOnlineConsentSet().

- `route` (*table*) : UI route (name field of the form "legal.xxx").
- **returns**: boolean true if leaving is allowed.

#### `ui_legal.isOnlineConsentSet()`

Returns true if telemetry and onlineFeatures are both different from "ask". Side effect in simple menu: enables both settings and saves.

- **returns**: boolean Consent provided.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/legal.lua`.*
