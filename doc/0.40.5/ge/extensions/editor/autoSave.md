# `editor_autoSave`

*Fichier : `lua/ge/extensions/editor/autoSave.lua` · VM : Game Engine (GE) · 174 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_autoSave` : `extensions.load("editor_autoSave")`, puis la globale `editor_autoSave`

Sauvegarde automatique de l'éditeur de niveaux. Un minuteur (preference files.autoSave.interval, 120 s par défaut) appelle editor.autoSaveLevel() quand files.autoSave.active est vrai, avec un compte à rebours dans la barre d'état pendant files.autoSave.noticeInterval secondes. Une fenêtre modale « AutoSave Restore » permet de restaurer l'arbre de scène depuis /temp/level_autosaves/<niveau>/ ; elle s'ouvre seule si l'éditeur ne s'est pas fermé proprement sur ce niveau, ou via le menu des fenêtres.

## Remarques

- La restauration copie le dossier d'autosave sur le niveau (editor.copyDirectory) puis rouvre le niveau : irréversible (le dialogue de confirmation le précise).
- Les descriptions des préférences parlent de /settings/editor/autosaves alors que le code lit /temp/level_autosaves/ : incohérence apparente entre texte d'aide et chemin utilisé.
- Préférences enregistrées (catégorie files > autoSave) : active (bool, false), saveBackupCopy (bool, false), interval (int, 120), noticeInterval (int, 10), maxAutoSaveCountPerSession (int, 3), counter (int, 1, masquée).
- Si interval est abaissé sous noticeInterval, noticeInterval est ramené à interval ; l'inverse est corrigé aussi.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_autoSave.onEditorGui(dtReal, dtSim, dtRaw)` | Appelé chaque frame de l'éditeur : affiche la fenêtre de restauration si nécessaire, décrémente le minuteur, affiche l'avertissement et déclenche editor.autoSaveLevel() quand il atteint 0. *(interne)* *(hook)* | 110 |
| `editor_autoSave.onEditorInitialized()` | Initialise le minuteur avec files.autoSave.interval et ajoute l'entrée « AutoSave Restore » au menu des fenêtres. *(interne)* *(hook)* | 133 |
| `editor_autoSave.onEditorPreferenceValueChanged(path, value)` | Hook appelé quand une préférence change : remet le minuteur à jour pour files.autoSave.interval et garde noticeInterval <= interval. *(interne)* *(hook)* | 138 |
| `editor_autoSave.onEditorRegisterPreferences(prefsRegistry)` | Hook d'enregistrement des préférences de l'éditeur : déclare la catégorie « files » et la sous-catégorie « autoSave ». *(interne)* *(hook)* | 153 |

### Détail des paramètres

#### `editor_autoSave.onEditorGui(dtReal, dtSim, dtRaw)`

Appelé chaque frame de l'éditeur : affiche la fenêtre de restauration si nécessaire, décrémente le minuteur, affiche l'avertissement et déclenche editor.autoSaveLevel() quand il atteint 0.

- `dtReal` (*number*) : Durée réelle de la frame (s), utilisée pour le minuteur.
- `dtSim` (*number*) : Durée simulée (non utilisée).
- `dtRaw` (*number*) : Durée brute (non utilisée).

#### `editor_autoSave.onEditorPreferenceValueChanged(path, value)`

Hook appelé quand une préférence change : remet le minuteur à jour pour files.autoSave.interval et garde noticeInterval <= interval.

- `path` (*string*) : Chemin de la préférence, ex. "files.autoSave.interval".
- `value` (*any*) : Nouvelle valeur.

#### `editor_autoSave.onEditorRegisterPreferences(prefsRegistry)`

Hook d'enregistrement des préférences de l'éditeur : déclare la catégorie « files » et la sous-catégorie « autoSave ».

- `prefsRegistry` (*table*) : Registre de préférences de l'éditeur (registerCategory / registerSubCategory).

## Appels vers le moteur (C++)

- `FS:` `directoryList`, `stat`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/autoSave.lua`.*
