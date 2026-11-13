# `ui_apps`

*Fichier : `lua/ge/extensions/ui/apps.lua` · VM : Game Engine (GE) · 252 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_apps` : `extensions.load("ui_apps")`, puis la globale `ui_apps`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_apps.getUIAppsData()` |  | 214 |
| `ui_apps.notifyLayoutsChanged()` |  | 222 |
| `ui_apps.onFilesChanged(files)` | *(hook)* | 228 |
| `ui_apps.onUpdate()` | *(hook)* | 238 |

**Évènements UI (guihooks.trigger) :** `UiAppLayoutsChanged`

## Appels vers le moteur (C++)

- `FS:` `fileExists`, `findFiles`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/apps.lua`.*
