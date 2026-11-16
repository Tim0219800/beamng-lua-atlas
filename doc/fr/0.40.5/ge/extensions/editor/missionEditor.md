# `editor_missionEditor`

*Fichier : `lua/ge/extensions/editor/missionEditor.lua` · VM : Game Engine (GE) · 1791 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_missionEditor` : `extensions.load("editor_missionEditor")`, puis la globale `editor_missionEditor`

Fenêtre « Mission Editor » du world editor pour créer et modifier les missions du jeu (info.json de chaque dossier de mission). Elle liste les missions avec filtres (niveau courant, procédurales, carrière, freeroam), recherche et regroupement (niveau, type, date, branche), et propose le menu File (nouvelle mission, sauvegarde, suppression). Elle instancie les sous-fenêtres du dossier missionEditor/ (general, conditions, careerSetup, additionalAttributes, startTrigger, layers, setupModules, genericTypeData, objectives, progressSingle, progressMulti, playbookUtils, issues, previewChecker) et délègue l'édition de chaque section. Dépend de gameplay_missions_missions.

## Exemple

```lua
extensions.load('editor_missionEditor')
editor_missionEditor.show()
editor_missionEditor.setMissionById('west_coast_usa/arrive/mission1')
```

## Remarques

- Les modifications d'une mission sont repérées par mission._dirty = true ; « Save » appelle gameplay_missions_missions.saveMission(mission, mission.missionFolder).
- La suppression d'une mission efface réellement des fichiers (FS:removeFile et FS:directoryRemove sur le dossier de la mission) : à manipuler avec précaution.
- Les préférences missionEditor.general stockent groupFilter, showWindows, shortIds (identifiants courts) et alwaysShowScreenshots.
- L'éditeur de dev (missionEditor/dev.lua) est commenté dans loadWindows et n'est donc pas utilisé.
- Bug : getSelectedMissionId renvoie clickedMission, c'est-à-dire la table de la mission cliquée (ou nil), et non son identifiant.
- onConsoleLog ne fait que print(timer) : il n'affiche ni le niveau ni la ligne du message.
- onSerialize/onDeserialized conservent la dernière mission sélectionnée et le dernier onglet à travers un rechargement Lua.

**Dépendances (chargées avant) :** `gameplay_missions_missions`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_missionEditor.clickMission(m)` | Simule un clic sur une mission : elle sera sélectionnée à la prochaine image. | 1730 |
| `editor_missionEditor.getCurrentEditorHelperWhenActive()` | Renvoie l'assistant d'édition du type de mission courant, uniquement si la fenêtre est visible et qu'une mission est chargée ; sinon nil. | 1752 |
| `editor_missionEditor.getMissionList()` | Renvoie la liste des données de missions chargée par l'éditeur (gameplay_missions_missions.getFilesData), ou nil si elle n'a pas encore été chargée. | 1729 |
| `editor_missionEditor.getMissionTypeWindow()` | Renvoie la sous-fenêtre des données propres au type de mission (genericTypeData). | 1733 |
| `editor_missionEditor.getSelectedMissionId()` | Renvoie la mission actuellement cliquée. Malgré le nom, c'est la table de la mission (clickedMission) et non son id. | 1786 |
| `editor_missionEditor.getStartTriggerWindow()` | Renvoie la sous-fenêtre de l'éditeur de déclencheur de départ (startTrigger). | 1732 |
| `editor_missionEditor.onConsoleLog(timer, lvl, origin, line)` | Hook appelé pour chaque ligne de la console du jeu ; n'affiche que print(timer). *(interne)* *(hook)* | 1782 |
| `editor_missionEditor.onDeserialized(data)` | Hook de désérialisation : réélit la dernière mission (setMissionById) et force l'ouverture de l'arbre et de l'onglet mémorisés. *(interne)* *(hook)* | 1711 |
| `editor_missionEditor.onEditorGui()` | Hook appelé à chaque image par le world editor : dessine la fenêtre Mission Editor (barre de menu, liste, onglets de la mission, fenêtre des problèmes) et traite les clics. *(interne)* *(hook)* | 1074 |
| `editor_missionEditor.onEditorInitialized()` | Hook d'initialisation du world editor : enregistre les fenêtres mission_editor (1500x700) et mission_issues (700x700), l'entrée de menu « Mission Editor » (groupe Missions), charge le filtre et restaure showWindows depuis les préférences. *(interne)* *(hook)* | 1673 |
| `editor_missionEditor.onEditorRegisterPreferences(prefsRegistry)` | Hook : enregistre la catégorie de préférences missionEditor.general (groupFilter, showWindows, shortIds, alwaysShowScreenshots). *(interne)* *(hook)* | 1689 |
| `editor_missionEditor.onSerialize()` | Hook de sérialisation d'extension : mémorise l'id de la dernière mission affichée et le dernier onglet. *(interne)* *(hook)* | 1703 |
| `editor_missionEditor.reloadMissionSystem()` | Recharge tout le système de missions (gameplay_missions_missions.reloadCompleteMissionSystem), relit la liste, retrouve la mission précédemment affichée, remet à jour les sous-fenêtres et réapplique filtre, recherche et regroupement. | 1758 |
| `editor_missionEditor.setMissionById(id, instant)` | Sélectionne la mission d'id donné et ouvre l'arbre. Charge la liste si nécessaire. Avec instant, les sous-fenêtres sont aussitôt mises à jour (setMission). Ne fait rien si l'id n'existe pas. | 1734 |
| `editor_missionEditor.show()` | Ouvre la fenêtre « mission_editor » (editor.showWindow) et recharge le filtre de regroupement enregistré. | 1668 |

### Détail des paramètres

#### `editor_missionEditor.clickMission(m)`

Simule un clic sur une mission : elle sera sélectionnée à la prochaine image.

- `m` (*table*) : Données de mission (élément de getMissionList).

#### `editor_missionEditor.getCurrentEditorHelperWhenActive()`

Renvoie l'assistant d'édition du type de mission courant, uniquement si la fenêtre est visible et qu'une mission est chargée ; sinon nil.

- **renvoie** : table|nil Résultat de missionTypeWindow:getCurrentEditorHelper().

#### `editor_missionEditor.getMissionList()`

Renvoie la liste des données de missions chargée par l'éditeur (gameplay_missions_missions.getFilesData), ou nil si elle n'a pas encore été chargée.

- **renvoie** : table[]|nil Missions, chacune avec id, name, missionFolder, _dirty, etc.

#### `editor_missionEditor.getMissionTypeWindow()`

Renvoie la sous-fenêtre des données propres au type de mission (genericTypeData).

- **renvoie** : table Objet fenêtre, table vide avant le premier affichage.

#### `editor_missionEditor.getSelectedMissionId()`

Renvoie la mission actuellement cliquée. Malgré le nom, c'est la table de la mission (clickedMission) et non son id.

- **renvoie** : table|nil Données de la mission cliquée.

#### `editor_missionEditor.getStartTriggerWindow()`

Renvoie la sous-fenêtre de l'éditeur de déclencheur de départ (startTrigger).

- **renvoie** : table|nil Objet fenêtre, nil avant le premier affichage.

#### `editor_missionEditor.onConsoleLog(timer, lvl, origin, line)`

Hook appelé pour chaque ligne de la console du jeu ; n'affiche que print(timer).

- `timer` (*number*) : Horodatage du message.
- `lvl` (*string*) : Niveau (non utilisé).
- `origin` (*string*) : Origine (non utilisée).
- `line` (*string*) : Texte (non utilisé).

#### `editor_missionEditor.onDeserialized(data)`

Hook de désérialisation : réélit la dernière mission (setMissionById) et force l'ouverture de l'arbre et de l'onglet mémorisés.

- `data` (*table|nil*) : Données de onSerialize.

#### `editor_missionEditor.onEditorRegisterPreferences(prefsRegistry)`

Hook : enregistre la catégorie de préférences missionEditor.general (groupFilter, showWindows, shortIds, alwaysShowScreenshots).

- `prefsRegistry` (*table*) : Registre de préférences de l'éditeur.

#### `editor_missionEditor.onSerialize()`

Hook de sérialisation d'extension : mémorise l'id de la dernière mission affichée et le dernier onglet.

- **renvoie** : table {lastSelectedMissionId, lastTabItemShown}.

#### `editor_missionEditor.setMissionById(id, instant)`

Sélectionne la mission d'id donné et ouvre l'arbre. Charge la liste si nécessaire. Avec instant, les sous-fenêtres sont aussitôt mises à jour (setMission). Ne fait rien si l'id n'existe pas.

- `id` (*string*) : Identifiant de la mission.
- `instant` (*boolean|nil*) : true pour appliquer immédiatement aux sous-fenêtres.

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | string[] | {'gameplay_missions_missions'} : extension chargée avant celle-ci. |

**Évènements UI (guihooks.trigger) :** `MenuOpenModule`

## Appels vers le moteur (C++)

- `FS:` `directoryRemove`, `fileExists`, `findFiles`, `removeFile`

**Charge les extensions :** `career_modules_branches_leagues`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/missionEditor.lua`.*
