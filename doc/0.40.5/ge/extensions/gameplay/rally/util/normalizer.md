# `gameplay_rally_util_normalizer`

*File: `lua/ge/extensions/gameplay/rally/util/normalizer.lua` · VM: Game Engine (GE) · 24 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_rally_util_normalizer`: `extensions.load("gameplay_rally_util_normalizer")`, then the global `gameplay_rally_util_normalizer`

Small text normalization utility for rally notes: successively applies a list of replacements (pattern, replacement) to a string.

## Notes

- The `from` patterns are passed to string.gsub: they are Lua patterns (not literal strings), special characters such as `-`, `%` or `.` must be escaped.

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_rally_util_normalizer.replaceWords(word_map, note)` | Applies in order each {from, to} pair of word_map to the note via gsub and returns the transformed note. If note is nil, returns it as is. | 7 |

### Parameter details

#### `gameplay_rally_util_normalizer.replaceWords(word_map, note)`

Applies in order each {from, to} pair of word_map to the note via gsub and returns the transformed note. If note is nil, returns it as is.

- `word_map` (*table<integer, string[]>*) : List of {pattern, replacement} pairs.
- `note` (*string|nil*) : Text to normalize.
- **returns**: string|nil Text after replacements, or nil if note was nil.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/rally/util/normalizer.lua`.*
