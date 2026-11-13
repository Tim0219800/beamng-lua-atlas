# `editor_trafficDebug`

*Fichier : `lua/ge/extensions/editor/trafficDebug.lua` · VM : Game Engine (GE) · 510 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_trafficDebug` : `extensions.load("editor_trafficDebug")`, puis la globale `editor_trafficDebug`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_trafficDebug.onEditorDeactivated()` | *(hook)* | 461 |
| `editor_trafficDebug.onEditorGui()` | *(hook)* | 471 |
| `editor_trafficDebug.onEditorInitialized()` | *(hook)* | 466 |
| `editor_trafficDebug.onTrafficAction(id, action, data)` | *(hook)* | 500 |

## Appels vers le moteur (C++)

- `be:` `getObjectPositionXYZ`
- `debugDrawer:` `drawSquarePrism`
- `obj:` `queueLuaCommand`
- `scenetree.` `objectExistsById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/trafficDebug.lua`.*
