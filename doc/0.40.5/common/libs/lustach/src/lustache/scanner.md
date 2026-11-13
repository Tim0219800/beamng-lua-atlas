# `libs_lustach_src_lustache_scanner`

*Fichier : `lua/common/libs/lustach/src/lustache/scanner.lua` · VM : Commun (GE + véhicule) · 58 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("libs/lustach/src/lustache/scanner")`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `libs_lustach_src_lustache_scanner.eos(self)` | Returns `true` if the tail is empty (end of string). | 7 |
| `libs_lustach_src_lustache_scanner.new(self, str)` |  | 48 |
| `libs_lustach_src_lustache_scanner.scan(self, pattern)` | Tries to match the given regular expression at the current position.<br> Returns the matched text if it can match, `null` otherwise. | 13 |
| `libs_lustach_src_lustache_scanner.scan_until(self, pattern)` | Skips all text until the given regular expression can be matched. Returns<br> the skipped string, which is the entire tail of this scanner if no match<br> can be made. | 28 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/libs/lustach/src/lustache/scanner.lua`.*
