# `ui_photomode_scene`

*Fichier : `lua/ge/extensions/ui/photomode/scene.lua` · VM : Game Engine (GE) · 874 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_photomode_scene` : `extensions.load("ui_photomode_scene")`, puis la globale `ui_photomode_scene`

Onglet « scène » du mode photo : lit et modifie l'environnement du niveau (heure du jour, date, nuages, brouillard, vent, décalage du nord, affichages célestes et météores) via core_environment et core_celestial. Il gère aussi la sauvegarde/restauration de l'état d'origine à l'ouverture/fermeture de la session, un bookmark d'environnement, et les presets de type « scene » (qui incluent une partie advancedRender gérée par ui_photomode_advancedRender).

## Remarques

- Limites appliquées : time 0..1 (fraction du jour), cloudCover 0..3, fogDensity 0..50, fogAtmosphereHeight 1..1000. northOverride est ramené dans [-180, 180[ (180 conservé si la valeur d'entrée est positive).
- setSceneState exige une session photo active. __lerpSeconds (nombre) dans le patch donne la durée de transition passée à core_environment.setState. Seuls time, cloudCover, fogDensity, fogAtmosphereHeight et northOverride sont pris en compte par setSceneState (pas windSpeed, vents ni celestial).
- Raisons d'échec possibles : session_inactive, scene_state_invalid, scene_api_unavailable, scene_tod_unavailable, scene_celestial_api_unavailable, scene_set_failed, scene_patch_empty, scene_state_unavailable, bookmark_unavailable, preset_part_invalid.
- applyPresetState accepte options.part : "all" (ou nil), "environment" (heure et date), "shadows", "detailTerrain", "weather", "celestial" ; toute autre valeur donne preset_part_invalid.
- Bug du jeu : logSceneTimeOfDayDebug lit une variable isDebugEnabled qui n'est pas déclarée dans ce fichier (globale, donc nil) : le journal détaillé de l'heure du jour n'est jamais écrit. De même logTag n'est pas déclaré dans ce fichier et les log("E", logTag, ...) utilisent une globale nil.
- formatSceneTimeOfDayDebugState affiche sceneState.dayLength, champ absent de l'état de scène (affiche nil).

**Dépendances (chargées avant) :** `ui_photomode_shared`, `ui_photomode_advancedRender`, `core_celestial`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_photomode_scene.applyPresetState(state, options)` | Applique un preset de scène (heure, météo, nord, éléments célestes) puis sa partie advancedRender. S'arrête au premier échec. | 822 |
| `ui_photomode_scene.buildMetadataState()` | Renvoie la partie scène à inclure dans les métadonnées d'une capture : time, play, year, month, day, cloudCover, fogDensity, fogAtmosphereHeight, windSpeed, cloudWindDirection, groundWind, northOverride, celestial. | 852 |
| `ui_photomode_scene.buildState()` | Construit l'état de scène courant (valeurs bornées aux limites) à partir de core_environment et core_celestial, avec la table availability indiquant quels éléments sont lisibles. | 274 |
| `ui_photomode_scene.captureDefaultPresetState()` | Capture l'état par défaut de la session (état de scène restauré ou courant + rendu avancé par défaut). Renvoie nil si aucun des deux n'est disponible. | 812 |
| `ui_photomode_scene.capturePresetState()` | Capture l'état courant sous forme de preset : {scene={...}, advancedRender=...} (advancedRender vient de ui_photomode_advancedRender.buildMetadataState). | 808 |
| `ui_photomode_scene.captureRestoreState()` | Mémorise dans S.sessionSceneRestoreState l'état de scène d'origine pour le restaurer à la fin de la session. Appelée au début de la session photo. *(interne)* | 296 |
| `ui_photomode_scene.captureSerializableState()` | Lit l'état brut de scène : time, play, year, month, day, cloudCover, fogDensity, fogAtmosphereHeight, windSpeed, cloudWindDirection, groundWind (vecteurs {x,y,z}), northOverride, celestial ({meteor, display}). Les valeurs indisponibles valent nil. | 145 |
| `ui_photomode_scene.getSceneState()` | Renvoie l'état de scène courant (buildState) avec ok = session active ; reason="session_inactive" sinon. | 670 |
| `ui_photomode_scene.loadEnvironmentBookmark()` | Réapplique le bookmark d'environnement mémorisé (heure, météo, nord, éléments célestes). Exige une session active et un bookmark. | 609 |
| `ui_photomode_scene.logTimeOfDayDebug(label, sceneState)` | Journalise (niveau debug) l'heure du jour sous la forme {time, play, dayLength} avec un libellé. Voir la note sur le bug isDebugEnabled. *(interne)* | 214 |
| `ui_photomode_scene.restoreState()` | Restaure l'état de scène sauvegardé par captureRestoreState (heure, environnement, nord, éléments célestes) puis l'efface. Appelée à la fin de la session photo ; ne fait rien s'il n'y a rien à restaurer. *(interne)* | 478 |
| `ui_photomode_scene.saveEnvironmentBookmark()` | Mémorise l'état d'environnement courant dans S.savedEnvironmentBookmark. Exige une session active. | 588 |
| `ui_photomode_scene.setSceneState(partialState)` | Applique un patch partiel de scène (heure, météo, nord) pendant une session photo et renvoie le nouvel état. Échoue avec scene_patch_empty si rien n'a été appliqué. | 523 |

### Détail des paramètres

#### `ui_photomode_scene.applyPresetState(state, options)`

Applique un preset de scène (heure, météo, nord, éléments célestes) puis sa partie advancedRender. S'arrête au premier échec.

- `state` (*table*) : Preset {scene=..., advancedRender=...}.
- `options` (*table|nil*) : options.part : all, environment, shadows, detailTerrain, weather, celestial.
- **renvoie** : table {state=...} ou {ok=false, reason}.

#### `ui_photomode_scene.buildMetadataState()`

Renvoie la partie scène à inclure dans les métadonnées d'une capture : time, play, year, month, day, cloudCover, fogDensity, fogAtmosphereHeight, windSpeed, cloudWindDirection, groundWind, northOverride, celestial.

- **renvoie** : table État de scène pour métadonnées.

#### `ui_photomode_scene.buildState()`

Construit l'état de scène courant (valeurs bornées aux limites) à partir de core_environment et core_celestial, avec la table availability indiquant quels éléments sont lisibles.

- **renvoie** : table État de scène (voir getSceneState).

#### `ui_photomode_scene.captureDefaultPresetState()`

Capture l'état par défaut de la session (état de scène restauré ou courant + rendu avancé par défaut). Renvoie nil si aucun des deux n'est disponible.

- **renvoie** : table|nil Données de preset combinées.

#### `ui_photomode_scene.capturePresetState()`

Capture l'état courant sous forme de preset : {scene={...}, advancedRender=...} (advancedRender vient de ui_photomode_advancedRender.buildMetadataState).

- **renvoie** : table Données de preset combinées.

#### `ui_photomode_scene.captureSerializableState()`

Lit l'état brut de scène : time, play, year, month, day, cloudCover, fogDensity, fogAtmosphereHeight, windSpeed, cloudWindDirection, groundWind (vecteurs {x,y,z}), northOverride, celestial ({meteor, display}). Les valeurs indisponibles valent nil.

- **renvoie** : table État brut sérialisable.

#### `ui_photomode_scene.getSceneState()`

Renvoie l'état de scène courant (buildState) avec ok = session active ; reason="session_inactive" sinon.

- **renvoie** : table État de scène : sessionActive, bookmarkAvailable, availability, time, play, year, month, day, cloudCover, fogDensity, fogAtmosphereHeight, windSpeed, cloudWindDirection, groundWind, northOverride, celestial, plus ok/reason.

#### `ui_photomode_scene.loadEnvironmentBookmark()`

Réapplique le bookmark d'environnement mémorisé (heure, météo, nord, éléments célestes). Exige une session active et un bookmark.

- **renvoie** : table {ok=true, state} ou {ok=false, reason, state?}.

#### `ui_photomode_scene.logTimeOfDayDebug(label, sceneState)`

Journalise (niveau debug) l'heure du jour sous la forme {time, play, dayLength} avec un libellé. Voir la note sur le bug isDebugEnabled.

- `label` (*string*) : Préfixe du message.
- `sceneState` (*table*) : État à afficher.

#### `ui_photomode_scene.saveEnvironmentBookmark()`

Mémorise l'état d'environnement courant dans S.savedEnvironmentBookmark. Exige une session active.

- **renvoie** : table {ok=true, state} ou {ok=false, reason}.

#### `ui_photomode_scene.setSceneState(partialState)`

Applique un patch partiel de scène (heure, météo, nord) pendant une session photo et renvoie le nouvel état. Échoue avec scene_patch_empty si rien n'a été appliqué.

- `partialState` (*table*) : Champs possibles : time (0..1), play (booléen, avec time), year, month, day, cloudCover, fogDensity, fogAtmosphereHeight, northOverride (degrés), __lerpSeconds (secondes de transition).
- **renvoie** : table {ok=true, state=...} ou {ok=false, reason=..., state?=...}.

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table<integer, string> | Extensions chargées avant : ui_photomode_shared, ui_photomode_advancedRender, core_celestial. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/photomode/scene.lua`.*
