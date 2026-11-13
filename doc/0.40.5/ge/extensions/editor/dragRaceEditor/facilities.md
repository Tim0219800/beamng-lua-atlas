# `editor_dragRaceEditor_facilities`

*Fichier : `lua/ge/extensions/editor/dragRaceEditor/facilities.lua` · VM : Game Engine (GE) · 394 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_dragRaceEditor_facilities` : `extensions.load("editor_dragRaceEditor_facilities")`, puis la globale `editor_dragRaceEditor_facilities`

Gère les facilities (installations de drag) dans l'éditeur de drag race : liste chargée via gameplay_drag_saveSystem, sélection, création, suppression, sauvegarde en <id>.facility.json dans le dossier dragstrips du niveau (avec renommage du fichier si l'id change), et panneaux ImGui (liste, détails, ajout/retrait de strips). Une facility regroupe des chemins de fichiers strip (stripIds).

## Remarques

- Chaque facility a des champs d'édition internes : _filePath (chemin du fichier) et _dirty (modifiée non sauvée).
- selectFacility désélectionne strip et réglages et écrit dans les réglages courants facilityId = "/levels/<niveau>/dragstrips/<id>.facility.json" (ou l'id seul sans niveau).
- Dans la liste, facility.stripIds est supposé non nil ; le détail le crée s'il manque.
- drawFacilitiesPreview écrit seulement le nom de la facility à l'origine (0,0,0).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_dragRaceEditor_facilities.addFacility()` | Crée une facility « New Facility » (id new_facility_N, stripIds vide, _dirty=true), l'ajoute et la sélectionne. | 91 |
| `editor_dragRaceEditor_facilities.drawFacilitiesList()` | Dessine la liste ImGui avec boutons Add, Remove, Save, Refresh ; les entrées non sauvées sont en orange. *(interne)* | 197 |
| `editor_dragRaceEditor_facilities.drawFacilitiesPreview()` | Dessine en debug 3D le nom de la facility sélectionnée à l'origine. *(interne)* | 386 |
| `editor_dragRaceEditor_facilities.drawFacilityDetails()` | Dessine l'édition de la facility sélectionnée : id, nom, description, ajout (liste déroulante avec recherche) et retrait de strips. *(interne)* | 248 |
| `editor_dragRaceEditor_facilities.getAllFacilities()` | Renvoie la liste des facilities. | 32 |
| `editor_dragRaceEditor_facilities.getSelectedFacility()` | Renvoie la facility sélectionnée. | 53 |
| `editor_dragRaceEditor_facilities.getSelectedFacilityIndex()` | Index (base 1) de la facility sélectionnée, -1 si aucune. | 45 |
| `editor_dragRaceEditor_facilities.hasSavedFacilities()` | Indique si au moins une facility a un fichier et n'est pas modifiée. | 36 |
| `editor_dragRaceEditor_facilities.loadAllFacilities()` | Charge toutes les facilities avec dragSaveSystem.getAllFacilities(), remet _dirty à false et complète _filePath depuis le dossier drag du niveau. | 18 |
| `editor_dragRaceEditor_facilities.removeSelectedFacility()` | Retire de la liste la facility sélectionnée (le fichier sur disque n'est pas supprimé) et ajuste la sélection. | 111 |
| `editor_dragRaceEditor_facilities.saveAllFacilities()` | Sauve toutes les facilities modifiées dans le dossier drag du niveau, qu'elle crée si besoin. | 125 |
| `editor_dragRaceEditor_facilities.saveFacility(facility)` | Sauve une facility dans <niveau>/<id>.facility.json. Si l'id a changé, renomme d'abord l'ancien fichier (échoue si le nouveau existe déjà). | 154 |
| `editor_dragRaceEditor_facilities.selectFacility(index)` | Sélectionne une facility : quitte l'édition de zone, désélectionne strip et réglages, met facilityId dans les réglages de drag courants et marque des changements non sauvés. | 60 |
| `editor_dragRaceEditor_facilities.setSelectedFacilityIndex(index)` | Fixe l'index sélectionné sans effets de bord. | 49 |

### Détail des paramètres

#### `editor_dragRaceEditor_facilities.getAllFacilities()`

Renvoie la liste des facilities.

- **renvoie** : table tableau de facilities

#### `editor_dragRaceEditor_facilities.getSelectedFacility()`

Renvoie la facility sélectionnée.

- **renvoie** : table|nil facility ou nil

#### `editor_dragRaceEditor_facilities.getSelectedFacilityIndex()`

Index (base 1) de la facility sélectionnée, -1 si aucune.

- **renvoie** : integer index

#### `editor_dragRaceEditor_facilities.hasSavedFacilities()`

Indique si au moins une facility a un fichier et n'est pas modifiée.

- **renvoie** : boolean résultat

#### `editor_dragRaceEditor_facilities.saveAllFacilities()`

Sauve toutes les facilities modifiées dans le dossier drag du niveau, qu'elle crée si besoin.

- **renvoie** : boolean false si aucun niveau ou dossier non créable, sinon true (même si une sauvegarde individuelle a échoué)

#### `editor_dragRaceEditor_facilities.saveFacility(facility)`

Sauve une facility dans <niveau>/<id>.facility.json. Si l'id a changé, renomme d'abord l'ancien fichier (échoue si le nouveau existe déjà).

- `facility` (*table*) : facility à sauver
- **renvoie** : boolean succès

#### `editor_dragRaceEditor_facilities.selectFacility(index)`

Sélectionne une facility : quitte l'édition de zone, désélectionne strip et réglages, met facilityId dans les réglages de drag courants et marque des changements non sauvés.

- `index` (*integer*) : index base 1

#### `editor_dragRaceEditor_facilities.setSelectedFacilityIndex(index)`

Fixe l'index sélectionné sans effets de bord.

- `index` (*integer*) : index base 1

## Appels vers le moteur (C++)

- `FS:` `directoryCreate`, `directoryExists`, `fileExists`, `renameFile`
- `debugDrawer:` `drawTextAdvanced`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/dragRaceEditor/facilities.lua`.*
