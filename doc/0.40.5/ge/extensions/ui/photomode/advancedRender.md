# `ui_photomode_advancedRender`

*Fichier : `lua/ge/extensions/ui/photomode/advancedRender.lua` · VM : Game Engine (GE) · 619 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_photomode_advancedRender` : `extensions.load("ui_photomode_advancedRender")`, puis la globale `ui_photomode_advancedRender`

Réglages de rendu avancé du mode photo : finesse des détails (detailAdjust), échelle LOD du terrain, densité d'herbe, qualité des ombres, ombres des véhicules, « last split casters » et qualité des nuages. Le module lit et écrit ces valeurs dans les réglages graphiques et les variables du moteur (via ui_photomode_shared), mémorise l'état initial de la session pour pouvoir le restaurer, et gère un signet (bookmark) de réglages. Il sert de backend au panneau « rendu avancé » du mode photo et aux presets.

## Exemple

```lua
local res = ui_photomode_advancedRender.setAdvancedRenderState({grassDensity = 0.5, shadowsQualityMode = "High", cloudQualityMode = "Ultra"})
if not res.ok then log('W', 'x', res.reason) end
```

## Remarques

- Les fonctions d'écriture renvoient {ok, reason, state}. Raisons : advanced_render_disabled, session_inactive, advanced_render_state_invalid, advanced_render_patch_empty, shadow_quality_invalid, cloud_quality_invalid, advanced_render_set_failed, advanced_render_defaults_unavailable, bookmark_unavailable, advanced_render_state_unavailable.
- Bornes appliquées par clamp : detailAdjust 0.5 à 5 (défaut 2), terrainLodScale 0.001 à 2 (défaut 0.75), grassDensity 0 à 1 (défaut 1).
- shadowsQualityMode accepte Lowest, Low, Normal, High, Ultra. cloudQualityMode accepte Low, Normal, High, Ultra (vrtDownsampleFactor 8/6/4/2 et shadowLutUpdateGroupSize 8/4/2/2) ; une valeur numérique est ramenée au mode le plus proche (<=2 Ultra, <=4 High, <=6 Normal, sinon Low).
- Le réglage est actif par défaut dans les builds non « shipping » (shipping_build ~= true) ; dans une version commerciale il faut le débloquer avec setAdvancedRenderTuningEnabled (l'UI affiche alors le déverrouillage, isUnlockVisible).
- Toutes les modifications exigent une session de mode photo active (ui_photomode_shared.S.sessionActive) ; l'état de départ est capturé par captureRestoreState et remis par restoreState.
- Le module appelle ui_photomode_session.buildCapabilities() sans le déclarer dans M.dependencies.

**Dépendances (chargées avant) :** `ui_photomode_shared`, `core_settings_graphic`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_photomode_advancedRender.applyPresetState(state)` | Applique un preset (patch partiel). Un état non table est traité comme un patch vide, ce qui renvoie une erreur advanced_render_patch_empty. | 589 |
| `ui_photomode_advancedRender.buildMetadataState()` | Sous-ensemble de l'état à écrire dans les métadonnées d'une photo : les sept réglages sans les champs d'interface. | 602 |
| `ui_photomode_advancedRender.buildState()` | Construit l'état d'affichage du rendu avancé (même fonction que le local buildAdvancedRenderState). | 254 |
| `ui_photomode_advancedRender.captureDefaultPresetState()` | État par défaut pour un preset : l'état de départ de la session, ou nil s'il n'a pas été capturé. | 581 |
| `ui_photomode_advancedRender.capturePresetState()` | État à enregistrer dans un preset (identique à buildMetadataState). | 577 |
| `ui_photomode_advancedRender.captureRestoreState()` | Capture l'état de départ de la session pour une restauration ultérieure. Appelée au début d'une session du mode photo. *(interne)* | 267 |
| `ui_photomode_advancedRender.getAdvancedRenderState()` | Renvoie l'état courant (valeurs, availability, defaults, sessionActive, bookmarkAvailable) avec ok (session active et réglage activé) et reason (advanced_render_disabled ou session_inactive). | 548 |
| `ui_photomode_advancedRender.getDefaultEnabled()` | Indique si le rendu avancé est activé par défaut : true quand le jeu n'est pas un build shipping. | 60 |
| `ui_photomode_advancedRender.isTuningEnabled()` | Renvoie l'activation effective : la surcharge posée par setAdvancedRenderTuningEnabled si elle existe, sinon getDefaultEnabled(). | 68 |
| `ui_photomode_advancedRender.isUnlockVisible()` | Indique si l'UI doit proposer le déverrouillage du rendu avancé : true seulement en build shipping. | 64 |
| `ui_photomode_advancedRender.loadAdvancedRenderBookmark()` | Réapplique le signet enregistré. | 513 |
| `ui_photomode_advancedRender.resetAdvancedRenderToDefaults()` | Remet les réglages à l'état capturé au début de la session. | 450 |
| `ui_photomode_advancedRender.restoreState()` | Restaure l'état capturé au début de la session, puis l'oublie. Appelée à la fin de la session. *(interne)* | 401 |
| `ui_photomode_advancedRender.saveAdvancedRenderBookmark()` | Mémorise l'état actuel comme signet de session. | 486 |
| `ui_photomode_advancedRender.setAdvancedRenderState(partialState)` | Applique un patch partiel des réglages (detailAdjust, terrainLodScale, grassDensity, shadowsQualityMode, lastSplitCastersEnabled, vehicleShadowEnabled, cloudQualityMode). Les nombres sont bornés, les modes validés. | 415 |
| `ui_photomode_advancedRender.setAdvancedRenderTuningEnabled(value)` | Active ou désactive le réglage avancé (surcharge de session). Renvoie aussi les capacités du mode photo et, si activé pendant une session, l'état courant. | 559 |

### Détail des paramètres

#### `ui_photomode_advancedRender.applyPresetState(state)`

Applique un preset (patch partiel). Un état non table est traité comme un patch vide, ce qui renvoie une erreur advanced_render_patch_empty.

- `state` (*table*) : État de preset
- **renvoie** : table {state} en cas de succès, sinon {ok = false, reason}

#### `ui_photomode_advancedRender.buildMetadataState()`

Sous-ensemble de l'état à écrire dans les métadonnées d'une photo : les sept réglages sans les champs d'interface.

- **renvoie** : table Réglages seuls

#### `ui_photomode_advancedRender.buildState()`

Construit l'état d'affichage du rendu avancé (même fonction que le local buildAdvancedRenderState).

- **renvoie** : table État avec valeurs, availability, defaults, sessionActive, bookmarkAvailable

#### `ui_photomode_advancedRender.captureDefaultPresetState()`

État par défaut pour un preset : l'état de départ de la session, ou nil s'il n'a pas été capturé.

- **renvoie** : table|nil Réglages initiaux

#### `ui_photomode_advancedRender.capturePresetState()`

État à enregistrer dans un preset (identique à buildMetadataState).

- **renvoie** : table Réglages

#### `ui_photomode_advancedRender.getAdvancedRenderState()`

Renvoie l'état courant (valeurs, availability, defaults, sessionActive, bookmarkAvailable) avec ok (session active et réglage activé) et reason (advanced_render_disabled ou session_inactive).

- **renvoie** : table État d'affichage

#### `ui_photomode_advancedRender.getDefaultEnabled()`

Indique si le rendu avancé est activé par défaut : true quand le jeu n'est pas un build shipping.

- **renvoie** : boolean activé par défaut

#### `ui_photomode_advancedRender.isTuningEnabled()`

Renvoie l'activation effective : la surcharge posée par setAdvancedRenderTuningEnabled si elle existe, sinon getDefaultEnabled().

- **renvoie** : boolean réglage actif

#### `ui_photomode_advancedRender.isUnlockVisible()`

Indique si l'UI doit proposer le déverrouillage du rendu avancé : true seulement en build shipping.

- **renvoie** : boolean déverrouillage visible

#### `ui_photomode_advancedRender.loadAdvancedRenderBookmark()`

Réapplique le signet enregistré.

- **renvoie** : table {ok, reason?, state?}

#### `ui_photomode_advancedRender.resetAdvancedRenderToDefaults()`

Remet les réglages à l'état capturé au début de la session.

- **renvoie** : table {ok, reason?, state?}

#### `ui_photomode_advancedRender.saveAdvancedRenderBookmark()`

Mémorise l'état actuel comme signet de session.

- **renvoie** : table {ok, reason?, state?}

#### `ui_photomode_advancedRender.setAdvancedRenderState(partialState)`

Applique un patch partiel des réglages (detailAdjust, terrainLodScale, grassDensity, shadowsQualityMode, lastSplitCastersEnabled, vehicleShadowEnabled, cloudQualityMode). Les nombres sont bornés, les modes validés.

- `partialState` (*table*) : Champs à modifier
- **renvoie** : table {ok, reason?, state?}

#### `ui_photomode_advancedRender.setAdvancedRenderTuningEnabled(value)`

Active ou désactive le réglage avancé (surcharge de session). Renvoie aussi les capacités du mode photo et, si activé pendant une session, l'état courant.

- `value` (*boolean*) : true par défaut si la valeur n'est pas un booléen reconnu (déduit du code)
- **renvoie** : table {ok = true, enabled, capabilities, state?}

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | string[] | {"ui_photomode_shared", "core_settings_graphic"} |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/photomode/advancedRender.lua`.*
