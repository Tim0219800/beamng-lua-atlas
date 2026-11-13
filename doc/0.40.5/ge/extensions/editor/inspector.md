# `editor_inspector`

*Fichier : `lua/ge/extensions/editor/inspector.lua` · VM : Game Engine (GE) · 2309 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_inspector` : `extensions.load("editor_inspector")`, puis la globale `editor_inspector`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_inspector.onEditorActivated()` | *(hook)* | 1590 |
| `editor_inspector.onEditorAfterOpenLevel()` | *(hook)* | 2292 |
| `editor_inspector.onEditorDeactivated()` | *(hook)* | 1596 |
| `editor_inspector.onEditorGui()` | *(hook)* | 1484 |
| `editor_inspector.onEditorInitialized()` | *(hook)* | 2234 |
| `editor_inspector.onEditorLoadGuiInstancerState(state)` | *(hook)* | 1599 |
| `editor_inspector.onEditorObjectSelectionChanged()` | *(hook)* | 2262 |
| `editor_inspector.onEditorRegisterApi()` | *(hook)* | 2227 |
| `editor_inspector.onEditorSaveGuiInstancerState(state)` | *(hook)* | 1607 |
| `editor_inspector.onExtensionLoaded()` | *(hook)* | 1007 |

## Classe `editor`

Objet `editor` construit dans le module (par ex. par `new`), avec ces méthodes :

| Méthode | Description | Ligne |
|---|---|---|
| `editor.addInspectorInstance(selection)` |  | 132 |
| `editor.checkEditorDirtyFlag()` |  | 100 |
| `editor.closeInspectorInstance(idx)` |  | 157 |
| `editor.getInspectorInstances()` |  | 163 |
| `editor.getInspectorTypeHandlers()` |  | 167 |
| `editor.inspectorHasField(fieldName)` |  | 986 |
| `editor.registerInspectorFieldModifier(uniqueName, callback)` |  | 182 |
| `editor.registerInspectorTypeHandler(typeName, guiCallback)` |  | 171 |
| `editor.unregisterInspectorFieldModifier(uniqueName)` |  | 188 |
| `editor.unregisterInspectorTypeHandler(typeName)` |  | 178 |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onEditorInspectorHeaderGui` — écouté par 8 module(s)

## Appels vers le moteur (C++)

- `FS:` `fileExists`, `isLinkFile`
- `core_environment.` `refreshnightLightsObjects`
- `obj:` `getClassDocString`, `getClassName`, `getDynDataFieldbyName`, `getGroup`, `getId`, `inspectUpdate`, `isEditorDirty`, `isSubClassOf`
- `scenetree.` `findObject`, `findObjectById`

**Charge les extensions :** `editor_groundCoverEditor`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/inspector.lua`.*
