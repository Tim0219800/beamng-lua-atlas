# `ui_uiMods`

*Fichier : `lua/ge/extensions/ui/uiMods.lua` · VM : Game Engine (GE) · 381 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_uiMods` : `extensions.load("ui_uiMods")`, puis la globale `ui_uiMods`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_uiMods.bumpUiRuntimeRevision(path)` | for manual file reloads | 341 |
| `ui_uiMods.getImageList(path)` |  | 108 |
| `ui_uiMods.getUiApps()` |  | 53 |
| `ui_uiMods.getUiRuntimeFileList(withMtime)` |  | 347 |
| `ui_uiMods.getUiRuntimeRevisions()` |  | 336 |
| `ui_uiMods.getVueMods()` |  | 31 |
| `ui_uiMods.onExtensionLoaded()` | *(hook)* | 7 |
| `ui_uiMods.onFilesChanged(files)` | *(hook)* | 274 |
| `ui_uiMods.setUiRuntimeBundled(cfg)` |  | 208 |

**Évènements UI (guihooks.trigger) :** `UiAppsChanged`, `UiImageListChanged`, `UiModsChanged`, `UiRuntimeFileChanged`

## Appels vers le moteur (C++)

- `FS:` `findFiles`, `stat`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/uiMods.lua`.*
