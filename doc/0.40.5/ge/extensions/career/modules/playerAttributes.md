# `career_modules_playerAttributes`

*Fichier : `lua/ge/extensions/career/modules/playerAttributes.lua` · VM : Game Engine (GE) · 328 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `career_modules_playerAttributes` : `extensions.load("career_modules_playerAttributes")`, puis la globale `career_modules_playerAttributes`

**Dépendances (chargées avant) :** `career_career`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `career_modules_playerAttributes.addAttributes(change, reason)` | reason should be table with label, list of tags | 66 |
| `career_modules_playerAttributes.getAllAttributes()` |  | 152 |
| `career_modules_playerAttributes.getAttribute(attributeName)` |  | 145 |
| `career_modules_playerAttributes.getAttributeLog()` |  | 320 |
| `career_modules_playerAttributes.getAttributeValue(attributeName)` |  | 148 |
| `career_modules_playerAttributes.getCareerHistoryInfo(historyType)` |  | 215 |
| `career_modules_playerAttributes.getFinancialHistory(limit)` |  | 207 |
| `career_modules_playerAttributes.getGameplayHistory(limit)` |  | 211 |
| `career_modules_playerAttributes.getRecentFinancialChanges(limit)` |  | 203 |
| `career_modules_playerAttributes.getRewardDisplayName(attributeKey)` |  | 22 |
| `career_modules_playerAttributes.onCareerActive(active)` | *(hook)* | 294 |
| `career_modules_playerAttributes.onExtensionLoaded()` | *(hook)* | 226 |
| `career_modules_playerAttributes.onLogbookGetEntries(_)` | logbook integration *(hook)* | 307 |
| `career_modules_playerAttributes.onSaveCurrentProfile(currentSavePath)` | this should only be loaded when the career is active *(hook)* | 288 |
| `career_modules_playerAttributes.setAttributes(newValues, reason)` |  | 136 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table |  |
| `logAttributeChange` | any |  ⚠ référence `logAttributeChange` non définie dans le fichier (vaut probablement nil) |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onPlayerAttributesChanged` — écouté par 3 module(s)

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/career/modules/playerAttributes.lua`.*
