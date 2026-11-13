# `editor_toolUtilities_statsFooter`

*Fichier : `lua/ge/extensions/editor/toolUtilities/statsFooter.lua` · VM : Game Engine (GE) · 48 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_toolUtilities_statsFooter` : `extensions.load("editor_toolUtilities_statsFooter")`, puis la globale `editor_toolUtilities_statsFooter`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_toolUtilities_statsFooter.item(label, val, col, lead, tip)` | One "Label N" stat: dull label, tinted number, dull bar in front of it. `lead` starts a fresh row, so no bar. | 16 |
| `editor_toolUtilities_statsFooter.liveRow(instances, unique, fresh)` | Drawn tris, range and drawing count for `instances` (triLive entries), with `unique` added in whole as it has no LODs.<br>`fresh` says the list changed since last time, so it may hold a shape never measured. | 26 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/toolUtilities/statsFooter.lua`.*
