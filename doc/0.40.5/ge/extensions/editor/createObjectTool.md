# `editor_createObjectTool`

*Fichier : `lua/ge/extensions/editor/createObjectTool.lua` · VM : Game Engine (GE) · 1147 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_createObjectTool` : `extensions.load("editor_createObjectTool")`, puis la globale `editor_createObjectTool`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_createObjectTool.initGroups()` | Initializes all groups; this exists so it can be called even if the editor is not active | 1001 |
| `editor_createObjectTool.navigateList(up)` |  | 350 |
| `editor_createObjectTool.onEditorDeactivated()` | *(hook)* | 1129 |
| `editor_createObjectTool.onEditorGui()` | *(hook)* | 1133 |
| `editor_createObjectTool.onEditorInitialized()` | *(hook)* | 1073 |
| `editor_createObjectTool.onEditorRegisterPreferences(prefsRegistry)` | *(hook)* | 1118 |
| `editor_createObjectTool.selectClass()` |  | 345 |

## Classe `editor`

Objet `editor` construit dans le module (par ex. par `new`), avec ces méthodes :

| Méthode | Description | Ligne |
|---|---|---|
| `editor.addObjectCreateGroup(name, icon, objectClasses)` | Add a new create objects group button to the create toolbar.<br> @param name the name of the custom create group<br> @param icon the icon for this group's button (in the form of: ``editor.icons.some_icon_name_here``)<br> @param objectClasses an array of object class info tables to create the buttons in this group, the info table for a class can be created with the `editor.makeCreateObjectItem` function | 979 |
| `editor.createCustomClassObject(clsName, parentNode)` | Create a class object under selected scene tree node.<br> @param clsName object class name<br> @param parentNode scene tree parent node (optional, defaults to current selected node)<br> @returns created object instance | 288 |
| `editor.createObjectInstance(classname, createObjectItem)` |  | 113 |
| `editor.getAllObjectCreateGroups()` | Return all create groups.<br> @returns the entire create group table | 996 |
| `editor.getCurrentSelectedParent()` |  | 61 |
| `editor.getObjectCreateGroup(name)` | Return a create group info table by group name.<br> @param name the name of the create group<br> @returns the create group | 988 |
| `editor.getObjectCreateItem(classname)` |  | 103 |
| `editor.makeCreateObjectItem(icon, classname, title, buildFunc, singleInstance)` | Prepare a create object item for the toolbar. Used as a helper when creating the array for the new group.<br> @param icon the icon for the create object button<br> @param classname the C++ classname for the create object button, to create the instance for<br> @param title the display name for the class<br> @param buildFunc the function to be called right before the instance is created, so you can setup the object<br> @param singleInstance true if this button will create a single instance on click, otherwise if false, you create instances by clicking in the 3D viewport until ESCAPE is pressed | 965 |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onEditorCustomClassBuildFunc`

## Appels vers le moteur (C++)

- `Sim.` `getSimObjectDerivedClassNames`, `upcast`
- `debugDrawer:` `drawLineInstance`, `drawTextAdvanced`
- `obj:` `getClassName`, `getField`, `getGroup`, `getId`, `getPosition`, `getScale`, `isSubClassOf`, `registerObject`, `reloadTextures`, `setEmitterDataBlock`, `setField`, `setName`, `setPosition`, `setTerrFileLvlFolder`, `setTransform`
- `scenetree.` `findClassObjects`, `findObject`, `findObjectById`
- `worldEditorCppApi.` `createObject`, `setAxisGizmoSelectedElement`, `snapPositionToGrid`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/createObjectTool.lua`.*
