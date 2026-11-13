# `util_groundModelDebug`

*Fichier : `lua/ge/extensions/util/groundModelDebug.lua` · VM : Game Engine (GE) · 578 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `util_groundModelDebug` : `extensions.load("util_groundModelDebug")`, puis la globale `util_groundModelDebug`

**Dépendances (chargées avant) :** `ui_imguiUtils`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `util_groundModelDebug.onDeserialized(data)` | *(hook)* | 563 |
| `util_groundModelDebug.onExtensionLoaded()` | *(hook)* | 551 |
| `util_groundModelDebug.onSerialize()` | *(hook)* | 555 |
| `util_groundModelDebug.onUpdate(dt)` | x axis, vs y axis *(hook)* | 232 |
| `util_groundModelDebug.openWindow()` |  | 207 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table |  |

## Appels vers le moteur (C++)

- `Engine.` `setStaticColDebugEnabled`, `setStaticColDebugPosShrink`
- `be:` `setGroundModel`
- `core_environment.` `reloadGroundModels`
- `debugDrawer:` `drawSphere`, `renderGroundModelDebug`, `renderStaticColCounter`, `renderStaticColDebug`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/util/groundModelDebug.lua`.*
