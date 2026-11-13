# `editor_missionPlaybook_missionTreeViewer`

*Fichier : `lua/ge/extensions/editor/missionPlaybook/missionTreeViewer.lua` · VM : Game Engine (GE) · 261 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_missionPlaybook_missionTreeViewer` : `extensions.load("editor_missionPlaybook_missionTreeViewer")`, puis la globale `editor_missionPlaybook_missionTreeViewer`

Fenêtre « Playbook Mission Tree Viewer » associée à editor_missionPlaybook. Elle dessine, avec l'éditeur de nœuds du flowgraph (ui_flowgraph_editor), l'arbre de déblocage des missions de carrière : un nœud par mission (showInCareer), placé selon la profondeur forwardInfo.depth, relié aux missions qu'elle débloque (forwardIds). La couleur indique l'état (vert démarrable, jaune visible, rouge sinon) et des icônes d'étoiles montrent les étoiles débloquées à l'étape courante du playbook (étoile pleine, vide, ou « stars » pour débloquée à cette étape).

## Remarques

- Il faut cliquer sur « Generate » pour créer les nœuds (generateNodes) ; sans cela M.nodes reste vide.
- La fenêtre n'est dessinée que si « Mission Playbook » est visible et que book.results[book.page] existe.
- Bug : M.onEditorRegisterPreferences est assigné à une variable globale non définie (nil).
- Du code de débogage (dump) reste actif dans onEditorGui et onPlaybookLogAfterStep.
- createRect.is_empty référence w et h globaux (non définis) ; fonction inutilisée.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_missionPlaybook_missionTreeViewer.onEditorGui()` | Hook d'éditeur appelé à chaque frame : crée (une fois) un contexte d'éditeur de nœuds dédié, dessine les nœuds et les liens puis restaure le contexte précédent. *(interne)* *(hook)* | 183 |
| `editor_missionPlaybook_missionTreeViewer.onEditorInitialized()` | Hook appelé à l'initialisation de l'éditeur : enregistre la fenêtre (500x500) et l'entrée de menu « Missions ». *(interne)* *(hook)* | 229 |
| `editor_missionPlaybook_missionTreeViewer.onPlaybookLogAfterStep(resultData)` | Hook émis après chaque instruction du playbook : ajoute à resultData les étoiles débloquées par mission (unlockedStars) et celles débloquées à cette étape (unlockedThisStep). *(interne)* *(hook)* | 234 |
| `editor_missionPlaybook_missionTreeViewer.show()` | Affiche les fenêtres « Mission Playbook » et « Playbook Mission Tree Viewer ». | 224 |

### Détail des paramètres

#### `editor_missionPlaybook_missionTreeViewer.onPlaybookLogAfterStep(resultData)`

Hook émis après chaque instruction du playbook : ajoute à resultData les étoiles débloquées par mission (unlockedStars) et celles débloquées à cette étape (unlockedThisStep).

- `resultData` (*table*) : Résultat de l'étape, modifié sur place.

## Champs

| Champ | Type | Description |
|---|---|---|
| `nodes` | table[] | Nœuds générés : {id, name, missionId, pos}. |
| `nodesByMId` | table<string, table> | Nœuds indexés par id de mission. |
| `onEditorRegisterPreferences` | any |  ⚠ référence `onEditorRegisterPreferences` non définie dans le fichier (vaut probablement nil) |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/missionPlaybook/missionTreeViewer.lua`.*
