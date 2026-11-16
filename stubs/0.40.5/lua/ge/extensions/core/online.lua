---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/online.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- GE extension `core_online`: access layer to BeamNG's online services (authentication, mod repository API, downloads). It is only active if the 'onlineFeatures' setting is 'enable'. It sends HTTP requests via SecureComm on the engine side, tracks each request ('working' then 'finished' state) and calls a Lua callback at the end. It also receives instructions from the server (messages to display, mod updates). A modder very rarely uses it; core_modmanager and core_repository use it.
--- Access: extension `core_online`: `extensions.load("core_online")`, then the global `core_online`
---@class core_online
core_online = {}

--- JSON API call: like download but requests a decoded JSON response in responseData.
---Source: lua/ge/extensions/core/online.lua:143
---@param uri string API path ('s1/v4/...') or full URL.
---@param finishCallback function|nil Called at the end with the request's public table; nil = request without callback.
---@param postDataTbl table|nil Data to send, encoded as JSON.
---@param outfile string|nil File where the response is written.
---@param reqType string|nil HTTP method, 'get' by default (lowercased).
---@param progressCallback function|nil Called periodically with the public table (progress).
---@param postFileName string|nil File name to send in POST.
---@param authorizationHeader string|nil Authorization header to add.
---@return boolean|nil  false if refused (disabled or not authenticated), nil otherwise.
function core_online.apiCall(uri, finishCallback, postDataTbl, outfile, reqType, progressCallback, postFileName, authorizationHeader) end

--- Engine callback at the end of a request: fills the public table, sets it to the 'finished' state and calls the Lua end callback.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/online.lua:148
---@param id integer Request id.
---@param responseCode integer HTTP code.
---@param responseBuffer string Response body.
---@param responseHeaders string Response headers.
---@param responseData table Decoded JSON response.
---@param postData any Data sent (unused).
---@param curlCode integer curl error code (0 = ok).
---@param curlErrorStr string curl error message.
---@param effectiveURL string Final URL after redirects.
function core_online.callbackSecureCommCpp(id, responseCode, responseBuffer, responseHeaders, responseData, postData, curlCode, curlErrorStr, effectiveURL) end

--- Engine callback during a request: updates the progress (0 values ignored) and calls the progress callback.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/online.lua:199
---@param id integer Request id.
---@param dltotal number Total bytes to download.
---@param dlnow number Bytes downloaded.
---@param ultotal number Total bytes to upload.
---@param ulnow number Bytes sent.
---@param dlspeed number Download speed.
---@param ulspeed number Upload speed.
---@param time number Elapsed time.
function core_online.callbackSecureCommCppProgress(id, dltotal, dlnow, ultotal, ulnow, dlspeed, ulspeed, time) end

--- Called by the engine after a request has finished: forgets it.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/online.lua:194
---@param id integer Request id.
function core_online.clearRequest(id) end

--- Downloads a URL or a server path (without treating the response as JSON).
---Source: lua/ge/extensions/core/online.lua:139
---@param uri string Full URL or path.
---@param finishCallback function|nil End callback.
---@param postDataTbl table|nil POST data encoded as JSON.
---@param outfile string|nil Destination file.
---@param reqType string|nil HTTP method, 'get' by default.
---@param progressCallback function|nil Progress callback.
---@return boolean|nil  false if refused, nil otherwise.
function core_online.download(uri, finishCallback, postDataTbl, outfile, reqType, progressCallback) end

--- Sends to the UI (guihooks 'OnlineRequestsState') the public part of all in-progress or finished requests.
---Source: lua/ge/extensions/core/online.lua:41
function core_online.getRequestsUI() end

--- On load: reads the onlineFeatures setting (onSettingsChanged).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/online.lua:248
function core_online.onExtensionLoaded() end

--- Called by the engine with instructions sent by the authentication server (see notes).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/online.lua:297
---@param data table { origin = 'gameauth', cmds = [ { type, ... } ] }
function core_online.onInstructions(data) end

--- Hook called by the engine when the connection state changes: notifies the UI and sends the service provider info.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/online.lua:22
---@param connected boolean true if authenticated.
function core_online.onOnlineStateChanged(connected) end

--- Hook called when settings change: enables (and opens the session) or disables online features depending on onlineFeatures.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/online.lua:232
function core_online.onSettingsChanged() end

--- Called by the UI to permanently hide a message: adds its uid to the OnlineHiddenMessageIDs setting and saves.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/online.lua:282
---@param uid string Message identifier.
function core_online.onUIOnlineMessageHide(uid) end

--- Called by the UI when it can display online messages: sends those already received.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/online.lua:276
function core_online.onUIOnlineMessageReady() end

--- Opens the online session on the engine side (Engine.Online.openSession), only once per game launch and only if online features are enabled.
---Source: lua/ge/extensions/core/online.lua:50
function core_online.openSession() end

--- Asks the UI for the connection state: sends 'OnlineStateChanged' and, if a service provider (e.g. Steam) is connected, 'SteamInfo'.
---Source: lua/ge/extensions/core/online.lua:37
function core_online.requestState() end

--- Exported but nil: no function of that name is defined in the file. (dynamically assigned)
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/online.lua:dyn
function core_online.requestSubscriptions() end

--- Exported but nil: no function of that name is defined in the file. (dynamically assigned)
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/online.lua:dyn
function core_online.testWebsocket() end

