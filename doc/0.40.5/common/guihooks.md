# `guihooks`

*File: `lua/common/guihooks.lua` · VM: Common (GE + vehicle) · 215 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** global `guihooks`

Lua gateway to the HTML/JS interface (CEF). Allows triggering JS hooks on the UI side (guihooks.trigger) and sending high-frequency data streams to UI apps. Present in the GE VM (via `be`) and in the vehicle VM (via `obj`); both send through queueHookJS/queueStreamDataJS. A modder uses it to show a message, update a UI app or plot values in the 'Generic Graph' app.

## Example

```lua
guihooks.trigger('MyUiHook', {speed = 12.5, gear = 'D'})  -- JS side: $scope.$on('MyUiHook', function(ev, data) ... end)
guihooks.message('Hello', 5, 'myCategory')
guihooks.graph({'speed', speed, 100, 'm/s'}, {'rpm', rpm, 8000})
```

## Notes

- nil arguments are removed from the list sent to JS by trigger and triggerClient (arguments are compacted, no holes). trigger sends '[]' if there are no non-nil arguments.
- trigger uses the execution context identifier execCtxWebId (global) as target, 0 by default; triggerClient lets you target a specific client identifier (targetDsmId).
- In the vehicle VM, queueStream only writes to the cache if M.updateStreams is true; reset() sets it back to false. On the GE side, queueStream always sets M.updateStreams to true. The cache is sent by sendStreams.
- sendStreams() must be called from the vehicle's onGraphicsStep (stated in the code): in the vehicle VM it also calls streams.update() and triggers VehicleChange/VehicleReset if v.data changed.
- M.queueStream and M.send are defined fields (aliases): automatic extraction wrongly reports them as nil, the local variable queueStream is a function (nop if neither obj nor be exists).
- The code comment plans for this module to be reviewed: 'todo replace ui_message'. guihooks.message does nothing if the player is not seated (playerInfo.firstPlayerSeated false).
- graph() returns the normalized values table (key, value, scale, unit, renderNegatives, RGBA color from jetColor). graphWithCSV keeps a CSV file open at module level: the first call sets the columns.

## Functions

| Function | Description | Line |
|---|---|---|
| `guihooks.graph(a, ...)` | Feeds the 'Generic Graph' UI app (stream 'genericGraphSimple'). Each argument is a table {key, value, scale, unit, renderNegatives, color}; defaults: key '#i', value 0, scale 1, unit '', renderNegatives false, color RGBA jet gradient. Returns the normalized list. Example: graph({'foo',foo}, {'bar',bar,100}, {'baz',baz,nil,'m/s',false,nil}). | 151 |
| `guihooks.graphWithCSV(filename, ...)` | Like graph, and also records each call as a row of an in-memory CSV (csvlib). The first call creates the file and sets the columns (key + unit). Write to disk with graphWithCSVWrite(). | 167 |
| `guihooks.graphWithCSVWrite()` | Writes the CSV accumulated by graphWithCSV to the file; logs an error if no CSV exists. | 185 |
| `guihooks.message(msg, ttl, category, icon, availableOptionsCount, currentOptionIndex)` | Displays a message in the UI via the 'Message' hook (data {msg, ttl, category, icon, availableOptionsCount, currentOptionIndex}). Does nothing if playerInfo.firstPlayerSeated is false. | 126 |
| `guihooks.messageForSeatedPlayers(msg, ttl, category, icon, availableOptionsCount, currentOptionIndex)` | Sends the 'Message' hook once for each seated player (playerInfo.seatedPlayers), with the field data.player. Accepts either the same arguments as message, or a single table {msg=..., ...} passed as the first argument (ttl nil). | 132 |
| `guihooks.reset()` | Sets updateStreams back to false, empties the stream cache and sends the 'VehicleReset' hook if the first player is seated. Called on a vehicle/VM reset. *(internal)* | 97 |
| `guihooks.sendStreams()` | Sends to the UI all streams cached by queueStream then empties the cache. Called by the engine (vehicle VM: from onGraphicsStep; must not be called from GE according to the code comment). *(internal)* | 88 |
| `guihooks.trigger(hookName, ...)` | Triggers the JS hook `hookName` on the UI side with the given arguments (JSON-encoded in an array). nil values are ignored. Garbage-collector sensitive (reuses a temporary table): do not modify it lightly. | 26 |
| `guihooks.triggerClient(targetDsmId, hookName, ...)` | Like trigger but for a specific UI client identified by targetDsmId. | 41 |
| `guihooks.triggerRawJS(hookName, rawJs)` | Triggers a JS hook by passing raw JS (inserted as is between brackets, no escaping or JSON encoding). To be used only with trusted text. | 54 |
| `guihooks.triggerStream(streamName, streamData)` | Immediately sends stream data to the UI under the name streamName (JSON-encoded). | 58 |

### Parameter details

#### `guihooks.graph(a, ...)`

Feeds the 'Generic Graph' UI app (stream 'genericGraphSimple'). Each argument is a table {key, value, scale, unit, renderNegatives, color}; defaults: key '#i', value 0, scale 1, unit '', renderNegatives false, color RGBA jet gradient. Returns the normalized list. Example: graph({'foo',foo}, {'bar',bar,100}, {'baz',baz,nil,'m/s',false,nil}).

- `a` (*table|nil*) : first graph {key, value, scale, unit, renderNegatives, color} (ignored if nil/false)
- `...` (*table*) : other graphs, same format
- **returns**: table[] list of graphs with default values filled in

#### `guihooks.graphWithCSV(filename, ...)`

Like graph, and also records each call as a row of an in-memory CSV (csvlib). The first call creates the file and sets the columns (key + unit). Write to disk with graphWithCSVWrite().

- `filename` (*string|nil*) : CSV file name (taken at the first call; default graphcsv.<date>.csv)
- `...` (*table*) : graphs, same arguments as graph

#### `guihooks.message(msg, ttl, category, icon, availableOptionsCount, currentOptionIndex)`

Displays a message in the UI via the 'Message' hook (data {msg, ttl, category, icon, availableOptionsCount, currentOptionIndex}). Does nothing if playerInfo.firstPlayerSeated is false.

- `msg` (*string*) : text (possibly a translation key, inferred from the UI code)
- `ttl` (*number|nil*) : display duration in seconds, default 5
- `category` (*string|nil*) : message category, default ''
- `icon` (*string|nil*) : icon
- `availableOptionsCount` (*integer|nil*) : number of options (choice menus)
- `currentOptionIndex` (*integer|nil*) : current option

#### `guihooks.messageForSeatedPlayers(msg, ttl, category, icon, availableOptionsCount, currentOptionIndex)`

Sends the 'Message' hook once for each seated player (playerInfo.seatedPlayers), with the field data.player. Accepts either the same arguments as message, or a single table {msg=..., ...} passed as the first argument (ttl nil).

- `msg` (*string|table*) : text or data table with a msg field
- `ttl` (*number|nil*) : duration, default 5
- `category` (*string|nil*) : category, default ''
- `icon` (*string|nil*) : icon
- `availableOptionsCount` (*integer|nil*) : number of options
- `currentOptionIndex` (*integer|nil*) : current option

#### `guihooks.trigger(hookName, ...)`

Triggers the JS hook `hookName` on the UI side with the given arguments (JSON-encoded in an array). nil values are ignored. Garbage-collector sensitive (reuses a temporary table): do not modify it lightly.

- `hookName` (*string*) : JS hook name
- `...` (*any*) : JSON-serializable arguments (nil ignored)

#### `guihooks.triggerClient(targetDsmId, hookName, ...)`

Like trigger but for a specific UI client identified by targetDsmId.

- `targetDsmId` (*integer*) : target client/UI identifier
- `hookName` (*string*) : JS hook name
- `...` (*any*) : arguments (nil ignored)

#### `guihooks.triggerRawJS(hookName, rawJs)`

Triggers a JS hook by passing raw JS (inserted as is between brackets, no escaping or JSON encoding). To be used only with trusted text.

- `hookName` (*string*) : JS hook name
- `rawJs` (*any*) : raw JS code converted with tostring

#### `guihooks.triggerStream(streamName, streamData)`

Immediately sends stream data to the UI under the name streamName (JSON-encoded).

- `streamName` (*string*) : stream name
- `streamData` (*any*) : JSON-serializable data

## Fields

| Field | Type | Description |
|---|---|---|
| `queueStream` | function | queueStream(key, value): caches the stream data `key` for later sending by sendStreams (vehicle VM: only if updateStreams is true). nop if neither `obj` nor `be` exists. |
| `send` | function | Alias of queueStream. |

## Calls into the engine (C++)

- `be:` `queueHookJS`, `queueStreamDataJS`
- `obj:` `queueHookJS`, `queueStreamDataJS`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/guihooks.lua`.*
