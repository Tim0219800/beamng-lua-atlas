# `ui_liveries_saves`

*Fichier : `lua/ge/extensions/ui/liveries/saves.lua` · VM : Game Engine (GE) · 186 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_liveries_saves` : `extensions.load("ui_liveries_saves")`, puis la globale `ui_liveries_saves`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_liveries_saves.clearCurrentSave()` |  | 115 |
| `ui_liveries_saves.consumeStagedApplySkin()` |  | 120 |
| `ui_liveries_saves.create(filename)` |  | 52 |
| `ui_liveries_saves.delete(filename)` |  | 90 |
| `ui_liveries_saves.exists(filename)` |  | 32 |
| `ui_liveries_saves.getAll()` |  | 36 |
| `ui_liveries_saves.getCurrentSaveName()` |  | 111 |
| `ui_liveries_saves.getFilename(file)` |  | 19 |
| `ui_liveries_saves.load(filename)` |  | 163 |
| `ui_liveries_saves.rename(filename, newFilename)` |  | 62 |
| `ui_liveries_saves.save(filename, applySkin)` |  | 137 |

## Appels vers le moteur (C++)

- `FS:` `fileExists`, `findFiles`, `removeFile`, `renameFile`, `stat`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/liveries/saves.lua`.*
