# `editor_vehicleEditor_staticEditor_veStaticRenderView`

*Fichier : `lua/ge/extensions/editor/vehicleEditor/staticEditor/veStaticRenderView.lua` · VM : Game Engine (GE) · 822 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_vehicleEditor_staticEditor_veStaticRenderView` : `extensions.load("editor_vehicleEditor_staticEditor_veStaticRenderView")`, puis la globale `editor_vehicleEditor_staticEditor_veStaticRenderView`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_vehicleEditor_staticEditor_veStaticRenderView.createRenderViewUI()` | Creates a new renderview UI<br> Go through list of renderview datas<br> and if data exists but window for that data is hidden, show it<br> else if data doesn't exist, create new data and register new window | 191 |
| `editor_vehicleEditor_staticEditor_veStaticRenderView.destroyAllRenderViews()` |  | 757 |
| `editor_vehicleEditor_staticEditor_veStaticRenderView.getMainRenderViewMouseRay()` |  | 748 |
| `editor_vehicleEditor_staticEditor_veStaticRenderView.moveBackward(val)` |  | 801 |
| `editor_vehicleEditor_staticEditor_veStaticRenderView.moveForward(val)` |  | 800 |
| `editor_vehicleEditor_staticEditor_veStaticRenderView.moveLeft(val)` |  | 798 |
| `editor_vehicleEditor_staticEditor_veStaticRenderView.moveRight(val)` |  | 799 |
| `editor_vehicleEditor_staticEditor_veStaticRenderView.onDeserialize(data)` | *(hook)* | 793 |
| `editor_vehicleEditor_staticEditor_veStaticRenderView.onEditorGui(dt)` | *(hook)* | 686 |
| `editor_vehicleEditor_staticEditor_veStaticRenderView.onEditorHeadlessChange(enabled, toolName)` | *(hook)* | 765 |
| `editor_vehicleEditor_staticEditor_veStaticRenderView.onEditorInitialized()` | *(hook)* | 779 |
| `editor_vehicleEditor_staticEditor_veStaticRenderView.onPreRender()` | Do debugDrawer stuff here *(hook)* | 434 |
| `editor_vehicleEditor_staticEditor_veStaticRenderView.onSerialize()` | *(hook)* | 787 |
| `editor_vehicleEditor_staticEditor_veStaticRenderView.setCameraSpeed(s)` |  | 802 |

## Appels vers le moteur (C++)

- `debugDrawer:` `drawCylinder`, `drawLine`, `drawText`, `drawTextAdvanced`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/vehicleEditor/staticEditor/veStaticRenderView.lua`.*
