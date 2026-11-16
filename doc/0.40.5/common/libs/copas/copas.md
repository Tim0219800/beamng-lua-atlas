# `libs_copas_copas`

*File: `lua/common/libs/copas/copas.lua` · VM: Common (GE + vehicle) · 1188 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("libs/copas/copas")`

Copas 2.0.2: third-party library (Kepler Project) — "Coroutine Oriented Portable Asynchronous Services", a coroutine-based dispatcher for TCP/UDP servers and clients, built on LuaSocket. Sockets are wrapped (copas.wrap) so that send/receive/connect yield instead of blocking; copas.loop or copas.step runs it all. Copas is the basis of the submodules copas.http, copas.ftp, copas.smtp, copas.timer, copas.lock, copas.semaphore and copas.limit.

## Example

```lua
local copas = require("libs/copas/copas")
copas.addthread(function()
  copas.sleep(1)
  print("1 s later")
end)
copas.loop() -- or copas.step(0) every frame
```

## Notes

- In BeamNG, prefer copas.step(timeout) called periodically rather than copas.loop (endless loop that would block the game) (inferred from the nature of the functions).
- copas.sleep(sleeptime) with a negative value puts the coroutine to sleep until copas.wakeup(co).
- dohandshake raises an error (instead of returning nil+error) to avoid carrying on in plaintext by mistake; all references to the old socket must be replaced with the returned SSL socket.
- useSocketTimeoutErrors(true) returns LuaSocket's original errors (timeout, wantread, wantwrite, Operation already in progress); otherwise always "timeout".

## Functions

| Function | Description | Line |
|---|---|---|
| `libs_copas_copas.addserver(server, handler, timeout)` | Registers a TCP server socket and a handler called in a new coroutine for each accepted connection (function defined in the code, not listed by the automatic extractor). (dynamically assigned) | dyn |
| `libs_copas_copas.addthread(handler, ...)` | Adds a new coroutine to the dispatcher; it starts at the next loop step. | 903 |
| `libs_copas_copas.connect(skt, host, port)` | Connects the socket and waits (yielding) for the connection to finish. | 565 |
| `libs_copas_copas.dohandshake(skt, sslt)` | Asynchronous SSL handshake on a connected client socket. Returns a new SSL socket that replaces the old one; raises an error on failure. | 611 |
| `libs_copas_copas.finished()` | Indicates whether there is nothing left to do (no socket for reading/writing and no scheduled task). | 1166 |
| `libs_copas_copas.flush()` | Flushes a client's write buffer (obsolete). | 651 |
| `libs_copas_copas.handler(handler, sslparams)` | Wraps a handler so as to wrap the socket and perform the optional SSL handshake. | 769 |
| `libs_copas_copas.loop(initializer, timeout)` | Endless dispatcher loop: listens to and processes requests until stopped. Sets copas.running to true. | 1175 |
| `libs_copas_copas.receive(client, pattern, part)` | Reads according to a pattern on a client and yields to timeouts. For UDP, the pattern is required and must be a number. | 398 |
| `libs_copas_copas.receivePartial(client, pattern, part)` | Like receive, but unblocks as soon as data arrives (partial reads). | 468 |
| `libs_copas_copas.receivefrom(client, size)` | Receives data from a UDP client (not available for TCP). | 438 |
| `libs_copas_copas.removeserver(server, keep_open)` | Removes a server from the dispatcher; closes it unless keep_open is true. | 882 |
| `libs_copas_copas.removethread(thread)` | Removes a coroutine from the dispatcher (it is deleted at its next resume). | 912 |
| `libs_copas_copas.send(client, data, from, to)` | Sends data to a client, with buffering, yielding on timeout. from and to are ignored for UDP. | 509 |
| `libs_copas_copas.sendto(client, data, ip, port)` | Sends a UDP datagram. | 559 |
| `libs_copas_copas.setErrorHandler(err, default)` | Sets the function called when a handler raises an error; with default true, also replaces the default handler (inferred from code). | 798 |
| `libs_copas_copas.settimeout(skt, timeout)` | Sets the timeout of a Copas socket. | 380 |
| `libs_copas_copas.sleep(sleeptime)` | Suspends the current coroutine and wakes it after sleeptime seconds. A negative value suspends it until an explicit call to wakeup. | 926 |
| `libs_copas_copas.step(timeout)` | One step of the dispatcher loop: processes the ready sockets and the scheduled tasks. | 1136 |
| `libs_copas_copas.useSocketTimeoutErrors(bool)` | Chooses to return LuaSocket's original timeout errors (true) or always "timeout" (false). | 809 |
| `libs_copas_copas.wakeup(co)` | Wakes a coroutine put to sleep by sleep. | 931 |
| `libs_copas_copas.wrap(skt, sslt)` | Wraps a LuaSocket socket into an asynchronous Copas socket; with sslt, enables SSL. | 755 |

### Parameter details

#### `libs_copas_copas.addserver(server, handler, timeout)`

Registers a TCP server socket and a handler called in a new coroutine for each accepted connection (function defined in the code, not listed by the automatic extractor). (dynamically assigned)

- `server` (*table*) : LuaSocket server socket
- `handler` (*function*) : Handler function handler(skt) (see copas.handler)
- `timeout` (*number|nil*) : Operation timeout (inferred from code)

#### `libs_copas_copas.addthread(handler, ...)`

Adds a new coroutine to the dispatcher; it starts at the next loop step.

- `handler` (*function*) : Function run in the coroutine
- `...` (*any*) : Arguments passed to the handler
- **returns**: thread The coroutine created

#### `libs_copas_copas.connect(skt, host, port)`

Connects the socket and waits (yielding) for the connection to finish.

- `skt` (*table*) : Socket
- `host` (*string*) : Host
- `port` (*integer*) : Port

#### `libs_copas_copas.dohandshake(skt, sslt)`

Asynchronous SSL handshake on a connected client socket. Returns a new SSL socket that replaces the old one; raises an error on failure.

- `skt` (*table*) : LuaSocket client socket
- `sslt` (*table*) : SSL parameters
- **returns**: table SSL socket

#### `libs_copas_copas.finished()`

Indicates whether there is nothing left to do (no socket for reading/writing and no scheduled task).

- **returns**: boolean true if there is nothing left to process

#### `libs_copas_copas.handler(handler, sslparams)`

Wraps a handler so as to wrap the socket and perform the optional SSL handshake.

- `handler` (*function*) : Handler(skt)
- `sslparams` (*table|nil*) : SSL parameters
- **returns**: function Wrapped handler

#### `libs_copas_copas.loop(initializer, timeout)`

Endless dispatcher loop: listens to and processes requests until stopped. Sets copas.running to true.

- `initializer` (*function|nil*) : Function run in a coroutine at startup
- `timeout` (*number|nil*) : Timeout of each step

#### `libs_copas_copas.receive(client, pattern, part)`

Reads according to a pattern on a client and yields to timeouts. For UDP, the pattern is required and must be a number.

- `client` (*table*) : Socket
- `pattern` (*string|integer|nil*) : LuaSocket read pattern ("*l", "*a", number of bytes)
- `part` (*string|nil*) : Data already received (resume)

#### `libs_copas_copas.receivePartial(client, pattern, part)`

Like receive, but unblocks as soon as data arrives (partial reads).

- `client` (*table*) : Socket
- `pattern` (*string|integer|nil*) : Read pattern
- `part` (*string|nil*) : Data already received

#### `libs_copas_copas.receivefrom(client, size)`

Receives data from a UDP client (not available for TCP).

- `client` (*table*) : UDP socket
- `size` (*integer*) : Maximum size

#### `libs_copas_copas.removeserver(server, keep_open)`

Removes a server from the dispatcher; closes it unless keep_open is true.

- `server` (*table*) : Server socket
- `keep_open` (*boolean|nil*) : Do not close the socket

#### `libs_copas_copas.removethread(thread)`

Removes a coroutine from the dispatcher (it is deleted at its next resume).

- `thread` (*thread*) : Coroutine to remove

#### `libs_copas_copas.send(client, data, from, to)`

Sends data to a client, with buffering, yielding on timeout. from and to are ignored for UDP.

- `client` (*table*) : Socket
- `data` (*string*) : Data
- `from` (*integer|nil*) : First byte to send
- `to` (*integer|nil*) : Last byte to send

#### `libs_copas_copas.sendto(client, data, ip, port)`

Sends a UDP datagram.

- `client` (*table*) : UDP socket
- `data` (*string*) : Data
- `ip` (*string*) : Address
- `port` (*integer*) : Port

#### `libs_copas_copas.setErrorHandler(err, default)`

Sets the function called when a handler raises an error; with default true, also replaces the default handler (inferred from code).

- `err` (*function*) : Error handler
- `default` (*boolean|nil*) : Change the default handler

#### `libs_copas_copas.settimeout(skt, timeout)`

Sets the timeout of a Copas socket.

- `skt` (*table*) : Socket
- `timeout` (*number*) : Timeout in seconds

#### `libs_copas_copas.sleep(sleeptime)`

Suspends the current coroutine and wakes it after sleeptime seconds. A negative value suspends it until an explicit call to wakeup.

- `sleeptime` (*number*) : Duration in seconds (negative: until wakeup)

#### `libs_copas_copas.step(timeout)`

One step of the dispatcher loop: processes the ready sockets and the scheduled tasks.

- `timeout` (*number|nil*) : Maximum socket wait time, in seconds
- **returns**: boolean|nil false if no data processed, true otherwise (or nil + error message)

#### `libs_copas_copas.useSocketTimeoutErrors(bool)`

Chooses to return LuaSocket's original timeout errors (true) or always "timeout" (false).

- `bool` (*boolean*) : Enable the original errors

#### `libs_copas_copas.wakeup(co)`

Wakes a coroutine put to sleep by sleep.

- `co` (*thread*) : Coroutine to wake

#### `libs_copas_copas.wrap(skt, sslt)`

Wraps a LuaSocket socket into an asynchronous Copas socket; with sslt, enables SSL.

- `skt` (*table*) : LuaSocket socket
- `sslt` (*table|nil*) : SSL parameters (empty table for the defaults)
- **returns**: table Wrapped socket

## Fields

| Field | Type | Description |
|---|---|---|
| `_COPYRIGHT` | string | Copyright Kepler Project 2005-2017. |
| `_DESCRIPTION` | string | Coroutine Oriented Portable Asynchronous Services. |
| `_VERSION` | string | "Copas 2.0.2". |
| `autoclose` | boolean | If true (default), closes the connection's socket once the handler has finished. |
| `running` | boolean | Indicates that the copas.loop loop is running (false at the start). |

## Class `_sleeping`

Internal queue of sleeping coroutines (internal object).

Object `_sleeping` built inside the module (e.g. by `new`), with these methods:

| Method | Description | Line |
|---|---|---|
| `_sleeping.insert()` | Inserts a sleeping coroutine (internal to the dispatcher). | 58 |
| `_sleeping.remove()` | Removes a sleeping coroutine (internal to the dispatcher). | 58 |

## Class `socket`

LuaSocket functions redefined by Copas as coroutine-safe versions (allows using socket.http in Copas).

| Method | Description | Line |
|---|---|---|
| `socket.newtry(finalizer)` | Coroutine-compatible version of socket.newtry. | 83 |
| `socket.protect(func)` | Coroutine-compatible version of socket.protect. | 77 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/libs/copas/copas.lua`.*
