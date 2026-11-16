# `core_reproGuard`

*File: `lua/ge/extensions/core/reproGuard.lua` · VM: Game Engine (GE) · 111 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `core_reproGuard`: `extensions.load("core_reproGuard")`, then the global `core_reproGuard`

Security guard for the v1/runRepro schema command: decides whether a decoded command line may be passed to run_repro.bat, based on an allowlist of glob patterns. The pure logic (isAllowed) is separated from reading the allowlist file (loadPatterns).

## Example

```lua
local ok, reason = core_reproGuard.isCommandAllowed(cmd)
```

## Notes

- The allowlist is read from /DevTools/tests/micropy/resources/repro_allowlist.json, field permissions.allow (array of patterns). If the file is missing or invalid, the list is empty so everything is refused (fail closed).
- The characters < > ^ ` " and control characters (including CR/LF) are forbidden everywhere in the command.
- The command is split on && || ; | & ; each segment must match at least one pattern. In a pattern, '*' stands for any sequence of characters; other characters are literal.
- Only leading spaces of a segment are removed; the trailing space stays in the segment.

## Functions

| Function | Description | Line |
|---|---|---|
| `core_reproGuard.isAllowed(command, patterns)` | Pure function: tests whether command satisfies the pattern list. Refuses an empty command, one with a forbidden character, an empty list, or one with a segment matching no pattern. | 64 |
| `core_reproGuard.isCommandAllowed(command)` | Shortcut: loads the patterns from disk then calls isAllowed. | 106 |
| `core_reproGuard.loadPatterns()` | Reads the allowed patterns from the allowlist JSON file. Logs an error and returns {} if the file is missing or malformed. | 95 |

### Parameter details

#### `core_reproGuard.isAllowed(command, patterns)`

Pure function: tests whether command satisfies the pattern list. Refuses an empty command, one with a forbidden character, an empty list, or one with a segment matching no pattern.

- `command` (*string*) : Decoded command line.
- `patterns` (*string[]*) : Allowed glob patterns.
- **returns**: boolean true if allowed.
- **returns**: string 'ok' or the reason for the refusal (empty command, forbidden shell metacharacter, empty allowlist, no command segments, segment not allowed: ...).

#### `core_reproGuard.isCommandAllowed(command)`

Shortcut: loads the patterns from disk then calls isAllowed.

- `command` (*string*) : Command line.
- **returns**: boolean true if allowed.
- **returns**: string Reason.

#### `core_reproGuard.loadPatterns()`

Reads the allowed patterns from the allowlist JSON file. Logs an error and returns {} if the file is missing or malformed.

- **returns**: string[] permissions.allow patterns, or {}.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/core/reproGuard.lua`.*
