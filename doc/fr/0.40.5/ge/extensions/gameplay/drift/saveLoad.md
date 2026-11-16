# `gameplay_drift_saveLoad`

*Fichier : `lua/ge/extensions/gameplay/drift/saveLoad.lua` · VM : Game Engine (GE) · 175 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_drift_saveLoad` : `extensions.load("gameplay_drift_saveLoad")`, puis la globale `gameplay_drift_saveLoad`

Charge et sauvegarde les spots de drift du roaming libre. Scanne /levels/<niveau>/driftSpots/ à la recherche de spot.driftSpot.json, construit une table de spots indexée par id (niveau/dossier) avec leurs infos UI, leur aperçu, leurs scores et objectifs sauvegardés, cache les objets marqueurs de la scène, et écrit les scores modifiés. Charge aussi les zones de cascade (stuntZones) depuis un fichier JSON.

## Remarques

- Sauvegarde freeroam : settings/cloud/driftSpots/<spotId>.json ; sauvegarde carrière : <profil>/career/driftSpots/<spotId>.json (écrite par onSaveCurrentProfile, seulement pour les spots marqués _dirty).
- Le cache spotsById est construit paresseusement par getDriftSpotsById ; clearCache ou onCareerActive le vident pour forcer un rechargement.
- Chaque spot chargé a les champs : id, spatialInfo, racePath, bounds, level, info (avec preview et name), saveData {scores, objectivesCompleted}, unlocked=true.
- Les scores de saveData.scores sont triés par score décroissant au chargement.
- Les objets listés dans spatialInfo.lines[].markerObjects sont masqués (setHidden(true)) dès le chargement ; un avertissement est loggué si un objet est introuvable.
- Le hook onAfterDriftSpotsLoaded(spotsById) n'est émis qu'en carrière active.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_drift_saveLoad.clearCache()` | Vide le cache des spots ; le prochain appel à getDriftSpotsById relira tout depuis le disque. | 17 |
| `gameplay_drift_saveLoad.getDriftSpotById(spotId)` | Renvoie les données d'un spot, ou nil s'il n'existe pas dans le niveau courant. | 45 |
| `gameplay_drift_saveLoad.getDriftSpotsById()` | Renvoie (en la construisant au besoin) la table de tous les spots de drift du niveau courant, indexée par id. Utilise le dossier de sauvegarde carrière si la carrière est active, sinon settings/cloud/driftSpots/. | 50 |
| `gameplay_drift_saveLoad.getPreviewWithFallback(dir)` | Cherche preview.jpg, preview.png ou preview.jpeg dans le dossier donné ; sinon renvoie /ui/images/noPreview.jpg. | 119 |
| `gameplay_drift_saveLoad.loadAndSanitizeDriftFreeroamSpotsCurrMap()` | Renvoie la liste (tableau) des spots dont le niveau est le niveau courant. | 132 |
| `gameplay_drift_saveLoad.loadDriftData(fileName)` | Lit un fichier JSON de données de drift, convertit pos/rot/scl de chaque stuntZone en vec3/quat, puis appelle gameplay_drift_stuntZones.setStuntZones(json.stuntZones). Logge une erreur et retourne si le fichier est absent. | 142 |
| `gameplay_drift_saveLoad.onCareerActive()` | Hook : appelé à l'activation de la carrière, vide le cache des spots. *(interne)* *(hook)* | 13 |
| `gameplay_drift_saveLoad.onSaveCurrentProfile(currentSavePath)` | Hook : appelé lors de la sauvegarde du profil carrière ; écrit dans <currentSavePath>/career/driftSpots/ tous les spots marqués _dirty. *(interne)* *(hook)* | 27 |
| `gameplay_drift_saveLoad.saveDriftSpotsScoresForSpotById(spotId)` | Marque le spot comme modifié (_dirty). Hors carrière, écrit immédiatement son fichier de scores dans settings/cloud/driftSpots/ ; en carrière, l'écriture est différée à onSaveCurrentProfile. | 36 |

### Détail des paramètres

#### `gameplay_drift_saveLoad.getDriftSpotById(spotId)`

Renvoie les données d'un spot, ou nil s'il n'existe pas dans le niveau courant.

- `spotId` (*string*) : Id du spot.
- **renvoie** : table|nil Données du spot (id, spatialInfo, racePath, bounds, level, info, saveData, unlocked).

#### `gameplay_drift_saveLoad.getDriftSpotsById()`

Renvoie (en la construisant au besoin) la table de tous les spots de drift du niveau courant, indexée par id. Utilise le dossier de sauvegarde carrière si la carrière est active, sinon settings/cloud/driftSpots/.

- **renvoie** : table<string, table> Spots indexés par id.

#### `gameplay_drift_saveLoad.getPreviewWithFallback(dir)`

Cherche preview.jpg, preview.png ou preview.jpeg dans le dossier donné ; sinon renvoie /ui/images/noPreview.jpg.

- `dir` (*string*) : Dossier du spot.
- **renvoie** : string Chemin de l'image d'aperçu.

#### `gameplay_drift_saveLoad.loadAndSanitizeDriftFreeroamSpotsCurrMap()`

Renvoie la liste (tableau) des spots dont le niveau est le niveau courant.

- **renvoie** : table[] Tableau de spots.

#### `gameplay_drift_saveLoad.loadDriftData(fileName)`

Lit un fichier JSON de données de drift, convertit pos/rot/scl de chaque stuntZone en vec3/quat, puis appelle gameplay_drift_stuntZones.setStuntZones(json.stuntZones). Logge une erreur et retourne si le fichier est absent.

- `fileName` (*string|nil*) : Chemin du fichier JSON ; ne fait rien si nil.

#### `gameplay_drift_saveLoad.onSaveCurrentProfile(currentSavePath)`

Hook : appelé lors de la sauvegarde du profil carrière ; écrit dans <currentSavePath>/career/driftSpots/ tous les spots marqués _dirty.

- `currentSavePath` (*string*) : Dossier de sauvegarde du profil courant.

#### `gameplay_drift_saveLoad.saveDriftSpotsScoresForSpotById(spotId)`

Marque le spot comme modifié (_dirty). Hors carrière, écrit immédiatement son fichier de scores dans settings/cloud/driftSpots/ ; en carrière, l'écriture est différée à onSaveCurrentProfile.

- `spotId` (*string*) : Id du spot, de la forme "niveau/dossier".

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onAfterDriftSpotsLoaded`

## Appels vers le moteur (C++)

- `FS:` `fileExists`, `findFiles`
- `obj:` `setHidden`
- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/drift/saveLoad.lua`.*
