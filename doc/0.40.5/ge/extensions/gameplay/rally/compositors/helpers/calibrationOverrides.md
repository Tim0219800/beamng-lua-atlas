# `gameplay_rally_compositors_helpers_calibrationOverrides`

*Fichier : `lua/ge/extensions/gameplay/rally/compositors/helpers/calibrationOverrides.lua` · VM : Game Engine (GE) · 173 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_rally_compositors_helpers_calibrationOverrides` : `extensions.load("gameplay_rally_compositors_helpers_calibrationOverrides")`, puis la globale `gameplay_rally_compositors_helpers_calibrationOverrides`

Gère le calibrage par mission des seuils d'un style de compositeur de notes de rallye (diamètres d'intensité des virages, longueurs d'arc par intensité). Les réglages sont stockés dans <missionDir>/rally/compositorCalibration.json sous la forme {version=1, styles={<style>={intensity={diameter={...}}, lengthsByIntensity={<intensité>={arcMeters={...}}}}}} et réappliqués à la configuration d'un style au chargement. Une liste de 'boundaries' est un tableau croissant de bornes basses commençant par 0 ; la dernière plage est ouverte (pas de max).

## Exemple

```lua
local ok = gameplay_rally_compositors_helpers_calibrationOverrides.setBoundaries(missionDir, 'english/casual', 'intensity', 'diameter', {0, 20, 45, 80})
```

## Remarques

- Une plage {min, max} correspond à [min, max[ ; la dernière plage n'a que min.
- validateBoundaries exige : tableau numérique non vide, premier élément 0, valeurs strictement croissantes, et (si expectedCount est donné) la bonne longueur.
- applyToConfig n'applique que les sections corner.numbering.intensity (clé 'diameter') et corner.numbering.lengthsByIntensity (clé 'arcMeters').

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_rally_compositors_helpers_calibrationOverrides.applyBoundariesToList(list, key, boundaries)` | Réécrit la clé 'key' de chaque entrée de la liste avec la plage {min, max} issue des bornes (la dernière : {min} seul). Ne modifie rien si les bornes sont invalides ou de mauvaise longueur. | 75 |
| `gameplay_rally_compositors_helpers_calibrationOverrides.applyToConfig(config, compositorName, missionDir)` | Applique les calibrages sauvegardés à la configuration d'un style (corner.numbering.intensity et lengthsByIntensity). Appelé par textCompositor:load. | 143 |
| `gameplay_rally_compositors_helpers_calibrationOverrides.boundariesFromList(list, key)` | Extrait les bornes basses d'une liste d'entrées dont la clé 'key' est une plage {min, max}. Renvoie nil si la liste est vide, ne commence pas à 0, n'est pas contiguë (max précédent = min suivant) ou si un max manque hors dernière entrée. | 39 |
| `gameplay_rally_compositors_helpers_calibrationOverrides.calibrationFile(missionDir)` | Chemin du fichier de calibrage d'une mission : <missionDir>/rally/compositorCalibration.json. | 17 |
| `gameplay_rally_compositors_helpers_calibrationOverrides.load(missionDir)` | Lit le fichier de calibrage de la mission. Renvoie une structure vierge {version=1, styles={}} si le fichier est absent ou illisible (erreur journalisée dans ce dernier cas). | 87 |
| `gameplay_rally_compositors_helpers_calibrationOverrides.save(missionDir, data)` | Écrit les données de calibrage (indentées) dans le fichier de la mission, en créant le dossier au besoin. | 101 |
| `gameplay_rally_compositors_helpers_calibrationOverrides.setBoundaries(missionDir, compositorName, groupName, key, boundaries)` | Enregistre une liste de bornes sous styles[compositorName][groupName][key] puis sauvegarde le fichier. | 126 |
| `gameplay_rally_compositors_helpers_calibrationOverrides.setLengthBoundaries(missionDir, compositorName, intensityName, boundaries)` | Enregistre les bornes de longueur d'arc d'une intensité sous styles[compositorName].lengthsByIntensity[intensityName].arcMeters puis sauvegarde. | 134 |
| `gameplay_rally_compositors_helpers_calibrationOverrides.validateBoundaries(boundaries, expectedCount)` | Vérifie qu'une liste de bornes est valable (numérique, commence à 0, strictement croissante, bonne longueur). | 59 |

### Détail des paramètres

#### `gameplay_rally_compositors_helpers_calibrationOverrides.applyBoundariesToList(list, key, boundaries)`

Réécrit la clé 'key' de chaque entrée de la liste avec la plage {min, max} issue des bornes (la dernière : {min} seul). Ne modifie rien si les bornes sont invalides ou de mauvaise longueur.

- `list` (*table[]*) : Liste d'entrées modifiée sur place.
- `key` (*string*) : Clé à écrire.
- `boundaries` (*number[]*) : Bornes basses.
- **renvoie** : boolean true si appliqué.

#### `gameplay_rally_compositors_helpers_calibrationOverrides.applyToConfig(config, compositorName, missionDir)`

Applique les calibrages sauvegardés à la configuration d'un style (corner.numbering.intensity et lengthsByIntensity). Appelé par textCompositor:load.

- `config` (*table*) : Configuration du style (modifiée sur place).
- `compositorName` (*string*) : Nom du style.
- `missionDir` (*string*) : Dossier de la mission.
- **renvoie** : boolean true si au moins une liste a été modifiée.

#### `gameplay_rally_compositors_helpers_calibrationOverrides.boundariesFromList(list, key)`

Extrait les bornes basses d'une liste d'entrées dont la clé 'key' est une plage {min, max}. Renvoie nil si la liste est vide, ne commence pas à 0, n'est pas contiguë (max précédent = min suivant) ou si un max manque hors dernière entrée.

- `list` (*table[]|nil*) : Liste ordonnée d'entrées.
- `key` (*string*) : Clé contenant la plage (ex. 'diameter', 'arcMeters').
- **renvoie** : number[]|nil Bornes basses, ou nil si la liste n'est pas valide.

#### `gameplay_rally_compositors_helpers_calibrationOverrides.calibrationFile(missionDir)`

Chemin du fichier de calibrage d'une mission : <missionDir>/rally/compositorCalibration.json.

- `missionDir` (*string|nil*) : Dossier de la mission.
- **renvoie** : string|nil Chemin, ou nil si missionDir est nil.

#### `gameplay_rally_compositors_helpers_calibrationOverrides.load(missionDir)`

Lit le fichier de calibrage de la mission. Renvoie une structure vierge {version=1, styles={}} si le fichier est absent ou illisible (erreur journalisée dans ce dernier cas).

- `missionDir` (*string|nil*) : Dossier de la mission.
- **renvoie** : table Données {version, styles}.

#### `gameplay_rally_compositors_helpers_calibrationOverrides.save(missionDir, data)`

Écrit les données de calibrage (indentées) dans le fichier de la mission, en créant le dossier au besoin.

- `missionDir` (*string|nil*) : Dossier de la mission.
- `data` (*table|nil*) : Données ; vierges si nil.
- **renvoie** : boolean Résultat de jsonWriteFile (false si missionDir est nil).

#### `gameplay_rally_compositors_helpers_calibrationOverrides.setBoundaries(missionDir, compositorName, groupName, key, boundaries)`

Enregistre une liste de bornes sous styles[compositorName][groupName][key] puis sauvegarde le fichier.

- `missionDir` (*string*) : Dossier de la mission.
- `compositorName` (*string*) : Nom du style.
- `groupName` (*string*) : Groupe (ex. 'intensity').
- `key` (*string*) : Clé (ex. 'diameter').
- `boundaries` (*number[]*) : Bornes (copiées ; nil si une valeur n'est pas numérique).
- **renvoie** : boolean Succès de l'écriture.

#### `gameplay_rally_compositors_helpers_calibrationOverrides.setLengthBoundaries(missionDir, compositorName, intensityName, boundaries)`

Enregistre les bornes de longueur d'arc d'une intensité sous styles[compositorName].lengthsByIntensity[intensityName].arcMeters puis sauvegarde.

- `missionDir` (*string*) : Dossier de la mission.
- `compositorName` (*string*) : Nom du style.
- `intensityName` (*string*) : Identifiant de l'intensité.
- `boundaries` (*number[]*) : Bornes d'arc en mètres.
- **renvoie** : boolean Succès de l'écriture.

#### `gameplay_rally_compositors_helpers_calibrationOverrides.validateBoundaries(boundaries, expectedCount)`

Vérifie qu'une liste de bornes est valable (numérique, commence à 0, strictement croissante, bonne longueur).

- `boundaries` (*table*) : Tableau de nombres.
- `expectedCount` (*integer|nil*) : Longueur attendue.
- **renvoie** : boolean true si valide.

## Appels vers le moteur (C++)

- `FS:` `directoryCreate`, `fileExists`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/rally/compositors/helpers/calibrationOverrides.lua`.*
