# `ui_photomode_effects`

*Fichier : `lua/ge/extensions/ui/photomode/effects.lua` · VM : Game Engine (GE) · 907 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_photomode_effects` : `extensions.load("ui_photomode_effects")`, puis la globale `ui_photomode_effects`

Effets de post-traitement du mode photo : profondeur de champ (DOF, avec mise au point automatique), SSAO, occlusion spéculaire, ombres en espace écran, réflexions SSR, flou de mouvement, qualité des réflexions dynamiques et des rétroviseurs, visibilité des occupants, plus l'état du flash (délégué à ui_photomode_flash). Le module lit et écrit ces valeurs via les objets postFX de scenetree, les variables $DOFPostFx::* et les réglages graphiques, sauvegarde l'état de départ de la session (y compris sur disque avec ui_photomode_postFxPersistence) et le restaure à la fin.

## Exemple

```lua
local res = ui_photomode_effects.setEffectsState({dofEnabled = true, dofAutofocus = true, ssrQualityMode = "High"})
if not res.ok then log('W', 'x', res.reason) end
```

## Remarques

- Les fonctions d'écriture exigent une session de mode photo active (ui_photomode_shared.S.sessionActive), sinon elles renvoient {ok = false, reason = "session_inactive"}.
- Raisons d'échec possibles : effects_state_invalid, effects_patch_empty, effect_unavailable, effect_set_failed, ssao_quality_invalid, ssr_quality_invalid, reflection_quality_invalid, mirrors_quality_invalid, screen_space_shadows_set_failed, effects_defaults_unavailable, preset_part_invalid, flash_set_failed.
- Bornes appliquées par clamp (défaut en cas de valeur invalide) : dofMaxBlurNear 0 à 1 (0), dofMaxBlurFar 0 à 1 (0.15), dofFocusRange -100 à 250 (50), dofAperture 0.1 à 100 (8), dofFalloffSharpness 0.1 à 100 (1), motionBlurStrength 0 à 2 (0.5).
- Correspondance avec les variables du moteur : dofMaxBlurNear = $DOFPostFx::BlurMin, dofMaxBlurFar = BlurMax, dofFocusRange = FocusRangeMax, dofAperture = BlurCurveFar, dofFalloffSharpness = FocusRangeMin.
- Avec dofAutofocus actif et sans dofFocusRange fourni, la portée manuelle est mémorisée puis FocusRangeMax passe à 0 ; elle est rétablie à la désactivation de l'autofocus.
- Modes acceptés : reflectionQualityMode et mirrorsQualityMode = Disabled, Lowest, Low, Normal, High, Ultra ; ssrQualityMode = Off, Low, Medium, High ; ssaoQualityMode = Off, Normal, High (Low est ramené à Normal ; un nombre >= 64 d'échantillons donne High).
- applyPresetState accepte options.part (all, dof, ssao, specularOcclusion, screenSpaceShadows, ssr, motionBlur, reflections, occupants, flash) pour n'appliquer qu'une partie d'un preset ; dans ce découpage, mirrorsQualityMode fait partie de « reflections ».
- Dans resetEffectsToDefaults, les résultats de applyEffectsStatePatch et restoreDofEffectsState ne sont pas vérifiés : la fonction renvoie ok = true même si une étape a échoué.

**Dépendances (chargées avant) :** `ui_photomode_shared`, `ui_photomode_postFxPersistence`, `ui_photomode_flash`, `core_settings_graphic`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_photomode_effects.applyPresetState(state, options)` | Applique un preset d'effets, en totalité ou pour une partie (options.part), puis délègue la sous-table flash à ui_photomode_flash.applyPresetState. | 854 |
| `ui_photomode_effects.buildMetadataState()` | Sous-ensemble de l'état à écrire dans les métadonnées d'une photo : les 16 réglages d'effets plus flash. | 882 |
| `ui_photomode_effects.buildState()` | Construit l'état d'affichage des effets (même fonction que le local buildEffectsState). | 406 |
| `ui_photomode_effects.captureDefaultPresetState()` | État par défaut pour un preset (état de départ de la session, avec le flash par défaut), ou nil si l'état de départ n'a pas été capturé. | 798 |
| `ui_photomode_effects.capturePresetState()` | État à enregistrer dans un preset (identique à buildMetadataState). | 794 |
| `ui_photomode_effects.captureRestoreState()` | Capture l'état de départ de la session et le sauvegarde via ui_photomode_postFxPersistence.saveRestoreState (fusion avec la version persistée), pour restauration à la fin. Appelée au début d'une session du mode photo. *(interne)* | 420 |
| `ui_photomode_effects.captureSerializableState()` | Lit directement les valeurs actuelles dans le moteur (objets postFX, variables $DOFPostFx::*, réglages graphiques) et les renvoie sous forme brute ; les valeurs illisibles valent nil. | 355 |
| `ui_photomode_effects.getEffectsState()` | Renvoie l'état courant des effets (valeurs, availability, defaults, defaultsAvailable, sessionActive, flash) avec ok = session active, et reason = session_inactive sinon. | 785 |
| `ui_photomode_effects.resetEffectsToDefaults()` | Réapplique l'état capturé au début de la session, y compris le flash. | 755 |
| `ui_photomode_effects.restoreState()` | Restaure l'état de départ (relu depuis la persistance si elle a réussi, sinon depuis la mémoire) : d'abord les effets hors DOF, puis le DOF. Appelée à la fin d'une session. *(interne)* | 707 |
| `ui_photomode_effects.setEffectsState(partialState)` | Applique un patch partiel d'effets : dofEnabled, dofAutofocus, dofMaxBlurNear, dofMaxBlurFar, dofFocusRange, dofAperture, dofFalloffSharpness, ssaoQualityMode (alias ssaoQuality, ssaoSamples, ssaoEnabled), screenSpaceShadowsEnabled, specularOcclusionEnabled, ssrQualityMode, motionBlurEnabled, motionBlurStrength, reflectionQualityMode, mirrorsQualityMode, occupantsVisible. Valeurs numériques bornées, modes validés. S'arrête à la première erreur (les champs déjà appliqués restent appliqués). | 726 |

### Détail des paramètres

#### `ui_photomode_effects.applyPresetState(state, options)`

Applique un preset d'effets, en totalité ou pour une partie (options.part), puis délègue la sous-table flash à ui_photomode_flash.applyPresetState.

- `state` (*table*) : État de preset
- `options` (*table|nil*) : {part = nom de partie} (facultatif)
- **renvoie** : table {state} en cas de succès, sinon {ok = false, reason}

#### `ui_photomode_effects.buildMetadataState()`

Sous-ensemble de l'état à écrire dans les métadonnées d'une photo : les 16 réglages d'effets plus flash.

- **renvoie** : table Réglages

#### `ui_photomode_effects.buildState()`

Construit l'état d'affichage des effets (même fonction que le local buildEffectsState).

- **renvoie** : table État avec valeurs, availability, defaults, sessionActive, flash

#### `ui_photomode_effects.captureDefaultPresetState()`

État par défaut pour un preset (état de départ de la session, avec le flash par défaut), ou nil si l'état de départ n'a pas été capturé.

- **renvoie** : table|nil Réglages initiaux

#### `ui_photomode_effects.capturePresetState()`

État à enregistrer dans un preset (identique à buildMetadataState).

- **renvoie** : table Réglages

#### `ui_photomode_effects.captureSerializableState()`

Lit directement les valeurs actuelles dans le moteur (objets postFX, variables $DOFPostFx::*, réglages graphiques) et les renvoie sous forme brute ; les valeurs illisibles valent nil.

- **renvoie** : table État brut

#### `ui_photomode_effects.getEffectsState()`

Renvoie l'état courant des effets (valeurs, availability, defaults, defaultsAvailable, sessionActive, flash) avec ok = session active, et reason = session_inactive sinon.

- **renvoie** : table État d'affichage

#### `ui_photomode_effects.resetEffectsToDefaults()`

Réapplique l'état capturé au début de la session, y compris le flash.

- **renvoie** : table {ok, reason?, state?}

#### `ui_photomode_effects.setEffectsState(partialState)`

Applique un patch partiel d'effets : dofEnabled, dofAutofocus, dofMaxBlurNear, dofMaxBlurFar, dofFocusRange, dofAperture, dofFalloffSharpness, ssaoQualityMode (alias ssaoQuality, ssaoSamples, ssaoEnabled), screenSpaceShadowsEnabled, specularOcclusionEnabled, ssrQualityMode, motionBlurEnabled, motionBlurStrength, reflectionQualityMode, mirrorsQualityMode, occupantsVisible. Valeurs numériques bornées, modes validés. S'arrête à la première erreur (les champs déjà appliqués restent appliqués).

- `partialState` (*table*) : Champs à modifier
- **renvoie** : table {ok, reason?, state}

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | string[] | ui_photomode_shared, ui_photomode_postFxPersistence, ui_photomode_flash, core_settings_graphic |

## Appels vers le moteur (C++)

- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/photomode/effects.lua`.*
