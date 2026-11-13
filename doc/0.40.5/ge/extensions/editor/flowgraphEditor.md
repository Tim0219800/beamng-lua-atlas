# `editor_flowgraphEditor`

*Fichier : `lua/ge/extensions/editor/flowgraphEditor.lua` · VM : Game Engine (GE) · 1101 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_flowgraphEditor` : `extensions.load("editor_flowgraphEditor")`, puis la globale `editor_flowgraphEditor`

Extension de l'éditeur de jeu qui héberge l'éditeur Flowgraph (éditeur visuel de graphes de nœuds pour le gameplay, les scénarios et les missions). Elle crée la fenêtre principale (flowgraph/main) et toutes les fenêtres annexes (overview, stateView, events, examples, properties, variables, projectSettings, history, welcome, nodelibrary, execution, search, references, garbageDebug), gère le manager courant (core_flowgraphManager), l'ouverture/sauvegarde de fichiers .flow.json, l'autosave, les fichiers récents, les raccourcis d'édition et l'enregistrement des préférences flowgraph.general.* et flowgraph.debug.*.

## Exemple

```lua
extensions.load('editor_flowgraphEditor')
editor_flowgraphEditor.open()
local mgr = editor_flowgraphEditor.getManager()
```

## Remarques

- Les fonctions de dessin et les hooks onEditor* ne fonctionnent que lorsque l'éditeur est actif et initialisé (onEditorInitialized crée les fenêtres et le contexte ui_flowgraph_editor).
- Fichiers de projet : *.flow.json ; macros : *.macro.flow.json ; autosaves dans flowgraphEditor/autoSaves/ (nom <timestamp>_<nom du projet>.flow.json), intervalle par défaut 120 s (préférence flowgraph.general.autosaveInterval, 30-600).
- setManager ne change le manager qu'au prochain onEditorGui (sauf instant = true).
- Incohérences dans le code : save() teste la préférence flowgraph.general.editorDebug alors que celle enregistrée est flowgraph.debug.editorDebug (le test est donc toujours « faux »), saveFile() log une erreur pour un projet transitoire mais ne s'arrête pas ; onClientStartMission écrit M.requesteEditor (faute de frappe) donc requestedEditor n'est jamais remis à false ; showNodeReferences appelle winReferences:searchFor qui n'existe pas ; la boucle de restauration de onEditorGui utilise une variable globale `done` toujours nil ; onWindowMenuItem appelle open() avant sa déclaration locale (non exportée, non utilisée).
- M.onUpdate est la petite fenêtre « FG Monitor » affichée quand l'éditeur est désactivé mais que showSmallFgWindow est vrai.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_flowgraphEditor.addHistory(title, graph)` | Programme un instantané d'historique (undo) du projet avec un titre ; le snapshot est pris plus tard (delayedHistorySnapshot). Affiche aussi le titre dans la console. | 392 |
| `editor_flowgraphEditor.arrowControllableWindowCall(fun, ...)` | Appelle une méthode sur la fenêtre contrôlable au clavier courante (recherche, bibliothèque de nœuds), s'il y en a une. | 848 |
| `editor_flowgraphEditor.autoSave()` | Sauvegarde automatique : si le minuteur est écoulé, que le projet est modifiable et non transitoire, écrit une copie dans flowgraphEditor/autoSaves/ et réarme le minuteur. | 149 |
| `editor_flowgraphEditor.closeCurrent()` | Ferme le projet courant (removeManager) et bascule sur le premier manager restant ou nil. | 100 |
| `editor_flowgraphEditor.drawContextMenus()` | Dessine le popup « CreateNodeContentMenu » (bibliothèque de nœuds à la position mgr.newNodePos). *(interne)* | 378 |
| `editor_flowgraphEditor.drawEditor(dtReal, dtSim, dtRaw)` | Dessine l'éditeur complet pour la frame : manager, fenêtre principale, toutes les fenêtres annexes, gestion du double-clic de nœud, autosave. Appelée depuis onEditorGui. *(interne)* | 473 |
| `editor_flowgraphEditor.drawExecution()` | Dessine la vue d'exécution seule (executionView:drawAlone). *(interne)* | 386 |
| `editor_flowgraphEditor.drawRestoreMenu()` | Dessine le sous-menu « Restore... » listant les fichiers d'autosave regroupés par projet d'origine (date UTC). *(interne)* | 406 |
| `editor_flowgraphEditor.getManager()` | Renvoie le manager flowgraph affiché dans l'éditeur. | 797 |
| `editor_flowgraphEditor.getPropertiesWindow()` | Renvoie la fenêtre Properties. | 1059 |
| `editor_flowgraphEditor.isActionMapEnabled(map)` | Indique si l'action map « <map>ActionMap » est active et activée. | 1048 |
| `editor_flowgraphEditor.onClientStartMission()` | Hook appelé au démarrage d'une mission/niveau côté client : si requestedEditor est vrai, active l'éditeur et ouvre la fenêtre Flowgraph. *(interne)* *(hook)* | 822 |
| `editor_flowgraphEditor.onDeserialized(data)` | Hook de restauration après rechargement Lua : mémorise les fenêtres ouvertes (data.windows) et le nom du manager courant (data.currentMgrName). *(interne)* *(hook)* | 792 |
| `editor_flowgraphEditor.onEditorActivated()` | Hook appelé à l'activation de l'éditeur : masque la petite fenêtre FG Monitor. *(interne)* *(hook)* | 629 |
| `editor_flowgraphEditor.onEditorDeactivated()` | Hook appelé à la désactivation de l'éditeur : dépile les action maps FlowgraphMain et Flowgraph. *(interne)* *(hook)* | 623 |
| `editor_flowgraphEditor.onEditorGui(dtReal, dtSim, dtRaw)` | Hook appelé à chaque frame par l'éditeur : gère action maps, tooltips, changement de manager, puis dessine l'éditeur (drawEditor) si la fenêtre principale est visible. *(interne)* *(hook)* | 260 |
| `editor_flowgraphEditor.onEditorInitialized()` | Hook appelé quand l'éditeur est prêt : crée les fenêtres, l'entrée de menu « Flowgraph Editor » (groupe Gameplay), le contexte d'éditeur de nœuds, restaure les fenêtres ouvertes et déclare le mode d'édition flowgraphTransform. *(interne)* *(hook)* | 641 |
| `editor_flowgraphEditor.onEditorRegisterPreferences(prefsRegistry)` | Hook d'enregistrement des préférences : catégorie 'flowgraph' avec sous-catégories 'general' (pins, fichiers récents, autosave…) et 'debug' (editorDebug, displayIds…). *(interne)* *(hook)* | 745 |
| `editor_flowgraphEditor.onSerialize()` | Hook de sauvegarde avant rechargement Lua : renvoie l'état des fenêtres et le nom du manager courant (table vide si les fenêtres n'existent pas). *(interne)* *(hook)* | 693 |
| `editor_flowgraphEditor.onUpdate(dtReal, dtSim, dtRaw)` | Hook appelé à chaque frame : dessine la petite fenêtre « FG Monitor » (bouton pour agrandir l'éditeur) quand showSmallFgWindow est vrai. *(interne)* *(hook)* | 552 |
| `editor_flowgraphEditor.open()` | Ouvre (affiche) la fenêtre principale de l'éditeur Flowgraph. | 618 |
| `editor_flowgraphEditor.openFile(fCbData, openAsNewManager, keepSavedDirs)` | Ouvre un fichier .flow.json : soit comme nouveau manager (et le rend courant), soit en rechargeant les données dans le manager courant. Met à jour le dossier et les fichiers récents. | 80 |
| `editor_flowgraphEditor.save()` | Enregistre le projet courant : saveFile s'il a déjà un nom/dossier, sinon ouvre le dialogue « Enregistrer sous ». Réarme l'autosave. | 139 |
| `editor_flowgraphEditor.saveAsFile(fCbData)` | Définit le dossier et le nom de fichier du projet d'après le chemin choisi, puis sauvegarde. | 195 |
| `editor_flowgraphEditor.saveCurrent()` | Sauvegarde le graphe courant : la macro (saveMacro) s'il s'agit d'une macro avec chemin, sinon le projet (save). | 131 |
| `editor_flowgraphEditor.saveFile()` | Écrit le projet dans savedDir/savedFilename (JSON indenté). Refuse si le projet n'a pas de nom ou n'est pas à l'arrêt (runningState ~= 'stopped'), marque les graphes propres, renomme « New Project » d'après le fichier et met à jour les fichiers récents. | 160 |
| `editor_flowgraphEditor.saveMacro(graph)` | Sauvegarde une macro : ouvre le popup « Unsaved macros » si des macros enfants sont modifiées, sinon écrit au chemin existant (macroPath) ou ouvre le dialogue (.macro.flow.json). | 114 |
| `editor_flowgraphEditor.setManager(newMgr, instant)` | Demande de changer le manager affiché (appliqué au prochain onEditorGui, ou immédiatement avec instant). | 685 |
| `editor_flowgraphEditor.showNodeReferences(node)` | Ouvre la fenêtre References et lui demande de chercher un nœud. Bug : appelle winReferences:searchFor qui n'existe pas dans references.lua. | 835 |
| `editor_flowgraphEditor.uiAutoConnectShortcut()` | Raccourci : relie automatiquement les pins de sortie du nœud de gauche aux pins d'entrée libres du nœud de droite, d'après la ressemblance des pins (nodelib:ratePinSimilarity) et si le lien est possible. Fonctionne avec un lien sélectionné, un nœud ayant un seul voisin, ou deux nœuds sélectionnés. | 913 |
| `editor_flowgraphEditor.uiDisconnectShortcut()` | Raccourci : supprime les liens sélectionnés, ou les liens reliant les nœuds sélectionnés au reste du graphe (à défaut, ceux entre nœuds sélectionnés). | 1000 |
| `editor_flowgraphEditor.uiFindShortcut()` | Raccourci : ouvre la fenêtre Search et place le focus dans le champ de recherche. | 1033 |
| `editor_flowgraphEditor.uiFocusNodesShortcut()` | Raccourci : recentre la vue du graphe sur la sélection, ou sur tout le contenu s'il n'y a pas de sélection. | 854 |
| `editor_flowgraphEditor.uiHideShortcut(hide)` | Raccourci : bascule la visibilité des liens sélectionnés ; sans lien sélectionné, masque ou affiche les liens des nœuds sélectionnés. Ajoute un instantané d'historique. | 864 |
| `editor_flowgraphEditor.uiShowSourceShortcut()` | Raccourci : ouvre l'explorateur de fichiers sur le fichier source du nœud sélectionné (node.sourcePath), s'il y en a exactement un. | 903 |
| `editor_flowgraphEditor.uiToggleCategoryShortcut()` | Raccourci : bascule le mode dynamique (toggleDynamicMode) du nœud sélectionné, s'il y en a exactement un. | 1038 |
| `editor_flowgraphEditor.windowsMenu()` | Dessine le contenu du menu « Windows » : une entrée par fenêtre (cochée si visible) et « Open All » / « Close All ». *(interne)* | 801 |

### Détail des paramètres

#### `editor_flowgraphEditor.addHistory(title, graph)`

Programme un instantané d'historique (undo) du projet avec un titre ; le snapshot est pris plus tard (delayedHistorySnapshot). Affiche aussi le titre dans la console.

- `title` (*string*) : Texte de l'entrée d'historique.
- `graph` (*table|boolean|nil*) : Graphe concerné ; nil = graphe courant ; un autre type (ex. false) = pas de graphe.

#### `editor_flowgraphEditor.arrowControllableWindowCall(fun, ...)`

Appelle une méthode sur la fenêtre contrôlable au clavier courante (recherche, bibliothèque de nœuds), s'il y en a une.

- `fun` (*string*) : Nom de la méthode (ex. 'navigateList', 'createNode').
- `...` (*any*) : Arguments passés à la méthode.

#### `editor_flowgraphEditor.drawEditor(dtReal, dtSim, dtRaw)`

Dessine l'éditeur complet pour la frame : manager, fenêtre principale, toutes les fenêtres annexes, gestion du double-clic de nœud, autosave. Appelée depuis onEditorGui.

- `dtReal` (*number*) : Delta temps réel (s).
- `dtSim` (*number*) : Delta temps simulation (s).
- `dtRaw` (*number*) : Delta temps brut (s).

#### `editor_flowgraphEditor.getManager()`

Renvoie le manager flowgraph affiché dans l'éditeur.

- **renvoie** : table|nil Manager courant.

#### `editor_flowgraphEditor.getPropertiesWindow()`

Renvoie la fenêtre Properties.

- **renvoie** : table Instance de la fenêtre properties.

#### `editor_flowgraphEditor.isActionMapEnabled(map)`

Indique si l'action map « <map>ActionMap » est active et activée.

- `map` (*string*) : Nom sans le suffixe 'ActionMap'.
- **renvoie** : boolean true si activée.

#### `editor_flowgraphEditor.onDeserialized(data)`

Hook de restauration après rechargement Lua : mémorise les fenêtres ouvertes (data.windows) et le nom du manager courant (data.currentMgrName).

- `data` (*table*) : Données produites par onSerialize.

#### `editor_flowgraphEditor.onEditorGui(dtReal, dtSim, dtRaw)`

Hook appelé à chaque frame par l'éditeur : gère action maps, tooltips, changement de manager, puis dessine l'éditeur (drawEditor) si la fenêtre principale est visible.

- `dtReal` (*number*) : Delta temps réel (s).
- `dtSim` (*number*) : Delta temps simulation (s).
- `dtRaw` (*number*) : Delta temps brut (s).

#### `editor_flowgraphEditor.onEditorRegisterPreferences(prefsRegistry)`

Hook d'enregistrement des préférences : catégorie 'flowgraph' avec sous-catégories 'general' (pins, fichiers récents, autosave…) et 'debug' (editorDebug, displayIds…).

- `prefsRegistry` (*table*) : Registre de préférences de l'éditeur.

#### `editor_flowgraphEditor.onSerialize()`

Hook de sauvegarde avant rechargement Lua : renvoie l'état des fenêtres et le nom du manager courant (table vide si les fenêtres n'existent pas).

- **renvoie** : table Données sérialisées.

#### `editor_flowgraphEditor.onUpdate(dtReal, dtSim, dtRaw)`

Hook appelé à chaque frame : dessine la petite fenêtre « FG Monitor » (bouton pour agrandir l'éditeur) quand showSmallFgWindow est vrai.

- `dtReal` (*number*) : Delta temps réel (s).
- `dtSim` (*number*) : Delta temps simulation (s).
- `dtRaw` (*number*) : Delta temps brut (s).

#### `editor_flowgraphEditor.openFile(fCbData, openAsNewManager, keepSavedDirs)`

Ouvre un fichier .flow.json : soit comme nouveau manager (et le rend courant), soit en rechargeant les données dans le manager courant. Met à jour le dossier et les fichiers récents.

- `fCbData` (*table*) : Données du dialogue de fichier, avec le champ filepath.
- `openAsNewManager` (*boolean|nil*) : true pour créer un nouveau manager.
- `keepSavedDirs` (*boolean|nil*) : Transmis à loadManager (conserver les dossiers enregistrés).

#### `editor_flowgraphEditor.saveAsFile(fCbData)`

Définit le dossier et le nom de fichier du projet d'après le chemin choisi, puis sauvegarde.

- `fCbData` (*table*) : Données du dialogue, champ filepath.

#### `editor_flowgraphEditor.saveMacro(graph)`

Sauvegarde une macro : ouvre le popup « Unsaved macros » si des macros enfants sont modifiées, sinon écrit au chemin existant (macroPath) ou ouvre le dialogue (.macro.flow.json).

- `graph` (*table*) : Graphe de type macro.

#### `editor_flowgraphEditor.setManager(newMgr, instant)`

Demande de changer le manager affiché (appliqué au prochain onEditorGui, ou immédiatement avec instant).

- `newMgr` (*table|nil*) : Manager flowgraph.
- `instant` (*boolean|nil*) : Appliquer tout de suite à la variable locale mgr.

#### `editor_flowgraphEditor.showNodeReferences(node)`

Ouvre la fenêtre References et lui demande de chercher un nœud. Bug : appelle winReferences:searchFor qui n'existe pas dans references.lua.

- `node` (*table*) : Nœud à rechercher.

#### `editor_flowgraphEditor.uiHideShortcut(hide)`

Raccourci : bascule la visibilité des liens sélectionnés ; sans lien sélectionné, masque ou affiche les liens des nœuds sélectionnés. Ajoute un instantané d'historique.

- `hide` (*boolean*) : Valeur appliquée aux liens des nœuds sélectionnés quand aucun lien n'est sélectionné.

## Champs

| Champ | Type | Description |
|---|---|---|
| `allowTooltip` | boolean | Vrai quand la souris est immobile depuis plus de 0,5 s et qu'aucun bouton n'est enfoncé : autorise l'affichage des tooltips. |
| `forceOpen` | table<string, boolean> | Valeurs initiales {states = true, log = true} indiquant des vues à ouvrir de force. |
| `lastOpenedFolder` | string | Dernier dossier utilisé pour ouvrir/enregistrer (défaut 'flowgraphEditor/'). |
| `pushedNodeLibActionMap` | boolean | Vrai si l'action map 'NodeLibrary' a été poussée par une fenêtre de recherche. |
| `requestedEditor` | boolean | Si vrai, onClientStartMission active l'éditeur et ouvre Flowgraph. |
| `settings` | table | Réglages d'interface : viewModes = {'default', 'simple', 'flowLevel', 'debug'}. |
| `showSmallFgWindow` | ImBoolPtr | Affichage de la petite fenêtre « FG Monitor » (BoolPtr). |
| `switchToSmallWindow` | boolean | Si vrai, le prochain drawEditor désactive l'éditeur et affiche la petite fenêtre. |

## Appels vers le moteur (C++)

- `FS:` `fileExists`, `findFiles`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/flowgraphEditor.lua`.*
