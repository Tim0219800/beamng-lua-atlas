# `gameplay_rally_recce_drivelineRecording`

*Fichier : `lua/ge/extensions/gameplay/rally/recce/drivelineRecording.lua` · VM : Game Engine (GE) · 60 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_rally_recce_drivelineRecording` : `extensions.load("gameplay_rally_recce_drivelineRecording")`, puis la globale `gameplay_rally_recce_drivelineRecording`

Chargeur du fichier de « driveline » enregistré pendant une reconnaissance (recce) de rallye. Une driveline est une suite de points horodatés (position, orientation) du parcours roulé. Le module lit le fichier JSONL de la mission et construit une PointList avec relations entre points et normales. Extension gameplay_rally_recce_drivelineRecording, utilisée par la classe recce.

## Remarques

- Chaque ligne JSONL doit contenir pos (vec3), quat et ts (horodatage) ; ils sont passés à PointList():createPoint.
- Il faut au moins 3 points, sinon le chargement échoue (log E, retour nil).
- Le temps de chargement est loggé (rallyUtil.getTime()).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_rally_recce_drivelineRecording.load(missionDir)` | Charge le fichier de driveline de la mission et renvoie une PointList prête à l'emploi (setupPointRelationships et setupPointNormals déjà appelés). | 17 |

### Détail des paramètres

#### `gameplay_rally_recce_drivelineRecording.load(missionDir)`

Charge le fichier de driveline de la mission et renvoie une PointList prête à l'emploi (setupPointRelationships et setupPointNormals déjà appelés).

- `missionDir` (*string*) : Dossier de la mission contenant le fichier de driveline (rallyUtil.drivelineFile)
- **renvoie** : table|nil PointList, ou nil si le fichier est absent, illisible ou a moins de 3 points

## Appels vers le moteur (C++)

- `FS:` `fileExists`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/rally/recce/drivelineRecording.lua`.*
