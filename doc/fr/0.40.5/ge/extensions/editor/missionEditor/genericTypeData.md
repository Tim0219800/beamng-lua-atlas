# `editor_missionEditor_genericTypeData`

*Fichier : `lua/ge/extensions/editor/missionEditor/genericTypeData.lua` · VM : Game Engine (GE) · 398 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/editor/missionEditor/genericTypeData")` (fichier sous extensions/ mais pas une extension classique)

Panneau de l'éditeur de missions qui édite le champ missionTypeData d'une mission. Il liste les types de mission (gameplay_missions_missions.getMissionTypes), choisit l'éditeur spécifique au type (gameplay_missions_missions.getMissionEditorForType) et, à défaut ou en mode « Raw », propose un éditeur JSON brut. Il fournit aussi un popup qui compare les variables de mission avec celles du projet Flowgraph ouvert (ajout et correction de type en un clic). Le module renvoie un constructeur (fonction) : require(...)(missionEditor) crée une instance via C:init.

## Exemple

```lua
local gtd = require('/lua/ge/extensions/editor/missionEditor/genericTypeData')(missionEditor)
gtd:setMission(mission)
-- dans la boucle imgui de l'éditeur :
gtd:draw()
```

## Remarques

- Le changement de type (changeMissionType) mémorise les anciennes données par mission et par type dans oldMissionTypeData, et les restaure si on revient au type précédent.
- L'éditeur JSON brut plafonne le texte à environ 8*(2+max(128, 4*taille)) / 8 caractères (affiché « char limit »). Un JSON invalide n'est pas sauvegardé et affiche un message en rouge.
- loadEditor n'est pas appelée dans ce fichier ; elle cherche /gameplay/missionTypes/<type>/editor.lua et crée un éditeur par défaut (editorHelper) sinon.
- Le champ mission._dirty est mis à true à chaque modification pour signaler qu'une sauvegarde est nécessaire.

## Classe `C`

Instance du panneau « Mission Type Data ». Champs principaux : missionEditor, mission, missionTypes (liste triée), missionTypeEditors (éditeur par type), rawEditPerMission, oldMissionTypeData, mtdIssues.

Le module renvoie un constructeur : `local obj = require("editor_missionEditor_genericTypeData")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:changeMissionType(newType, force)` | Change le type de la mission : sauvegarde les données du type actuel, crée (ou restaure) celles du nouveau type, puis rappelle setMission. | 77 |
| `C:draw()` | Dessine le panneau : combo du type de mission, case « Raw », bouton « Auto fix N issues », puis l'éditeur du type ou l'éditeur JSON brut. | 244 |
| `C:drawTools()` | Pour chaque type dont l'éditeur définit toolsFunctions, crée un sous-menu et appelle cette fonction. | 340 |
| `C:drawViews()` | Appelle drawViews(liste des missions) sur chaque éditeur de type qui le définit. | 364 |
| `C:drawViewsMenu()` | Pour chaque type dont l'éditeur définit viewFunctions, crée un sous-menu et appelle cette fonction. | 352 |
| `C:fillGeneric(mission)` | Remplace mission.missionTypeData par les données neuves fournies par l'éditeur du type de la mission (getNewData), ou {} s'il n'y en a pas. | 72 |
| `C:getCurrentEditorHelper()` | Renvoie l'éditeur du type de la mission courante. | 372 |
| `C:getMissionIssues(m)` | Renvoie la liste des problèmes d'une mission : résultat de checkContainer de l'éditeur de son type, plus ceux de calculateMissionIssues du type s'il existe (appelé en pcall). | 375 |
| `C:init(missionEditor)` | Constructeur appelé par la fonction renvoyée par le module. Récupère la liste triée des types de mission et l'éditeur de chaque type. | 25 |
| `C:loadEditor(missionType)` | Cherche /gameplay/missionTypes/<missionType>/editor.lua et l'instancie avec missionEditor. Si le fichier n'existe pas ou ne se charge pas, crée un éditeur générique via gameplay_missions_missions.editorHelper. | 41 |
| `C:openPopup()` | Ouvre le popup imgui « missionFGVariables » (aide aux variables Flowgraph). | 99 |
| `C:setMission(mission)` | Définit la mission courante, transmet le conteneur à l'éditeur de son type (setContainer) et recalcule les problèmes (checkContainer) dans self.mtdIssues. | 60 |
| `C:variablesHelperPopup()` | Dessine le popup qui classe les champs du type de mission en variables manquantes, de type différent, correctes, et variables présentes seulement dans le Flowgraph. Les boutons ajoutent les variables manquantes (valeur par défaut du type) ou corrigent leur type dans le projet Flowgraph courant (editor_flowgraphEditor.getManager()). À appeler à chaque frame. | 103 |

## Appels vers le moteur (C++)

- `FS:` `fileExists`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/missionEditor/genericTypeData.lua`.*
