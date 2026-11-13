# `editor_api_valueInspector`

*Fichier : `lua/ge/extensions/editor/api/valueInspector.lua` · VM : Game Engine (GE) · 1470 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/editor/api/valueInspector")` (fichier sous extensions/ mais pas une extension classique)

## Classe `C`

Le module renvoie un constructeur : `local obj = require("editor_api_valueInspector")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:deleteTexObjs()` |  | 504 |
| `C:displayMaterialPopupList(objectSet, fieldName, fieldNameId, fieldValue, selectedIds, val, arrayIndex, className)` |  | 299 |
| `C:displaySimSetPopupList(objectSetArray, fieldName, fieldNameId, fieldValue, selectedIds, val, arrayIndex, className)` |  | 212 |
| `C:init()` |  | 426 |
| `C:initializeTables(force)` |  | 492 |
| `C:reinitializeTables()` |  | 488 |
| `C:setSimSetWindowFieldId(id)` |  | 500 |
| `C:valueEditorGui(fieldName, fieldValue, arrayIndex, fieldLabel, fieldDesc, fieldType, fieldTypeName, customData, pasteCallback, contextMenuUI, indeterminateFlags)` |  | 565 |

## Appels vers le moteur (C++)

- `Sim.` `findObject`, `findObjectById`, `findObjectByIdNoUpcast`, `findObjectByPersistID`, `getDataBlockSet`, `getMaterialSet`, `getRootGroup`, `getSFXAmbienceSet`, `getSFXDescriptionSet`, `getSFXEnvironmentSet`, `getSFXParameterGroup`, `getSFXStateSet`, `getSFXTrackSet`
- `obj:` `getClassName`, `getField`, `getID`, `getId`, `getName`
- `scenetree.` `findObject`, `findObjectById`
- `ui_imgui.` `Button`
- `worldEditorCppApi.` `findDerivedDatablockClassname`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/api/valueInspector.lua`.*
