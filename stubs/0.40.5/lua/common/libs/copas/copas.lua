---@meta
-- tim19Atlas stub generated from lua/common/libs/copas/copas.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Copas 2.0.2: third-party library (Kepler Project) — "Coroutine Oriented Portable Asynchronous Services", a coroutine-based dispatcher for TCP/UDP servers and clients, built on LuaSocket. Sockets are wrapped (copas.wrap) so that send/receive/connect yield instead of blocking; copas.loop or copas.step runs it all. Copas is the basis of the submodules copas.http, copas.ftp, copas.smtp, copas.timer, copas.lock, copas.semaphore and copas.limit.
--- Access: `require("libs/copas/copas")`
---@class libs_copas_copas
---@field _COPYRIGHT string Copyright Kepler Project 2005-2017.
---@field _DESCRIPTION string Coroutine Oriented Portable Asynchronous Services.
---@field _VERSION string "Copas 2.0.2".
---@field autoclose boolean If true (default), closes the connection's socket once the handler has finished.
---@field running boolean Indicates that the copas.loop loop is running (false at the start).
local libs_copas_copas = {}

--- Registers a TCP server socket and a handler called in a new coroutine for each accepted connection (function defined in the code, not listed by the automatic extractor). (dynamically assigned)
---Source: lua/common/libs/copas/copas.lua:dyn
---@param server table LuaSocket server socket
---@param handler function Handler function handler(skt) (see copas.handler)
---@param timeout number|nil Operation timeout (inferred from code)
function libs_copas_copas.addserver(server, handler, timeout) end

--- Adds a new coroutine to the dispatcher; it starts at the next loop step.
---Source: lua/common/libs/copas/copas.lua:903
---@param handler function Function run in the coroutine
---@param ... any Arguments passed to the handler
---@return thread  The coroutine created
function libs_copas_copas.addthread(handler, ...) end

--- Connects the socket and waits (yielding) for the connection to finish.
---Source: lua/common/libs/copas/copas.lua:565
---@param skt table Socket
---@param host string Host
---@param port integer Port
function libs_copas_copas.connect(skt, host, port) end

--- Asynchronous SSL handshake on a connected client socket. Returns a new SSL socket that replaces the old one; raises an error on failure.
---Source: lua/common/libs/copas/copas.lua:611
---@param skt table LuaSocket client socket
---@param sslt table SSL parameters
---@return table  SSL socket
function libs_copas_copas.dohandshake(skt, sslt) end

--- Indicates whether there is nothing left to do (no socket for reading/writing and no scheduled task).
---Source: lua/common/libs/copas/copas.lua:1166
---@return boolean  true if there is nothing left to process
function libs_copas_copas.finished() end

--- Flushes a client's write buffer (obsolete).
---Source: lua/common/libs/copas/copas.lua:651
function libs_copas_copas.flush() end

--- Wraps a handler so as to wrap the socket and perform the optional SSL handshake.
---Source: lua/common/libs/copas/copas.lua:769
---@param handler function Handler(skt)
---@param sslparams table|nil SSL parameters
---@return function  Wrapped handler
function libs_copas_copas.handler(handler, sslparams) end

--- Endless dispatcher loop: listens to and processes requests until stopped. Sets copas.running to true.
---Source: lua/common/libs/copas/copas.lua:1175
---@param initializer function|nil Function run in a coroutine at startup
---@param timeout number|nil Timeout of each step
function libs_copas_copas.loop(initializer, timeout) end

--- Reads according to a pattern on a client and yields to timeouts. For UDP, the pattern is required and must be a number.
---Source: lua/common/libs/copas/copas.lua:398
---@param client table Socket
---@param pattern string|integer|nil LuaSocket read pattern ("*l", "*a", number of bytes)
---@param part string|nil Data already received (resume)
function libs_copas_copas.receive(client, pattern, part) end

--- Like receive, but unblocks as soon as data arrives (partial reads).
---Source: lua/common/libs/copas/copas.lua:468
---@param client table Socket
---@param pattern string|integer|nil Read pattern
---@param part string|nil Data already received
function libs_copas_copas.receivePartial(client, pattern, part) end

--- Receives data from a UDP client (not available for TCP).
---Source: lua/common/libs/copas/copas.lua:438
---@param client table UDP socket
---@param size integer Maximum size
function libs_copas_copas.receivefrom(client, size) end

--- Removes a server from the dispatcher; closes it unless keep_open is true.
---Source: lua/common/libs/copas/copas.lua:882
---@param server table Server socket
---@param keep_open boolean|nil Do not close the socket
function libs_copas_copas.removeserver(server, keep_open) end

--- Removes a coroutine from the dispatcher (it is deleted at its next resume).
---Source: lua/common/libs/copas/copas.lua:912
---@param thread thread Coroutine to remove
function libs_copas_copas.removethread(thread) end

--- Sends data to a client, with buffering, yielding on timeout. from and to are ignored for UDP.
---Source: lua/common/libs/copas/copas.lua:509
---@param client table Socket
---@param data string Data
---@param from integer|nil First byte to send
---@param to integer|nil Last byte to send
function libs_copas_copas.send(client, data, from, to) end

--- Sends a UDP datagram.
---Source: lua/common/libs/copas/copas.lua:559
---@param client table UDP socket
---@param data string Data
---@param ip string Address
---@param port integer Port
function libs_copas_copas.sendto(client, data, ip, port) end

--- Sets the function called when a handler raises an error; with default true, also replaces the default handler (inferred from code).
---Source: lua/common/libs/copas/copas.lua:798
---@param err function Error handler
---@param default boolean|nil Change the default handler
function libs_copas_copas.setErrorHandler(err, default) end

--- Sets the timeout of a Copas socket.
---Source: lua/common/libs/copas/copas.lua:380
---@param skt table Socket
---@param timeout number Timeout in seconds
function libs_copas_copas.settimeout(skt, timeout) end

--- Suspends the current coroutine and wakes it after sleeptime seconds. A negative value suspends it until an explicit call to wakeup.
---Source: lua/common/libs/copas/copas.lua:926
---@param sleeptime number Duration in seconds (negative: until wakeup)
function libs_copas_copas.sleep(sleeptime) end

--- One step of the dispatcher loop: processes the ready sockets and the scheduled tasks.
---Source: lua/common/libs/copas/copas.lua:1136
---@param timeout number|nil Maximum socket wait time, in seconds
---@return boolean|nil  false if no data processed, true otherwise (or nil + error message)
function libs_copas_copas.step(timeout) end

--- Chooses to return LuaSocket's original timeout errors (true) or always "timeout" (false).
---Source: lua/common/libs/copas/copas.lua:809
---@param bool boolean Enable the original errors
function libs_copas_copas.useSocketTimeoutErrors(bool) end

--- Wakes a coroutine put to sleep by sleep.
---Source: lua/common/libs/copas/copas.lua:931
---@param co thread Coroutine to wake
function libs_copas_copas.wakeup(co) end

--- Wraps a LuaSocket socket into an asynchronous Copas socket; with sslt, enables SSL.
---Source: lua/common/libs/copas/copas.lua:755
---@param skt table LuaSocket socket
---@param sslt table|nil SSL parameters (empty table for the defaults)
---@return table  Wrapped socket
function libs_copas_copas.wrap(skt, sslt) end

--- Internal queue of sleeping coroutines (internal object).
---@class libs_copas_copas__sleeping
local libs_copas_copas__sleeping = {}

--- Inserts a sleeping coroutine (internal to the dispatcher).
---*(internal: called by the engine or the main loop)*
---Source: lua/common/libs/copas/copas.lua:58
function libs_copas_copas__sleeping.insert() end

--- Removes a sleeping coroutine (internal to the dispatcher).
---*(internal: called by the engine or the main loop)*
---Source: lua/common/libs/copas/copas.lua:58
function libs_copas_copas__sleeping.remove() end

--- LuaSocket functions redefined by Copas as coroutine-safe versions (allows using socket.http in Copas).
---@class libs_copas_copas_socket
local libs_copas_copas_socket = {}

--- Coroutine-compatible version of socket.newtry.
---Source: lua/common/libs/copas/copas.lua:83
---@param finalizer function Cleanup function
function libs_copas_copas_socket.newtry(finalizer) end

--- Coroutine-compatible version of socket.protect.
---Source: lua/common/libs/copas/copas.lua:77
---@param func function Function to protect
function libs_copas_copas_socket.protect(func) end

return libs_copas_copas
