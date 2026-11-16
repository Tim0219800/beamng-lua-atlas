# `ui_photomode_presets`

*Fichier : `lua/ge/extensions/ui/photomode/presets.lua` · VM : Game Engine (GE) · 484 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_photomode_presets` : `extensions.load("ui_photomode_presets")`, puis la globale `ui_photomode_presets`

Gestion des presets du mode photo, de trois types : camera, scene et effects. Chaque type est stocké dans un fichier JSON sous settings/photomode/presets/ (camera.json, scene.json, effects.json) ; l'état est capturé ou appliqué par les modules ui_photomode_camera, _scene et _effects. Le module gère aussi un preset temporaire « Defaults » (état capturé au début de la session) et les presets temporaires fournis par ces modules.

## Remarques

- Format du fichier : {version=1, presets={...}} ; chaque preset a id (UUID), type, version=1, name, createdAt, updatedAt, origin, data. Les nouveaux presets sont insérés en tête de liste.
- Le preset par défaut a l'identifiant "__defaults" et temporary=true ; le supprimer ne l'efface pas du disque, il est seulement masqué jusqu'à resetTemporaryPresets.
- Les presets de caméra de type scène (data.cameraPresetType == "scene") ne sont listés/applicables que dans le niveau dont l'identifiant correspond à data.levelId.
- Les fonctions renvoient {ok=false, reason=...} en cas d'échec (preset_type_invalid, preset_not_found, preset_capture_failed, preset_write_failed, preset_bundle_invalid). En cas de succès, la table ne contient pas forcément le champ ok.
- renamePreset et deletePreset ne touchent que les presets du fichier (le renommage d'un preset temporaire renvoie preset_not_found).
- Nom vide : remplacé par "Untitled preset".

**Dépendances (chargées avant) :** `ui_photomode_camera`, `ui_photomode_scene`, `ui_photomode_effects`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_photomode_presets.applyPreset(presetType, presetId, options)` | Applique un preset par identifiant (défaut, temporaire ou du fichier) via applyPresetState du module concerné. | 275 |
| `ui_photomode_presets.applyPresetPayload(presetType, payload)` | Applique directement une charge utile de preset (par exemple importée depuis les métadonnées d'une capture), sans passer par le stockage. | 398 |
| `ui_photomode_presets.captureSessionDefaultPresets()` | Capture, pour chaque type de preset, l'état par défaut courant (captureDefaultPresetState du module concerné). Sert de contenu au preset « Defaults ». À appeler au début d'une session photo. | 129 |
| `ui_photomode_presets.deletePreset(presetType, presetId)` | Supprime un preset du fichier ; pour le preset par défaut ou un preset temporaire, le masque seulement. | 320 |
| `ui_photomode_presets.discoverTemporaryPresets(presetType)` | Active l'inclusion des presets temporaires du module (getTemporaryPresetList) pour ce type, puis renvoie la liste complète. | 228 |
| `ui_photomode_presets.getScreenshotPresetBundle()` | Capture l'état courant des trois modules sous forme de bundle destiné aux métadonnées d'une capture d'écran. | 462 |
| `ui_photomode_presets.listPresets(presetType)` | Liste les presets d'un type : le preset par défaut (s'il n'est pas masqué), les presets temporaires déjà découverts, puis ceux du fichier disponibles dans le niveau courant. | 213 |
| `ui_photomode_presets.renamePreset(presetType, presetId, name)` | Renomme un preset enregistré dans le fichier et met à jour updatedAt. | 373 |
| `ui_photomode_presets.resetTemporaryPresets()` | Réinitialise l'état temporaire : presets découverts, presets masqués et états par défaut capturés de la session. | 58 |
| `ui_photomode_presets.saveCurrentPreset(presetType, name, options)` | Capture l'état courant du module du type donné (capturePresetState) et l'enregistre comme nouveau preset en tête du fichier. | 245 |
| `ui_photomode_presets.savePresetBundle(bundle, namePrefix, origin)` | Enregistre un bundle de presets : pour chacun de camera, scene, effects présent dans le bundle, appelle savePresetPayload avec le nom « <préfixe> <type> ». S'arrête au premier échec. | 436 |
| `ui_photomode_presets.savePresetPayload(presetType, name, payload, origin)` | Enregistre une charge utile fournie (sans capture de l'état courant) comme nouveau preset en tête du fichier. | 415 |

### Détail des paramètres

#### `ui_photomode_presets.applyPreset(presetType, presetId, options)`

Applique un preset par identifiant (défaut, temporaire ou du fichier) via applyPresetState du module concerné.

- `presetType` (*string*) : "camera", "scene" ou "effects".
- `presetId` (*string*) : Identifiant du preset, ou "__defaults".
- `options` (*table|nil*) : Options transmises à applyPresetState ({} par défaut).
- **renvoie** : table {preset, state} ou {ok=false, reason}.

#### `ui_photomode_presets.applyPresetPayload(presetType, payload)`

Applique directement une charge utile de preset (par exemple importée depuis les métadonnées d'une capture), sans passer par le stockage.

- `presetType` (*string*) : "camera", "scene" ou "effects".
- `payload` (*table*) : Table de preset ; si elle contient un champ data, c'est lui qui est appliqué, sinon la table entière.
- **renvoie** : table {state} ou {ok=false, reason}.

#### `ui_photomode_presets.deletePreset(presetType, presetId)`

Supprime un preset du fichier ; pour le preset par défaut ou un preset temporaire, le masque seulement.

- `presetType` (*string*) : "camera", "scene" ou "effects".
- `presetId` (*string*) : Identifiant du preset.
- **renvoie** : table {presets} (liste à jour) ou {ok=false, reason}.

#### `ui_photomode_presets.discoverTemporaryPresets(presetType)`

Active l'inclusion des presets temporaires du module (getTemporaryPresetList) pour ce type, puis renvoie la liste complète.

- `presetType` (*string*) : "camera", "scene" ou "effects".
- **renvoie** : table {presets=table[]} ou {ok=false, reason, presets={}}.

#### `ui_photomode_presets.getScreenshotPresetBundle()`

Capture l'état courant des trois modules sous forme de bundle destiné aux métadonnées d'une capture d'écran.

- **renvoie** : table {schemaVersion=1, camera={version,type,data}, scene={...}, effects={...}}.

#### `ui_photomode_presets.listPresets(presetType)`

Liste les presets d'un type : le preset par défaut (s'il n'est pas masqué), les presets temporaires déjà découverts, puis ceux du fichier disponibles dans le niveau courant.

- `presetType` (*string*) : "camera", "scene" ou "effects".
- **renvoie** : table {presets=table[]} ou {ok=false, reason, presets={}}.

#### `ui_photomode_presets.renamePreset(presetType, presetId, name)`

Renomme un preset enregistré dans le fichier et met à jour updatedAt.

- `presetType` (*string*) : "camera", "scene" ou "effects".
- `presetId` (*string*) : Identifiant du preset.
- `name` (*string*) : Nouveau nom.
- **renvoie** : table {preset, presets} ou {ok=false, reason}.

#### `ui_photomode_presets.saveCurrentPreset(presetType, name, options)`

Capture l'état courant du module du type donné (capturePresetState) et l'enregistre comme nouveau preset en tête du fichier.

- `presetType` (*string*) : "camera", "scene" ou "effects".
- `name` (*string*) : Nom du preset.
- `options` (*table|nil*) : Options passées à capturePresetState ({} par défaut).
- **renvoie** : table {preset, presets} ou {ok=false, reason}.

#### `ui_photomode_presets.savePresetBundle(bundle, namePrefix, origin)`

Enregistre un bundle de presets : pour chacun de camera, scene, effects présent dans le bundle, appelle savePresetPayload avec le nom « <préfixe> <type> ». S'arrête au premier échec.

- `bundle` (*table*) : Table {camera=..., scene=..., effects=...}.
- `namePrefix` (*string*) : Préfixe des noms.
- `origin` (*any*) : Provenance transmise à chaque preset.
- **renvoie** : table {imported={camera=preset, scene=preset, effects=preset}} ou {ok=false, reason}.

#### `ui_photomode_presets.savePresetPayload(presetType, name, payload, origin)`

Enregistre une charge utile fournie (sans capture de l'état courant) comme nouveau preset en tête du fichier.

- `presetType` (*string*) : "camera", "scene" ou "effects".
- `name` (*string*) : Nom du preset.
- `payload` (*table*) : Données du preset (champ data ou table entière).
- `origin` (*any*) : Provenance stockée dans le champ origin du preset (déduit du code).
- **renvoie** : table {preset, presets} ou {ok=false, reason}.

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table<integer, string> | Extensions chargées avant : ui_photomode_camera, ui_photomode_scene, ui_photomode_effects. |

## Appels vers le moteur (C++)

- `Engine.` `generateUUID`
- `FS:` `directoryCreate`, `directoryExists`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/photomode/presets.lua`.*
