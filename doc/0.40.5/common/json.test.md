# `json_test`

*Fichier : `lua/common/json.test.lua` · VM : Commun (GE + véhicule) · 223 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("json.test")`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `json_test.testJsonDecodeArrayString(ctx)` | Tests decoding a plain JSON array string. | 28 |
| `json_test.testJsonDecodeComments(ctx)` | Tests comment handling in both object and array contexts. | 85 |
| `json_test.testJsonDecodeEscapes(ctx)` | Tests string escape decoding. | 103 |
| `json_test.testJsonDecodeFromBuffer(ctx)` | Tests decode path that takes a string.buffer instance. | 37 |
| `json_test.testJsonDecodeInfinityTokens(ctx)` | Tests Infinity spellings accepted by SJSON parser. | 121 |
| `json_test.testJsonDecodeInvalidInputType(ctx)` | Tests invalid input type raises an error. | 194 |
| `json_test.testJsonDecodeInvalidNumberTokens(ctx)` | Tests malformed number/Infinity tokens rejected by parser rules. | 129 |
| `json_test.testJsonDecodeInvalidString(ctx)` | Tests invalid text returns an error via pcall. | 186 |
| `json_test.testJsonDecodeMalformedCases(ctx)` | Tests malformed JSON/SJSON inputs fail decoding. | 202 |
| `json_test.testJsonDecodeMissingCommasAccepted(ctx)` | Tests permissive parsing where commas may be omitted. | 65 |
| `json_test.testJsonDecodeNil(ctx)` | Tests decode(nil) returns nil. | 14 |
| `json_test.testJsonDecodeNumbers(ctx)` | Tests number parsing variants supported by the parser. | 112 |
| `json_test.testJsonDecodeObjectString(ctx)` | Tests decoding a plain JSON object string. | 19 |
| `json_test.testJsonDecodeSjsonFeatures(ctx)` | Tests SJSON-like features expected by BeamNG parser. | 47 |
| `json_test.testJsonDecodeTopLevelAssignments(ctx)` | Tests top-level key/value format without surrounding braces. | 76 |
| `json_test.testJsonEncodeDecodeRoundtrip(ctx)` | Tests encode/decode roundtrip for nested values. | 167 |
| `json_test.testJsonEncodeDecodeVec3Quat(ctx)` | Tests encode/decode behavior for BeamNG special cdata-like types. | 145 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/json.test.lua`.*
