# `core_vehicle_thumbnail`

*Fichier : `lua/ge/extensions/core/vehicle/thumbnail.lua` · VM : Game Engine (GE) · 288 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `core_vehicle_thumbnail` : `extensions.load("core_vehicle_thumbnail")`, puis la globale `core_vehicle_thumbnail`

Extension GE `core_vehicle_thumbnail` : génère les miniatures (.jpg) des configurations de véhicule sauvegardées, soit directement dans vehicles/<modèle>/<config>.jpg, soit sous forme de capture temporaire d'aperçu (dossier /screenshots/vehicleConfigTemp) que l'utilisateur peut valider ou annuler avant la sauvegarde. Délègue la prise de vue à util_screenshotCreator_currentConfigThumbnail. Utilisée par core_vehicle_partmgmt.

## Exemple

```lua
local r = core_vehicle_thumbnail.captureTemporaryThumbnail()
if r.success then
  -- l'UI reçoit le guihook VehicleConfigThumbnailPreviewReady {captureId, success, path}
end
-- à la sauvegarde :
core_vehicle_thumbnail.commitTemporaryThumbnail(r.captureId, 'vehicles/pickup/ma_config.jpg')
```

## Remarques

- Les captures temporaires sont suivies par un identifiant numérique croissant (captureId). Le guihook VehicleConfigThumbnailPreviewReady est émis avec {captureId, success, path?} à la fin de chaque capture.
- La copie de fichier est atomique : copie vers un .tmp, sauvegarde éventuelle de l'ancien fichier en .bak, puis renommage ; restauration en cas d'échec.
- generateThumbnail utilise `vehicle.jbeam or vehicle.JBeam` pour le nom du modèle (deux casses testées).

**Dépendances (chargées avant) :** `core_vehicle_manager`, `core_vehicle_configTarget`, `util_screenshotCreator_currentConfigThumbnail`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `core_vehicle_thumbnail.cancelTemporaryThumbnail(captureId)` | Annule une capture (supprime le fichier ; si elle est encore en cours, elle sera supprimée à son terme). | 186 |
| `core_vehicle_thumbnail.captureTemporaryThumbnail()` | Démarre une capture temporaire (aperçu) pour la config courante du véhicule configuré ; le fichier est /screenshots/vehicleConfigTemp/save-preview-<id>.jpg. | 161 |
| `core_vehicle_thumbnail.clearTemporaryThumbnail(captureId)` | Annule une capture précise, ou toutes si captureId est nil. | 199 |
| `core_vehicle_thumbnail.commitTemporaryThumbnail(captureId, targetPath)` | Valide une capture prête : la copie vers targetPath puis supprime le fichier temporaire. | 265 |
| `core_vehicle_thumbnail.copyThumbnailFile(sourcePath, targetPath)` | Copie un fichier miniature vers une destination en remplaçant l'ancien de manière sûre (création du dossier si nécessaire). | 223 |
| `core_vehicle_thumbnail.generateConfigThumbnail(configName)` | Génère la miniature de la config nommée pour le véhicule configuré, dans vehicles/<modèle>/<nom>.jpg, via util_screenshotCreator_currentConfigThumbnail. | 110 |
| `core_vehicle_thumbnail.getTemporaryThumbnail()` | Renvoie la capture temporaire prête la plus récente. | 114 |
| `core_vehicle_thumbnail.isValidTemporaryThumbnail(path)` | Indique si le chemin correspond à une capture temporaire prête, non annulée et existante. | 213 |

### Détail des paramètres

#### `core_vehicle_thumbnail.cancelTemporaryThumbnail(captureId)`

Annule une capture (supprime le fichier ; si elle est encore en cours, elle sera supprimée à son terme).

- `captureId` (*integer*) : identifiant de la capture
- **renvoie** : table {success, captureId} ou {success = false, reason = 'captureNotFound', captureId}

#### `core_vehicle_thumbnail.captureTemporaryThumbnail()`

Démarre une capture temporaire (aperçu) pour la config courante du véhicule configuré ; le fichier est /screenshots/vehicleConfigTemp/save-preview-<id>.jpg.

- **renvoie** : table {success = true, captureId, path} ou {success = false, reason = 'noCurrentConfig'|'busy'}

#### `core_vehicle_thumbnail.clearTemporaryThumbnail(captureId)`

Annule une capture précise, ou toutes si captureId est nil.

- `captureId` (*integer|nil*) : identifiant ; nil = toutes
- **renvoie** : table {success = true} (ou résultat de cancelTemporaryThumbnail)

#### `core_vehicle_thumbnail.commitTemporaryThumbnail(captureId, targetPath)`

Valide une capture prête : la copie vers targetPath puis supprime le fichier temporaire.

- `captureId` (*integer*) : capture prête
- `targetPath` (*string*) : chemin du .jpg définitif
- **renvoie** : boolean true si copiée

#### `core_vehicle_thumbnail.copyThumbnailFile(sourcePath, targetPath)`

Copie un fichier miniature vers une destination en remplaçant l'ancien de manière sûre (création du dossier si nécessaire).

- `sourcePath` (*string*) : fichier source existant
- `targetPath` (*string*) : fichier destination
- **renvoie** : boolean true si la copie a réussi

#### `core_vehicle_thumbnail.generateConfigThumbnail(configName)`

Génère la miniature de la config nommée pour le véhicule configuré, dans vehicles/<modèle>/<nom>.jpg, via util_screenshotCreator_currentConfigThumbnail.

- `configName` (*string*) : nom de config (le chemin et les extensions .pc/.jpg sont retirés)
- **renvoie** : boolean true si la prise de vue a démarré

#### `core_vehicle_thumbnail.getTemporaryThumbnail()`

Renvoie la capture temporaire prête la plus récente.

- **renvoie** : table {captureId, path} ou {path = nil} s'il n'y en a pas

#### `core_vehicle_thumbnail.isValidTemporaryThumbnail(path)`

Indique si le chemin correspond à une capture temporaire prête, non annulée et existante.

- `path` (*string*) : chemin du fichier
- **renvoie** : boolean true si valide

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | string[] | core_vehicle_manager, core_vehicle_configTarget, util_screenshotCreator_currentConfigThumbnail. |

## Appels vers le moteur (C++)

- `FS:` `copyFile`, `directoryCreate`, `directoryExists`, `fileExists`, `removeFile`, `renameFile`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/core/vehicle/thumbnail.lua`.*
