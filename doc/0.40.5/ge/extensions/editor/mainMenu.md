# `editor_mainMenu`

*Fichier : `lua/ge/extensions/editor/mainMenu.lua` · VM : Game Engine (GE) · 941 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_mainMenu` : `extensions.load("editor_mainMenu")`, puis la globale `editor_mainMenu`

Barre de menu principale du World Editor : menus File, Edit, Camera, Object, View, Window, Help, plus titre du niveau, mode d'édition courant, notifications, barre d'état, métriques de scène (mémoire GPU/CPU), et boîtes de dialogue (À propos, mode sans échec, retour du niveau à l'original, sauvegarde/suppression/réinitialisation de layouts). Il fournit aux autres outils l'API editor.addWindowMenuItem (entrée dans le menu Window), editor.showNotification, editor.setStatusBar/hideStatusBar et editor.rebuildCollision.

## Exemple

```lua
editor.addWindowMenuItem("Mon outil", function() editor.showWindow("monOutil") end, {groupMenuName = 'Debug'})
editor.showNotification("Sauvegardé")
```

## Remarques

- Dans addWindowMenuItem, si `info` est fourni mais sans groupMenuName (par ex. seulement experimental ou gameplay), l'élément n'est ajouté à aucune liste : il n'apparaît donc pas dans le menu (bug probable du jeu). Sans `info`, l'entrée est ajoutée normalement.
- Le menu Window mémorise les outils récemment ouverts (préférence ui.general.recentWindowMenuCount, 5 par défaut), sauvegardés dans l'état de l'éditeur (windowMenuRecentTools).
- Le menu File n'a pas « Save Level As » (commenté dans le code).
- Le bouton « revert to original » n'apparaît que pour un niveau officiel ou issu d'un mod déballé dans /mods/unpacked ; il supprime le dossier du niveau puis rouvre le niveau (perte des modifications).
- En mode headless, seul le hook onEditorHeadlessMainMenuBar est émis, sans barre de menu.

**Dépendances (chargées avant) :** `editor_layoutManager`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_mainMenu.onEditorActivated()` | Appelé à l'activation de l'éditeur : applique aux gizmos les préférences gizmos.general.drawGizmoPlane et highlightSelectedMeshes. *(interne)* *(hook)* | 865 |
| `editor_mainMenu.onEditorGuiMainMenu()` | Dessine la barre de menu principale et les dialogues à chaque frame. Émet onEditorMainMenuBar (ou onEditorHeadlessMainMenuBar en headless). *(interne)* *(hook)* | 692 |
| `editor_mainMenu.onEditorInitialized()` | Enregistre les fenêtres de dialogue, ouvre la fenêtre de mode sans échec si besoin et détermine si le bouton « revert level to original » doit être proposé. *(interne)* *(hook)* | 872 |
| `editor_mainMenu.onEditorLoadState(state)` | Restaure la liste des outils récents depuis l'état (chaînes non vides uniquement). *(interne)* *(hook)* | 921 |
| `editor_mainMenu.onEditorPreferenceValueChanged(path, value)` | Réagit aux préférences ui.general.sceneMetric, gizmos.visualization.visTypes et ui.general.recentWindowMenuCount. *(interne)* *(hook)* | 906 |
| `editor_mainMenu.onEditorSaveState(state)` | Ajoute la liste des outils récents à l'état sauvegardé (state.windowMenuRecentTools). *(interne)* *(hook)* | 916 |
| `editor_mainMenu.onExtensionLoaded()` | Appelé au chargement : vide les listes de menus, crée la file de notifications (maxNotificationCount 100) et installe editor.addWindowMenuItem, showNotification, setStatusBar, hideStatusBar, rebuildCollision. *(interne)* *(hook)* | 847 |

### Détail des paramètres

#### `editor_mainMenu.onEditorLoadState(state)`

Restaure la liste des outils récents depuis l'état (chaînes non vides uniquement).

- `state` (*table|nil*) : État de l'éditeur.

#### `editor_mainMenu.onEditorPreferenceValueChanged(path, value)`

Réagit aux préférences ui.general.sceneMetric, gizmos.visualization.visTypes et ui.general.recentWindowMenuCount.

- `path` (*string*) : Chemin de la préférence.
- `value` (*any*) : Nouvelle valeur.

#### `editor_mainMenu.onEditorSaveState(state)`

Ajoute la liste des outils récents à l'état sauvegardé (state.windowMenuRecentTools).

- `state` (*table*) : État de l'éditeur à compléter.

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table<integer, string> | {"editor_layoutManager"}. |

## Classe `editor`

Fonctions ajoutées à la table globale `editor` par ce module.

Objet `editor` construit dans le module (par ex. par `new`), avec ces méthodes :

| Méthode | Description | Ligne |
|---|---|---|
| `editor.addWindowMenuItem(itemText, actionFunc, info, defaultToolWindow)` | Ajoute une entrée dans le menu Window de l'éditeur. Les entrées defaultToolWindow (Inspector, Scene Tree…) sont en tête du menu, séparées des autres ; les entrées sont triées par texte. Appelle le hook onEditorToolWindowOpened(itemText, "windowMenu") au clic. | 804 |
| `editor.hideStatusBar()` | Masque la barre d'état. À appeler quand l'opération est terminée. | 617 |
| `editor.rebuildCollision(force)` | Reconstruit la collision statique (be:reloadCollision, puis efface le drapeau) si nécessaire ou forcé, et affiche une notification. | 143 |
| `editor.setStatusBar(text, uiCallback)` | Définit le texte de la barre d'état et un callback ImGui optionnel (la barre n'est visible que si le texte est non vide). | 611 |
| `editor.showNotification(text, icon, group, duration, doBeep)` | Ajoute une notification à la file ; elle remplace celle du même groupe si elle existe. | 158 |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onEditorHeadlessMainMenuBar` — écouté par 1 module(s)
- `onEditorMainMenuBar` — écouté par 1 module(s)
- `onEditorToolWindowOpened` — écouté par 1 module(s)

## Appels vers le moteur (C++)

- `Engine.` `clearNeedCollisionRebuild`, `getNeedCollisionRebuild`
- `FS:` `directoryExists`, `directoryRemove`, `fileExists`, `findFiles`
- `be:` `reloadCollision`
- `worldEditorCppApi.` `colladaExportSelection`, `setAxisGizmoHighlightSelectedMeshes`, `setAxisGizmoRenderMoveGrid`, `setAxisGizmoRenderPlane`, `setAxisGizmoRenderPlaneHashes`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/mainMenu.lua`.*
