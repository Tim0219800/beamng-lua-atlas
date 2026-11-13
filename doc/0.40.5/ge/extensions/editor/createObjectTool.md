# `editor_createObjectTool`

*Fichier : `lua/ge/extensions/editor/createObjectTool.lua` · VM : Game Engine (GE) · 1147 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_createObjectTool` : `extensions.load("editor_createObjectTool")`, puis la globale `editor_createObjectTool`

Outil « Create Object(s) » du World Editor : barre d'outils de création d'objets de niveau (SimObjects). Il définit les groupes de boutons (Environment, Level, BeamNG, Other Classes), le mode d'édition editor.editModes.createObject (placement au clic dans la vue 3D, prévisualisation par raycast, rotation autour de l'axe vertical avec Ctrl+molette, magnétisme à la grille), un sélecteur de toutes les classes SimObject avec filtre et fréquence d'usage, et l'historique d'annulation de chaque création. Un moddeur d'éditeur s'en sert pour ajouter ses propres groupes de création ou créer un objet par script via les fonctions injectées dans editor.

## Exemple

```lua
local items = {
  editor.makeCreateObjectItem(editor.icons.add_circle, "BeamNGTrigger", "Mon trigger", function(obj) obj:setField("triggerType", 0, "Box") end)
}
editor.addObjectCreateGroup("Mon groupe", editor.icons.folder, items)
```

## Remarques

- Les fonctions editor.addObjectCreateGroup, getObjectCreateGroup, getAllObjectCreateGroups, makeCreateObjectItem, getObjectCreateItem, createObjectInstance, getCurrentSelectedParent et createCustomClassObject ne sont attachées à editor qu'après un appel à initGroups() (fait par onEditorInitialized).
- initGroups() réinitialise la table des groupes : les groupes ajoutés auparavant par addObjectCreateGroup sont perdus.
- Les classes MeshRoad, DecalRoad et River sont masquées du sélecteur « Other Classes » (elles ont leur éditeur dédié).
- Le parent de création par défaut est le groupe verrouillé en focus, sinon le SimSet ou le groupe de l'objet sélectionné (sauf MissionCleanup), sinon scenetree.MissionGroup.
- Les noms d'objets créés sont <Classe>_<n> avec le plus petit n libre.
- Un TSStatic créé sans mesh reçoit la forme de substitution /core/art/shapes/no_mesh.dae pour éviter l'erreur « No shape set » à l'enregistrement.
- La création d'un BeamNGVehicle est commentée dans le code (« crashes »).
- Préférences enregistrées dans la catégorie createObjectTool.general : infiniteCreateByClick (true), verticalToolbar (false), classFrecency (cachée).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_createObjectTool.initGroups()` | Recrée les quatre groupes standard (Environment, Level, BeamNG, Other Classes) avec leurs boutons et attache à editor les fonctions de création (addObjectCreateGroup, makeCreateObjectItem, createObjectInstance…). Peut être appelée même si l'éditeur n'est pas actif. | 1001 |
| `editor_createObjectTool.navigateList(up)` | Déplace la sélection dans la liste de recherche de classes (vers le haut si up est vrai, sinon vers le bas), bornée à la liste. | 350 |
| `editor_createObjectTool.onEditorDeactivated()` | Hook appelé quand le World Editor se ferme ; retire l'action map « CreateObjectTool ». *(interne)* *(hook)* | 1129 |
| `editor_createObjectTool.onEditorGui()` | Hook appelé à chaque frame de l'éditeur ; retire l'action map « CreateObjectTool » tant qu'aucun popup de sélection de classe n'est ouvert. *(interne)* *(hook)* | 1133 |
| `editor_createObjectTool.onEditorInitialized()` | Hook appelé à l'initialisation de l'éditeur : déclare le mode d'édition « Create Object(s) », les raccourcis auxiliaires (Ctrl+molette pour tourner, Alt pour le magnétisme), editor.stopCreatingObjects, editor.togglePlaceNewObjectAtCamera, appelle initGroups() et charge la liste des classes SimObject (Sim.getSimObjectDerivedClassNames). *(interne)* *(hook)* | 1073 |
| `editor_createObjectTool.onEditorRegisterPreferences(prefsRegistry)` | Hook appelé pour enregistrer les préférences de la catégorie createObjectTool. *(interne)* *(hook)* | 1118 |
| `editor_createObjectTool.selectClass()` | Valide la classe actuellement surlignée dans le sélecteur de classes (équivalent à Entrée, déclenché par l'action map). | 345 |

### Détail des paramètres

#### `editor_createObjectTool.navigateList(up)`

Déplace la sélection dans la liste de recherche de classes (vers le haut si up est vrai, sinon vers le bas), bornée à la liste.

- `up` (*boolean*) : true pour monter, false pour descendre

#### `editor_createObjectTool.onEditorRegisterPreferences(prefsRegistry)`

Hook appelé pour enregistrer les préférences de la catégorie createObjectTool.

- `prefsRegistry` (*table*) : registre de préférences de l'éditeur

## Classe `editor`

Fonctions ajoutées à la table globale editor par initGroups().

Objet `editor` construit dans le module (par ex. par `new`), avec ces méthodes :

| Méthode | Description | Ligne |
|---|---|---|
| `editor.addObjectCreateGroup(name, icon, objectClasses)` | Ajoute un bouton de groupe de création à la barre d'outils. | 979 |
| `editor.createCustomClassObject(clsName, parentNode)` | Crée un objet de la classe donnée sous un nœud de l'arbre de scène. Émet le hook onEditorCustomClassBuildFunc(obj) avant l'enregistrement, donne un shapeName de substitution aux TSStatic sans forme, enregistre l'objet avec un nom numéroté et l'ajoute au parent. | 288 |
| `editor.createObjectInstance(classname, createObjectItem)` | Crée une instance via worldEditorCppApi.createObject, la nomme (<Classe>_<n>), exécute le buildFunc de l'item, puis l'enregistre (déclenche onAdd). Ne l'ajoute pas à un groupe. | 113 |
| `editor.getAllObjectCreateGroups()` | Renvoie la table complète des groupes de création. | 996 |
| `editor.getCurrentSelectedParent()` | Renvoie le parent par défaut pour les nouveaux objets (groupe en focus, groupe de la sélection, ou MissionGroup). | 61 |
| `editor.getObjectCreateGroup(name)` | Renvoie un groupe de création par son nom. | 988 |
| `editor.getObjectCreateItem(classname)` | Cherche dans tous les groupes l'item dont le classname correspond (le premier trouvé). | 103 |
| `editor.makeCreateObjectItem(icon, classname, title, buildFunc, singleInstance)` | Construit un item de création {icon, classname, title, buildFunc, singleInstance}. title vaut classname par défaut. | 965 |

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
