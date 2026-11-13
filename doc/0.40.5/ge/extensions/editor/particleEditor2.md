# `editor_particleEditor2`

*Fichier : `lua/ge/extensions/editor/particleEditor2.lua` · VM : Game Engine (GE) · 541 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_particleEditor2` : `extensions.load("editor_particleEditor2")`, puis la globale `editor_particleEditor2`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_particleEditor2.onEditorGui()` | *(hook)* | 463 |
| `editor_particleEditor2.onEditorInitialized()` | *(hook)* | 517 |
| `editor_particleEditor2.onEditorToolWindowHide(windowName)` | *(hook)* | 507 |
| `editor_particleEditor2.onEditorToolWindowShow(windowName)` | *(hook)* | 497 |
| `editor_particleEditor2.onExtensionUnloaded()` | *(hook)* | 528 |
| `editor_particleEditor2.onPreRender()` | *(hook)* | 488 |
| `editor_particleEditor2.onUpdate()` | *(hook)* | 492 |

## Appels vers le moteur (C++)

- `Sim.` `getDataBlockSet`, `getUniqueName`, `upcast`
- `debugDrawer:` `currentRenderViewMaskClear`, `currentRenderViewMaskSet`, `drawLine`
- `scenetree.` `findObject`, `findObjectById`
- `worldEditorCppApi.` `createObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/particleEditor2.lua`.*
