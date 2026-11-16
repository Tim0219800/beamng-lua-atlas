# `core_online`

*File: `lua/ge/extensions/core/online.lua` · VM: Game Engine (GE) · 356 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `core_online`: `extensions.load("core_online")`, then the global `core_online`

GE extension `core_online`: access layer to BeamNG's online services (authentication, mod repository API, downloads). It is only active if the 'onlineFeatures' setting is 'enable'. It sends HTTP requests via SecureComm on the engine side, tracks each request ('working' then 'finished' state) and calls a Lua callback at the end. It also receives instructions from the server (messages to display, mod updates). A modder very rarely uses it; core_modmanager and core_repository use it.

## Example

```lua
-- JSON API call (example from the code)
core_online.apiCall('s1/v4/getMods?query=&order_by=&order=&page=1', function(req)
  dump(req.responseData)
end)
-- file download
core_online.download('https://exemple.org/x.zip', function(req) log('I','', req.state) end, nil, '/temp/x.zip')
```

## Notes

- If online features are disabled ('onlineFeatures' setting different from 'enable'), apiCall/download return false without sending anything; disabling the setting also sets the 'telemetry' setting to 'disable'. If the client is not authenticated (Engine.Online.isAuthenticated()), the call is refused with an error in the log and returns false.
- A request is tracked in `requests` (unique increasing id). The public table passed to the callback contains: id, url or uri, outfile, dirname/filename/fileext, state ('working'|'finished'), error/errorCode (if curlCode ~= 0), effectiveURL, responseCode, responseBuffer (text), responseData (decoded JSON table, if non-empty), dltotal, dlnow, ultotal, ulnow, dlspeed, ulspeed, time (progress). downloadURL returns nothing (nil) on success: only false indicates a refusal.
- If the address starts with http:// or https:// it is used as is (url field), otherwise it is treated as a relative API path (uri field). reqType is 'get' by default. postDataTbl is encoded as JSON (lunajson) and sent as the body. postFileName and authorizationHeader are only passed by apiCall.
- The engine calls callbackSecureCommCpp and callbackSecureCommCppProgress (names registered as 'core_online.callbackSecureCommCpp...'): do not remove them. clearRequest(id) is then called by the engine to free the request.
- Probable bug in callbackSecureCommCpp: the test uses the variable `responseresponseHeadersBuffer` (typo, always nil), so r.pub.responseHeaders is never filled.
- Bug: M.requestSubscriptions and M.testWebsocket are exported but no local variable of that name exists: they are nil.
- Server instructions (onInstructions): only those with origin == 'gameauth' are accepted. Handled types: message (displayed via guihooks 'OnlineMessage' except IDs hidden in the OnlineHiddenMessageIDs setting), modUpdateAvailable (core_modmanager.check4Update), repomsg, repocmd, automationmsg (core_repository). Any other type is logged as an error.

## Functions

| Function | Description | Line |
|---|---|---|
| `core_online.apiCall(uri, finishCallback, postDataTbl, outfile, reqType, progressCallback, postFileName, authorizationHeader)` | JSON API call: like download but requests a decoded JSON response in responseData. | 143 |
| `core_online.callbackSecureCommCpp(id, responseCode, responseBuffer, responseHeaders, responseData, postData, curlCode, curlErrorStr, effectiveURL)` | Engine callback at the end of a request: fills the public table, sets it to the 'finished' state and calls the Lua end callback. *(internal)* | 148 |
| `core_online.callbackSecureCommCppProgress(id, dltotal, dlnow, ultotal, ulnow, dlspeed, ulspeed, time)` | Engine callback during a request: updates the progress (0 values ignored) and calls the progress callback. *(internal)* | 199 |
| `core_online.clearRequest(id)` | Called by the engine after a request has finished: forgets it. *(internal)* | 194 |
| `core_online.download(uri, finishCallback, postDataTbl, outfile, reqType, progressCallback)` | Downloads a URL or a server path (without treating the response as JSON). | 139 |
| `core_online.getRequestsUI()` | Sends to the UI (guihooks 'OnlineRequestsState') the public part of all in-progress or finished requests. | 41 |
| `core_online.onExtensionLoaded()` | On load: reads the onlineFeatures setting (onSettingsChanged). *(internal)* *(hook)* | 248 |
| `core_online.onInstructions(data)` | Called by the engine with instructions sent by the authentication server (see notes). *(internal)* *(hook)* | 297 |
| `core_online.onOnlineStateChanged(connected)` | Hook called by the engine when the connection state changes: notifies the UI and sends the service provider info. *(internal)* *(hook)* | 22 |
| `core_online.onSettingsChanged()` | Hook called when settings change: enables (and opens the session) or disables online features depending on onlineFeatures. *(internal)* *(hook)* | 232 |
| `core_online.onUIOnlineMessageHide(uid)` | Called by the UI to permanently hide a message: adds its uid to the OnlineHiddenMessageIDs setting and saves. *(internal)* *(hook)* | 282 |
| `core_online.onUIOnlineMessageReady()` | Called by the UI when it can display online messages: sends those already received. *(internal)* *(hook)* | 276 |
| `core_online.openSession()` | Opens the online session on the engine side (Engine.Online.openSession), only once per game launch and only if online features are enabled. | 50 |
| `core_online.requestState()` | Asks the UI for the connection state: sends 'OnlineStateChanged' and, if a service provider (e.g. Steam) is connected, 'SteamInfo'. | 37 |
| `core_online.requestSubscriptions()` | Exported but nil: no function of that name is defined in the file. (dynamically assigned) *(internal)* | dyn |
| `core_online.testWebsocket()` | Exported but nil: no function of that name is defined in the file. (dynamically assigned) *(internal)* | dyn |

### Parameter details

#### `core_online.apiCall(uri, finishCallback, postDataTbl, outfile, reqType, progressCallback, postFileName, authorizationHeader)`

JSON API call: like download but requests a decoded JSON response in responseData.

- `uri` (*string*) : API path ('s1/v4/...') or full URL.
- `finishCallback` (*function|nil*) : Called at the end with the request's public table; nil = request without callback.
- `postDataTbl` (*table|nil*) : Data to send, encoded as JSON.
- `outfile` (*string|nil*) : File where the response is written.
- `reqType` (*string|nil*) : HTTP method, 'get' by default (lowercased).
- `progressCallback` (*function|nil*) : Called periodically with the public table (progress).
- `postFileName` (*string|nil*) : File name to send in POST.
- `authorizationHeader` (*string|nil*) : Authorization header to add.
- **returns**: boolean|nil false if refused (disabled or not authenticated), nil otherwise.

#### `core_online.callbackSecureCommCpp(id, responseCode, responseBuffer, responseHeaders, responseData, postData, curlCode, curlErrorStr, effectiveURL)`

Engine callback at the end of a request: fills the public table, sets it to the 'finished' state and calls the Lua end callback.

- `id` (*integer*) : Request id.
- `responseCode` (*integer*) : HTTP code.
- `responseBuffer` (*string*) : Response body.
- `responseHeaders` (*string*) : Response headers.
- `responseData` (*table*) : Decoded JSON response.
- `postData` (*any*) : Data sent (unused).
- `curlCode` (*integer*) : curl error code (0 = ok).
- `curlErrorStr` (*string*) : curl error message.
- `effectiveURL` (*string*) : Final URL after redirects.

#### `core_online.callbackSecureCommCppProgress(id, dltotal, dlnow, ultotal, ulnow, dlspeed, ulspeed, time)`

Engine callback during a request: updates the progress (0 values ignored) and calls the progress callback.

- `id` (*integer*) : Request id.
- `dltotal` (*number*) : Total bytes to download.
- `dlnow` (*number*) : Bytes downloaded.
- `ultotal` (*number*) : Total bytes to upload.
- `ulnow` (*number*) : Bytes sent.
- `dlspeed` (*number*) : Download speed.
- `ulspeed` (*number*) : Upload speed.
- `time` (*number*) : Elapsed time.

#### `core_online.clearRequest(id)`

Called by the engine after a request has finished: forgets it.

- `id` (*integer*) : Request id.

#### `core_online.download(uri, finishCallback, postDataTbl, outfile, reqType, progressCallback)`

Downloads a URL or a server path (without treating the response as JSON).

- `uri` (*string*) : Full URL or path.
- `finishCallback` (*function|nil*) : End callback.
- `postDataTbl` (*table|nil*) : POST data encoded as JSON.
- `outfile` (*string|nil*) : Destination file.
- `reqType` (*string|nil*) : HTTP method, 'get' by default.
- `progressCallback` (*function|nil*) : Progress callback.
- **returns**: boolean|nil false if refused, nil otherwise.

#### `core_online.onInstructions(data)`

Called by the engine with instructions sent by the authentication server (see notes).

- `data` (*table*) : { origin = 'gameauth', cmds = [ { type, ... } ] }

#### `core_online.onOnlineStateChanged(connected)`

Hook called by the engine when the connection state changes: notifies the UI and sends the service provider info.

- `connected` (*boolean*) : true if authenticated.

#### `core_online.onUIOnlineMessageHide(uid)`

Called by the UI to permanently hide a message: adds its uid to the OnlineHiddenMessageIDs setting and saves.

- `uid` (*string*) : Message identifier.

**UI events (guihooks.trigger):** `OnlineMessage`, `OnlineRequestsState`, `OnlineStateChanged`, `SteamInfo`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/core/online.lua`.*
