---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/repository.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Client of the online mod repository (BeamNG repository) on the GE side. It queries the API (core_online.apiCall, routes s1/v4 and s2/v4), manages mod subscriptions, keeps a download/update queue (mods installed in /mods/repo/) and pushes the state to the UI through guihooks (ModListReceived, ModReceived, UpdateQueueState, downloadStatesChanged, etc.). It depends on core_modmanager to mount or delete mods.
--- Access: extension `core_repository`: `extensions.load("core_repository")`, then the global `core_repository`
---@class core_repository
---@field requestSubscriptions nil Is nil: reference to a variable not defined in the file.
core_repository = {}

--- Adds a mod to the download queue (no duplicates by id). Fills in the fields: dirname '/mods/repo/', outfile, uri '<id>/<ver>/<filename>', icon, initial state (updating for a subscription, waiting otherwise).
---Source: lua/ge/extensions/core/repository.lua:486
---@param data table Mod data: id, ver, filename, reason (e.g. 'subscription').
function core_repository.addUpdateQueue(data) end

--- Changes the state of a queue element (by file name), then notifies the UI (UpdateQueueState and RepoModChangeStatus).
---Source: lua/ge/extensions/core/repository.lua:139
---@param fname string File name of the mod.
---@param nstate string New state (waiting, updating, downloading, downloaded, done).
function core_repository.changeStateUpdateQueue(fname, nstate) end

--- Downloads a mod (s1/v4/download/mods/<uri>) to localPath..filename and handles the end: errors (toastr notification), deletion of an old file of the same mod outside the repo folder, queue update, report to the server and start of the next download.
---Source: lua/ge/extensions/core/repository.lua:152
---@param uri string '<id>/<version>/<filename>'.
---@param filename string Name of the zip file to write.
---@param localPath string|nil Target folder, '/mods/repo/' by default.
---@param callback function|nil Called with the download response if the HTTP code is 200.
function core_repository.installMod(uri, filename, localPath, callback) end

--- Subscribes the user to a mod: adds it to the queue as a 'subscription' and starts the download. May be ignored if the user voluntarily unsubscribed (useOptOut).
---Source: lua/ge/extensions/core/repository.lua:388
---@param mod_id string Mod identifier.
---@param useOptOut boolean|nil If true, ignores the request if the mod is in the opt-out list.
function core_repository.modSubscribe(mod_id, useOptOut) end

--- Unsubscribes the user: registers the mod in the opt-out list, removes it from the queue (refused if it is downloading), deletes the local mod via core_modmanager.deleteMod and notifies the server (s2/v4/modUnsubscribe) if needed.
---Source: lua/ge/extensions/core/repository.lua:441
---@param mod_id string Mod identifier.
function core_repository.modUnsubscribe(mod_id) end

--- Hook called when the mod manager is ready: replays the pending subscriptions, then applies the repoCmd orders (install, delete, disable mods) and clears them.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/repository.lua:567
function core_repository.onModManagerReady() end

--- Hook called when the connection state changes: calls runSubscription.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/repository.lua:621
---@param connected boolean Not used.
function core_repository.onOnlineStateChanged(connected) end

--- Update hook: if the download progress has changed, sends 'downloadStatesChanged' to the UI.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/repository.lua:46
---@param dt number Frame duration (unused).
function core_repository.onUpdate(dt) end

--- Requests a mod's details (s1/v4/getMod/<id>). Result passed to the callback if provided, otherwise sent via 'ModReceived'. Offline or on failure with local data, uses requestModOffline.
---Source: lua/ge/extensions/core/repository.lua:324
---@param mod_id string Mod identifier on the repository.
---@param callback function|nil Receives request.responseData.
function core_repository.requestMod(mod_id, callback) end

--- Sends to the UI ('ModReceived') the local information of an installed mod; ok = 1 if found, 0 otherwise.
---Source: lua/ge/extensions/core/repository.lua:299
---@param mod_id string Mod identifier.
function core_repository.requestModOffline(mod_id) end

--- Requests the mod list from the server (s1/v4/getMods). Each entry is enriched with pending, unpacked and downState. Result sent to the UI via 'ModListReceived'.
---Source: lua/ge/extensions/core/repository.lua:262
---@param query string|nil Search text.
---@param order_by string|nil Sort field.
---@param order string|nil Sort direction.
---@param page integer Page number, starting at 1.
---@param categories any Category filter (passed as is).
function core_repository.requestMods(query, order_by, order, page, categories) end

--- Like requestMods but limited to the user's mods (own = 1). Result sent via 'MyModsReceived'.
---Source: lua/ge/extensions/core/repository.lua:352
---@param query string|nil Search.
---@param order_by string|nil Sort field.
---@param order string|nil Sort direction.
---@param page integer Page number, starting at 1.
---@param categories any Category filter.
function core_repository.requestMyMods(query, order_by, order, page, categories) end

--- Replays the pending subscriptions if the mod manager is ready and the user is authenticated.
---Source: lua/ge/extensions/core/repository.lua:612
function core_repository.runSubscription() end

--- Stores the server's orders (forceInstall, forceRemove, forceDisable) applied at onModManagerReady.
---Source: lua/ge/extensions/core/repository.lua:559
---@param cmddata table Lists of mod identifiers by key.
function core_repository.setRepoCmd(cmddata) end

--- Stores the repository message, then included in the lists sent to the UI.
---Source: lua/ge/extensions/core/repository.lua:555
---@param data table Message.
function core_repository.setRepoMsg(data) end

--- Stores an automation message, included in the lists sent to the UI (automationMsg).
---Source: lua/ge/extensions/core/repository.lua:563
---@param data table Message.
function core_repository.setrepoAutomationMsg(data) end

--- Asks the UI to display a mod's page ('ShowMod' event).
---Source: lua/ge/extensions/core/repository.lua:605
---@param modId string Mod identifier.
function core_repository.uiShowMod(modId) end

--- Displays the mods menu (UI state 'menu.mods.local') after MenuHide.
---Source: lua/ge/extensions/core/repository.lua:600
function core_repository.uiShowRepo() end

--- Sends 'UpdateQueueState' to the UI with the lists updatingList, doneList, missingList and the updating flag.
---Source: lua/ge/extensions/core/repository.lua:53
function core_repository.uiUpdateQueue() end

--- Sets all elements with action 'missing' to update and restarts the queue.
---Source: lua/ge/extensions/core/repository.lua:542
function core_repository.updateAllMissing() end

--- Disables auto-mount, marks all elements with action 'update' for update and restarts the queue.
---Source: lua/ge/extensions/core/repository.lua:516
function core_repository.updateAllMods() end

--- Updates a single mod of the queue.
---Source: lua/ge/extensions/core/repository.lua:529
---@param id string Mod identifier.
function core_repository.updateOneMod(id) end

