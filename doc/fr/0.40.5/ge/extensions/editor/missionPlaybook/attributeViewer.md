# `editor_missionPlaybook_attributeViewer`

*Fichier : `lua/ge/extensions/editor/missionPlaybook/attributeViewer.lua` · VM : Game Engine (GE) · 127 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_missionPlaybook_attributeViewer` : `extensions.load("editor_missionPlaybook_attributeViewer")`, puis la globale `editor_missionPlaybook_attributeViewer`

Fenêtre « Playbook Attribute Viewer » associée à editor_missionPlaybook. À chaque étape du playbook, elle enregistre les attributs du joueur (career_modules_playerAttributes.getAllAttributes : valeur, niveau de branche, progression vers le niveau suivant) dans resultData.attributes. La fenêtre affiche pour la page courante un tableau Key / Value / Tier / Change (vert pour une hausse, rouge pour une baisse) et une courbe de l'évolution des attributs (hors « money ») via plotHelperUtil.

## Remarques

- La fenêtre n'est dessinée que si la fenêtre « Mission Playbook » est visible.
- Bug : M.onEditorRegisterPreferences est assigné à une variable globale non définie dans ce fichier (nil) ; sans effet.
- Le graphique est conditionné par plotInvalid, mis à true à chaque onPlaybookLogAfterStep ; il n'apparaît donc qu'après une première étape exécutée.
- Le calcul de « Change » lit prevData[key].value sans vérifier que la clé existe dans l'étape précédente.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_missionPlaybook_attributeViewer.onEditorGui(dt)` | Hook d'éditeur appelé à chaque frame : dessine le tableau et le graphique des attributs pour book.results[book.page]. *(interne)* *(hook)* | 17 |
| `editor_missionPlaybook_attributeViewer.onEditorInitialized()` | Hook appelé à l'initialisation de l'éditeur : enregistre la fenêtre (500x500), l'entrée de menu « Missions » et crée l'utilitaire de tracé. *(interne)* *(hook)* | 97 |
| `editor_missionPlaybook_attributeViewer.onPlaybookLogAfterStep(resultData)` | Hook émis par editor_missionPlaybook après chaque instruction : ajoute resultData.attributes = {clé = {value, level, curLvlProgress, neededForNext}}. *(interne)* *(hook)* | 103 |
| `editor_missionPlaybook_attributeViewer.show()` | Affiche les fenêtres « Mission Playbook » et « Playbook Attribute Viewer ». | 87 |

### Détail des paramètres

#### `editor_missionPlaybook_attributeViewer.onEditorGui(dt)`

Hook d'éditeur appelé à chaque frame : dessine le tableau et le graphique des attributs pour book.results[book.page].

- `dt` (*number*) : Durée de la frame en secondes (passée au tracé).

#### `editor_missionPlaybook_attributeViewer.onPlaybookLogAfterStep(resultData)`

Hook émis par editor_missionPlaybook après chaque instruction : ajoute resultData.attributes = {clé = {value, level, curLvlProgress, neededForNext}}.

- `resultData` (*table*) : Résultat de l'étape, modifié sur place.

## Champs

| Champ | Type | Description |
|---|---|---|
| `onEditorRegisterPreferences` | any |  ⚠ référence `onEditorRegisterPreferences` non définie dans le fichier (vaut probablement nil) |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/missionPlaybook/attributeViewer.lua`.*
