# `epnf`

*File: `lua/common/libs/lua-luaepnf/epnf.lua` · VM: Common (GE + vehicle) · 219 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** global `epnf`

lua-luaepnf: third-party library (Gerhard Lipp) that makes it easy to define LPeg grammars in an EBNF-like syntax, with an automatic syntax tree (AST) and parsing error messages. Here it relies on LuLPeg (libs/LuLPeg/lulpeg), a pure-Lua reimplementation of LPeg. Limited role for a modder: parsing a custom language or text format.

## Example

```lua
local epnf = require('libs/lua-luaepnf/epnf')
local g = epnf.define(function(_ENV)
  START 'expr'
  expr = ID * (P'+' * ID)^0 * EOF()
end)
local ast = epnf.parsestring(g, 'a+b')
```

## Notes

- In the file, 'epnf' is a local variable of the module (the auto doc says it is global).
- raise (and parsing errors) write the message with print() to standard output (the faulty line and a ^ marker), without raising an exception; only define raises an assertion 'no start rule defined' if no START rule is defined.
- Rule names are created by assignment in the environment; those declared by SUPPRESS do not generate an AST node.

## Functions

| Function | Description | Line |
|---|---|---|
| `epnf.define(func, g, e)` | Prepares an environment where grammar rules are defined by simple assignment (name = pattern) with LPeg shortcuts (uppercase) and the helpers START, SUPPRESS, E, EOF, ID, W, WS. Each rule produces an AST node {id=name, pos=position, ...}. | 108 |
| `epnf.dumpast(node)` | Writes an indented representation of the AST to stderr (debugging). | 208 |
| `epnf.parse(g, name, input, ...)` | Applies a grammar to a string and returns the AST. | 158 |
| `epnf.parsefile(g, fname, ...)` | Reads a whole file then applies the grammar. Raises an error if the file cannot be opened. | 164 |
| `epnf.parsestring(g, str, ...)` | Like parse, with an input name generated from the first 20 characters of the text. | 174 |
| `epnf.raise(n, msg, s, p)` | Reports a semantic validation error of the AST: prints 'name:line: message', the faulty line and a marker under the position (assert p <= #s). | 51 |

### Parameter details

#### `epnf.define(func, g, e)`

Prepares an environment where grammar rules are defined by simple assignment (name = pattern) with LPeg shortcuts (uppercase) and the helpers START, SUPPRESS, E, EOF, ID, W, WS. Each rule produces an AST node {id=name, pos=position, ...}.

- `func` (*function*) : Definition function; receives the environment as argument (and its environment is replaced under Lua 5.1).
- `g` (*table|nil*) : Existing grammar table to complete.
- `e` (*table|nil*) : Fallback environment for unknown names (default: func's environment, or _G).
- **returns**: table Grammar usable with parse/parsestring/parsefile.

#### `epnf.dumpast(node)`

Writes an indented representation of the AST to stderr (debugging).

- `node` (*table*) : Root node.

#### `epnf.parse(g, name, input, ...)`

Applies a grammar to a string and returns the AST.

- `g` (*table*) : Grammar.
- `name` (*string*) : Input name for error messages.
- `input` (*string*) : Text to parse.
- `...` (*any*) : Extra arguments passed to the matching.
- **returns**: table|nil AST.
- **returns**: string name.
- **returns**: string input.

#### `epnf.parsefile(g, fname, ...)`

Reads a whole file then applies the grammar. Raises an error if the file cannot be opened.

- `g` (*table*) : Grammar.
- `fname` (*string*) : File path.
- `...` (*any*) : Extra arguments.
- **returns**: table|nil AST.
- **returns**: string Name (the path).
- **returns**: string Content.

#### `epnf.parsestring(g, str, ...)`

Like parse, with an input name generated from the first 20 characters of the text.

- `g` (*table*) : Grammar.
- `str` (*string*) : Text.
- `...` (*any*) : Extra arguments.
- **returns**: table|nil AST.
- **returns**: string Generated name.
- **returns**: string Text.

#### `epnf.raise(n, msg, s, p)`

Reports a semantic validation error of the AST: prints 'name:line: message', the faulty line and a marker under the position (assert p <= #s).

- `n` (*string*) : Input name.
- `msg` (*string*) : Message.
- `s` (*string*) : Parsed text.
- `p` (*integer*) : Position in the text.

## Class `env_index`

Table of helpers visible in the function passed to define (with START and SUPPRESS in addition).

Object `env_index` built inside the module (e.g. by `new`), with these methods:

| Method | Description | Line |
|---|---|---|
| `env_index.E(msg)` | LPeg pattern that reports a parsing error with the given message. | 91 |
| `env_index.EOF(msg)` | LPeg pattern: end of input, otherwise error with the given message. | 94 |
| `env_index.W(s)` | LPeg pattern: keyword s, not followed by a letter, digit or _ . | 100 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/libs/lua-luaepnf/epnf.lua`.*
