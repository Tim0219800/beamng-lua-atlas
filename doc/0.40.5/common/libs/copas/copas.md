# `libs_copas_copas`

*Fichier : `lua/common/libs/copas/copas.lua` · VM : Commun (GE + véhicule) · 1188 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("libs/copas/copas")`

Copas is free software: it can be used for both academic and commercial purposes at absolutely no
cost. There are no royalties or GNU-like "copyleft" restrictions. Copas qualifies as Open Source
software. Its licenses are compatible with GPL. Copas is not in the public domain and the Kepler
Project keep its copyright. The legal details are below.

The spirit of the license is that you are free to use Copas for any purpose at no cost without having
to ask us. The only requirement is that if you do use Copas, then you should give us credit by
including the appropriate copyright notice somewhere in your product or its documentation.

Copas was designed and implemented by Andr� Carregal and Javier Guerra. The implementation is not
derived from licensed software.

Copyright � 2005-2010 Kepler Project.

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and
associated documentation files (the "Software"), to deal in the Software without restriction,
including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense,
and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial
portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT
LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN
NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
--
 Copas - Coroutine Oriented Portable Asynchronous Services
 A dispatcher based on coroutines that can be used by TCP/IP servers.
 Uses LuaSocket as the interface with the TCP/IP stack.
 Authors: Andre Carregal, Javier Guerra, and Fabio Mascarenhas
 Contributors: Diego Nehab, Mike Pall, David Burgess, Leonardo Godinho,
               Thomas Harning Jr., and Gary NG
 Copyright 2005-2016 - Kepler Project (www.keplerproject.org)
 $Id: copas.lua,v 1.37 2009/04/07 22:09:52 carregal Exp $

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `libs_copas_copas.addthread(handler, ...)` | Adds an new coroutine thread to Copas dispatcher | 903 |
| `libs_copas_copas.connect(skt, host, port)` | waits until connection is completed | 565 |
| `libs_copas_copas.dohandshake(skt, sslt)` | Peforms an (async) ssl handshake on a connected TCP client socket.<br> NOTE: replace all previous socket references, with the returned new ssl wrapped socket<br> Throws error and does not return nil+error, as that might silently fail<br> in code like this;<br>   copas.addserver(s1, function(skt)<br>       skt = copas.wrap(skt, sparams)<br>       skt:dohandshake()   --> without explicit error checking, this fails silently and<br>       skt:send(body)      --> continues unencrypted<br> @param skt Regular LuaSocket CLIENT socket object<br> @param sslt Table with ssl parameters<br> @return wrapped ssl socket, or throws an error | 611 |
| `libs_copas_copas.finished()` | Check whether there is something to do.<br> returns false if there are no sockets for read/write nor tasks scheduled<br> (which means Copas is in an empty spin) | 1166 |
| `libs_copas_copas.flush()` | flushes a client write buffer (deprecated) | 651 |
| `libs_copas_copas.handler(handler, sslparams)` | Wraps a handler in a function that deals with wrapping the socket and doing the<br> optional ssl handshake. | 769 |
| `libs_copas_copas.loop(initializer, timeout)` | Dispatcher endless loop.<br> Listen to client requests and handles them forever | 1175 |
| `libs_copas_copas.receive(client, pattern, part)` | reads a pattern from a client and yields to the reading set on timeouts<br> UDP: a UDP socket expects a second argument to be a number, so it MUST<br> be provided as the 'pattern' below defaults to a string. Will throw a<br> 'bad argument' error if omitted. | 398 |
| `libs_copas_copas.receivePartial(client, pattern, part)` | same as above but with special treatment when reading chunks,<br> unblocks on any data received. | 468 |
| `libs_copas_copas.receivefrom(client, size)` | receives data from a client over UDP. Not available for TCP.<br> (this is a copy of receive() method, adapted for receivefrom() use) | 438 |
| `libs_copas_copas.removeserver(server, keep_open)` |  | 882 |
| `libs_copas_copas.removethread(thread)` |  | 912 |
| `libs_copas_copas.send(client, data, from, to)` | sends data to a client. The operation is buffered and<br> yields to the writing set on timeouts<br> Note: from and to parameters will be ignored by/for UDP sockets | 509 |
| `libs_copas_copas.sendto(client, data, ip, port)` |  | 559 |
| `libs_copas_copas.setErrorHandler(err, default)` |  | 798 |
| `libs_copas_copas.settimeout(skt, timeout)` |  | 380 |
| `libs_copas_copas.sleep(sleeptime)` | yields the current coroutine and wakes it after 'sleeptime' seconds.<br> If sleeptime < 0 then it sleeps until explicitly woken up using 'wakeup' | 926 |
| `libs_copas_copas.step(timeout)` | Dispatcher loop step.<br> Listen to client requests and handles them<br> Returns false if no socket-data was handled, or true if there was data<br> handled (or nil + error message) | 1136 |
| `libs_copas_copas.useSocketTimeoutErrors(bool)` | if `bool` is truthy, then the original socket errors will be returned in case of timeouts;<br> `timeout, wantread, wantwrite, Operation already in progress`. If falsy, it will always<br> return `timeout`. | 809 |
| `libs_copas_copas.wakeup(co)` | Wakes up a sleeping coroutine 'co'. | 931 |
| `libs_copas_copas.wrap(skt, sslt)` | Wraps a LuaSocket socket object in an async Copas based socket object.<br> @param skt The socket to wrap<br> @sslt (optional) Table with ssl parameters, use an empty table to use ssl with defaults<br> @return wrapped socket object | 755 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `_COPYRIGHT` | string | Meta information is public even if beginning with an "_" |
| `_DESCRIPTION` | string |  |
| `_VERSION` | string |  |
| `autoclose` | boolean | Close the socket associated with the current connection after the handler finishes |
| `running` | boolean | indicator for the loop running |

## Classe `_sleeping`

Objet `_sleeping` construit dans le module (par ex. par `new`), avec ces méthodes :

| Méthode | Description | Ligne |
|---|---|---|
| `_sleeping.insert()` | 100ms | 58 |
| `_sleeping.remove()` | 100ms | 58 |

## Classe `socket`

| Méthode | Description | Ligne |
|---|---|---|
| `socket.newtry(finalizer)` |  | 83 |
| `socket.protect(func)` |  | 77 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/libs/copas/copas.lua`.*
