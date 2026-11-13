# `editor_aiTests`

*Fichier : `lua/ge/extensions/editor/aiTests.lua` · VM : Game Engine (GE) · 420 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_aiTests` : `extensions.load("editor_aiTests")`, puis la globale `editor_aiTests`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_aiTests.onEditorDeactivated()` | *(hook)* | 404 |
| `editor_aiTests.onEditorGui()` | *(hook)* | 384 |
| `editor_aiTests.onEditorInitialized()` | *(hook)* | 410 |

## Appels vers le moteur (C++)

- `be:` `setDynamicCollisionEnabled`
- `debugDrawer:` `drawSphere`, `drawSquarePrism`, `drawTextAdvanced`
- `obj:` `getDirectionVector`, `getDirectionVectorUp`, `getPosition`, `getRotation`, `queueLuaCommand`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/aiTests.lua`.*
