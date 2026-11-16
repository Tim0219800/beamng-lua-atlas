# `editor_missionPlaybook_unlockedMissionsViewer`

*Fichier : `lua/ge/extensions/editor/missionPlaybook/unlockedMissionsViewer.lua` · VM : Game Engine (GE) · 90 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_missionPlaybook_unlockedMissionsViewer` : `extensions.load("editor_missionPlaybook_unlockedMissionsViewer")`, puis la globale `editor_missionPlaybook_unlockedMissionsViewer`

Fenêtre « Playbook Unlocked Missions Viewer » associée à editor_missionPlaybook. Après chaque étape du playbook, elle classe les missions de carrière en trois listes (startable, visible, invisible) d'après gameplay_missions_unlocks.isMissionStartable / isMissionVisible et les range dans resultData.unlockedMissions. La fenêtre affiche trois colonnes pour la page courante et met en vert les missions devenues démarrables à cette étape (unlockChange.byId).

## Remarques

- La fenêtre n'est dessinée que si « Mission Playbook » est visible.
- Bug : M.onEditorRegisterPreferences est assigné à une variable globale non définie (nil).
- Une mission « visible » mais non démarrable va dans visible ; une mission démarrable mais non visible va dans invisible.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_missionPlaybook_unlockedMissionsViewer.onEditorGui()` | Hook d'éditeur appelé à chaque frame : dessine les trois colonnes de missions pour book.results[book.page]. *(interne)* *(hook)* | 13 |
| `editor_missionPlaybook_unlockedMissionsViewer.onEditorInitialized()` | Hook appelé à l'initialisation de l'éditeur : enregistre la fenêtre (500x500) et l'entrée de menu « Missions ». *(interne)* *(hook)* | 54 |
| `editor_missionPlaybook_unlockedMissionsViewer.onPlaybookLogAfterStep(resultData)` | Hook émis après chaque instruction du playbook : ajoute resultData.unlockedMissions = {startable, visible, invisible} (listes d'ids). *(interne)* *(hook)* | 59 |
| `editor_missionPlaybook_unlockedMissionsViewer.show()` | Affiche les fenêtres « Mission Playbook » et « Playbook Unlocked Missions Viewer ». | 49 |

### Détail des paramètres

#### `editor_missionPlaybook_unlockedMissionsViewer.onPlaybookLogAfterStep(resultData)`

Hook émis après chaque instruction du playbook : ajoute resultData.unlockedMissions = {startable, visible, invisible} (listes d'ids).

- `resultData` (*table*) : Résultat de l'étape, modifié sur place.

## Champs

| Champ | Type | Description |
|---|---|---|
| `onEditorRegisterPreferences` | any |  ⚠ référence `onEditorRegisterPreferences` non définie dans le fichier (vaut probablement nil) |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/missionPlaybook/unlockedMissionsViewer.lua`.*
