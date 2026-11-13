# `gameplay_rally_util_jsonlUtils`

*Fichier : `lua/ge/extensions/gameplay/rally/util/jsonlUtils.lua` · VM : Game Engine (GE) · 87 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_rally_util_jsonlUtils` : `extensions.load("gameplay_rally_util_jsonlUtils")`, puis la globale `gameplay_rally_util_jsonlUtils`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_rally_util_jsonlUtils.parseJsonlFile(fname, processLine, rallyUtil)` | Parse a JSONL file, calling processLine for each valid JSON line<br> Returns array of parsed objects, or nil on error<br> processLine(obj) should return the processed object or nil to skip | 39 |
| `gameplay_rally_util_jsonlUtils.readFileToMemory(fname)` | Read entire file into memory | 17 |
| `gameplay_rally_util_jsonlUtils.readJsonlLines(fname, callback)` | Simple JSONL file reader using io.lines (for backward compatibility)<br> Calls callback(obj) for each line | 70 |
| `gameplay_rally_util_jsonlUtils.splitIntoLines(content)` | Split content into lines | 27 |
| `gameplay_rally_util_jsonlUtils.startsWithDoubleSlash(line)` | Check if a line starts with a comment marker | 11 |

## Appels vers le moteur (C++)

- `FS:` `fileExists`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/rally/util/jsonlUtils.lua`.*
