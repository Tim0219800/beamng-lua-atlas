# `core_repository`

*File: `lua/ge/extensions/core/repository.lua` · VM: Game Engine (GE) · 655 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `core_repository`: `extensions.load("core_repository")`, then the global `core_repository`

Client of the online mod repository (BeamNG repository) on the GE side. It queries the API (core_online.apiCall, routes s1/v4 and s2/v4), manages mod subscriptions, keeps a download/update queue (mods installed in /mods/repo/) and pushes the state to the UI through guihooks (ModListReceived, ModReceived, UpdateQueueState, downloadStatesChanged, etc.). It depends on core_modmanager to mount or delete mods.

## Example

```lua
-- from the JS UI: bngApi.engineLua('extensions.core_repository.requestMods(' + bngApi.serializeToLua({query='drift'}) + ')')
core_repository.modSubscribe('1234')
```

## Notes

- Request results are not returned: they are sent to the UI by guihooks.trigger (requestMods -> ModListReceived, requestMod -> ModReceived unless a callback is provided, requestMyMods -> MyModsReceived).
- UI pages start at 1: requestMods and requestMyMods send page - 1 to the server.
- If the onlineFeatures setting is not 'enable', requestMod switches to offline mode (requestModOffline, local mod manager data).
- Update queue: each element has a state (waiting, updating, downloading, downloaded, done). The number of simultaneous downloads comes from the modNumParallelDownload setting (3 by default). When everything is finished, the server is informed (s2/v4/modUpdateSuccess) and UpdateFinished is emitted.
- modSubscribe also records an opt-out in /settings/cloud/mods-optout.json; modUnsubscribe registers the mod there (voluntary unsubscription). If the mod manager is not ready or the user is not authenticated, the subscription is put on hold (subList) then replayed by runSubscription.
- BUG: M.requestSubscriptions = requestSubscriptions references an undefined local variable, so the field is nil.
- Probable BUG: in installMod, 'completeCallback' is a global variable never defined in this file; its test 'if completeCallback' is always false. Also requestMyMods uses v.id for 'pending' where requestMods uses v.tagid.
- In installMod, a file with the same name at the root of /mods/ is deleted before the download.

## Functions

| Function | Description | Line |
|---|---|---|
| `core_repository.addUpdateQueue(data)` | Adds a mod to the download queue (no duplicates by id). Fills in the fields: dirname '/mods/repo/', outfile, uri '<id>/<ver>/<filename>', icon, initial state (updating for a subscription, waiting otherwise). | 486 |
| `core_repository.changeStateUpdateQueue(fname, nstate)` | Changes the state of a queue element (by file name), then notifies the UI (UpdateQueueState and RepoModChangeStatus). | 139 |
| `core_repository.installMod(uri, filename, localPath, callback)` | Downloads a mod (s1/v4/download/mods/<uri>) to localPath..filename and handles the end: errors (toastr notification), deletion of an old file of the same mod outside the repo folder, queue update, report to the server and start of the next download. | 152 |
| `core_repository.modSubscribe(mod_id, useOptOut)` | Subscribes the user to a mod: adds it to the queue as a 'subscription' and starts the download. May be ignored if the user voluntarily unsubscribed (useOptOut). | 388 |
| `core_repository.modUnsubscribe(mod_id)` | Unsubscribes the user: registers the mod in the opt-out list, removes it from the queue (refused if it is downloading), deletes the local mod via core_modmanager.deleteMod and notifies the server (s2/v4/modUnsubscribe) if needed. | 441 |
| `core_repository.onModManagerReady()` | Hook called when the mod manager is ready: replays the pending subscriptions, then applies the repoCmd orders (install, delete, disable mods) and clears them. *(internal)* *(hook)* | 567 |
| `core_repository.onOnlineStateChanged(connected)` | Hook called when the connection state changes: calls runSubscription. *(internal)* *(hook)* | 621 |
| `core_repository.onUpdate(dt)` | Update hook: if the download progress has changed, sends 'downloadStatesChanged' to the UI. *(internal)* *(hook)* | 46 |
| `core_repository.requestMod(mod_id, callback)` | Requests a mod's details (s1/v4/getMod/<id>). Result passed to the callback if provided, otherwise sent via 'ModReceived'. Offline or on failure with local data, uses requestModOffline. | 324 |
| `core_repository.requestModOffline(mod_id)` | Sends to the UI ('ModReceived') the local information of an installed mod; ok = 1 if found, 0 otherwise. | 299 |
| `core_repository.requestMods(query, order_by, order, page, categories)` | Requests the mod list from the server (s1/v4/getMods). Each entry is enriched with pending, unpacked and downState. Result sent to the UI via 'ModListReceived'. | 262 |
| `core_repository.requestMyMods(query, order_by, order, page, categories)` | Like requestMods but limited to the user's mods (own = 1). Result sent via 'MyModsReceived'. | 352 |
| `core_repository.runSubscription()` | Replays the pending subscriptions if the mod manager is ready and the user is authenticated. | 612 |
| `core_repository.setRepoCmd(cmddata)` | Stores the server's orders (forceInstall, forceRemove, forceDisable) applied at onModManagerReady. | 559 |
| `core_repository.setRepoMsg(data)` | Stores the repository message, then included in the lists sent to the UI. | 555 |
| `core_repository.setrepoAutomationMsg(data)` | Stores an automation message, included in the lists sent to the UI (automationMsg). | 563 |
| `core_repository.uiShowMod(modId)` | Asks the UI to display a mod's page ('ShowMod' event). | 605 |
| `core_repository.uiShowRepo()` | Displays the mods menu (UI state 'menu.mods.local') after MenuHide. | 600 |
| `core_repository.uiUpdateQueue()` | Sends 'UpdateQueueState' to the UI with the lists updatingList, doneList, missingList and the updating flag. | 53 |
| `core_repository.updateAllMissing()` | Sets all elements with action 'missing' to update and restarts the queue. | 542 |
| `core_repository.updateAllMods()` | Disables auto-mount, marks all elements with action 'update' for update and restarts the queue. | 516 |
| `core_repository.updateOneMod(id)` | Updates a single mod of the queue. | 529 |

### Parameter details

#### `core_repository.addUpdateQueue(data)`

Adds a mod to the download queue (no duplicates by id). Fills in the fields: dirname '/mods/repo/', outfile, uri '<id>/<ver>/<filename>', icon, initial state (updating for a subscription, waiting otherwise).

- `data` (*table*) : Mod data: id, ver, filename, reason (e.g. 'subscription').

#### `core_repository.changeStateUpdateQueue(fname, nstate)`

Changes the state of a queue element (by file name), then notifies the UI (UpdateQueueState and RepoModChangeStatus).

- `fname` (*string*) : File name of the mod.
- `nstate` (*string*) : New state (waiting, updating, downloading, downloaded, done).

#### `core_repository.installMod(uri, filename, localPath, callback)`

Downloads a mod (s1/v4/download/mods/<uri>) to localPath..filename and handles the end: errors (toastr notification), deletion of an old file of the same mod outside the repo folder, queue update, report to the server and start of the next download.

- `uri` (*string*) : '<id>/<version>/<filename>'.
- `filename` (*string*) : Name of the zip file to write.
- `localPath` (*string|nil*) : Target folder, '/mods/repo/' by default.
- `callback` (*function|nil*) : Called with the download response if the HTTP code is 200.

#### `core_repository.modSubscribe(mod_id, useOptOut)`

Subscribes the user to a mod: adds it to the queue as a 'subscription' and starts the download. May be ignored if the user voluntarily unsubscribed (useOptOut).

- `mod_id` (*string*) : Mod identifier.
- `useOptOut` (*boolean|nil*) : If true, ignores the request if the mod is in the opt-out list.

#### `core_repository.modUnsubscribe(mod_id)`

Unsubscribes the user: registers the mod in the opt-out list, removes it from the queue (refused if it is downloading), deletes the local mod via core_modmanager.deleteMod and notifies the server (s2/v4/modUnsubscribe) if needed.

- `mod_id` (*string*) : Mod identifier.

#### `core_repository.onOnlineStateChanged(connected)`

Hook called when the connection state changes: calls runSubscription.

- `connected` (*boolean*) : Not used.

#### `core_repository.onUpdate(dt)`

Update hook: if the download progress has changed, sends 'downloadStatesChanged' to the UI.

- `dt` (*number*) : Frame duration (unused).

#### `core_repository.requestMod(mod_id, callback)`

Requests a mod's details (s1/v4/getMod/<id>). Result passed to the callback if provided, otherwise sent via 'ModReceived'. Offline or on failure with local data, uses requestModOffline.

- `mod_id` (*string*) : Mod identifier on the repository.
- `callback` (*function|nil*) : Receives request.responseData.

#### `core_repository.requestModOffline(mod_id)`

Sends to the UI ('ModReceived') the local information of an installed mod; ok = 1 if found, 0 otherwise.

- `mod_id` (*string*) : Mod identifier.

#### `core_repository.requestMods(query, order_by, order, page, categories)`

Requests the mod list from the server (s1/v4/getMods). Each entry is enriched with pending, unpacked and downState. Result sent to the UI via 'ModListReceived'.

- `query` (*string|nil*) : Search text.
- `order_by` (*string|nil*) : Sort field.
- `order` (*string|nil*) : Sort direction.
- `page` (*integer*) : Page number, starting at 1.
- `categories` (*any*) : Category filter (passed as is).

#### `core_repository.requestMyMods(query, order_by, order, page, categories)`

Like requestMods but limited to the user's mods (own = 1). Result sent via 'MyModsReceived'.

- `query` (*string|nil*) : Search.
- `order_by` (*string|nil*) : Sort field.
- `order` (*string|nil*) : Sort direction.
- `page` (*integer*) : Page number, starting at 1.
- `categories` (*any*) : Category filter.

#### `core_repository.setRepoCmd(cmddata)`

Stores the server's orders (forceInstall, forceRemove, forceDisable) applied at onModManagerReady.

- `cmddata` (*table*) : Lists of mod identifiers by key.

#### `core_repository.setRepoMsg(data)`

Stores the repository message, then included in the lists sent to the UI.

- `data` (*table*) : Message.

#### `core_repository.setrepoAutomationMsg(data)`

Stores an automation message, included in the lists sent to the UI (automationMsg).

- `data` (*table*) : Message.

#### `core_repository.uiShowMod(modId)`

Asks the UI to display a mod's page ('ShowMod' event).

- `modId` (*string*) : Mod identifier.

#### `core_repository.updateOneMod(id)`

Updates a single mod of the queue.

- `id` (*string*) : Mod identifier.

## Fields

| Field | Type | Description |
|---|---|---|
| `requestSubscriptions` | nil | Is nil: reference to a variable not defined in the file. ⚠ reference `requestSubscriptions` not defined in the file (probably nil) |

**UI events (guihooks.trigger):** `MenuHide`, `ModDownloaded`, `ModListReceived`, `ModReceived`, `ModSubscribed`, `ModUnsubscribed`, `MyModsReceived`, `RepoModChangeStatus`, `ShowMod`, `UpdateFinished`, `UpdateQueueState`, `downloadStateChanged`, `downloadStatesChanged`, `repoError`, `toastrMsg`

## Calls into the engine (C++)

- `FS:` `fileExists`, `removeFile`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/core/repository.lua`.*
