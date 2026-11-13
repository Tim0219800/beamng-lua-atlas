# `gameplay_rally_compositors_helpers_textCompositor`

*Fichier : `lua/ge/extensions/gameplay/rally/compositors/helpers/textCompositor.lua` · VM : Game Engine (GE) · 443 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/gameplay/rally/compositors/helpers/textCompositor")` (fichier sous extensions/ mais pas une extension classique)

## Classe `C`

Le module renvoie un constructeur : `local obj = require("gameplay_rally_compositors_helpers_textCompositor")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_requireCompositor()` |  | 65 |
| `C:compositePhraseEntries(structured, distBefore, distAfter, opts)` |  | 81 |
| `C:compositeText(structured, distBefore, distAfter)` |  | 71 |
| `C:compositeTextEscaped(structured, distBefore, distAfter)` |  | 76 |
| `C:compositorPath()` |  | 61 |
| `C:distanceCallsEnabled()` |  | 91 |
| `C:distanceToString(dist)` |  | 368 |
| `C:enumerateAll()` |  | 261 |
| `C:enumerateDistanceEntries()` |  | 162 |
| `C:enumerateDistances()` |  | 196 |
| `C:enumeratePacenotes()` |  | 204 |
| `C:enumerateScriptEntries()` |  | 209 |
| `C:getBaseUnit()` |  | 402 |
| `C:getConfig()` |  | 86 |
| `C:getDistanceCallShorthand(dist)` |  | 381 |
| `C:getDistanceLinks()` |  | 392 |
| `C:getLargeUnit()` |  | 405 |
| `C:getMaxDistance()` |  | 428 |
| `C:getMaxLinkDistance()` |  | 396 |
| `C:getPointTranslation()` |  | 408 |
| `C:getRoundingLarge()` |  | 422 |
| `C:getRoundingLargeThreshold()` |  | 425 |
| `C:getRoundingMedium()` |  | 415 |
| `C:getRoundingMediumThreshold()` |  | 418 |
| `C:getRoundingSmall()` |  | 412 |
| `C:getSystemPacenote(name, i)` |  | 155 |
| `C:getSystemPacenotes(missionPacenotesDirname, voicepackEntry)` | Returns a `{ name -> variants[] }` map (each variant has audioFname filled in).<br> Iteration order via pairs() is undefined; use `getSystemPacenotesOrdered()` when<br> order matters (script reader, audio generation, etc.). | 105 |
| `C:getSystemPacenotesOrdered()` | Returns the ordered { name, variants } array as authored by the style. | 97 |
| `C:init(compositorName, missionDir)` |  | 15 |
| `C:load()` |  | 27 |
| `C:pacenoteHash(text)` |  | 432 |
| `C:roundDistance(dist)` |  | 338 |
| `C:setVoicepackEntry(entry)` |  | 52 |
| `C:writeEnumerated(fname, enumerated)` |  | 334 |

## Appels vers le moteur (C++)

- `FS:` `fileExists`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/rally/compositors/helpers/textCompositor.lua`.*
