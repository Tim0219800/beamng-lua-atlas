# `editor_raceEditor`

*Fichier : `lua/ge/extensions/editor/raceEditor.lua` · VM : Game Engine (GE) · 569 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_raceEditor` : `extensions.load("editor_raceEditor")`, puis la globale `editor_raceEditor`

Fenêtre principale « Race Tool » de l'éditeur de courses/chemins (menu Gameplay > Race/Path Editor, mode d'édition « Edit Races »). Elle gère le fichier de course courant (*.race.json, dossier par défaut /gameplay/races/) : charger, sauvegarder, nouvelle course, copie depuis un Time Trials de scénario, liste de toutes les courses. Elle héberge les sous-fenêtres (pathnodes, segments, startPositions, trackLayout, timeTrials, tools) et une fenêtre « Race Test » (testing). Les chargements passent par l'historique d'édition (annuler/rétablir). Le chemin courant est un objet gameplay/race/path.

## Exemple

```lua
local race = editor_raceEditor.getCurrentPath()
editor_raceEditor.saveRace(race, '/gameplay/races/maCourse.race.json')
editor_raceEditor.loadRace('/gameplay/races/maCourse.race.json')
```

## Remarques

- Préférences enregistrées (catégorie raceEditor.general) : directionalNodes (true par défaut), showAiRoute, showCustomFields, useSimpleDrag.
- Le sous-module pacenotes est commenté dans la liste des fenêtres (non chargé). Ordre des fenêtres : 1 pathnodes, 2 segments, 3 startPositions, 4 trackLayout, 5 timeTrials, 6 tools.
- loadRace renvoie currentPath au moment de l'appel : comme le remplacement est fait plus tard par l'action d'historique (setRaceRedo), la valeur renvoyée peut être l'ancien chemin et non le chemin chargé.
- Dans setRaceRedo/setRaceUndo, la boucle « for _, window in ipairs(windows) » appelle currentWindow et non window : seule la fenêtre courante est mise à jour, N fois.
- Un dialogue « All Races » cherche tous les *.race.json de tout le système de fichiers virtuel (peut prendre quelques secondes).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_raceEditor.allowGizmo()` | Indique si le gizmo d'édition est autorisé : vrai quand le mode d'édition courant est « Edit Races ». | 551 |
| `editor_raceEditor.calculateAiRoute()` | Appelle autoConfig() puis getAiPath() sur le chemin courant pour recalculer la route IA (et la distance aiPathDistance). | 28 |
| `editor_raceEditor.changedFromExternal()` | À appeler quand le chemin courant a été modifié hors de la fenêtre : redonne le chemin à la sous-fenêtre active (setPath). | 555 |
| `editor_raceEditor.getCurrentFilename()` | Renvoie le chemin complet du fichier de course courant (dossier + nom). | 552 |
| `editor_raceEditor.getCurrentPath()` | Renvoie l'objet gameplay/race/path en cours d'édition. | 553 |
| `editor_raceEditor.getToolsWindow()` | Renvoie la sous-fenêtre « tools » de l'éditeur de course. | 567 |
| `editor_raceEditor.isVisible()` | Indique si la fenêtre « Race Tool » est affichée. | 554 |
| `editor_raceEditor.loadRace(filename)` | Lit un fichier .race.json, construit un nouveau chemin (onDeserialized), recalcule la route IA et valide une action d'historique « Set path to <nom> » pour le remplacer. Ne fait rien si filename est nil ; logue une erreur si le fichier est introuvable. | 79 |
| `editor_raceEditor.onDeserialized(data)` | Appelé après un rechargement Lua avec l'état sauvegardé ; restaure le chemin, le nom et le dossier du fichier, puis recalcule la route IA. *(interne)* *(hook)* | 520 |
| `editor_raceEditor.onEditorGui()` | Appelé à chaque frame. Dessine la fenêtre Race Tool (menu File, listes, onglets des sous-fenêtres) et repasse en mode objectSelect si la fenêtre est masquée. *(interne)* *(hook)* | 254 |
| `editor_raceEditor.onEditorInitialized()` | Déclare le mode d'édition raceEditMode, enregistre la fenêtre (500x500) et l'entrée de menu, puis instancie les sous-fenêtres et la fenêtre de test. *(interne)* *(hook)* | 471 |
| `editor_raceEditor.onEditorRegisterPreferences(prefsRegistry)` | Déclare la catégorie de préférences raceEditor (directionalNodes, showAiRoute, showCustomFields, useSimpleDrag). *(interne)* *(hook)* | 535 |
| `editor_raceEditor.onEditorToolWindowHide(windowName)` | Si la fenêtre masquée est raceEditorTool, repasse en mode objectSelect. *(interne)* *(hook)* | 499 |
| `editor_raceEditor.onSerialize()` | Appelé avant un rechargement Lua ; sérialise le chemin courant et le dernier dossier/nom de fichier. *(interne)* *(hook)* | 511 |
| `editor_raceEditor.onUpdate(dtReal, dtSim, dtRaw)` | Hook de mise à jour ; dessine la fenêtre « Race Test » (testingWindow:draw(dtSim)) quand elle est ouverte. *(interne)* *(hook)* | 113 |
| `editor_raceEditor.onWindowGotFocus(windowName)` | Si la fenêtre qui prend le focus est raceEditorTool, active le mode d'édition raceEditMode. *(interne)* *(hook)* | 505 |
| `editor_raceEditor.saveRace(race, savePath)` | Sérialise une course et l'écrit en JSON (jsonWriteFile, joli format). Met à jour le dossier et le nom de fichier mémorisés. | 67 |
| `editor_raceEditor.setupRace()` | Ouvre la fenêtre « Race Test », lui donne le chemin courant et prépare la course de test (testingWindow:setupRace). | 106 |
| `editor_raceEditor.show()` | Vide la sélection, affiche la fenêtre Race Tool et active le mode d'édition raceEditMode. | 447 |

### Détail des paramètres

#### `editor_raceEditor.allowGizmo()`

Indique si le gizmo d'édition est autorisé : vrai quand le mode d'édition courant est « Edit Races ».

- **renvoie** : boolean true si le mode d'édition courant est celui de l'éditeur de course.

#### `editor_raceEditor.getCurrentFilename()`

Renvoie le chemin complet du fichier de course courant (dossier + nom).

- **renvoie** : string Par défaut « /gameplay/races/NewRace.race.json ».

#### `editor_raceEditor.getCurrentPath()`

Renvoie l'objet gameplay/race/path en cours d'édition.

- **renvoie** : table Objet chemin de course (pathnodes, segments, startPositions…).

#### `editor_raceEditor.getToolsWindow()`

Renvoie la sous-fenêtre « tools » de l'éditeur de course.

- **renvoie** : table Instance du module raceEditor/tools.

#### `editor_raceEditor.isVisible()`

Indique si la fenêtre « Race Tool » est affichée.

- **renvoie** : boolean Visibilité de la fenêtre raceEditorTool.

#### `editor_raceEditor.loadRace(filename)`

Lit un fichier .race.json, construit un nouveau chemin (onDeserialized), recalcule la route IA et valide une action d'historique « Set path to <nom> » pour le remplacer. Ne fait rien si filename est nil ; logue une erreur si le fichier est introuvable.

- `filename` (*string|nil*) : Chemin du fichier .race.json.
- **renvoie** : table|nil currentPath (voir notes : peut être l'ancien chemin).

#### `editor_raceEditor.onDeserialized(data)`

Appelé après un rechargement Lua avec l'état sauvegardé ; restaure le chemin, le nom et le dossier du fichier, puis recalcule la route IA.

- `data` (*table|nil*) : Table de onSerialize : path, previousFilepath, previousFilename.

#### `editor_raceEditor.onEditorRegisterPreferences(prefsRegistry)`

Déclare la catégorie de préférences raceEditor (directionalNodes, showAiRoute, showCustomFields, useSimpleDrag).

- `prefsRegistry` (*table*) : Registre de préférences de l'éditeur.

#### `editor_raceEditor.onEditorToolWindowHide(windowName)`

Si la fenêtre masquée est raceEditorTool, repasse en mode objectSelect.

- `windowName` (*string*) : Nom de la fenêtre masquée.

#### `editor_raceEditor.onSerialize()`

Appelé avant un rechargement Lua ; sérialise le chemin courant et le dernier dossier/nom de fichier.

- **renvoie** : table {path, previousFilepath, previousFilename}.

#### `editor_raceEditor.onUpdate(dtReal, dtSim, dtRaw)`

Hook de mise à jour ; dessine la fenêtre « Race Test » (testingWindow:draw(dtSim)) quand elle est ouverte.

- `dtReal` (*number*) : Delta temps réel (non utilisé).
- `dtSim` (*number*) : Delta temps de simulation passé à la fenêtre de test.
- `dtRaw` (*number*) : Delta temps brut (non utilisé).

#### `editor_raceEditor.onWindowGotFocus(windowName)`

Si la fenêtre qui prend le focus est raceEditorTool, active le mode d'édition raceEditMode.

- `windowName` (*string*) : Nom de la fenêtre.

#### `editor_raceEditor.saveRace(race, savePath)`

Sérialise une course et l'écrit en JSON (jsonWriteFile, joli format). Met à jour le dossier et le nom de fichier mémorisés.

- `race` (*table|nil*) : Chemin de course à sauvegarder ; si nil, utilise le chemin courant.
- `savePath` (*string*) : Chemin complet du fichier de sortie.

## Appels vers le moteur (C++)

- `FS:` `findFiles`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/raceEditor.lua`.*
