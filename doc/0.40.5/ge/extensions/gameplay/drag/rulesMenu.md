# `gameplay_drag_rulesMenu`

*Fichier : `lua/ge/extensions/gameplay/drag/rulesMenu.lua` · VM : Game Engine (GE) · 204 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_drag_rulesMenu` : `extensions.load("gameplay_drag_rulesMenu")`, puis la globale `gameplay_drag_rulesMenu`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_drag_rulesMenu.applyRulesRestore(levelId, stripId)` | Returns saved rules for strip so Vue can restore display. Called by Vue on Restore. | 192 |
| `gameplay_drag_rulesMenu.applyRulesSave(levelId, stripId, rules)` | Persists rules for strip. Called by Vue on Save. | 186 |
| `gameplay_drag_rulesMenu.closeMenu()` | Closes the rules context. | 113 |
| `gameplay_drag_rulesMenu.getCurrentFacility()` | Returns current facility when opened from facility POI, or nil. | 126 |
| `gameplay_drag_rulesMenu.getRulesScreenData(facilityIdOrStripId)` | Returns data for Vue rules screen. facility.id (e.g. "alderStripRules"). | 136 |
| `gameplay_drag_rulesMenu.getSavedRulesForStrip(levelId, stripId)` | Returns saved rules (dragType, treeType, importantTimerId) for strip. Used by general when starting from POI. | 131 |
| `gameplay_drag_rulesMenu.isMenuOpen()` | Returns true if rules context is active. | 121 |
| `gameplay_drag_rulesMenu.onUpdate(dtReal, dtSim, dtRaw)` | Called each frame. Auto-closes when player drives out of tether range. *(hook)* | 197 |
| `gameplay_drag_rulesMenu.openMenu(facility)` | Opens the rules context for a facility. Sets up tether for auto-close. | 104 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table |  |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/drag/rulesMenu.lua`.*
