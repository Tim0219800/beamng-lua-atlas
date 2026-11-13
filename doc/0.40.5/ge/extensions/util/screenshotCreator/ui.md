# `util_screenshotCreator_ui`

*Fichier : `lua/ge/extensions/util/screenshotCreator/ui.lua` · VM : Game Engine (GE) · 864 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `util_screenshotCreator_ui` : `extensions.load("util_screenshotCreator_ui")`, puis la globale `util_screenshotCreator_ui`

**Dépendances (chargées avant) :** `ui_imgui`, `editor_main`, `core_camera`, `core_vehicles`, `core_gamestate`, `freeroam_freeroam`, `util_screenshotCreator_settings`, `util_screenshotCreator_job`, `util_screenshotCreator_lightingSetup`, `util_screenshotCreator_thumbnailConfig`, `util_screenshotCreator_framingManager`, `util_screenshotCreator_modelSelection`, `util_screenshotCreator_nodeOutpaint`, `util_screenshotCreator_shippedConfigs`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `util_screenshotCreator_ui.onDeserialized(data)` | *(hook)* | 833 |
| `util_screenshotCreator_ui.onExtensionUnloaded()` | *(hook)* | 158 |
| `util_screenshotCreator_ui.onSerialize()` | *(hook)* | 809 |
| `util_screenshotCreator_ui.onUpdate()` | *(hook)* | 687 |
| `util_screenshotCreator_ui.openWindow()` |  | 785 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table |  |

## Appels vers le moteur (C++)

- `FS:` `directoryCreate`, `directoryExists`, `fileExists`
- `scenetree.` `findObject`, `findObjectById`

**Charge les extensions :** `util_screenshotCreator_settings`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/util/screenshotCreator/ui.lua`.*
