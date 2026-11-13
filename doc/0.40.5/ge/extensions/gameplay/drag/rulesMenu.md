# `gameplay_drag_rulesMenu`

*Fichier : `lua/ge/extensions/gameplay/drag/rulesMenu.lua` · VM : Game Engine (GE) · 204 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_drag_rulesMenu` : `extensions.load("gameplay_drag_rulesMenu")`, puis la globale `gameplay_drag_rulesMenu`

Contexte de l'écran de règles de drag (interface Vue « mission.dragRules »). Il retrouve la piste associée à une installation (facility.id, avec suffixe « Rules » retiré), fournit à l'UI les options (dragType heads-up/bracket, arbre .400/.500, timers disponibles, valeurs par défaut et sauvegardées) et enregistre ou restaure les règles choisies pour une piste. Il pose aussi une laisse de 12 m autour de la porte de l'installation : le menu se ferme tout seul si le véhicule du joueur s'éloigne.

## Remarques

- Les règles sont stockées dans un presetManager de repli en mémoire (presetManagerFallback) : le vrai presetManager multijoueur est commenté dans getPresetManager. Les règles ne survivent donc pas à un rechargement de l'extension ou du jeu via ce module.
- Règles par défaut : dragType 'headsUpRace', treeType '.500', importantTimerId 'time_1_4'.
- Types de timers renvoyés à l'UI : 'velocity' ou 'distanceTimer' (tout ce qui n'est pas 'velocity' devient distanceTimer).
- Le rayon de laisse est POI_RADIUS = 12 m.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_drag_rulesMenu.applyRulesRestore(levelId, stripId)` | Renvoie les règles sauvegardées d'une piste pour que l'UI puisse les restaurer (bouton Restore). | 192 |
| `gameplay_drag_rulesMenu.applyRulesSave(levelId, stripId, rules)` | Enregistre les règles d'une piste (bouton Save de l'UI). Ne fait rien si un argument manque. | 186 |
| `gameplay_drag_rulesMenu.closeMenu()` | Ferme le contexte de règles : supprime la laisse, oublie l'installation et les données de piste. | 113 |
| `gameplay_drag_rulesMenu.getCurrentFacility()` | Installation ouverte via un POI d'installation. | 126 |
| `gameplay_drag_rulesMenu.getRulesScreenData(facilityIdOrStripId)` | Données pour l'écran Vue des règles : levelId, stripId, stripName, location (titre du niveau), numLanes, timers (id, label, labelKey, shortLabel, type, distance), dragTypeOptions, treeTypeOptions, defaults (issus de la piste) et saved (préréglage sauvegardé ou créé). | 136 |
| `gameplay_drag_rulesMenu.getSavedRulesForStrip(levelId, stripId)` | Règles sauvegardées d'une piste (dragType, treeType, importantTimerId), utilisées par poi.applyUserRulesToData au démarrage depuis un POI. | 131 |
| `gameplay_drag_rulesMenu.isMenuOpen()` | Vrai si le contexte de règles est actif. | 121 |
| `gameplay_drag_rulesMenu.onUpdate(dtReal, dtSim, dtRaw)` | Hook par frame : ferme le menu si le véhicule du joueur (joueur 0) sort de la laisse de 12 m (ou n'existe plus). *(interne)* *(hook)* | 197 |
| `gameplay_drag_rulesMenu.openMenu(facility)` | Ouvre le contexte de règles pour une installation : charge les données de la piste correspondante et pose la laisse sur la porte la plus proche (freeroam_facilities). | 104 |

### Détail des paramètres

#### `gameplay_drag_rulesMenu.applyRulesRestore(levelId, stripId)`

Renvoie les règles sauvegardées d'une piste pour que l'UI puisse les restaurer (bouton Restore).

- `levelId` (*string*) : Identifiant de niveau.
- `stripId` (*string*) : Identifiant de piste.
- **renvoie** : table|nil {dragType, treeType, importantTimerId} ou nil.

#### `gameplay_drag_rulesMenu.applyRulesSave(levelId, stripId, rules)`

Enregistre les règles d'une piste (bouton Save de l'UI). Ne fait rien si un argument manque.

- `levelId` (*string*) : Identifiant de niveau.
- `stripId` (*string*) : Identifiant de piste.
- `rules` (*table*) : {dragType, treeType, importantTimerId}.

#### `gameplay_drag_rulesMenu.getCurrentFacility()`

Installation ouverte via un POI d'installation.

- **renvoie** : table|nil Installation ou nil.

#### `gameplay_drag_rulesMenu.getRulesScreenData(facilityIdOrStripId)`

Données pour l'écran Vue des règles : levelId, stripId, stripName, location (titre du niveau), numLanes, timers (id, label, labelKey, shortLabel, type, distance), dragTypeOptions, treeTypeOptions, defaults (issus de la piste) et saved (préréglage sauvegardé ou créé).

- `facilityIdOrStripId` (*string*) : Identifiant d'installation (par ex. 'alderStripRules') ou de piste.
- **renvoie** : table|nil Données, nil si la piste est introuvable dans le niveau courant.

#### `gameplay_drag_rulesMenu.getSavedRulesForStrip(levelId, stripId)`

Règles sauvegardées d'une piste (dragType, treeType, importantTimerId), utilisées par poi.applyUserRulesToData au démarrage depuis un POI.

- `levelId` (*string*) : Identifiant de niveau.
- `stripId` (*string*) : Identifiant de piste.
- **renvoie** : table|nil Règles ou nil.

#### `gameplay_drag_rulesMenu.isMenuOpen()`

Vrai si le contexte de règles est actif.

- **renvoie** : boolean Menu ouvert ou non.

#### `gameplay_drag_rulesMenu.onUpdate(dtReal, dtSim, dtRaw)`

Hook par frame : ferme le menu si le véhicule du joueur (joueur 0) sort de la laisse de 12 m (ou n'existe plus).

- `dtReal` (*number*) : Delta temps réel (s).
- `dtSim` (*number*) : Delta temps simulé (s).
- `dtRaw` (*number*) : Delta brut (s).

#### `gameplay_drag_rulesMenu.openMenu(facility)`

Ouvre le contexte de règles pour une installation : charge les données de la piste correspondante et pose la laisse sur la porte la plus proche (freeroam_facilities).

- `facility` (*table*) : Installation (champ id).

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | string[] | Liste vide. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/drag/rulesMenu.lua`.*
