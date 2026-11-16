# `editor_dragRaceEditor_dragSettings`

*Fichier : `lua/ge/extensions/editor/dragRaceEditor/dragSettings.lua` · VM : Game Engine (GE) · 1167 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_dragRaceEditor_dragSettings` : `extensions.load("editor_dragRaceEditor_dragSettings")`, puis la globale `editor_dragRaceEditor_dragSettings`

Gère les fichiers de réglages de drag (*.dragSettings.json) dans l'éditeur de drag race. Un réglage décrit une course : id, stripId, dragType (headsUpRace/bracketRace), context (freeroam/activity), phases (stage, countdown, race, stop), timers et prefabs (arbre de départ, panneau d'affichage, chemins, décorations). Le module garde en mémoire un seul objet dragSettings (le réglage affiché) et la liste des fichiers trouvés, liste, charge, crée, renomme et sauvegarde ces fichiers, et dessine les panneaux ImGui correspondants.

## Remarques

- loadAllSettings cherche dans /levels/<niveau>/dragstrips/*.dragSettings.json puis dans /gameplay/missions/<niveau>/dragStripRace/*/dragSettings.json et dragStripAPM/*/dragSettings.json. Il essaie le nom du niveau tel quel, en minuscules, avec espaces remplacés par « _ », et les deux.
- Un fichier de la liste est {type, path, name, _dirty, _fileExists?, _cachedData?}. Le type vaut level, dragStripRace, dragStripAPM (ou mission via le bouton Add).
- Les index de sélection commencent à 1, -1 = aucune.
- Seul l'objet dragSettings courant est éditable : changer de sélection met en cache (_cachedData) le réglage modifié non sauvé et recharge l'autre depuis le disque.
- facilityId est ajouté en mémoire par facilities.selectFacility mais retiré au chargement et à la sauvegarde (jamais écrit dans le fichier).
- Sauvegarde : validation (dragType et stripId non vides), puis si le fichier est dans le dossier dragstrips du niveau et que id a changé, le fichier est renommé en <id>.dragSettings.json (échec si ce nom existe).
- À la lecture, si timers est absent ou vide, dragSaveSystem.DEFAULT_TIMERS est utilisé.
- Dans loadAllSettings, la boucle qui remet _dirty à false s'exécute sur une liste qui vient d'être vidée (sans effet).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_dragRaceEditor_dragSettings.drawDragSettingsSection()` | Dessine un panneau ImGui « Drag Settings » (ancienne présentation en bloc fixe de 200 px de haut). *(interne)* | 957 |
| `editor_dragRaceEditor_dragSettings.drawPhasesSection()` | Dessine l'édition des phases de course. *(interne)* | 1108 |
| `editor_dragRaceEditor_dragSettings.drawPrefabsSection()` | Dessine l'édition des prefabs (arbre, panneau, chemins, décorations). *(interne)* | 1041 |
| `editor_dragRaceEditor_dragSettings.drawSettingsDetails()` | Dessine le détail du réglage sélectionné : Basics, Phases, Timers, Prefabs. Les modifications appellent markDirty. *(interne)* | 402 |
| `editor_dragRaceEditor_dragSettings.drawSettingsList()` | Dessine la section « Drag Settings » (liste, bouton Add via dialogue de sauvegarde, etc.). Les boutons sont désactivés s'il n'y a aucun strip sauvegardé. *(interne)* | 236 |
| `editor_dragRaceEditor_dragSettings.getAllSettings()` | Renvoie la liste des fichiers de réglages. | 189 |
| `editor_dragRaceEditor_dragSettings.getDragSettings()` | Renvoie l'objet dragSettings en cours d'édition. | 834 |
| `editor_dragRaceEditor_dragSettings.getSelectedSettings()` | Renvoie l'entrée de fichier sélectionnée. | 201 |
| `editor_dragRaceEditor_dragSettings.getSelectedSettingsIndex()` | Index (base 1) du fichier sélectionné, -1 si aucun. | 193 |
| `editor_dragRaceEditor_dragSettings.loadAllSettings()` | Vide la liste puis la remplit avec les fichiers de réglages du niveau courant et de ses missions dragStripRace / dragStripAPM. Le nom affiché est json.id s'il existe, sinon le nom de fichier ou de dossier. Ne fait rien sans niveau chargé. | 68 |
| `editor_dragRaceEditor_dragSettings.loadDragSettings(filePath)` | Lit un fichier JSON dans dragSettings, supprime facilityId, complète id (nom de fichier) et timers par défaut, et remet _dirty à false pour le fichier correspondant. | 850 |
| `editor_dragRaceEditor_dragSettings.markDirty()` | Marque le fichier sélectionné comme modifié et copie dragSettings dans son cache. | 842 |
| `editor_dragRaceEditor_dragSettings.saveDragSettings(filePath)` | Valide puis écrit dragSettings (sans facilityId) en JSON. Corrige l'extension en .dragSettings.json, retire les caractères *?<>\|", renomme le fichier si l'id a changé (dossier du niveau), crée le dossier si besoin et met à jour l'entrée sélectionnée. | 876 |
| `editor_dragRaceEditor_dragSettings.selectSettings(index)` | Sélectionne un fichier : met en cache le réglage précédent s'il est modifié, désélectionne le strip, puis restaure le cache, ou charge le fichier depuis le disque, ou pour un fichier inexistant reprend le nom comme id. | 208 |
| `editor_dragRaceEditor_dragSettings.setDragSettings(settings)` | Remplace l'objet dragSettings courant (inchangé si nil). | 838 |
| `editor_dragRaceEditor_dragSettings.setSelectedSettingsIndex(index)` | Fixe l'index sélectionné sans charger de données. | 197 |
| `editor_dragRaceEditor_dragSettings.validateDragSettings(settings)` | Vérifie qu'un réglage a un dragType et un stripId non vides. | 946 |

### Détail des paramètres

#### `editor_dragRaceEditor_dragSettings.getAllSettings()`

Renvoie la liste des fichiers de réglages.

- **renvoie** : table tableau de {type, path, name, _dirty…}

#### `editor_dragRaceEditor_dragSettings.getDragSettings()`

Renvoie l'objet dragSettings en cours d'édition.

- **renvoie** : table réglage courant

#### `editor_dragRaceEditor_dragSettings.getSelectedSettings()`

Renvoie l'entrée de fichier sélectionnée.

- **renvoie** : table|nil entrée ou nil

#### `editor_dragRaceEditor_dragSettings.getSelectedSettingsIndex()`

Index (base 1) du fichier sélectionné, -1 si aucun.

- **renvoie** : integer index

#### `editor_dragRaceEditor_dragSettings.loadDragSettings(filePath)`

Lit un fichier JSON dans dragSettings, supprime facilityId, complète id (nom de fichier) et timers par défaut, et remet _dirty à false pour le fichier correspondant.

- `filePath` (*string*) : chemin du fichier .dragSettings.json
- **renvoie** : boolean false et erreur affichée si la lecture échoue

#### `editor_dragRaceEditor_dragSettings.saveDragSettings(filePath)`

Valide puis écrit dragSettings (sans facilityId) en JSON. Corrige l'extension en .dragSettings.json, retire les caractères *?<>|", renomme le fichier si l'id a changé (dossier du niveau), crée le dossier si besoin et met à jour l'entrée sélectionnée.

- `filePath` (*string|nil*) : chemin cible ; chemin de l'entrée sélectionnée si nil
- **renvoie** : boolean succès

#### `editor_dragRaceEditor_dragSettings.selectSettings(index)`

Sélectionne un fichier : met en cache le réglage précédent s'il est modifié, désélectionne le strip, puis restaure le cache, ou charge le fichier depuis le disque, ou pour un fichier inexistant reprend le nom comme id.

- `index` (*integer*) : index base 1

#### `editor_dragRaceEditor_dragSettings.setDragSettings(settings)`

Remplace l'objet dragSettings courant (inchangé si nil).

- `settings` (*table|nil*) : nouveau réglage

#### `editor_dragRaceEditor_dragSettings.setSelectedSettingsIndex(index)`

Fixe l'index sélectionné sans charger de données.

- `index` (*integer*) : index base 1 ou -1

#### `editor_dragRaceEditor_dragSettings.validateDragSettings(settings)`

Vérifie qu'un réglage a un dragType et un stripId non vides.

- `settings` (*table|nil*) : réglage
- **renvoie** : boolean validité
- **renvoie** : string|nil message d'erreur

## Appels vers le moteur (C++)

- `FS:` `directoryCreate`, `directoryExists`, `fileExists`, `findFiles`, `renameFile`, `stat`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/dragRaceEditor/dragSettings.lua`.*
