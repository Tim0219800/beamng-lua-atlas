# `core_supportReport`

*File: `lua/ge/extensions/core/supportReport.lua` · VM: Game Engine (GE) · 71 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `core_supportReport`: `extensions.load("core_supportReport")`, then the global `core_supportReport`

Sends a support report to the BeamNG server from the UI. send triggers Engine.SupportReport.send; the engine calls back onSupportReportSent with the support identifier (or an error). The identifier is kept for 15 minutes in settings/lastSupportReport.json, then forgotten. The state is published to the UI through the guihook 'SupportReportState'.

## Notes

- The state sent to the UI: {sending, supportId, expires, error, outdated}. expires is the expiration time (os.time), 0 if there is no identifier.
- Server errors containing HTML (e.g. a proxy's 502 page) are reduced to their title or plain text.

## Functions

| Function | Description | Line |
|---|---|---|
| `core_supportReport.onExtensionLoaded()` | Load hook: re-reads the last saved report and forgets it if expired. *(internal)* *(hook)* | 60 |
| `core_supportReport.onSupportReportSent(supportId, err, outdated)` | Engine callback when sending finishes. If supportId is not empty, stores it (JSON file); otherwise stores the error and the outdated flag. Republishes the state. *(internal)* *(hook)* | 48 |
| `core_supportReport.requestState()` | Forgets the expired report (deletes the file), then sends the current state to the UI (guihook SupportReportState). | 28 |
| `core_supportReport.send()` | Starts sending the report (Engine.SupportReport.send) if none is already in progress, then publishes the state. | 39 |

### Parameter details

#### `core_supportReport.onSupportReportSent(supportId, err, outdated)`

Engine callback when sending finishes. If supportId is not empty, stores it (JSON file); otherwise stores the error and the outdated flag. Republishes the state.

- `supportId` (*string*) : Support identifier, '' on failure.
- `err` (*string*) : Error message on failure.
- `outdated` (*boolean*) : True if the game is too old to send a report (inferred from code).

**UI events (guihooks.trigger):** `SupportReportState`

## Calls into the engine (C++)

- `FS:` `removeFile`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/core/supportReport.lua`.*
