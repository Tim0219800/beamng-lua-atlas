# `editor_api_core`

*Fichier : `lua/ge/extensions/editor/api/core.lua` · VM : Game Engine (GE) · 814 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_api_core` : `extensions.load("editor_api_core")`, puis la globale `editor_api_core`

Noyau de l'objet editor du World Editor : initialize(editor) y installe les constantes (FloatMin/Max, IntMin/Max, AuxControl_*), l'état (history, levelPath, dirty, editModes, selection) et les fonctions de base : création/ouverture/sauvegarde de niveaux, état « modifié » (dirty) du niveau et des outils, annuler/refaire, types de visualisation, visibilité/sélectionnabilité des classes d'objets, modes d'édition et actions copier/coller/supprimer routées vers le mode courant. Un moddeur d'outil d'éditeur s'en sert via editor.xxx.

## Exemple

```lua
editor.registerVisualizationType({name = "$Lua.myFlag", displayName = "Mon overlay", type = editor.varTypes.LuaVar})
editor.selectEditMode({displayName = "Mon mode", onActivate = function() end, onDeactivate = function() end})
editor.setDirty()
```

## Remarques

- Le module n'exporte que initialize ; tout est posé sur l'objet editor.
- Les actions cut/copy/paste/duplicate/selectAll/deselect/deleteSelection appellent d'abord le callback du mode d'édition courant (onCut, onCopy…), puis émettent le hook global correspondant (onEditorCut…).
- Types de visualisation (editor.varTypes) : ConVar=1 (VariableRegistry), LuaVar=2 (variable globale Lua évaluée par loadstring), Custom=3 (getter/setter), Setting=4 (settings). Un callback optionnel de typeData est appelé après setVisualizationType.
- saveLevel écrit d'abord dans <level>/__main puis remplace <level>/main ; en cas d'échec de sérialisation, un log FATAL est émis mais les hooks onEditorAfterSaveLevel et resetDirty s'exécutent quand même.
- copyDirectory/copyLevelFolder utilisent gsub avec les chemins comme motifs Lua (les caractères spéciaux comme '-' ou '.' ne sont pas échappés).
- checkDirtyAndSave : l'expression « editor.dirty or anyToolDirty() and editor.initialized » est évaluée avec la priorité Lua (and avant or) : editor.initialized ne conditionne que anyToolDirty.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_api_core.initialize(editorInstance)` | Installe constantes, variables d'état et fonctions sur l'objet editor. *(interne)* | 715 |

### Détail des paramètres

#### `editor_api_core.initialize(editorInstance)`

Installe constantes, variables d'état et fonctions sur l'objet editor.

- `editorInstance` (*table*) : Objet editor

## Classe `editor`

Fonctions ajoutées à l'objet editor par initialize.

Objet `editor` construit dans le module (par ex. par `new`), avec ces méthodes :

| Méthode | Description | Ligne |
|---|---|---|
| `editor.anyToolDirty()` | Si des outils sont modifiés, ouvre la fenêtre modale saveDirtyTools et renvoie true. | 544 |
| `editor.autoSaveLevel()` | Sauvegarde une copie du niveau dans /temp/level_autosaves/<niveau>/<compteur>/ en tournant sur files.autoSave.maxAutoSaveCountPerSession, puis restaure levelPath et l'état dirty. | 150 |
| `editor.checkDirtyAndSave(noCancelButton)` | Si le niveau/les outils sont modifiés, affiche une boîte de dialogue : Oui sauvegarde, Annuler appelle Engine.cancelShutdown(), Non remet tout à propre. | 553 |
| `editor.clearUndoHistory()` | Vide l'historique d'annulation et de refaire ; les actions passées deviennent irréversibles. | 309 |
| `editor.clearVisualizationTypes()` | Supprime tous les types de visualisation enregistrés. | 371 |
| `editor.copy()` | Copier : appelle onCopy du mode courant puis le hook onEditorCopy. | 474 |
| `editor.copyDirectory(srcPath, dstPath)` | Copie récursivement les fichiers de srcPath vers dstPath (FS:findFiles + FS:copyFile) et le logue. | 20 |
| `editor.copyLevelFolder(srcPath, dstPath)` | Copie un dossier de niveau (défaut levels/template/) vers un nouveau, remplace le nom de l'ancien niveau par le nouveau dans les .json/.cs et renomme les fichiers contenant l'ancien nom. Peut être long. | 32 |
| `editor.cut()` | Couper : appelle onCut du mode d'édition courant puis le hook onEditorCut. | 465 |
| `editor.deleteObject(objectId)` | Supprime un objet par id s'il existe et n'est pas verrouillé, puis marque l'éditeur modifié. | 275 |
| `editor.deleteSelection()` | Supprimer la sélection : appelle onDeleteSelection du mode courant, émet onEditorDeleteSelection et vide editor.selection. | 521 |
| `editor.deselect()` | Désélectionner : appelle onDeselect du mode courant puis le hook onEditorDeselect. | 512 |
| `editor.doNewLevel()` | Pour l'UI : propose de sauver, ouvre un sélecteur de dossier sous /levels, copie le niveau template vers le nouveau dossier, puis newLevel() et openLevel(). | 569 |
| `editor.doOpenLevel()` | Pour l'UI : propose de sauver, ouvre un sélecteur de dossier sous /levels et ouvre le niveau choisi. | 584 |
| `editor.doSaveLevel()` | Pour l'UI : sauvegarde le niveau, ou appelle doSaveLevelAs si levelPath est vide. | 596 |
| `editor.doSaveLevelAs()` | Pour l'UI : sélecteur de dossier, copie le dossier du niveau vers le nouveau puis saveLevelAs. Refuse /levels directement (il faut un sous-dossier). | 606 |
| `editor.duplicate()` | Dupliquer : appelle onDuplicate du mode courant puis le hook onEditorDuplicate. | 494 |
| `editor.enableHeadless(enabled, toolName)` | Active/désactive le mode headless d'un outil : sauvegarde et charge les dispositions de fenêtres, renseigne editor.headless/headlessToolName et émet onEditorHeadlessChange(enabled, toolName). | 625 |
| `editor.getCurrentEditModeName()` | Clé du mode courant dans editor.editModes, "" si aucun. | 456 |
| `editor.getLevelName()` | Nom du niveau courant (dernier dossier du chemin de mission). | 530 |
| `editor.getLevelPath()` | Chemin du dossier du niveau courant, "" si inconnu. | 539 |
| `editor.getObjectTypeSelectable(typeName)` | Indique si une classe d'objets est sélectionnable. | 398 |
| `editor.getObjectTypeVisible(typeName)` | Indique si une classe d'objets est rendue. | 385 |
| `editor.getVisualizationType(name)` | Valeur courante d'un type de visualisation ; nil si le nom est inconnu. | 338 |
| `editor.getVisualizationTypes()` | Liste des types de visualisation, triée par displayName si besoin. | 356 |
| `editor.isHeadlessToolActive(toolName)` | Indique si cet outil est actuellement en mode headless. | 647 |
| `editor.linkifyPath(targetPath)` | Crée dans le dossier du niveau un fichier .link (JSON {path = targetPath}) qui pointe vers targetPath, et renvoie le chemin du lien (sans .link). Renvoie targetPath tel quel si aucun niveau n'est ouvert, "" si targetPath est vide. | 665 |
| `editor.muteAudio(muteIt)` | Coupe le canal audio maître (mémorise le volume) ou le rétablit. | 651 |
| `editor.newLevel()` | Remet l'éditeur à zéro pour un nouveau niveau : hooks onEditorExitLevel puis onEditorBeforeNewLevel, vide l'historique, levelPath = "", compteur d'autosave à 1, puis onEditorAfterNewLevel et resetDirty. Ne détruit pas le scenetree. | 74 |
| `editor.openLevel(path)` | Ouvre un niveau existant : désactive les signaux Sim, hook onEditorBeforeOpenLevel, newLevel(), shutdown de l'éditeur puis core_levels.startLevel(path), puis hook onEditorAfterOpenLevel. Les modifications non sauvées sont perdues. | 88 |
| `editor.paste()` | Coller : appelle onPaste du mode courant puis le hook onEditorPaste. | 484 |
| `editor.quitEditor()` | Cache et désactive l'éditeur. | 265 |
| `editor.quitGame()` | Quitte le jeu (quit()). | 270 |
| `editor.redo(steps)` | Refait la ou les dernières opérations annulées. | 293 |
| `editor.registerVisualizationType(typeData)` | Enregistre un type de visualisation personnalisé. | 366 |
| `editor.resetAllDirtyTools()` | Vide la liste des outils modifiés et remet cleanExit à true. | 252 |
| `editor.resetDirty()` | Marque le niveau comme propre, efface le flag de scène du moteur et remet cleanExit à true. | 258 |
| `editor.resetDirtyTool(name)` | Retire un outil de la liste des outils modifiés. | 248 |
| `editor.saveDirtyToolsUi()` | Dessine la fenêtre modale « Save Tool Windows Data » listant les outils modifiés (Save All, Save Selected, Don't Save Any, Cancel). | 177 |
| `editor.saveLevel()` | Sauvegarde le MissionGroup dans <levelPath>main (via __main), avec hooks onEditorBeforeSaveLevel/onEditorAfterSaveLevel, resetDirty, notification, et copie de sauvegarde si la préférence files.autoSave.saveBackupCopy est active (hooks onEditorBefore/AfterSaveLevelBackup). | 115 |
| `editor.saveLevelAs(levelPath)` | Change editor.levelPath et le nom de mission (info.json) puis sauvegarde le niveau à cet emplacement. | 143 |
| `editor.selectAll()` | Tout sélectionner : appelle onSelectAll du mode courant puis le hook onEditorSelectAll. | 503 |
| `editor.selectEditMode(newEditMode)` | Active un mode d'édition : désactive l'ancien (onDeactivate, hook onEditorEditModeDeactivated, pop de son actionMap), active le nouveau (onActivate, hook onEditorEditModeActivated, push de son actionMap en priorité maximale) puis émet onEditorEditModeChanged(old, new). Champs du mode : displayName, onActivate, onDeactivate, onUpdate, onCut, onCopy, onPaste, onDuplicate, onSelectAll, onDeselect, onDeleteSelection, onToolbar, actionMap, icon, iconTooltip, hideObjectIcons. | 419 |
| `editor.setDirty()` | Marque le niveau comme modifié et enregistre l'info d'arrêt non propre (préférences general.internal.cleanExit/lastLevel). | 238 |
| `editor.setDirtyTool(name, saveFn)` | Déclare un outil comme ayant des données non sauvées, avec sa fonction de sauvegarde. | 243 |
| `editor.setObjectTypeSelectable(typeName, selectable)` | Autorise ou interdit la sélection d'une classe d'objets. | 392 |
| `editor.setObjectTypeVisible(typeName, visible)` | Rend visible/invisible une classe d'objets C++ dans l'éditeur. | 378 |
| `editor.setUndoHistory(history)` | Change l'instance d'historique utilisée (utile pour un undo par fenêtre/panneau). nil rétablit l'historique par défaut. | 300 |
| `editor.setVisualizationType(name, on)` | Active/désactive un type de visualisation enregistré (selon son type ConVar/LuaVar/Custom/Setting) puis appelle son callback éventuel. Ignore un nom inconnu. | 316 |
| `editor.undo(steps)` | Annule la ou les dernières opérations de l'historique courant. | 287 |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onEditorAfterNewLevel`
- `onEditorAfterOpenLevel` — écouté par 3 module(s)
- `onEditorAfterSaveLevel` — écouté par 5 module(s)
- `onEditorAfterSaveLevelBackup`
- `onEditorBeforeNewLevel`
- `onEditorBeforeOpenLevel`
- `onEditorBeforeSaveLevel` — écouté par 7 module(s)
- `onEditorBeforeSaveLevelBackup`
- `onEditorCopy`
- `onEditorCut`
- `onEditorDeleteSelection` — écouté par 2 module(s)
- `onEditorDeselect`
- `onEditorDuplicate`
- `onEditorEditModeActivated` — écouté par 1 module(s)
- `onEditorEditModeChanged` — écouté par 1 module(s)
- `onEditorEditModeDeactivated` — écouté par 1 module(s)
- `onEditorExitLevel` — écouté par 2 module(s)
- `onEditorHeadlessChange` — écouté par 3 module(s)
- `onEditorPaste`
- `onEditorSelectAll`

## Appels vers le moteur (C++)

- `Engine.` `cancelShutdown`
- `FS:` `copyFile`, `directoryCreate`, `directoryRemove`, `findFiles`, `renameFile`
- `Sim.` `findObjectById`, `serializeObjectToDirectories`
- `obj:` `deleteObject`, `isLocked`
- `worldEditorCppApi.` `clearSceneDirtyFlag`, `disableSimSetAndSimObjectSignals`, `getClassIsRenderable`, `getClassIsSelectable`, `setClassIsRenderable`, `setClassIsSelectable`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/api/core.lua`.*
