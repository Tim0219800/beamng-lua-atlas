# `libs_luasocket_socket_url`

*Fichier : `lua/common/libs/luasocket/socket/url.lua` · VM : Commun (GE + véhicule) · 308 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("libs/luasocket/socket/url")`

URI parsing, composition and relative URL resolution
 LuaSocket toolkit.
 Author: Diego Nehab
 Declare module

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `libs_luasocket_socket_url.absolute(base_url, relative_url)` | Builds a absolute URL from a base and a relative URL according to RFC 2396<br> Input<br>   base_url<br>   relative_url<br> Returns<br>   corresponding absolute url | 221 |
| `libs_luasocket_socket_url.build(parsed)` | Rebuilds a parsed URL from its components.<br> Components are protected if any reserved or unallowed characters are found<br> Input<br>   parsed: parsed URL, as returned by parse<br> Returns<br>   a stringing with the corresponding URL | 185 |
| `libs_luasocket_socket_url.build_path(parsed, unsafe)` | Builds a path component from its segments, escaping protected characters.<br> Input<br>   parsed: path segments<br>   unsafe: if true, segments are not protected before path is built<br> Returns<br>   path: corresponding path stringing | 281 |
| `libs_luasocket_socket_url.escape(s)` | Encodes a string into its escaped hexadecimal representation<br> Input<br>   s: binary string to be encoded<br> Returns<br>   escaped representation of string binary | 30 |
| `libs_luasocket_socket_url.parse(url, default)` | Parses a url and returns a table with all its parts according to RFC 2396<br> The following grammar describes the names given to the URL parts<br> <url> ::= <scheme>://<authority>/<path>;<params>?<query>#<fragment><br> <authority> ::= <userinfo>@<host>:<port><br> <userinfo> ::= <user>[:<password>]<br> <path> :: = {<segment>/}<segment><br> Input<br>   url: uniform resource locator of request<br>   default: table with default values for each field<br> Returns<br>   table with the following fields, where RFC naming conventions have<br>   been preserved:<br>     scheme, authority, userinfo, user, password, host, port,<br>     path, params, query, fragment<br> Obs:<br>   the leading '/' in {/<path>} is considered part of <path> | 126 |
| `libs_luasocket_socket_url.parse_path(path)` | Breaks a path into its segments, unescaping the segments<br> Input<br>   path<br> Returns<br>   segment: a table with one entry per segment | 260 |
| `libs_luasocket_socket_url.unescape(s)` | Encodes a string into its escaped hexadecimal representation<br> Input<br>   s: binary string to be encoded<br> Returns<br>   escaped representation of string binary | 73 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `_VERSION` | string | Module version |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/libs/luasocket/socket/url.lua`.*
