# `csvFile`

*File: `lua/common/csvlib.lua` · VM: Common (GE + vehicle) · 171 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** global `csvFile`, `csvLog`, `csvfile`, `dataToCSV`, `trajectoryToCSV2`

Library for writing and reading CSV/TSV files. newCSV/newTSV create a writer (csvWriter) to which rows are added with add, then the file is written with write (timestamped name) or the text is retrieved with dump. readFileCSV and decode read a CSV (RFC 4180) back into an array of rows. Useful for recording telemetry or curves from a mod.

## Example

```lua
local csv = require('csvlib').newCSV('t', 'rpm', 'torque')
csv:add(0.0, 800, 120)
csv:add(0.1, 900, 130)
local name = csv:write('mylog')  -- mylog_2026-...csv
local rows = require('csvlib').readFileCSV(name)
```

## Notes

- The file requires 'utils'; write uses writeFile (global) and readFileCSV uses readFile (global).
- Numbers are written in %.10g format; booleans are 1/0; nil gives an empty cell; strings are quoted if necessary (separator, quote, CR, LF, or starts with a space/control character).
- The default file name comes from the first letters of the headers (headernym), otherwise 'csv' or 'tsv'.
- write appends _YYYY-MM-DDTHH_MM_SS.ext unless the 4th character from the end of the name is a dot (name already has a 3-letter extension).
- decode converts to number the unquoted fields that start with a digit, + or - when tonumber succeeds; ignores spaces/tabs around values; removes trailing empty cells and trailing empty lines.
- Quoted cells remain strings, even if they look like a number.
- The headernym field is only defined if headers are passed to newCSV/newTSV, and only the first letter is kept (underscore for an empty header); add(...) with the headers writes the first row.

## Functions

| Function | Description | Line |
|---|---|---|
| `csvFile.decode(s, sep)` | Decodes CSV text (RFC 4180) into an array of rows of cells. | 99 |
| `csvFile.newCSV(...)` | Creates a CSV writer (comma separator). Any arguments form the header row. | 38 |
| `csvFile.newTSV(...)` | Creates a TSV writer (tab separator). Any arguments form the header row. | 42 |
| `csvFile.readFileCSV(filename, sep)` | Reads a file via readFile then decodes it with decode. | 163 |

### Parameter details

#### `csvFile.decode(s, sep)`

Decodes CSV text (RFC 4180) into an array of rows of cells.

- `s` (*string|nil*) : CSV content.
- `sep` (*string|nil*) : Separator (default ',').
- **returns**: table[]|nil Rows of cells (numbers or strings); nil if s is nil.

#### `csvFile.newCSV(...)`

Creates a CSV writer (comma separator). Any arguments form the header row.

- `...` (*any*) : Column names (optional).
- **returns**: table csvWriter object.

#### `csvFile.newTSV(...)`

Creates a TSV writer (tab separator). Any arguments form the header row.

- `...` (*any*) : Column names (optional).
- **returns**: table csvWriter object.

#### `csvFile.readFileCSV(filename, sep)`

Reads a file via readFile then decodes it with decode.

- `filename` (*string*) : File path.
- `sep` (*string|nil*) : Separator (first character used, default ',').
- **returns**: table[]|nil Array of rows, each row being an array of values; nil if the file is unreadable.

## Class `csvWriter`

Object returned by newCSV/newTSV. Accumulates the text in a string.buffer.

| Method | Description | Line |
|---|---|---|
| `csvWriter:add(...)` | Adds a row of cells (numbers, booleans, strings or nil). | 46 |
| `csvWriter:dump()` | Returns all the accumulated content as text. | 84 |
| `csvWriter:write(filename)` | Writes the content to a file (see notes for naming). | 88 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/csvlib.lua`.*
