# `gameplay_rally_compositors_helpers_compositorUtil`

*Fichier : `lua/ge/extensions/gameplay/rally/compositors/helpers/compositorUtil.lua` · VM : Game Engine (GE) · 863 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_rally_compositors_helpers_compositorUtil` : `extensions.load("gameplay_rally_compositors_helpers_compositorUtil")`, puis la globale `gameplay_rally_compositors_helpers_compositorUtil`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_rally_compositors_helpers_compositorUtil.compositeFromPhrases(config, structured, rawDistanceBefore, rawDistanceAfter, escapeVars)` |  | 556 |
| `gameplay_rally_compositors_helpers_compositorUtil.compositePhraseEntries(config, structured, rawDistanceBefore, rawDistanceAfter, opts)` | Walks structured items in fixed slot order, dispatches per type, and prepends/appends distance-call<br> placeholders. Unknown item types and unrenderable values silently drop their<br> sub-phrase. Items are spoken back-to-back with no auto-inserted item-to-item<br> connective; cross-pacenote links ("into" / "and") come from the<br> distance-driven link list when the active style enables distance calls. | 455 |
| `gameplay_rally_compositors_helpers_compositorUtil.cornerIntensityList(cornerCfg)` |  | 113 |
| `gameplay_rally_compositors_helpers_compositorUtil.cornerLengthEntryById(cornerCfg, intensityId, lengthId)` |  | 125 |
| `gameplay_rally_compositors_helpers_compositorUtil.cornerLengthEntryLabel(entry)` |  | 152 |
| `gameplay_rally_compositors_helpers_compositorUtil.cornerLengthEntryText(entry)` |  | 147 |
| `gameplay_rally_compositors_helpers_compositorUtil.cornerLengthList(cornerCfg, intensityId)` |  | 118 |
| `gameplay_rally_compositors_helpers_compositorUtil.cornerNumbering(cornerCfg)` |  | 107 |
| `gameplay_rally_compositors_helpers_compositorUtil.distanceCallsEnabled(config)` |  | 417 |
| `gameplay_rally_compositors_helpers_compositorUtil.enumerateConcise(textCompositor, config)` | Enumerates every renderable phrase for the active style. Used by audio<br> pipeline + script reader to know what files to look up / generate. | 784 |
| `gameplay_rally_compositors_helpers_compositorUtil.enumerateScriptEntries(textCompositor, config)` | Enumerates script-reader entries with category and variant metadata. This is<br> intentionally richer than enumerateConcise, which remains the compact runtime<br> phrase list used by existing audio validation flows. | 660 |
| `gameplay_rally_compositors_helpers_compositorUtil.getCaution(cautionCfg, item)` |  | 302 |
| `gameplay_rally_compositors_helpers_compositorUtil.getClosestEntry(valuesList, targetValue, key, filterFn)` |  | 71 |
| `gameplay_rally_compositors_helpers_compositorUtil.getCornerCall(cornerCfg, item)` |  | 246 |
| `gameplay_rally_compositors_helpers_compositorUtil.getCornerLengthForIntensity(cornerCfg, item, intensityEntry)` |  | 266 |
| `gameplay_rally_compositors_helpers_compositorUtil.getCornerLengthForItem(cornerCfg, item)` |  | 290 |
| `gameplay_rally_compositors_helpers_compositorUtil.getCornerShape(cornerCfg, shape)` |  | 296 |
| `gameplay_rally_compositors_helpers_compositorUtil.getNearestValue(valuesList, targetValue, key)` |  | 24 |
| `gameplay_rally_compositors_helpers_compositorUtil.getRandomWeightedItem(items)` |  | 396 |
| `gameplay_rally_compositors_helpers_compositorUtil.getRangeValue(valuesList, targetValue, key)` |  | 58 |
| `gameplay_rally_compositors_helpers_compositorUtil.intensityEntryId(entry)` |  | 158 |
| `gameplay_rally_compositors_helpers_compositorUtil.intensityEntryLabel(entry)` |  | 168 |
| `gameplay_rally_compositors_helpers_compositorUtil.intensityEntryText(entry)` |  | 163 |
| `gameplay_rally_compositors_helpers_compositorUtil.lookupComponentType(componentTypes, itemType)` |  | 138 |
| `gameplay_rally_compositors_helpers_compositorUtil.lookupDescriptorEntry(cornerCfg, descriptor)` | Returns the descriptor entry (or nil) for a corner item. | 232 |
| `gameplay_rally_compositors_helpers_compositorUtil.lookupIntensityEntry(cornerCfg, intensity)` | Returns the matching style intensity entry (or nil) for a measured physical diameter. | 213 |
| `gameplay_rally_compositors_helpers_compositorUtil.lookupRiskAdjustedIntensityEntry(cornerCfg, item)` |  | 218 |
| `gameplay_rally_compositors_helpers_compositorUtil.lookupShapeEntry(cornerCfg, shape)` |  | 238 |
| `gameplay_rally_compositors_helpers_compositorUtil.modifierComponents(componentTypes)` |  | 133 |
| `gameplay_rally_compositors_helpers_compositorUtil.pacenoteHash(text)` |  | 385 |
| `gameplay_rally_compositors_helpers_compositorUtil.postProcessPhrase(phrase)` |  | 379 |
| `gameplay_rally_compositors_helpers_compositorUtil.rangeBounds(value)` |  | 43 |
| `gameplay_rally_compositors_helpers_compositorUtil.rangeContains(value, targetValue)` |  | 51 |
| `gameplay_rally_compositors_helpers_compositorUtil.signedStep(value)` |  | 174 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/rally/compositors/helpers/compositorUtil.lua`.*
