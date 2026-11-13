# `editor_roadUtils`

*Fichier : `lua/ge/extensions/editor/roadUtils.lua` · VM : Game Engine (GE) · 304 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_roadUtils` : `extensions.load("editor_roadUtils")`, puis la globale `editor_roadUtils`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_roadUtils.getMaterialNames()` |  | 287 |
| `editor_roadUtils.getMaterials()` |  | 283 |
| `editor_roadUtils.getRoadTemplateFiles()` |  | 291 |
| `editor_roadUtils.reloadDecals(road, template)` |  | 97 |
| `editor_roadUtils.reloadDecorations(road)` |  | 43 |
| `editor_roadUtils.reloadTemplates()` |  | 234 |
| `editor_roadUtils.updateChildRoads(road)` |  | 172 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `onEditorInitialized` | nil |  |

## Appels vers le moteur (C++)

- `FS:` `findFiles`
- `be:` `reloadCollision`
- `scenetree.` `findObject`, `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/roadUtils.lua`.*
