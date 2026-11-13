# `editor_objectToSplineEditor`

*Fichier : `lua/ge/extensions/editor/objectToSplineEditor.lua` · VM : Game Engine (GE) · 498 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_objectToSplineEditor` : `extensions.load("editor_objectToSplineEditor")`, puis la globale `editor_objectToSplineEditor`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_objectToSplineEditor.onEditorGui()` | *(hook)* | 254 |
| `editor_objectToSplineEditor.onEditorInitialized()` | *(hook)* | 490 |

## Appels vers le moteur (C++)

- `Sim.` `getUniqueName`
- `be:` `getSurfaceHeightBelow`, `reloadCollision`
- `debugDrawer:` `drawLine`, `drawSphere`, `drawSquarePrism`
- `obj:` `getField`, `getId`, `getObjectBox`, `getPosition`, `getScale`, `getWorldBox`, `setTransform`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/objectToSplineEditor.lua`.*
