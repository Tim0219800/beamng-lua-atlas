---@meta
-- tim19Atlas stub generated from lua/common/libs/copas/copas.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Copas is free software: it can be used for both academic and commercial purposes at absolutely no
--- cost. There are no royalties or GNU-like "copyleft" restrictions. Copas qualifies as Open Source
--- software. Its licenses are compatible with GPL. Copas is not in the public domain and the Kepler
--- Project keep its copyright. The legal details are below.
---
--- The spirit of the license is that you are free to use Copas for any purpose at no cost without having
--- to ask us. The only requirement is that if you do use Copas, then you should give us credit by
--- including the appropriate copyright notice somewhere in your product or its documentation.
---
--- Copas was designed and implemented by Andr� Carregal and Javier Guerra. The implementation is not
--- derived from licensed software.
---
--- Copyright � 2005-2010 Kepler Project.
---
--- Permission is hereby granted, free of charge, to any person obtaining a copy of this software and
--- associated documentation files (the "Software"), to deal in the Software without restriction,
--- including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense,
--- and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so,
--- subject to the following conditions:
---
--- The above copyright notice and this permission notice shall be included in all copies or substantial
--- portions of the Software.
---
--- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT
--- LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN
--- NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
--- WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
--- SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
--- --
---  Copas - Coroutine Oriented Portable Asynchronous Services
---  A dispatcher based on coroutines that can be used by TCP/IP servers.
---  Uses LuaSocket as the interface with the TCP/IP stack.
---  Authors: Andre Carregal, Javier Guerra, and Fabio Mascarenhas
---  Contributors: Diego Nehab, Mike Pall, David Burgess, Leonardo Godinho,
---                Thomas Harning Jr., and Gary NG
---  Copyright 2005-2016 - Kepler Project (www.keplerproject.org)
---  $Id: copas.lua,v 1.37 2009/04/07 22:09:52 carregal Exp $
--- Accès : `require("libs/copas/copas")`
---@class libs_copas_copas
---@field _COPYRIGHT string
---@field _DESCRIPTION string
---@field _VERSION string
---@field autoclose boolean
---@field running boolean
local libs_copas_copas = {}

--- Adds an new coroutine thread to Copas dispatcher
---Source : lua/common/libs/copas/copas.lua:903
---@param handler any
---@param ... any
function libs_copas_copas.addthread(handler, ...) end

--- waits until connection is completed
---Source : lua/common/libs/copas/copas.lua:565
---@param skt any
---@param host any
---@param port any
function libs_copas_copas.connect(skt, host, port) end

--- Peforms an (async) ssl handshake on a connected TCP client socket.
---  NOTE: replace all previous socket references, with the returned new ssl wrapped socket
---  Throws error and does not return nil+error, as that might silently fail
---  in code like this;
---    copas.addserver(s1, function(skt)
---        skt = copas.wrap(skt, sparams)
---        skt:dohandshake()   --> without explicit error checking, this fails silently and
---        skt:send(body)      --> continues unencrypted
---  @param skt Regular LuaSocket CLIENT socket object
---  @param sslt Table with ssl parameters
---  @return wrapped ssl socket, or throws an error
---Source : lua/common/libs/copas/copas.lua:611
---@param skt any
---@param sslt any
function libs_copas_copas.dohandshake(skt, sslt) end

--- Check whether there is something to do.
---  returns false if there are no sockets for read/write nor tasks scheduled
---  (which means Copas is in an empty spin)
---Source : lua/common/libs/copas/copas.lua:1166
function libs_copas_copas.finished() end

--- flushes a client write buffer (deprecated)
---Source : lua/common/libs/copas/copas.lua:651
function libs_copas_copas.flush() end

--- Wraps a handler in a function that deals with wrapping the socket and doing the
---  optional ssl handshake.
---Source : lua/common/libs/copas/copas.lua:769
---@param handler any
---@param sslparams any
function libs_copas_copas.handler(handler, sslparams) end

--- Dispatcher endless loop.
---  Listen to client requests and handles them forever
---Source : lua/common/libs/copas/copas.lua:1175
---@param initializer any
---@param timeout any
function libs_copas_copas.loop(initializer, timeout) end

--- reads a pattern from a client and yields to the reading set on timeouts
---  UDP: a UDP socket expects a second argument to be a number, so it MUST
---  be provided as the 'pattern' below defaults to a string. Will throw a
---  'bad argument' error if omitted.
---Source : lua/common/libs/copas/copas.lua:398
---@param client any
---@param pattern any
---@param part any
function libs_copas_copas.receive(client, pattern, part) end

--- same as above but with special treatment when reading chunks,
---  unblocks on any data received.
---Source : lua/common/libs/copas/copas.lua:468
---@param client any
---@param pattern any
---@param part any
function libs_copas_copas.receivePartial(client, pattern, part) end

--- receives data from a client over UDP. Not available for TCP.
---  (this is a copy of receive() method, adapted for receivefrom() use)
---Source : lua/common/libs/copas/copas.lua:438
---@param client any
---@param size any
function libs_copas_copas.receivefrom(client, size) end

---Source : lua/common/libs/copas/copas.lua:882
---@param server any
---@param keep_open any
function libs_copas_copas.removeserver(server, keep_open) end

---Source : lua/common/libs/copas/copas.lua:912
---@param thread any
function libs_copas_copas.removethread(thread) end

--- sends data to a client. The operation is buffered and
---  yields to the writing set on timeouts
---  Note: from and to parameters will be ignored by/for UDP sockets
---Source : lua/common/libs/copas/copas.lua:509
---@param client any
---@param data any
---@param from any
---@param to any
function libs_copas_copas.send(client, data, from, to) end

---Source : lua/common/libs/copas/copas.lua:559
---@param client any
---@param data any
---@param ip any
---@param port any
function libs_copas_copas.sendto(client, data, ip, port) end

---Source : lua/common/libs/copas/copas.lua:798
---@param err any
---@param default any
function libs_copas_copas.setErrorHandler(err, default) end

---Source : lua/common/libs/copas/copas.lua:380
---@param skt any
---@param timeout any
function libs_copas_copas.settimeout(skt, timeout) end

--- yields the current coroutine and wakes it after 'sleeptime' seconds.
---  If sleeptime < 0 then it sleeps until explicitly woken up using 'wakeup'
---Source : lua/common/libs/copas/copas.lua:926
---@param sleeptime any
function libs_copas_copas.sleep(sleeptime) end

--- Dispatcher loop step.
---  Listen to client requests and handles them
---  Returns false if no socket-data was handled, or true if there was data
---  handled (or nil + error message)
---Source : lua/common/libs/copas/copas.lua:1136
---@param timeout any
function libs_copas_copas.step(timeout) end

--- if `bool` is truthy, then the original socket errors will be returned in case of timeouts;
---  `timeout, wantread, wantwrite, Operation already in progress`. If falsy, it will always
---  return `timeout`.
---Source : lua/common/libs/copas/copas.lua:809
---@param bool any
function libs_copas_copas.useSocketTimeoutErrors(bool) end

--- Wakes up a sleeping coroutine 'co'.
---Source : lua/common/libs/copas/copas.lua:931
---@param co any
function libs_copas_copas.wakeup(co) end

--- Wraps a LuaSocket socket object in an async Copas based socket object.
---  @param skt The socket to wrap
---  @sslt (optional) Table with ssl parameters, use an empty table to use ssl with defaults
---  @return wrapped socket object
---Source : lua/common/libs/copas/copas.lua:755
---@param skt any
---@param sslt any
function libs_copas_copas.wrap(skt, sslt) end

--- Classe locale `_sleeping` de lua/common/libs/copas/copas.lua
---@class libs_copas_copas__sleeping
local libs_copas_copas__sleeping = {}

--- 100ms
---Source : lua/common/libs/copas/copas.lua:58
function libs_copas_copas__sleeping.insert() end

--- 100ms
---Source : lua/common/libs/copas/copas.lua:58
function libs_copas_copas__sleeping.remove() end

--- Classe locale `socket` de lua/common/libs/copas/copas.lua
---@class libs_copas_copas_socket
local libs_copas_copas_socket = {}

---Source : lua/common/libs/copas/copas.lua:83
---@param finalizer any
function libs_copas_copas_socket.newtry(finalizer) end

---Source : lua/common/libs/copas/copas.lua:77
---@param func any
function libs_copas_copas_socket.protect(func) end

return libs_copas_copas
