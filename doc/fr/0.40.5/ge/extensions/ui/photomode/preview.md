# `ui_photomode_preview`

*Fichier : `lua/ge/extensions/ui/photomode/preview.lua` · VM : Game Engine (GE) · 292 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_photomode_preview` : `extensions.load("ui_photomode_preview")`, puis la globale `ui_photomode_preview`

Partie « aperçu / relecture » du mode photo. Elle ajoute aux métadonnées d'une capture l'état complet du mode photo (caméra, scène, effets, rendu avancé, capture) et les presets, puis permet de rejouer une capture à partir de ces métadonnées : chargement du niveau si besoin, placement de la caméra libre, FOV et heure du jour. Elle sait aussi ouvrir l'URL de partage d'un aperçu dans le navigateur.

## Remarques

- Les fonctions de retour renvoient des tables {ok=false, reason="..."} en cas d'échec (raisons : share_url_missing, browser_unavailable, open_web_failed, session_inactive, preview_metadata_invalid, preview_level_missing, extensions_load_unavailable, loadMapCmd_load_failed, loadMapCmd_unavailable, loadMapCmd_set_failed, camera_api_unavailable, camera_set_failed).
- Une lecture dans le même niveau n'est pas immédiate : la charge utile est stockée dans ui_photomode_shared.S.pendingPreviewPlayback et appliquée par handleUpdate dès que la session photo est fermée et que l'état du jeu n'est ni vide ni "menu". Pour un autre niveau, core_loadMapCmd.set(payload, false) est appelé tout de suite (le module est passé en déchargement manuel).
- Bug mineur du jeu : logTag n'est pas déclaré localement dans ce fichier ; les appels log("E", logTag, ...) utilisent donc une globale probablement nil (le message est journalisé sans étiquette valide).
- Le champ de métadonnées d'ouverture (openMap) attendu : level (obligatoire), camPos (3 nombres), camRot (4 nombres, quaternion), fov (> 0), timeOfDay.

**Dépendances (chargées avant) :** `ui_photomode_shared`, `ui_photomode_camera`, `ui_photomode_scene`, `ui_photomode_effects`, `ui_photomode_advancedRender`, `ui_photomode_capture`, `ui_photomode_presets`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_photomode_preview.collectScreenshotMetadata(metadata)` | Complète la table de métadonnées d'une capture avec metadata.photomodeState (schemaVersion, camera, scene, effects, advancedRender, capture) et metadata.photomodePresets (bundle de presets). Ne fait rien si la session photo n'est pas active ou si metadata n'est pas une table. | 226 |
| `ui_photomode_preview.handleUpdate(dtReal, dtSim, dtRaw)` | Appelée à chaque frame par la boucle du mode photo (hook de mise à jour) ; applique la lecture d'aperçu en attente (passage en caméra libre, setPosRot, setFOV, setTimeOfDay) quand les conditions sont réunies. Les arguments de temps ne sont pas utilisés. *(interne)* | 286 |
| `ui_photomode_preview.openPreviewShareUrl(shareUrl)` | Ouvre l'URL de partage d'un aperçu dans le navigateur web, si l'action media « preview.openShareUrl » est activée. | 195 |
| `ui_photomode_preview.playPreviewFromMetadata(openMap)` | Prépare la relecture d'une capture à partir de ses métadonnées. Exige une session photo active. Si le niveau est différent, déclenche immédiatement son chargement ; sinon met la charge utile en attente pour handleUpdate. | 241 |

### Détail des paramètres

#### `ui_photomode_preview.collectScreenshotMetadata(metadata)`

Complète la table de métadonnées d'une capture avec metadata.photomodeState (schemaVersion, camera, scene, effects, advancedRender, capture) et metadata.photomodePresets (bundle de presets). Ne fait rien si la session photo n'est pas active ou si metadata n'est pas une table.

- `metadata` (*table*) : Table modifiée en place.

#### `ui_photomode_preview.handleUpdate(dtReal, dtSim, dtRaw)`

Appelée à chaque frame par la boucle du mode photo (hook de mise à jour) ; applique la lecture d'aperçu en attente (passage en caméra libre, setPosRot, setFOV, setTimeOfDay) quand les conditions sont réunies. Les arguments de temps ne sont pas utilisés.

- `dtReal` (*number*) : Delta de temps réel (inutilisé).
- `dtSim` (*number*) : Delta de temps simulé (inutilisé).
- `dtRaw` (*number*) : Delta de temps brut (inutilisé).

#### `ui_photomode_preview.openPreviewShareUrl(shareUrl)`

Ouvre l'URL de partage d'un aperçu dans le navigateur web, si l'action media « preview.openShareUrl » est activée.

- `shareUrl` (*string*) : URL à ouvrir ; vide ou nil donne reason="share_url_missing".
- **renvoie** : table {ok=true} ou {ok=false, reason=...}.

#### `ui_photomode_preview.playPreviewFromMetadata(openMap)`

Prépare la relecture d'une capture à partir de ses métadonnées. Exige une session photo active. Si le niveau est différent, déclenche immédiatement son chargement ; sinon met la charge utile en attente pour handleUpdate.

- `openMap` (*table*) : Métadonnées d'ouverture {level, camPos, camRot, fov, timeOfDay}.
- **renvoie** : table {ok=true, level=string, requiresGameStatePlay=true} ou {ok=false, reason=...}.

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table<integer, string> | Extensions chargées avant : ui_photomode_shared, _camera, _scene, _effects, _advancedRender, _capture, _presets. |

**Charge les extensions :** `core_loadMapCmd`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/photomode/preview.lua`.*
